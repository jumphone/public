



TRAIN.DATA=read.table('data/56/Fitdevo/BRCA/mat_train.tsv',header=T,row.names=1,sep='\t')
TRAIN.TAG=read.csv('data/56/Fitdevo/BRCA/CorrectDP_train.csv',header=F)
TEST.DATA=read.table('data/56/Fitdevo/BRCA/mat_test.tsv',header=T,row.names=1,sep='\t')
TEST.TAG=read.csv('data/56/Fitdevo/BRCA/CorrectDP_test.csv',header=F)

source('https://raw.githubusercontent.com/jumphone/FitDevo/main/fitdevo.R') 
source('https://raw.githubusercontent.com/jumphone/InferLoop/main/inferloop/InferLoop.R') 

TRAIN.T=TRAIN.DATA[,which(TRAIN.TAG[,2]==1)]
TRAIN.N=TRAIN.DATA[,which(TRAIN.TAG[,2]==0)]

VT=apply(TRAIN.T,1,mean)
VN=apply(TRAIN.N,1,mean)

SPLIT=inferloop.splitILS(VT, VN, r=0)

BGW=VT
BGW[which(SPLIT$clst==3)]=1
BGW[which(SPLIT$clst!=3)]=0
#BGW=BGW[which(SPLIT$clst %in% c(1,3))]

###########################
OUT=fitdevo(TEST.DATA,BGW)
cor(OUT,TEST.TAG[,2])


