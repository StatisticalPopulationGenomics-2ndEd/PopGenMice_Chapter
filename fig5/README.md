__Note:__ As a prerequisite one needs to have filtered `VCF` files for individuals and population.

All related input files can be found here:

edmond-link here

The scripts used to map individual `FASTQ` files against the reference `GRCm39`, to apply base quality score recalibration and call SNPs can be found in the [`mm39_mapping`](mm39_mapping/README.md) directory.

To reproduce figure 5 you would need the following external software:

- vcftools (version ) (https://vcftools.github.io/index.html)
- bedGraphToBigWig (https://hgdownload.soe.ucsc.edu/admin/exe/)
- jbrowse (https://jbrowse.org/jb2/)

Run vcftools to extract window based statistics and combine them into bed and bigwig file to be visualized in jbrowse:

```
vcftools --gzvcf popGER.chr1.DP5.GQ30.SnpGap3.IndelGap5.vcf.gz --out popGER_pi_10kbp.chr1 --window-pi 10000
vcftools --gzvcf popGER.chr2.DP5.GQ30.SnpGap3.IndelGap5.vcf.gz --out popGER_pi_10kbp.chr2 --window-pi 10000
vcftools --gzvcf popGER.chr3.DP5.GQ30.SnpGap3.IndelGap5.vcf.gz --out popGER_pi_10kbp.chr3 --window-pi 10000
vcftools --gzvcf popGER.chr4.DP5.GQ30.SnpGap3.IndelGap5.vcf.gz --out popGER_pi_10kbp.chr4 --window-pi 10000
vcftools --gzvcf popGER.chr5.DP5.GQ30.SnpGap3.IndelGap5.vcf.gz --out popGER_pi_10kbp.chr5 --window-pi 10000
vcftools --gzvcf popGER.chr6.DP5.GQ30.SnpGap3.IndelGap5.vcf.gz --out popGER_pi_10kbp.chr6 --window-pi 10000
vcftools --gzvcf popGER.chr7.DP5.GQ30.SnpGap3.IndelGap5.vcf.gz --out popGER_pi_10kbp.chr7 --window-pi 10000
vcftools --gzvcf popGER.chr8.DP5.GQ30.SnpGap3.IndelGap5.vcf.gz --out popGER_pi_10kbp.chr8 --window-pi 10000
vcftools --gzvcf popGER.chr9.DP5.GQ30.SnpGap3.IndelGap5.vcf.gz --out popGER_pi_10kbp.chr9 --window-pi 10000
vcftools --gzvcf popGER.chr10.DP5.GQ30.SnpGap3.IndelGap5.vcf.gz --out popGER_pi_10kbp.chr10 --window-pi 10000
vcftools --gzvcf popGER.chr11.DP5.GQ30.SnpGap3.IndelGap5.vcf.gz --out popGER_pi_10kbp.chr11 --window-pi 10000
vcftools --gzvcf popGER.chr12.DP5.GQ30.SnpGap3.IndelGap5.vcf.gz --out popGER_pi_10kbp.chr12 --window-pi 10000
vcftools --gzvcf popGER.chr13.DP5.GQ30.SnpGap3.IndelGap5.vcf.gz --out popGER_pi_10kbp.chr13 --window-pi 10000
vcftools --gzvcf popGER.chr14.DP5.GQ30.SnpGap3.IndelGap5.vcf.gz --out popGER_pi_10kbp.chr14 --window-pi 10000
vcftools --gzvcf popGER.chr15.DP5.GQ30.SnpGap3.IndelGap5.vcf.gz --out popGER_pi_10kbp.chr15 --window-pi 10000
vcftools --gzvcf popGER.chr16.DP5.GQ30.SnpGap3.IndelGap5.vcf.gz --out popGER_pi_10kbp.chr16 --window-pi 10000
vcftools --gzvcf popGER.chr17.DP5.GQ30.SnpGap3.IndelGap5.vcf.gz --out popGER_pi_10kbp.chr17 --window-pi 10000
vcftools --gzvcf popGER.chr18.DP5.GQ30.SnpGap3.IndelGap5.vcf.gz --out popGER_pi_10kbp.chr18 --window-pi 10000
vcftools --gzvcf popGER.chr19.DP5.GQ30.SnpGap3.IndelGap5.vcf.gz --out popGER_pi_10kbp.chr19 --window-pi 10000
vcftools --gzvcf popGER.chrX.DP5.GQ30.SnpGap3.IndelGap5.vcf.gz --out popGER_pi_10kbp.chrX --window-pi 10000

awk '{print $1,$2,$3,$5}' popGER_pi_10kbp.chr1.windowed.pi > popGER_pi_10kbp.windowed.pi.bed
awk '{print $1,$2,$3,$5}' popGER_pi_10kbp.chr2.windowed.pi >> popGER_pi_10kbp.windowed.pi.bed
awk '{print $1,$2,$3,$5}' popGER_pi_10kbp.chr3.windowed.pi >> popGER_pi_10kbp.windowed.pi.bed
awk '{print $1,$2,$3,$5}' popGER_pi_10kbp.chr4.windowed.pi >> popGER_pi_10kbp.windowed.pi.bed
awk '{print $1,$2,$3,$5}' popGER_pi_10kbp.chr5.windowed.pi >> popGER_pi_10kbp.windowed.pi.bed
awk '{print $1,$2,$3,$5}' popGER_pi_10kbp.chr6.windowed.pi >> popGER_pi_10kbp.windowed.pi.bed
awk '{print $1,$2,$3,$5}' popGER_pi_10kbp.chr7.windowed.pi >> popGER_pi_10kbp.windowed.pi.bed
awk '{print $1,$2,$3,$5}' popGER_pi_10kbp.chr8.windowed.pi >> popGER_pi_10kbp.windowed.pi.bed
awk '{print $1,$2,$3,$5}' popGER_pi_10kbp.chr9.windowed.pi >> popGER_pi_10kbp.windowed.pi.bed
awk '{print $1,$2,$3,$5}' popGER_pi_10kbp.chr10.windowed.pi >> popGER_pi_10kbp.windowed.pi.bed
awk '{print $1,$2,$3,$5}' popGER_pi_10kbp.chr11.windowed.pi >> popGER_pi_10kbp.windowed.pi.bed
awk '{print $1,$2,$3,$5}' popGER_pi_10kbp.chr12.windowed.pi >> popGER_pi_10kbp.windowed.pi.bed
awk '{print $1,$2,$3,$5}' popGER_pi_10kbp.chr13.windowed.pi >> popGER_pi_10kbp.windowed.pi.bed
awk '{print $1,$2,$3,$5}' popGER_pi_10kbp.chr14.windowed.pi >> popGER_pi_10kbp.windowed.pi.bed
awk '{print $1,$2,$3,$5}' popGER_pi_10kbp.chr15.windowed.pi >> popGER_pi_10kbp.windowed.pi.bed
awk '{print $1,$2,$3,$5}' popGER_pi_10kbp.chr16.windowed.pi >> popGER_pi_10kbp.windowed.pi.bed
awk '{print $1,$2,$3,$5}' popGER_pi_10kbp.chr17.windowed.pi >> popGER_pi_10kbp.windowed.pi.bed
awk '{print $1,$2,$3,$5}' popGER_pi_10kbp.chr18.windowed.pi >> popGER_pi_10kbp.windowed.pi.bed
awk '{print $1,$2,$3,$5}' popGER_pi_10kbp.chr19.windowed.pi >> popGER_pi_10kbp.windowed.pi.bed
awk '{print $1,$2,$3,$5}' popGER_pi_10kbp.chrX.windowed.pi >> popGER_pi_10kbp.windowed.pi.bed

awk '{if($1!="CHROM") print $0}' popGER_pi_10kbp.windowed.pi.bed > popGER_pi_10kbp.windowed.pi.bed.no_header

bedGraphToBigWig popGER_pi_10kbp.windowed.pi.bed.no_header GRCm39.primary_assembly.genome.fa.fai.sizes popGER_pi_10kbp.windowed.pi.bed.bw

vcftools --gzvcf popGER.chr1.DP5.GQ30.SnpGap3.IndelGap5.vcf.gz --out popGER_TajD_10kbp.chr1 --TajimaD 10000
vcftools --gzvcf popGER.chr2.DP5.GQ30.SnpGap3.IndelGap5.vcf.gz --out popGER_TajD_10kbp.chr2 --TajimaD 10000
vcftools --gzvcf popGER.chr3.DP5.GQ30.SnpGap3.IndelGap5.vcf.gz --out popGER_TajD_10kbp.chr3 --TajimaD 10000
vcftools --gzvcf popGER.chr4.DP5.GQ30.SnpGap3.IndelGap5.vcf.gz --out popGER_TajD_10kbp.chr4 --TajimaD 10000
vcftools --gzvcf popGER.chr5.DP5.GQ30.SnpGap3.IndelGap5.vcf.gz --out popGER_TajD_10kbp.chr5 --TajimaD 10000
vcftools --gzvcf popGER.chr6.DP5.GQ30.SnpGap3.IndelGap5.vcf.gz --out popGER_TajD_10kbp.chr6 --TajimaD 10000
vcftools --gzvcf popGER.chr7.DP5.GQ30.SnpGap3.IndelGap5.vcf.gz --out popGER_TajD_10kbp.chr7 --TajimaD 10000
vcftools --gzvcf popGER.chr8.DP5.GQ30.SnpGap3.IndelGap5.vcf.gz --out popGER_TajD_10kbp.chr8 --TajimaD 10000
vcftools --gzvcf popGER.chr9.DP5.GQ30.SnpGap3.IndelGap5.vcf.gz --out popGER_TajD_10kbp.chr9 --TajimaD 10000
vcftools --gzvcf popGER.chr10.DP5.GQ30.SnpGap3.IndelGap5.vcf.gz --out popGER_TajD_10kbp.chr10 --TajimaD 10000
vcftools --gzvcf popGER.chr11.DP5.GQ30.SnpGap3.IndelGap5.vcf.gz --out popGER_TajD_10kbp.chr11 --TajimaD 10000
vcftools --gzvcf popGER.chr12.DP5.GQ30.SnpGap3.IndelGap5.vcf.gz --out popGER_TajD_10kbp.chr12 --TajimaD 10000
vcftools --gzvcf popGER.chr13.DP5.GQ30.SnpGap3.IndelGap5.vcf.gz --out popGER_TajD_10kbp.chr13 --TajimaD 10000
vcftools --gzvcf popGER.chr14.DP5.GQ30.SnpGap3.IndelGap5.vcf.gz --out popGER_TajD_10kbp.chr14 --TajimaD 10000
vcftools --gzvcf popGER.chr15.DP5.GQ30.SnpGap3.IndelGap5.vcf.gz --out popGER_TajD_10kbp.chr15 --TajimaD 10000
vcftools --gzvcf popGER.chr16.DP5.GQ30.SnpGap3.IndelGap5.vcf.gz --out popGER_TajD_10kbp.chr16 --TajimaD 10000
vcftools --gzvcf popGER.chr17.DP5.GQ30.SnpGap3.IndelGap5.vcf.gz --out popGER_TajD_10kbp.chr17 --TajimaD 10000
vcftools --gzvcf popGER.chr18.DP5.GQ30.SnpGap3.IndelGap5.vcf.gz --out popGER_TajD_10kbp.chr18 --TajimaD 10000
vcftools --gzvcf popGER.chr19.DP5.GQ30.SnpGap3.IndelGap5.vcf.gz --out popGER_TajD_10kbp.chr19 --TajimaD 10000
vcftools --gzvcf popGER.chrX.DP5.GQ30.SnpGap3.IndelGap5.vcf.gz --out popGER_TajD_10kbp.chrX --TajimaD 10000

awk '{print $1,$2,$2+10000,$4}' popGER_TajD_10kbp.chr1.Tajima.D > popGER_TajD_10kbp.Tajima.D.bed
awk '{print $1,$2,$2+10000,$4}' popGER_TajD_10kbp.chr2.Tajima.D >> popGER_TajD_10kbp.Tajima.D.bed
awk '{print $1,$2,$2+10000,$4}' popGER_TajD_10kbp.chr3.Tajima.D >> popGER_TajD_10kbp.Tajima.D.bed
awk '{print $1,$2,$2+10000,$4}' popGER_TajD_10kbp.chr4.Tajima.D >> popGER_TajD_10kbp.Tajima.D.bed
awk '{print $1,$2,$2+10000,$4}' popGER_TajD_10kbp.chr5.Tajima.D >> popGER_TajD_10kbp.Tajima.D.bed
awk '{print $1,$2,$2+10000,$4}' popGER_TajD_10kbp.chr6.Tajima.D >> popGER_TajD_10kbp.Tajima.D.bed
awk '{print $1,$2,$2+10000,$4}' popGER_TajD_10kbp.chr7.Tajima.D >> popGER_TajD_10kbp.Tajima.D.bed
awk '{print $1,$2,$2+10000,$4}' popGER_TajD_10kbp.chr8.Tajima.D >> popGER_TajD_10kbp.Tajima.D.bed
awk '{print $1,$2,$2+10000,$4}' popGER_TajD_10kbp.chr9.Tajima.D >> popGER_TajD_10kbp.Tajima.D.bed
awk '{print $1,$2,$2+10000,$4}' popGER_TajD_10kbp.chr10.Tajima.D >> popGER_TajD_10kbp.Tajima.D.bed
awk '{print $1,$2,$2+10000,$4}' popGER_TajD_10kbp.chr11.Tajima.D >> popGER_TajD_10kbp.Tajima.D.bed
awk '{print $1,$2,$2+10000,$4}' popGER_TajD_10kbp.chr12.Tajima.D >> popGER_TajD_10kbp.Tajima.D.bed
awk '{print $1,$2,$2+10000,$4}' popGER_TajD_10kbp.chr13.Tajima.D >> popGER_TajD_10kbp.Tajima.D.bed
awk '{print $1,$2,$2+10000,$4}' popGER_TajD_10kbp.chr14.Tajima.D >> popGER_TajD_10kbp.Tajima.D.bed
awk '{print $1,$2,$2+10000,$4}' popGER_TajD_10kbp.chr15.Tajima.D >> popGER_TajD_10kbp.Tajima.D.bed
awk '{print $1,$2,$2+10000,$4}' popGER_TajD_10kbp.chr16.Tajima.D >> popGER_TajD_10kbp.Tajima.D.bed
awk '{print $1,$2,$2+10000,$4}' popGER_TajD_10kbp.chr17.Tajima.D >> popGER_TajD_10kbp.Tajima.D.bed
awk '{print $1,$2,$2+10000,$4}' popGER_TajD_10kbp.chr18.Tajima.D >> popGER_TajD_10kbp.Tajima.D.bed
awk '{print $1,$2,$2+10000,$4}' popGER_TajD_10kbp.chr19.Tajima.D >> popGER_TajD_10kbp.Tajima.D.bed
awk '{print $1,$2,$2+10000,$4}' popGER_TajD_10kbp.chrX.Tajima.D >> popGER_TajD_10kbp.Tajima.D.bed

awk '{if($4!="nan") print $0}' popGER_TajD_10kbp.Tajima.D.bed > popGER_TajD_10kbp.Tajima.D.bed.red

bedGraphToBigWig popGER_TajD_10kbp.Tajima.D.bed.red GRCm39.primary_assembly.genome.fa.fai.sizes popGER_TajD_10kbp.Tajima.D.bed.red.bw
```
