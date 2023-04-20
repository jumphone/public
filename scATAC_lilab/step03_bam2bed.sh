

#samtools sort -n Mapping/ALL_BC.pe.q10.sort.bam --threads 20 -o ALL_BC_PAIR.bam
samtools sort -n Mapping/ALL_BC.bam --threads 40 -o ALL_BC_PAIR.bam

INPUT=ALL_BC_PAIR.bam
bedtools bamtobed  -bedpe -i $INPUT  > $INPUT\.bedpe


