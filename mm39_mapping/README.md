To reproduce mapping against the reference `GRCm39` you would need the following external software:

- minimap2 (version 2.28) (https://github.com/lh3/minimap2)
- samtools (version 1.21) (https://github.com/samtools/samtools)
- samblaster (version 0.1.26) (https://github.com/GregoryFaust/samblaster)
- 

The following genome data was used:

_Mus musculus domesticus_ (GRCm39):

https://ftp.ebi.ac.uk/pub/databases/gencode/Gencode_mouse/release_M33/GRCm39.primary_assembly.genome.fa.gz

The following SNP data was used to apply base quality score recalibration:

https://ftp.ebi.ac.uk/pub/databases/mousegenomes/REL-2112-v8-SNPs_Indels/mgp_REL2021_snps.vcf.gz

The scripts in this directory are examples scripts for one individual highlighting the commands for each step, the same parameter (if not inidcated otherwise) have been applied to all individuals which are given in the `samples.tsv` file.
