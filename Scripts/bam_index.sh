#!/bin/bash

## index bam files
echo "index bam files with samtools"

MAPS=($(for i in ~/Desktop/dsx_all/data_analyz/aligned_results/*_mapped_sorted.bam; do echo $(basename ${i%_mapped*}); done))

for MAP in ${MAPS[@]};
do
	## Folders
	MAPPED=~/Desktop/dsx_all/data_analyz/igv_bam/${MAP}_mapped_sorted.bam
	
	samtools index $MAPPED

done
