export MINIMAP2=/opt/minimap2-2.28_x64-linux/minimap2
export REFERENCE=/data/references/gencode.vM33/GRCm39.primary_assembly.genome.fa
export SAMBLASTER=/opt/samblaster-v.0.1.26/samblaster
export SAMTOOLS=/opt/samtools/samtools
export THREADS=12
export FWD=GER_01m_TP1_ERR899393_1.fastq.gz
export REV=GER_01m_TP1_ERR899393_2.fastq.gz

$MINIMAP2 -t $THREADS \
--sam-hit-only --secondary=yes \
-ax sr $REFERENCE $FWD $REV \
-R @RG\\tID:GER.1\\tSM:GER.1\\tLB:lib1\\tPL:illumina\\tPU:unit1 | \
$SAMBLASTER -r | $SAMTOOLS view -b - > GER.1.paired.nodup.samblaster.bam
$SAMTOOLS sort -O BAM -@$THREADS GER.1.paired.nodup.samblaster.bam > GER.1.paired.nodup.samblaster.bam.sorted
