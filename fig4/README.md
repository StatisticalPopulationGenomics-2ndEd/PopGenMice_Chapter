__Note:__ As a prerequisite to run `msmc2` one needs to have `GVCF` files for individuals and combine them per population.

All related input files can be found here:

edmond-link here

The scripts used to map individual `FASTQ` files against the reference `GRCm39`, to apply base quality score recalibration and call SNPs can be found in the `mm39_mapping` directory.

To reproduce figure 4 you would need the following external software:

- msmc2 (version ) (https://vcftools.github.io/index.html)

To prepare input files for msmc2 the script `vcfAllSiteParser2.py` was used, it takes combined autosomes `GVCF` files as input and produces for each chromosome one `input` and one `mask` file:

```
python vcfAllSiteParser.py GER.1.autosomes.g.vcf.gz GER.1
python vcfAllSiteParser.py GER.2.autosomes.g.vcf.gz GER.2
python vcfAllSiteParser.py GER.3.autosomes.g.vcf.gz GER.3
python vcfAllSiteParser.py GER.4.autosomes.g.vcf.gz GER.4
python vcfAllSiteParser.py GER.5.autosomes.g.vcf.gz GER.5
python vcfAllSiteParser.py GER.6.autosomes.g.vcf.gz GER.6
python vcfAllSiteParser.py GER.7.autosomes.g.vcf.gz GER.7
python vcfAllSiteParser.py GER.8.autosomes.g.vcf.gz GER.8
```

As a negative mask for each chromosome, the `RepeatMasker` resuluts from the reference `GRCm39` as indicated in the directory `fig1` was used

msmc2 was run with the following settings for each individual:


msmc2 was run with the following settings for each population (setting the corresponding number of individuals):
```
/opt/msmc2/msmc2_Linux -t 24 -p 1*4+25*2+1*4+1*6 -I 0-1,2-3,4-5,6-7,8-9,10-11,12-13,14-15 -o popGER.msmc2 input_msmc2.popGER.chr1.txt input_msmc2.popGER.chr2.txt input_msmc2.popGER.chr3.txt input_msmc2.popGER.chr4.txt input_msmc2.popGER.chr5.txt input_msmc2.popGER.chr6.txt input_msmc2.popGER.chr7.txt input_msmc2.popGER.chr8.txt input_msmc2.popGER.chr9.txt input_msmc2.popGER.chr10.txt input_msmc2.popGER.chr11.txt input_msmc2.popGER.chr12.txt input_msmc2.popGER.chr13.txt input_msmc2.popGER.chr14.txt input_msmc2.popGER.chr15.txt input_msmc2.popGER.chr16.txt input_msmc2.popGER.chr17.txt input_msmc2.popGER.chr18.txt input_msmc2.popGER.chr19.txt
```
