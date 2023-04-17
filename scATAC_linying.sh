cp *_R1.fq.gz R1/
cp *_R2.fq.gz R2/


gunzip R1/*.gz
gunzip R2/*.gz


cat R1/*.fq > ALL_R1.fq
cat R2/*.fq > ALL_R1.fq
