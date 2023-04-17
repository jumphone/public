library(Seurat)

pbmc=readRDS('seurat.rds')
PCA=pbmc@reductions$pca
UMAP=pbmc@reductions$umap
TSNE=pbmc@reductions$tsne
META=pbmc@meta.data
COUNT=pbmc[['RNA']]@counts
UMAP@assay.used='RNA'

pbmc=CreateSeuratObject(counts = COUNT, project = "cerebellum", min.cells = 0, min.features = 0)
pbmc@meta.data=META
pbmc@reductions$umap=UMAP

pbmc <- subset(pbmc, subset = nFeature_RNA>2000 & type=='nuclei')

pbmc <- NormalizeData(pbmc, normalization.method = "LogNormalize", scale.factor = 10000)


source('https://gitee.com/jumphone/VISA/raw/master/VISA.R')
EXP=rank(pbmc[['RNA']]@data['HNRNPH1',])
COL=visa.vcol(EXP,c(min(EXP),quantile(EXP,0.95),max(EXP)),c('grey90','grey90','indianred1'))
plot(pbmc@reductions$umap@cell.embeddings[order(EXP),], col=COL[order(EXP)], cex=0.5, pch=16)

DimPlot(pbmc, group.by='age',label=TRUE)+NoLegend()
DimPlot(pbmc, group.by='figure_clusters',label=TRUE)+NoLegend()


