#!/bin/bash

## reference  genome 
REF=~/Desktop/dsx_all/data_analyz/reference/Anopheles_gambiaePEST4.fasta

##Index reference genome 
echo " index reference genome with bwa index"
bwa index $REF

##Array of data prefix
POOLS=($(for i in ~/Desktop/dsx_all/data_analyz/00_fastq/R1/*_001.fastq.gz; do echo $(basename ${i%_R*}); done))

for POOL in ${POOLS[@]};
do 
	# define folder - storing results
	FORWARD=~/Desktop/dsx_all/data_analyz/trimmed/R1/${POOL}_R1_001_trimmed.fastq.gz
	REVERSE=~/Desktop/dsx_all/data_analyz/trimmed/R2/${POOL}_R2_001_trimmed.fastq.gz
	OUTPUT=~/Desktop/dsx_all/data_analyz/aligned_results/${POOL}_mapped_sorted.bam
	
	# then align and sort
	echo "Aligning $POOL with bwa"
	bwa mem -M -t 4 $REF $FORWARD  $REVERSE | samtools view -b | samtools sort -T ${POOL} > $OUTPUT

done

