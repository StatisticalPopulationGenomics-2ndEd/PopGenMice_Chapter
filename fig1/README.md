To reproduce figure 1 you would need the following external software:

- MashMap (version 3.1.3) (https://github.com/marbl/MashMap)
- bedtools2 (version 2.30.0) (https://github.com/arq5x/bedtools2)
- RepeatMasker (version 4.1.6) (https://www.repeatmasker.org/)
- NCBI/RMBLAST (version 2.14.1+)
- Dfam (version 3.8)
- R (version 4.4.0+) (https://cran.r-project.org/)

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

```
# get genome data
wget https://ftp.ncbi.nlm.nih.gov/genomes/all/GCF/000/001/635/GCF_000001635.27_GRCm39/GCF_000001635.27_GRCm39_genomic.fna.gz
wget https://ftp.ncbi.nlm.nih.gov/genomes/all/GCF/036/323/735/GCF_036323735.1_GRCr8/GCF_036323735.1_GRCr8_genomic.fna.gz
# run MashMap

