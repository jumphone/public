
# Seurat 4
library(Seurat)
natneu_2021=readRDS('/newdisk/database/TCP/RDS/NatNeu2021_seurat.rds') # get from UCSC single-cell database

# Quality control
natneu_2021_nuclei=subset(natneu_2021,subset = nFeature_RNA > 500 & nFeature_RNA < 3000, cells=colnames(natneu_2021)[which(natneu_2021$type %in% c('nuclei','nulcei'))])

DefaultAssay(natneu_2021_nuclei)='RNA'
natneu_2021_nuclei=NormalizeData(natneu_2021_nuclei, normalization.method = "LogNormalize", scale.factor = 10000)

MARKER=c('HNRNPH1','SOX11','CTNNB1','NEUROD1','PDGFRA','ACTB','GAPDH','SOX2','SOX4')

pdf('tmp.pdf',width=15,height=15)
FeaturePlot(natneu_2021_nuclei, features=MARKER,order=T,slot='data',cols=c('royalblue1','grey90','indianred1','gold1'),pt.size=0.1)
dev.off()







