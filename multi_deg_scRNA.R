
library(Biobase)
library(Seurat)
library(Libra)

SEED=123 # We have tested other seed and got similar results.
pbmc=readRDS('../Cerebellum/Fetal_cerebellum_final_cluster_1.rds')
pbmc$cell_type=rep('All',ncol(pbmc))
set.seed(SEED)
pbmc$replicate=sample(c('S1','S2','S3','S4','S5'),ncol(pbmc),replace=T)
pbmc$label=rep('nonTCP',length(pbmc$cell_type))
pbmc$label[which(pbmc$celltype=='02xTCP')]='TCP'
pbmc$label=factor(pbmc$label,levels = c("TCP","nonTCP"))
set.seed(SEED)
pbmc_sub=subset(pbmc, cells=sample(colnames(pbmc),1000))
table(pbmc_sub$label)









