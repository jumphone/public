library(Seurat)
pbmc=readRDS('Nature2022_Fetal_cerebellum_final_cluster_1.rds')

DATA=pbmc[['RNA']]@data
TYPE=pbmc$celltype


MARKER=c('SOX11','HNRNPH1','CTNNB1')
MAT=t(as.matrix(DATA[MARKER,]))
SMAT=apply(MAT,2,scale)


library(mclust)

X=SMAT
class=TYPE

BIC <-mclustBIC(X,G=10:30)
saveRDS(BIC, file='mclust_bic.rds')

plot(BIC)

mod1 <- Mclust(X, x = BIC)
summary(mod1, parameters = TRUE)


table(class, mod1$classification)



