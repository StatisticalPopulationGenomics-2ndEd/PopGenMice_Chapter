To reproduce figure 1 you would need the following external software:

- MashMap (version 3.1.3) (https://github.com/marbl/MashMap)
- bedtools2 (version 2.30.0) (https://github.com/arq5x/bedtools2)
- RepeatMasker (version 4.1.6) (https://www.repeatmasker.org/)
- NCBI/RMBLAST (version 2.14.1+)
- Dfam (version 3.8)
- R (version 4.4.0+) (https://cran.r-project.org/)
- biopython (version 1.8.5) (https://pypi.org/project/biopython/)

The following R packages are needed:

- argparse (https://cran.r-project.org/web/packages/argparse/index.html)
- circlize (https://cran.r-project.org/web/packages/circlize/index.html)
- colorspace (https://cran.r-project.org/web/packages/colorspace/index.html)
- dplyr (https://cran.r-project.org/web/packages/dplyr/index.html)
- intervals (https://cran.r-project.org/web/packages/intervals/index.html)
- stringr (https://cran.r-project.org/web/packages/stringr/index.html)
- Biostrings (https://bioconductor.org/packages/release/bioc/html/Biostrings.html)
- CRBHits (https://github.com/kullrich/CRBHits)

__Note:__ A modified version of the circlize package needs to be installed, this version is able to directly use the `inverse` option with the `circos.genomicLink` function.

```
devtools::install_github("https://github.com/kullrich/circlize", build_vignettes = FALSE, dependencies = FALSE)
```

The following genome data was used:

_Mus musculus domesticus_ (GRCm39):

https://ftp.ncbi.nlm.nih.gov/genomes/all/GCF/000/001/635/GCF_000001635.27_GRCm39/GCF_000001635.27_GRCm39_genomic.fna.gz

_Rattus norvegicus_ (GRCr8):

https://ftp.ncbi.nlm.nih.gov/genomes/all/GCF/036/323/735/GCF_036323735.1_GRCr8/GCF_036323735.1_GRCr8_genomic.fna.gz

To reproduce figure 1 do:

1. get genome data and CDS data

```
wget https://ftp.ncbi.nlm.nih.gov/genomes/all/GCF/000/001/635/GCF_000001635.27_GRCm39/GCF_000001635.27_GRCm39_genomic.fna.gz
wget https://ftp.ncbi.nlm.nih.gov/genomes/all/GCF/000/001/635/GCF_000001635.27_GRCm39/GCF_000001635.27_GRCm39_cds_from_genomic.fna.gz
wget https://ftp.ncbi.nlm.nih.gov/genomes/all/GCF/036/323/735/GCF_036323735.1_GRCr8/GCF_036323735.1_GRCr8_genomic.fna.gz
wget https://ftp.ncbi.nlm.nih.gov/genomes/all/GCF/036/323/735/GCF_036323735.1_GRCr8/GCF_036323735.1_GRCr8_cds_from_genomic.fna.gz
```

2. change chromosome names and only keep chromosomes (in R)

```
library(Biostrings)
GRCm39 <- Biostrings::readDNAStringSet("GCF_000001635.27_GRCm39_genomic.fna.gz")
GRCm39.chromsomes <- read.table("GRCm39.chromosomes.txt")
GRCm39 <- GRCm39[stringr::word(names(GRCm39)) %in% GRCm39.chromsomes$V1]
names(GRCm39) <- GRCm39.chromsomes$V2[match(stringr::word(names(GRCm39)), GRCm39.chromsomes$V1)]
Biostrings::writeXStringSet(GRCm39, file="GRCm39.fasta")
GRCr8 <- Biostrings::readDNAStringSet("GCF_036323735.1_GRCr8_genomic.fna.gz")
GRCr8.chromsomes <- read.table("GRCr8.chromosomes.txt")
GRCr8 <- GRCr8[stringr::word(names(GRCr8)) %in% GRCr8.chromsomes$V1]
names(GRCr8) <- GRCr8.chromsomes$V2[match(stringr::word(names(GRCr8)), GRCr8.chromsomes$V1)]
Biostrings::writeXStringSet(GRCr8, file="GRCr8.fasta")
```

3. run MashMap

assumes mashmap binary is set to `MASHMAP_PATH`

```
export MASHMAP_PATH=/data/opt/MashMap-3.1.3/build/bin/mashmap
Rscript mashmap2circos.r -m $MASHMAP_PATH \
-r GRCm39.fasta -q GRCr8.fasta \
-cytoband GRCr8_GRCm39_cytoBand.txt \
-s 100000 -pr GRCm39 -pq GRCr8 -rev \
-c 12
```

4. get gene density data (in R)

```
library(Biostrings)
library(CRBHits)

#GRCm39
cds.GRCm39 <- Biostrings::readDNAStringSet("GCF_000001635.27_GRCm39_cds_from_genomic.fna.gz")
cds.GRCm39.longest <- CRBHits::isoform2longest(cds.GRCm39, "NCBI")
cds.GRCm39.genepos <- CRBHits::cds2genepos(cds.GRCm39.longest)
cds.GRCm39.genepos <- cds.GRCm39.genepos[grep("NC_",cds.GRCm39.genepos$gene.chr), ]
GRCm39.chromsomes <- read.table("GRCm39.chromosomes.txt")
cds.GRCm39.genepos$gene.chr <- stringi::stri_replace_all_regex(cds.GRCm39.genepos$gene.chr, pattern=GRCm39.chromsomes$V1, replacement=GRCm39.chromsomes$V2, vectorise_all=FALSE)
cds.GRCm39.genepos$gene.chr <- paste0("GRCm39:", cds.GRCm39.genepos$gene.chr)
write.table(cds.GRCm39.genepos[,c(2,3,4)], sep="\t", col.names=FALSE, row.names=FALSE, quote=FALSE, file="GRCm39.primary_cds.bed")

#GRCr8
cds.GRCr8 <- readDNAStringSet("GCF_036323735.1_GRCr8_cds_from_genomic.fna.gz")
cds.GRCr8.longest <- isoform2longest(cds.GRCr8, "NCBI")
cds.GRCr8.genepos <- cds2genepos(cds.GRCr8.longest)
cds.GRCr8.genepos <- cds.GRCr8.genepos[grep("NC_",cds.GRCr8.genepos$gene.chr), ]
GRCr8.chromsomes <- read.table("GRCr8.chromosomes.txt")
cds.GRCr8.genepos$gene.chr <- stringi::stri_replace_all_regex(cds.GRCr8.genepos$gene.chr, pattern=GRCr8.chromsomes$V1, replacement=GRCr8.chromsomes$V2, vectorise_all=FALSE)
cds.GRCr8.genepos$gene.chr <- paste0("GRCr8:", cds.GRCr8.genepos$gene.chr)
write.table(cds.GRCr8.genepos[,c(2,3,4)], sep="\t", col.names=FALSE, row.names=FALSE, quote=FALSE, file="GRCr8.primary_cds.bed")
```

5. get repeat density data

6. get GC-content

```
python fasta2GCwindow.py -i GRCm39.fasta -o GRCm39.gc_100kbp.out -w 100000 -j 100000
python fasta2GCwindow.py -i GRCr8.fasta -o GRCr8.gc_100kbp.out -w 100000 -j 100000
```

7. integrate gene density, repeat density and GC-content with circos plot (in R)

```

```
