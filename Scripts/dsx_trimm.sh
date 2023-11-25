#!/bin/bash

POOLS=($(for i in ~/Desktop/dsx_all/data_analyz/00_fastq/R1/*_001.fastq.gz; do echo $(basename ${i%_R*}); done))

for POOL in ${POOLS[@]};
do
	# set folder
	IN1=~/Desktop/dsx_all/data_analyz/00_fastq/R1/${POOL}_R1_001.fastq.gz
	IN2=~/Desktop/dsx_all/data_analyz/00_fastq/R2/${POOL}_R2_001.fastq.gz
	OUT1=~/Desktop/dsx_all/data_analyz/trimmed/R1/${POOL}_R1_001_trimmed.fastq.gz
	OUT2=~/Desktop/dsx_all/data_analyz/trimmed/R2/${POOL}_R2_001_trimmed.fastq.gz
	LOG=~/Desktop/dsx_all/data_analyz/residual/${POOL}.log
	
	# Filter and trimm the data
	echo "Filtring and trimming $POOL with fastp"
	fastp --in1 $IN1 --in2 $IN2 --out1 $OUT1 --out2 $OUT2 -l 200 -h ${POOL}.html &> $LOG

done
