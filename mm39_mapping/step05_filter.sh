/opt/bcftools/bcftools-1.21/bcftools filter \
-e "sSUM(FORMAT/AD)<5 | MAX(FORMAT/GQ)<30" -g 3 -G 5 -S . --threads 12 \
GER.1.autosomes.g.vcf.gz | /opt/bcftools/bcftools-1.21/bcftools view --threads 12 -m 2 -i 'GT~"1"' -v snps -Oz -o \
GER.1.autosomes.DP5.GQ30.SnpGap3.IndelGap5.vcf.gz

/opt/bcftools/bcftools-1.21/bcftools filter \
-e "sSUM(FORMAT/AD)<5 | MAX(FORMAT/GQ)<30" -g 3 -G 5 -S . --threads 12 \
GER.1.chrX.g.vcf.gz | /opt/bcftools/bcftools-1.21/bcftools view --threads 12 -m 2 -i 'GT~"1"' -v snps -Oz -o \
GER.1.chrX.DP5.GQ30.SnpGap3.IndelGap5.vcf.gz
