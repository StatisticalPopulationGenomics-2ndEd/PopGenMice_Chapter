/opt/bcftools/bcftools-1.21/bcftools merge --threads 24 -r chrX \
GER.1.chrX.g.vcf.gz \
GER.2.chrX.g.vcf.gz \
GER.3.chrX.g.vcf.gz \
GER.4.chrX.g.vcf.gz \
GER.5.chrX.g.vcf.gz \
GER.6.chrX.g.vcf.gz \
GER.7.chrX.g.vcf.gz \
GER.8.chrX.g.vcf.gz \
| /opt/bcftools/bcftools-1.21/bcftools filter -e "sSUM(FORMAT/AD)<5 | MAX(FORMAT/GQ)<30" -g 3 -G 5 -S . --threads 24 \
| /opt/bcftools/bcftools-1.21/bcftools view --threads 24 -m 2 -i 'GT~"1"' -v snps -Oz -o popGER.chrX.DP5.GQ30.SnpGap3.IndelGap5.vcf.gz

/opt/bcftools/bcftools-1.21/bcftools merge --threads 24 -r chr19 \
GER.1.autosomes.g.vcf.gz \
GER.2.autosomes.g.vcf.gz \
GER.3.autosomes.g.vcf.gz \
GER.4.autosomes.g.vcf.gz \
GER.5.autosomes.g.vcf.gz \
GER.6.autosomes.g.vcf.gz \
GER.7.autosomes.g.vcf.gz \
GER.8.autosomes.g.vcf.gz \
| /opt/bcftools/bcftools-1.21/bcftools filter -e "sSUM(FORMAT/AD)<5 | MAX(FORMAT/GQ)<30" -g 3 -G 5 -S . --threads 24 \
| /opt/bcftools/bcftools-1.21/bcftools view --threads 24 -m 2 -i 'GT~"1"' -v snps -Oz -o popGER.chr19.DP5.GQ30.SnpGap3.IndelGap5.vcf.gz

/opt/bcftools/bcftools-1.21/bcftools merge --threads 24 -r chr18 \
GER.1.autosomes.g.vcf.gz \
GER.2.autosomes.g.vcf.gz \
GER.3.autosomes.g.vcf.gz \
GER.4.autosomes.g.vcf.gz \
GER.5.autosomes.g.vcf.gz \
GER.6.autosomes.g.vcf.gz \
GER.7.autosomes.g.vcf.gz \
GER.8.autosomes.g.vcf.gz \
| /opt/bcftools/bcftools-1.21/bcftools filter -e "sSUM(FORMAT/AD)<5 | MAX(FORMAT/GQ)<30" -g 3 -G 5 -S . --threads 24 \
| /opt/bcftools/bcftools-1.21/bcftools view --threads 24 -m 2 -i 'GT~"1"' -v snps -Oz -o popGER.chr18.DP5.GQ30.SnpGap3.IndelGap5.vcf.gz

/opt/bcftools/bcftools-1.21/bcftools merge --threads 24 -r chr17 \
GER.1.autosomes.g.vcf.gz \
GER.2.autosomes.g.vcf.gz \
GER.3.autosomes.g.vcf.gz \
GER.4.autosomes.g.vcf.gz \
GER.5.autosomes.g.vcf.gz \
GER.6.autosomes.g.vcf.gz \
GER.7.autosomes.g.vcf.gz \
GER.8.autosomes.g.vcf.gz \
| /opt/bcftools/bcftools-1.21/bcftools filter -e "sSUM(FORMAT/AD)<5 | MAX(FORMAT/GQ)<30" -g 3 -G 5 -S . --threads 24 \
| /opt/bcftools/bcftools-1.21/bcftools view --threads 24 -m 2 -i 'GT~"1"' -v snps -Oz -o popGER.chr17.DP5.GQ30.SnpGap3.IndelGap5.vcf.gz

/opt/bcftools/bcftools-1.21/bcftools merge --threads 24 -r chr16 \
GER.1.autosomes.g.vcf.gz \
GER.2.autosomes.g.vcf.gz \
GER.3.autosomes.g.vcf.gz \
GER.4.autosomes.g.vcf.gz \
GER.5.autosomes.g.vcf.gz \
GER.6.autosomes.g.vcf.gz \
GER.7.autosomes.g.vcf.gz \
GER.8.autosomes.g.vcf.gz \
| /opt/bcftools/bcftools-1.21/bcftools filter -e "sSUM(FORMAT/AD)<5 | MAX(FORMAT/GQ)<30" -g 3 -G 5 -S . --threads 24 \
| /opt/bcftools/bcftools-1.21/bcftools view --threads 24 -m 2 -i 'GT~"1"' -v snps -Oz -o popGER.chr16.DP5.GQ30.SnpGap3.IndelGap5.vcf.gz

/opt/bcftools/bcftools-1.21/bcftools merge --threads 24 -r chr15 \
GER.1.autosomes.g.vcf.gz \
GER.2.autosomes.g.vcf.gz \
GER.3.autosomes.g.vcf.gz \
GER.4.autosomes.g.vcf.gz \
GER.5.autosomes.g.vcf.gz \
GER.6.autosomes.g.vcf.gz \
GER.7.autosomes.g.vcf.gz \
GER.8.autosomes.g.vcf.gz \
| /opt/bcftools/bcftools-1.21/bcftools filter -e "sSUM(FORMAT/AD)<5 | MAX(FORMAT/GQ)<30" -g 3 -G 5 -S . --threads 24 \
| /opt/bcftools/bcftools-1.21/bcftools view --threads 24 -m 2 -i 'GT~"1"' -v snps -Oz -o popGER.chr15.DP5.GQ30.SnpGap3.IndelGap5.vcf.gz

/opt/bcftools/bcftools-1.21/bcftools merge --threads 24 -r chr14 \
GER.1.autosomes.g.vcf.gz \
GER.2.autosomes.g.vcf.gz \
GER.3.autosomes.g.vcf.gz \
GER.4.autosomes.g.vcf.gz \
GER.5.autosomes.g.vcf.gz \
GER.6.autosomes.g.vcf.gz \
GER.7.autosomes.g.vcf.gz \
GER.8.autosomes.g.vcf.gz \
| /opt/bcftools/bcftools-1.21/bcftools filter -e "sSUM(FORMAT/AD)<5 | MAX(FORMAT/GQ)<30" -g 3 -G 5 -S . --threads 24 \
| /opt/bcftools/bcftools-1.21/bcftools view --threads 24 -m 2 -i 'GT~"1"' -v snps -Oz -o popGER.chr14.DP5.GQ30.SnpGap3.IndelGap5.vcf.gz

/opt/bcftools/bcftools-1.21/bcftools merge --threads 24 -r chr13 \
GER.1.autosomes.g.vcf.gz \
GER.2.autosomes.g.vcf.gz \
GER.3.autosomes.g.vcf.gz \
GER.4.autosomes.g.vcf.gz \
GER.5.autosomes.g.vcf.gz \
GER.6.autosomes.g.vcf.gz \
GER.7.autosomes.g.vcf.gz \
GER.8.autosomes.g.vcf.gz \
| /opt/bcftools/bcftools-1.21/bcftools filter -e "sSUM(FORMAT/AD)<5 | MAX(FORMAT/GQ)<30" -g 3 -G 5 -S . --threads 24 \
| /opt/bcftools/bcftools-1.21/bcftools view --threads 24 -m 2 -i 'GT~"1"' -v snps -Oz -o popGER.chr13.DP5.GQ30.SnpGap3.IndelGap5.vcf.gz

/opt/bcftools/bcftools-1.21/bcftools merge --threads 24 -r chr12 \
GER.1.autosomes.g.vcf.gz \
GER.2.autosomes.g.vcf.gz \
GER.3.autosomes.g.vcf.gz \
GER.4.autosomes.g.vcf.gz \
GER.5.autosomes.g.vcf.gz \
GER.6.autosomes.g.vcf.gz \
GER.7.autosomes.g.vcf.gz \
GER.8.autosomes.g.vcf.gz \
| /opt/bcftools/bcftools-1.21/bcftools filter -e "sSUM(FORMAT/AD)<5 | MAX(FORMAT/GQ)<30" -g 3 -G 5 -S . --threads 24 \
| /opt/bcftools/bcftools-1.21/bcftools view --threads 24 -m 2 -i 'GT~"1"' -v snps -Oz -o popGER.chr12.DP5.GQ30.SnpGap3.IndelGap5.vcf.gz

/opt/bcftools/bcftools-1.21/bcftools merge --threads 24 -r chr11 \
GER.1.autosomes.g.vcf.gz \
GER.2.autosomes.g.vcf.gz \
GER.3.autosomes.g.vcf.gz \
GER.4.autosomes.g.vcf.gz \
GER.5.autosomes.g.vcf.gz \
GER.6.autosomes.g.vcf.gz \
GER.7.autosomes.g.vcf.gz \
GER.8.autosomes.g.vcf.gz \
| /opt/bcftools/bcftools-1.21/bcftools filter -e "sSUM(FORMAT/AD)<5 | MAX(FORMAT/GQ)<30" -g 3 -G 5 -S . --threads 24 \
| /opt/bcftools/bcftools-1.21/bcftools view --threads 24 -m 2 -i 'GT~"1"' -v snps -Oz -o popGER.chr11.DP5.GQ30.SnpGap3.IndelGap5.vcf.gz

/opt/bcftools/bcftools-1.21/bcftools merge --threads 24 -r chr10 \
GER.1.autosomes.g.vcf.gz \
GER.2.autosomes.g.vcf.gz \
GER.3.autosomes.g.vcf.gz \
GER.4.autosomes.g.vcf.gz \
GER.5.autosomes.g.vcf.gz \
GER.6.autosomes.g.vcf.gz \
GER.7.autosomes.g.vcf.gz \
GER.8.autosomes.g.vcf.gz \
| /opt/bcftools/bcftools-1.21/bcftools filter -e "sSUM(FORMAT/AD)<5 | MAX(FORMAT/GQ)<30" -g 3 -G 5 -S . --threads 24 \
| /opt/bcftools/bcftools-1.21/bcftools view --threads 24 -m 2 -i 'GT~"1"' -v snps -Oz -o popGER.chr10.DP5.GQ30.SnpGap3.IndelGap5.vcf.gz

/opt/bcftools/bcftools-1.21/bcftools merge --threads 24 -r chr9 \
GER.1.autosomes.g.vcf.gz \
GER.2.autosomes.g.vcf.gz \
GER.3.autosomes.g.vcf.gz \
GER.4.autosomes.g.vcf.gz \
GER.5.autosomes.g.vcf.gz \
GER.6.autosomes.g.vcf.gz \
GER.7.autosomes.g.vcf.gz \
GER.8.autosomes.g.vcf.gz \
| /opt/bcftools/bcftools-1.21/bcftools filter -e "sSUM(FORMAT/AD)<5 | MAX(FORMAT/GQ)<30" -g 3 -G 5 -S . --threads 24 \
| /opt/bcftools/bcftools-1.21/bcftools view --threads 24 -m 2 -i 'GT~"1"' -v snps -Oz -o popGER.chr9.DP5.GQ30.SnpGap3.IndelGap5.vcf.gz

/opt/bcftools/bcftools-1.21/bcftools merge --threads 24 -r chr8 \
GER.1.autosomes.g.vcf.gz \
GER.2.autosomes.g.vcf.gz \
GER.3.autosomes.g.vcf.gz \
GER.4.autosomes.g.vcf.gz \
GER.5.autosomes.g.vcf.gz \
GER.6.autosomes.g.vcf.gz \
GER.7.autosomes.g.vcf.gz \
GER.8.autosomes.g.vcf.gz \
| /opt/bcftools/bcftools-1.21/bcftools filter -e "sSUM(FORMAT/AD)<5 | MAX(FORMAT/GQ)<30" -g 3 -G 5 -S . --threads 24 \
| /opt/bcftools/bcftools-1.21/bcftools view --threads 24 -m 2 -i 'GT~"1"' -v snps -Oz -o popGER.chr8.DP5.GQ30.SnpGap3.IndelGap5.vcf.gz

/opt/bcftools/bcftools-1.21/bcftools merge --threads 24 -r chr7 \
GER.1.autosomes.g.vcf.gz \
GER.2.autosomes.g.vcf.gz \
GER.3.autosomes.g.vcf.gz \
GER.4.autosomes.g.vcf.gz \
GER.5.autosomes.g.vcf.gz \
GER.6.autosomes.g.vcf.gz \
GER.7.autosomes.g.vcf.gz \
GER.8.autosomes.g.vcf.gz \
| /opt/bcftools/bcftools-1.21/bcftools filter -e "sSUM(FORMAT/AD)<5 | MAX(FORMAT/GQ)<30" -g 3 -G 5 -S . --threads 24 \
| /opt/bcftools/bcftools-1.21/bcftools view --threads 24 -m 2 -i 'GT~"1"' -v snps -Oz -o popGER.chr7.DP5.GQ30.SnpGap3.IndelGap5.vcf.gz

/opt/bcftools/bcftools-1.21/bcftools merge --threads 24 -r chr6 \
GER.1.autosomes.g.vcf.gz \
GER.2.autosomes.g.vcf.gz \
GER.3.autosomes.g.vcf.gz \
GER.4.autosomes.g.vcf.gz \
GER.5.autosomes.g.vcf.gz \
GER.6.autosomes.g.vcf.gz \
GER.7.autosomes.g.vcf.gz \
GER.8.autosomes.g.vcf.gz \
| /opt/bcftools/bcftools-1.21/bcftools filter -e "sSUM(FORMAT/AD)<5 | MAX(FORMAT/GQ)<30" -g 3 -G 5 -S . --threads 24 \
| /opt/bcftools/bcftools-1.21/bcftools view --threads 24 -m 2 -i 'GT~"1"' -v snps -Oz -o popGER.chr6.DP5.GQ30.SnpGap3.IndelGap5.vcf.gz

/opt/bcftools/bcftools-1.21/bcftools merge --threads 24 -r chr5 \
GER.1.autosomes.g.vcf.gz \
GER.2.autosomes.g.vcf.gz \
GER.3.autosomes.g.vcf.gz \
GER.4.autosomes.g.vcf.gz \
GER.5.autosomes.g.vcf.gz \
GER.6.autosomes.g.vcf.gz \
GER.7.autosomes.g.vcf.gz \
GER.8.autosomes.g.vcf.gz \
| /opt/bcftools/bcftools-1.21/bcftools filter -e "sSUM(FORMAT/AD)<5 | MAX(FORMAT/GQ)<30" -g 3 -G 5 -S . --threads 24 \
| /opt/bcftools/bcftools-1.21/bcftools view --threads 24 -m 2 -i 'GT~"1"' -v snps -Oz -o popGER.chr5.DP5.GQ30.SnpGap3.IndelGap5.vcf.gz

/opt/bcftools/bcftools-1.21/bcftools merge --threads 24 -r chr4 \
GER.1.autosomes.g.vcf.gz \
GER.2.autosomes.g.vcf.gz \
GER.3.autosomes.g.vcf.gz \
GER.4.autosomes.g.vcf.gz \
GER.5.autosomes.g.vcf.gz \
GER.6.autosomes.g.vcf.gz \
GER.7.autosomes.g.vcf.gz \
GER.8.autosomes.g.vcf.gz \
| /opt/bcftools/bcftools-1.21/bcftools filter -e "sSUM(FORMAT/AD)<5 | MAX(FORMAT/GQ)<30" -g 3 -G 5 -S . --threads 24 \
| /opt/bcftools/bcftools-1.21/bcftools view --threads 24 -m 2 -i 'GT~"1"' -v snps -Oz -o popGER.chr4.DP5.GQ30.SnpGap3.IndelGap5.vcf.gz

/opt/bcftools/bcftools-1.21/bcftools merge --threads 24 -r chr3 \
GER.1.autosomes.g.vcf.gz \
GER.2.autosomes.g.vcf.gz \
GER.3.autosomes.g.vcf.gz \
GER.4.autosomes.g.vcf.gz \
GER.5.autosomes.g.vcf.gz \
GER.6.autosomes.g.vcf.gz \
GER.7.autosomes.g.vcf.gz \
GER.8.autosomes.g.vcf.gz \
| /opt/bcftools/bcftools-1.21/bcftools filter -e "sSUM(FORMAT/AD)<5 | MAX(FORMAT/GQ)<30" -g 3 -G 5 -S . --threads 24 \
| /opt/bcftools/bcftools-1.21/bcftools view --threads 24 -m 2 -i 'GT~"1"' -v snps -Oz -o popGER.chr3.DP5.GQ30.SnpGap3.IndelGap5.vcf.gz

/opt/bcftools/bcftools-1.21/bcftools merge --threads 24 -r chr2 \
GER.1.autosomes.g.vcf.gz \
GER.2.autosomes.g.vcf.gz \
GER.3.autosomes.g.vcf.gz \
GER.4.autosomes.g.vcf.gz \
GER.5.autosomes.g.vcf.gz \
GER.6.autosomes.g.vcf.gz \
GER.7.autosomes.g.vcf.gz \
GER.8.autosomes.g.vcf.gz \
| /opt/bcftools/bcftools-1.21/bcftools filter -e "sSUM(FORMAT/AD)<5 | MAX(FORMAT/GQ)<30" -g 3 -G 5 -S . --threads 24 \
| /opt/bcftools/bcftools-1.21/bcftools view --threads 24 -m 2 -i 'GT~"1"' -v snps -Oz -o popGER.chr2.DP5.GQ30.SnpGap3.IndelGap5.vcf.gz

/opt/bcftools/bcftools-1.21/bcftools merge --threads 24 -r chr1 \
GER.1.autosomes.g.vcf.gz \
GER.2.autosomes.g.vcf.gz \
GER.3.autosomes.g.vcf.gz \
GER.4.autosomes.g.vcf.gz \
GER.5.autosomes.g.vcf.gz \
GER.6.autosomes.g.vcf.gz \
GER.7.autosomes.g.vcf.gz \
GER.8.autosomes.g.vcf.gz \
| /opt/bcftools/bcftools-1.21/bcftools filter -e "sSUM(FORMAT/AD)<5 | MAX(FORMAT/GQ)<30" -g 3 -G 5 -S . --threads 24 \
| /opt/bcftools/bcftools-1.21/bcftools view --threads 24 -m 2 -i 'GT~"1"' -v snps -Oz -o popGER.chr1.DP5.GQ30.SnpGap3.IndelGap5.vcf.gz
