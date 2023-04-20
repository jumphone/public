

INPUT=ALL_BC_PAIR.bam.bedpe.changed.bed
bedtools groupby -i $INPUT -grp 1,2,3,4 -opCols 5 -ops sum | bedtools sort -i - > $INPUT\.agg.sorted.bed

bgzip $INPUT\.agg.sorted.bed
tabix -p bed $INPUT\.agg.sorted.bed.gz



bedtools groupby -i $INPUT -grp 4 -opCols 5 -ops sum > $INPUT\.cell_stat.txt




