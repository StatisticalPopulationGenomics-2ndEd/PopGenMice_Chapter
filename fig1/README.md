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
devtools::install_github("https://github.com/kullrich/circlize", build_vignettes=FALSE, dependencies=FALSE)
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

get overlap and count genes per 100kbp window

```
cut -f2,3 GRCm39.chromosomes.txt > GRCm39.chromosomes.bed
/opt/bedtools2/bin/bedtools makewindows -g GRCm39.chromosomes.bed -w 100000 | awk '{print "GRCm39:"$0}' > GRCm39.100kbp.bins.txt
/opt/bedtools2/bin/bedtools intersect -a GRCm39.100kbp.bins.txt -b GRCm39.primary_cds.bed -c > GRCm39.primary_cds.w100kbp.bed

cut -f2,3 GRCr8.chromosomes.txt > GRCr8.chromosomes.bed
/opt/bedtools2/bin/bedtools makewindows -g GRCr8.chromosomes.bed -w 100000 | awk '{print "GRCr8:"$0}' > GRCr8.100kbp.bins.txt
/opt/bedtools2/bin/bedtools intersect -a GRCr8.100kbp.bins.txt -b GRCr8.primary_cds.bed -c > GRCr8.primary_cds.w100kbp.bed
```

5. get repeat density data

RepeatMasker data from genomes (GRCm39 and GRCr8) are available here:

edmond-link here

sort and merge overlapping repeat regions per 100kbp window

```
sort -k1,1 -k4,4n -k5,5n GRCm39.repeatmasker.out.gff > GRCm39.repeatmasker.out.sorted.gff
/opt/bedtools2/bin/bedtools merge -i GRCm39.repeatmasker.out.sorted.gff > GRCm39.repeatmasker.out.sorted.gff.merged
/opt/bedtools2/bin/bedtools intersect -a GRCm39.100kbp.bins.txt -b GRCm39.repeatmasker.out.sorted.gff.merged -wo > GRCm39.repeatmasker.w100kbp.repeats

sort -k1,1 -k4,4n -k5,5n GRCr8.repeatmasker.out.gff > GRCr8.repeatmasker.out.sorted.gff
/opt/bedtools2/bin/bedtools merge -i GRCr8.repeatmasker.out.sorted.gff > GRCr8.repeatmasker.out.sorted.gff.merged
/opt/bedtools2/bin/bedtools intersect -a GRCr8.100kbp.bins.txt -b GRCr8.repeatmasker.out.sorted.gff.merged -wo > GRCr8.repeatmasker.w100kbp.repeats
```

get repeat fraction (in R)

```
options(scipen=22)
#GRCm39
GRCm39.repeats <- read.table("GRCm39.repeatmasker.w100kbp.repeats")
tmp <- GRCm39.repeats
tmp.df<-as.data.frame(tmp)
GRCm39.repeats.df<-as.data.frame(GRCm39.repeats)
GRCm39.repeats<-dplyr::group_by(GRCm39.repeats.df, V1, V2, V3) %>% summarise(SUM=sum(V7))
GRCm39.repeats<-GRCm39.repeats[,c("V1","V2","V3","SUM")]
GRCm39.repeats$SUM<-GRCm39.repeats$SUM/(GRCm39.repeats$V3-GRCm39.repeats$V2)
colnames(GRCm39.repeats)<-c("seq","s","e","repeat_fraction")
write.table(GRCm39.repeats, sep="\t", col.names=TRUE, row.names=FALSE, quote=FALSE, file="GRCm39.repeatmasker.w100kbp.repeats.fraction.tsv")

#GRCr8
GRCr8.repeats <- read.table("GRCr8.repeatmasker.w100kbp.repeats")
GRCr8.repeats.df<-as.data.frame(GRCr8.repeats)
GRCr8.repeats<-dplyr::group_by(GRCr8.repeats.df, V1, V2, V3) %>% summarise(SUM=sum(V7))
GRCr8.repeats<-GRCr8.repeats[,c("V1","V2","V3","SUM")]
GRCr8.repeats$SUM<-GRCr8.repeats$SUM/(GRCr8.repeats$V3-GRCr8.repeats$V2)
colnames(GRCr8.repeats)<-c("seq","s","e","repeat_fraction")
write.table(GRCr8.repeats, sep="\t", col.names=TRUE, row.names=FALSE, quote=FALSE, file="GRCr8.repeatmasker.w100kbp.repeats.fraction.tsv")
```

6. get GC-content

extract GC-content from fasta files in 100kbp windows

```
python fasta2GCwindow.py -i GRCm39.fasta -o GRCm39.gc_100kbp.out -w 100000 -j 100000
python fasta2GCwindow.py -i GRCr8.fasta -o GRCr8.gc_100kbp.out -w 100000 -j 100000
```

7. integrate gene density, repeat density and GC-content with circos plot (in R)

```
options(scipen=22)
#load mashmap output and cytoband
mashmap <- read.table("mashmap.circos.mashmap.bed", sep="\t", header=TRUE, na.strings="", comment.char="")
genome.df <- read.table("GRCr8_GRCm39_cytoBand.txt")
colnames(genome.df) <- c("name", "start", "end", "bandname", "stain")

#load GC-content
gc_col_fun <- colorRamp2(c(0.25, 0.5, 0.75), c("#e6f972", "#a0d294ff", "#38acaf"))
GRCm39_gc <- read.table("GRCm39.gc_100kbp.out", header=TRUE)
GRCm39_gc$seq <- paste0("GRCm39:",GRCm39_gc$seq)
GRCr8_gc <- read.table("GRCr8.gc_100kbp.out", header=TRUE)
GRCr8_gc$seq <- paste0("GRCr8:",GRCr8_gc$seq)
gc <- rbind(GRCm39_gc, GRCr8_gc)
gc <- gc[gc$seq %in% genome.df$name, ]
gc <- gc[gc$n!=1, ]

#load gene density
gene_col_fun <- colorRamp2(c(0, 0.1, 1), c("#f7f7f7", "#92c5de", "#0571b0"))
normalize_min_max <- function(x) {return((x - min(x, na.rm = TRUE)) / (max(x, na.rm = TRUE) - min(x, na.rm = TRUE)))}
GRCm39_gd <- read.table("GRCm39.primary_cds.w100kbp.bed")
GRCm39_gd$min_max <- normalize_min_max(GRCm39_gd$V4)
GRCr8_gd <- read.table("GRCr8.primary_cds.w100kbp.bed")
GRCr8_gd$min_max <- normalize_min_max(GRCr8_gd$V4)
gene_content <- rbind(GRCm39_gd, GRCr8_gd )
colnames(gene_content) <- c("seq", "s", "e", "gene_count", "min_max")
gene_content <- gene_content[gene_content$seq %in% genome.df$name, ]
gene_content <- gene_content %>%
  group_by(seq) %>%
  mutate(min_max = normalize_min_max(gene_count)) %>%
  ungroup()

#load repeat density
repeats_col_fun <- colorRamp2(c(0, 0.5, 1), c("#fef6b5", "#f4a99cff", "#e15383"))
GRCm39_repeats <- read.table("GRCm39.repeatmasker.w100kbp.repeats.fraction.tsv", header=TRUE)
GRCr8_repeats <- read.table("GRCr8.repeatmasker.w100kbp.repeats.fraction.tsv", header=TRUE)
repeats <- rbind(GRCm39_repeats, GRCr8_repeats)
repeats <- repeats[repeats$seq %in% genome.df$name, ]

#create plot
library(circlize)

png("GRCm39_GRCr8_circos.png", width=2400, height=2400, res=300)
circos.par(track.margin = c(0.01, 0.01))
circos.initializeWithIdeogram(genome.df, labels.cex=CEX, sort.chr=FALSE)
circos.track(ylim = c(0, 1), track.height = mm_h(1), bg.border = NA, cell.padding = c(0, 0, 0, 0))
highlight.chromosome(genome.df$name[grep("GRCm39",genome.df$name)], col="black", track.index=3)
highlight.chromosome(genome.df$name[grep("GRCr8",genome.df$name)], col="brown4", track.index=3)
circos.trackPlotRegion(
  factors = gene_content$seq,  # Chromosomes
  x = gene_content$s,  # Start positions
  ylim = c(0, 1),  # GC values range from 0 to 1
  panel.fun = function(x, y) {
    chr = CELL_META$sector.index
    idx = gene_content$seq == chr  # Filter data for current chromosome
    
    # Draw heatmap bars
    circos.rect(
      xleft = gene_content$s[idx], 
      xright = gene_content$e[idx], 
      ybottom = 0, 
      ytop = 1, 
      col = gene_col_fun(gene_content$min_max[idx]), 
      border = NA  # Remove border for a smooth heatmap
    )
  },
  track.height = mm_h(2),  # Adjust height
  bg.border = NA,  # Remove track border
  track.margin = c(0, 0),
  cell.padding = c(0, 0, 0, 0)
)
circos.trackPlotRegion(
  factors = repeats$seq,  # Chromosomes
  x = repeats$s,  # Start positions
  ylim = c(0, 1),  # GC values range from 0 to 1
  panel.fun = function(x, y) {
    chr = CELL_META$sector.index
    idx = repeats$seq == chr  # Filter data for current chromosome
    
    # Draw heatmap bars
    circos.rect(
      xleft = repeats$s[idx], 
      xright = repeats$e[idx], 
      ybottom = 0, 
      ytop = 1, 
      col = repeats_col_fun(repeats$repeat_fraction[idx]), 
      border = NA  # Remove border for a smooth heatmap
    )
  },
  track.height = mm_h(2),  # Adjust height
  bg.border = NA,  # Remove track border
  track.margin = c(0, 0),
  cell.padding = c(0, 0, 0, 0)
)
circos.trackPlotRegion(
  factors = gc$seq,  # Chromosomes
  x = gc$s,  # Start positions
  ylim = c(0, 1),  # GC values range from 0 to 1
  panel.fun = function(x, y) {
    chr = CELL_META$sector.index
    idx = gc$seq == chr  # Filter data for current chromosome
    
    # Draw heatmap bars
    circos.rect(
      xleft = gc$s[idx], 
      xright = gc$e[idx], 
      ybottom = 0, 
      ytop = 1, 
      col = gc_col_fun(gc$gc[idx]), 
      border = NA  # Remove border for a smooth heatmap
    )
  },
  track.height = mm_h(2),  # Adjust height
  bg.border = NA,  # Remove track border
  track.margin = c(0, 0),
  cell.padding = c(0, 0, 0, 0)
)
circos.genomicLink(bed1, bed2, col = plot_colors, border = NA, inverse = mashmap$strand=="-")
dev.off()
```
