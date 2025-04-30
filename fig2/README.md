To reproduce figure 2 you would need the following external software:

- IQ-TREE (version 2.2.0) (http://www.iqtree.org/)
- R (version 4.4.0+) (https://cran.r-project.org/)
- figtree (version 1.4.4) (http://tree.bio.ed.ac.uk/software/figtree/)
- minimap2 (version 2.2.8) (https://github.com/lh3/minimap2)

The following R packages are needed:

- Biostrings (https://bioconductor.org/packages/release/bioc/html/Biostrings.html)
- DECIPHER (https://bioconductor.org/packages/release/bioc/html/DECIPHER.html)
- 

Get multiple sequence alignment of mitochondria (in R):

```
library(Biostrings)
library(DECIPHER)
dna <- Biostrings::readDNAStringSet("rodents_mt.fasta")
```
