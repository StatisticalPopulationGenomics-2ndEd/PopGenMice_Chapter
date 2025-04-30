To reproduce figure 2 you would need the following external software:

- IQ-TREE (version 2.2.0) (http://www.iqtree.org/)
- R (version 4.4.0+) (https://cran.r-project.org/)
- figtree (version 1.4.4) (http://tree.bio.ed.ac.uk/software/figtree/)
- minimap2 (version 2.2.8) (https://github.com/lh3/minimap2)

The following R packages are needed:

- Biostrings (https://bioconductor.org/packages/release/bioc/html/Biostrings.html)
- DECIPHER (https://bioconductor.org/packages/release/bioc/html/DECIPHER.html)
- MSA2dist (https://bioconductor.org/packages/release/bioc/html/MSA2dist.html)

The following data was used:

| species | nucID |
| Apodemus agrarius | NC 016428.1 |
| Apodemus sylvaticus | NC 049122.1 |
| Apodemus uralensis | personal communication |
| Arvicanthis niloticus | CM022273.1 |
| Grammomys surdaster | MN807579.1 |
| Hylomyscus alleni | MZ131547.1 |
| Mastomys coucha | MF062946.1 |
| Mastomys natalensis | MG017593.1 |
| Micromys minutus | OZ004814.1 |
| Mus baoulei | MN964115.1 |
| Mus caroli | KJ530558.1 |
| Mus cervicolor | KJ530559.1 |
| Mus cookii | KJ530561.1 |
| Mus famulus | KX084803.1 |
| Mus fragilicauda | KJ530563.1 |
| Mus macedonicus | OR840781.1 |
| Mus mattheyi | personal communication |
| Mus minutoides | OP764675.1 |
| Mus musculus C57BL 6J | AY172335.1 |
| Mus musculus castaneus | OW971845.1 |
| Mus musculus domesticus | OW971635.1 |
| Mus musculus molossinus | OW971677.1 |
| Mus musculus musculus | OW971782.1 |
| Mus pahari | NC 036680.1 |
| Mus spicilegus | NC 085425.1 |
| Mus spretus | OW971698.1 |
| Mus terricolor | EU352649.1 |
| Rattus norvegicus | AY172581.1 |
| Rattus rattus | EU273707.1 |
| Tokudaia osimensis | LC642727.1 |
| Tokudaia tokunoshimensis | LC778284.1 |

Get multiple sequence alignment of mitochondria (in R):

```
library(Biostrings)
library(DECIPHER)
library(MSA2dist)
dna <- Biostrings::readDNAStringSet("rodents_mt.fasta")
msa <- DECIPHER::AlignSeqs(dna)
Biostrings::writeXStringSet(msa, file="msa.fasta")
keep.idx <- which(apply(as.matrix(msa), 2, function(x) all(x!="-")))
msa.nogaps <- MSA2dist::subString(msa, keep.idx, keep.idx)
Biostrings::writeXStringSet(msa.nogaps, file="msa.nogaps.fasta")
```

Model prediction with iq-tree:

```
iqtree2 -s msa.nogaps.fasta -m TEST_ONLY -nt 48
iqtree2 -s msa.nogaps.fasta -m GTR+F+I+G4 -nt 48 -redo -B 10000 -alrt 1000 -lbp 1000
```

