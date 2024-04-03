
library(Seurat)
ori.pbmc=readRDS('8ef95311-5b26-4cb2-816d-6883f794ddb7.rds')

DATA=ori.pbmc[['RNA']]@data

library(clusterProfiler)  
library(org.Hs.eg.db)

ENSG=rownames(DATA)
SYMBOL=mapIds(org.Hs.eg.db, ENSG, column="SYMBOL", keytype="ENSEMBL", multiVals="first")

USED=which(!is.na(SYMBOL))

DATA=DATA[USED,]
rownames(DATA)=SYMBOL[USED]

