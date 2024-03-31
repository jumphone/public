library(Seurat)
pbmc=readRDS('Nature2022_Fetal_cerebellum_final_cluster_1.rds')

DATA=pbmc[['RNA']]@data
TYPE=pbmc$celltype
UMAP=pbmc@reductions$umap@cell.embeddings

set.seed(123)
RANDOM_INDEX=sample(1:ncol(DATA),10000)

UDATA=DATA[,RANDOM_INDEX]
UTYPE=TYPE[RANDOM_INDEX]
UUMAP=UMAP[RANDOM_INDEX,]

MARKER=c('SOX11','HNRNPH1','CTNNB1')
MAT=t(as.matrix(UDATA[MARKER,]))

############
K=20
##############
df=MAT
dist_matrix <- dist(df, method = "euclidean")
hc <- hclust(dist_matrix) 
clst=cutree(hc,k=K)


TAB=as.matrix(table(UTYPE, clst))
RS=rowSums(TAB)
CS=colSums(TAB)

UNUM=RS-TAB+t(CS-t(TAB))+TAB

RMAT=TAB/UNUM
heatmap(RMAT, scale=NULL)

boxplot(rowSums(MAT)~clst)

