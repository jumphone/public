setwd('/newdisk/database/TCP')
source('https://gitee.com/jumphone/BEER/raw/master/BEER.R')

library(Seurat)
protein_coding=read.table('/home/database/annotation/hg19/Homo_sapiens.GRCh37.75.chr.pc.gene.SYM.bed',sep='\t')[,4]
natneu_2021=readRDS('/newdisk/database/TCP/RDS/NatNeu2021_seurat.rds') # get from UCSC single-cell database

# Quality control
natneu_2021_nuclei=subset(natneu_2021,subset = nFeature_RNA > 500 & nFeature_RNA < 3000, cells=colnames(natneu_2021)[which(natneu_2021$type %in% c('nuclei','nulcei'))])

DefaultAssay(natneu_2021_nuclei)='RNA'
natneu_2021_nuclei=NormalizeData(natneu_2021_nuclei, normalization.method = "LogNormalize", scale.factor = 10000)

MARKER=c('HNRNPH1','SOX11','CTNNB1','NEUROD1','PDGFRA','ACTB','GAPDH')
FeaturePlot(natneu_2021_nuclei, features=MARKER,order=T,slot='data',cols=c('royalblue1','grey90','indianred1','gold1'))




