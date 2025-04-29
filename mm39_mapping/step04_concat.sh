/opt/bcftools/bcftools-1.21/bcftools concat --threads 24 \
-Oz -o GER.1.autosomes.g.vcf.gz \
GER.1.paired.nodup.samblaster.bam.sorted.BQSR.bam.chr1.mpileup.call.g.vcf.gz \
GER.1.paired.nodup.samblaster.bam.sorted.BQSR.bam.chr2.mpileup.call.g.vcf.gz \
GER.1.paired.nodup.samblaster.bam.sorted.BQSR.bam.chr3.mpileup.call.g.vcf.gz \
GER.1.paired.nodup.samblaster.bam.sorted.BQSR.bam.chr4.mpileup.call.g.vcf.gz \
GER.1.paired.nodup.samblaster.bam.sorted.BQSR.bam.chr5.mpileup.call.g.vcf.gz \
GER.1.paired.nodup.samblaster.bam.sorted.BQSR.bam.chr6.mpileup.call.g.vcf.gz \
GER.1.paired.nodup.samblaster.bam.sorted.BQSR.bam.chr7.mpileup.call.g.vcf.gz \
GER.1.paired.nodup.samblaster.bam.sorted.BQSR.bam.chr8.mpileup.call.g.vcf.gz \
GER.1.paired.nodup.samblaster.bam.sorted.BQSR.bam.chr9.mpileup.call.g.vcf.gz \
GER.1.paired.nodup.samblaster.bam.sorted.BQSR.bam.chr10.mpileup.call.g.vcf.gz \
GER.1.paired.nodup.samblaster.bam.sorted.BQSR.bam.chr11.mpileup.call.g.vcf.gz \
GER.1.paired.nodup.samblaster.bam.sorted.BQSR.bam.chr12.mpileup.call.g.vcf.gz \
GER.1.paired.nodup.samblaster.bam.sorted.BQSR.bam.chr13.mpileup.call.g.vcf.gz \
GER.1.paired.nodup.samblaster.bam.sorted.BQSR.bam.chr14.mpileup.call.g.vcf.gz \
GER.1.paired.nodup.samblaster.bam.sorted.BQSR.bam.chr15.mpileup.call.g.vcf.gz \
GER.1.paired.nodup.samblaster.bam.sorted.BQSR.bam.chr16.mpileup.call.g.vcf.gz \
GER.1.paired.nodup.samblaster.bam.sorted.BQSR.bam.chr17.mpileup.call.g.vcf.gz \
GER.1.paired.nodup.samblaster.bam.sorted.BQSR.bam.chr18.mpileup.call.g.vcf.gz \
GER.1.paired.nodup.samblaster.bam.sorted.BQSR.bam.chr19.mpileup.call.g.vcf.gz

mv GER.1.paired.nodup.samblaster.bam.sorted.BQSR.bam.chrX.mpileup.call.g.vcf.gz \
GER.1.chrX.g.vcf.gz
