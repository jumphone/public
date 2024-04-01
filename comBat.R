DATA=RPKM
BATCH=c('our','our','li','li')

library(sva)
library(limma)
pheno = data.frame(batch=as.matrix(BATCH))
orig.data=DATA
edata = as_matrix(orig.data)
batch = pheno$batch
modcombat = model.matrix(~1, data=pheno)
combat_edata = ComBat(dat=edata, batch=batch, mod=modcombat, par.prior=TRUE, prior.plots=FALSE)
rownames(combat_edata)=rownames(edata)
colnames(combat_edata)=colnames(edata)
combat_edata=as.matrix(combat_edata)
combat_edata[which(combat_edata<0)]=0
combat_edata[which(is.na(combat_edata))]=0


