for file in *.BQSR.bam;do /opt/bcftools/bcftools-1.21/bcftools mpileup -Ou \
-f /data/references/gencode.vM33/GRCm39.primary_assembly.genome.fa \
-r chrX $file | /opt/bcftools/bcftools-1.21/bcftools call --ploidy 1 -mA -Oz -f GQ -o $file.chrX.mpileup.call.g.vcf.gz;done

for file in *.BQSR.bam;do /opt/bcftools/bcftools-1.21/bcftools mpileup -Ou \
-f /data/references/gencode.vM33/GRCm39.primary_assembly.genome.fa \
-r chr19 $file | /opt/bcftools/bcftools-1.21/bcftools call -mA -Oz -f GQ -o $file.chr19.mpileup.call.g.vcf.gz;done

for file in *.BQSR.bam;do /opt/bcftools/bcftools-1.21/bcftools mpileup -Ou \
-f /data/references/gencode.vM33/GRCm39.primary_assembly.genome.fa \
-r chr18 $file | /opt/bcftools/bcftools-1.21/bcftools call -mA -Oz -f GQ -o $file.chr18.mpileup.call.g.vcf.gz;done

for file in *.BQSR.bam;do /opt/bcftools/bcftools-1.21/bcftools mpileup -Ou \
-f /data/references/gencode.vM33/GRCm39.primary_assembly.genome.fa \
-r chr17 $file | /opt/bcftools/bcftools-1.21/bcftools call -mA -Oz -f GQ -o $file.chr17.mpileup.call.g.vcf.gz;done

for file in *.BQSR.bam;do /opt/bcftools/bcftools-1.21/bcftools mpileup -Ou \
-f /data/references/gencode.vM33/GRCm39.primary_assembly.genome.fa \
-r chr16 $file | /opt/bcftools/bcftools-1.21/bcftools call -mA -Oz -f GQ -o $file.chr16.mpileup.call.g.vcf.gz;done

for file in *.BQSR.bam;do /opt/bcftools/bcftools-1.21/bcftools mpileup -Ou \
-f /data/references/gencode.vM33/GRCm39.primary_assembly.genome.fa \
-r chr15 $file | /opt/bcftools/bcftools-1.21/bcftools call -mA -Oz -f GQ -o $file.chr15.mpileup.call.g.vcf.gz;done

for file in *.BQSR.bam;do /opt/bcftools/bcftools-1.21/bcftools mpileup -Ou \
-f /data/references/gencode.vM33/GRCm39.primary_assembly.genome.fa \
-r chr14 $file | /opt/bcftools/bcftools-1.21/bcftools call -mA -Oz -f GQ -o $file.chr14.mpileup.call.g.vcf.gz;done

for file in *.BQSR.bam;do /opt/bcftools/bcftools-1.21/bcftools mpileup -Ou \
-f /data/references/gencode.vM33/GRCm39.primary_assembly.genome.fa \
-r chr13 $file | /opt/bcftools/bcftools-1.21/bcftools call -mA -Oz -f GQ -o $file.chr13.mpileup.call.g.vcf.gz;done

for file in *.BQSR.bam;do /opt/bcftools/bcftools-1.21/bcftools mpileup -Ou \
-f /data/references/gencode.vM33/GRCm39.primary_assembly.genome.fa \
-r chr12 $file | /opt/bcftools/bcftools-1.21/bcftools call -mA -Oz -f GQ -o $file.chr12.mpileup.call.g.vcf.gz;done

for file in *.BQSR.bam;do /opt/bcftools/bcftools-1.21/bcftools mpileup -Ou \
-f /data/references/gencode.vM33/GRCm39.primary_assembly.genome.fa \
-r chr11 $file | /opt/bcftools/bcftools-1.21/bcftools call -mA -Oz -f GQ -o $file.chr11.mpileup.call.g.vcf.gz;done

for file in *.BQSR.bam;do /opt/bcftools/bcftools-1.21/bcftools mpileup -Ou \
-f /data/references/gencode.vM33/GRCm39.primary_assembly.genome.fa \
-r chr10 $file | /opt/bcftools/bcftools-1.21/bcftools call -mA -Oz -f GQ -o $file.chr10.mpileup.call.g.vcf.gz;done

for file in *.BQSR.bam;do /opt/bcftools/bcftools-1.21/bcftools mpileup -Ou \
-f /data/references/gencode.vM33/GRCm39.primary_assembly.genome.fa \
-r chr9 $file | /opt/bcftools/bcftools-1.21/bcftools call -mA -Oz -f GQ -o $file.chr9.mpileup.call.g.vcf.gz;done

for file in *.BQSR.bam;do /opt/bcftools/bcftools-1.21/bcftools mpileup -Ou \
-f /data/references/gencode.vM33/GRCm39.primary_assembly.genome.fa \
-r chr8 $file | /opt/bcftools/bcftools-1.21/bcftools call -mA -Oz -f GQ -o $file.chr8.mpileup.call.g.vcf.gz;done

for file in *.BQSR.bam;do /opt/bcftools/bcftools-1.21/bcftools mpileup -Ou \
-f /data/references/gencode.vM33/GRCm39.primary_assembly.genome.fa \
-r chr7 $file | /opt/bcftools/bcftools-1.21/bcftools call -mA -Oz -f GQ -o $file.chr7.mpileup.call.g.vcf.gz;done

for file in *.BQSR.bam;do /opt/bcftools/bcftools-1.21/bcftools mpileup -Ou \
-f /data/references/gencode.vM33/GRCm39.primary_assembly.genome.fa \
-r chr6 $file | /opt/bcftools/bcftools-1.21/bcftools call -mA -Oz -f GQ -o $file.chr6.mpileup.call.g.vcf.gz;done

for file in *.BQSR.bam;do /opt/bcftools/bcftools-1.21/bcftools mpileup -Ou \
-f /data/references/gencode.vM33/GRCm39.primary_assembly.genome.fa \
-r chr5 $file | /opt/bcftools/bcftools-1.21/bcftools call -mA -Oz -f GQ -o $file.chr5.mpileup.call.g.vcf.gz;done

for file in *.BQSR.bam;do /opt/bcftools/bcftools-1.21/bcftools mpileup -Ou \
-f /data/references/gencode.vM33/GRCm39.primary_assembly.genome.fa \
-r chr4 $file | /opt/bcftools/bcftools-1.21/bcftools call -mA -Oz -f GQ -o $file.chr4.mpileup.call.g.vcf.gz;done

for file in *.BQSR.bam;do /opt/bcftools/bcftools-1.21/bcftools mpileup -Ou \
-f /data/references/gencode.vM33/GRCm39.primary_assembly.genome.fa \
-r chr3 $file | /opt/bcftools/bcftools-1.21/bcftools call -mA -Oz -f GQ -o $file.chr3.mpileup.call.g.vcf.gz;done

for file in *.BQSR.bam;do /opt/bcftools/bcftools-1.21/bcftools mpileup -Ou \
-f /data/references/gencode.vM33/GRCm39.primary_assembly.genome.fa \
-r chr2 $file | /opt/bcftools/bcftools-1.21/bcftools call -mA -Oz -f GQ -o $file.chr2.mpileup.call.g.vcf.gz;done

for file in *.BQSR.bam;do /opt/bcftools/bcftools-1.21/bcftools mpileup -Ou \
-f /data/references/gencode.vM33/GRCm39.primary_assembly.genome.fa \
-r chr1 $file | /opt/bcftools/bcftools-1.21/bcftools call -mA -Oz -f GQ -o $file.chr1.mpileup.call.g.vcf.gz;done
