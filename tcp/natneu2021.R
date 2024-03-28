
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

pdf('tmp_count.pdf',width=15,height=15)
FeaturePlot(natneu_2021_nuclei, features=MARKER,order=T,slot='counts',cols=c('royalblue1','grey90','indianred1','gold1'),pt.size=0.1)
dev.off()

####################################################################################
# For Zaili

library(Seurat)
natneu_2021=readRDS('/newdisk/database/TCP/RDS/NatNeu2021_seurat.rds') # get from UCSC single-cell database
natneu_2021_counts=natneu_2021[['RNA']]@counts
natneu_2021_meta=natneu_2021@meta.data
natneu_2021_umap=natneu_2021@reductions$umap@cell.embeddings

saveRDS(natneu_2021_meta,'/newdisk/database/TCP/RDS/NatNeu2021_meta.rds')
saveRDS(natneu_2021_counts,'/newdisk/database/TCP/RDS/NatNeu2021_counts.rds')
saveRDS(natneu_2021_umap,'/newdisk/database/TCP/RDS/NatNeu2021_umap.rds')

##################


#####################
# Load data
library(Seurat)

natneu_2021_counts=readRDS('/newdisk/database/TCP/RDS/NatNeu2021_counts.rds')
natneu_2021_meta=readRDS('/newdisk/database/TCP/RDS/NatNeu2021_meta.rds')
natneu_2021_umap=readRDS('/newdisk/database/TCP/RDS/NatNeu2021_umap.rds')

####################
# Preprocess
natneu_2021 <- CreateSeuratObject(counts = natneu_2021_counts, meta.data =natneu_2021_meta, project = "natneu_2021", min.cells = 0, min.features = 0)
natneu_2021 <- NormalizeData(natneu_2021, normalization.method = "LogNormalize", scale.factor = 10000)
natneu_2021 <- FindVariableFeatures(natneu_2021, selection.method = "vst", nfeatures = 2000)
all.genes <- rownames(natneu_2021)
natneu_2021 <- ScaleData(natneu_2021, features = all.genes)
natneu_2021 <- RunPCA(natneu_2021, features = VariableFeatures(object = natneu_2021))
natneu_2021 <- RunUMAP(natneu_2021, dims = 1:10)
natneu_2021@reductions$umap@cell.embeddings=natneu_2021_umap

##########################
# Quality control
natneu_2021_nuclei=subset(natneu_2021,subset = nFeature_RNA > 500 & nFeature_RNA < 3000, cells=colnames(natneu_2021)[which(natneu_2021$type %in% c('nuclei','nulcei'))])

DefaultAssay(natneu_2021_nuclei)='RNA'
natneu_2021_nuclei=NormalizeData(natneu_2021_nuclei, normalization.method = "LogNormalize", scale.factor = 10000)

MARKER=c('HNRNPH1','SOX11','CTNNB1','NEUROD1','PDGFRA','ACTB','GAPDH','SOX2','SOX4')

pdf('tmp.pdf',width=15,height=15)
FeaturePlot(natneu_2021_nuclei, features=MARKER,order=T,slot='data',cols=c('royalblue1','grey90','indianred1','gold1'),pt.size=0.1)
dev.off()


pdf('tmp_count.pdf',width=15,height=15)
FeaturePlot(natneu_2021_nuclei, features=MARKER,order=T,slot='counts',cols=c('royalblue1','grey90','indianred1','gold1'),pt.size=0.1)
dev.off()



