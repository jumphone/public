
library(MASS)
set.seed(123)
KDEN=kde2d(x=VEC[,1],y=VEC[,2],n=100)

ALL_INDEX=c(1:length(KDEN$z))
COL_INDEX=(ALL_INDEX-1) %% ncol(KDEN$z)+1
ROW_INDEX=(ALL_INDEX-1) %/% ncol(KDEN$z) +1

DVEC=cbind(KDEN$x[COL_INDEX],KDEN$y[ROW_INDEX])
DEN=as.numeric(KDEN$z)


source('/home/toolkit/src/VISA.R')
COL=visa.vcol(DEN,CV=c(min(DEN),max(DEN)),CN=c('blue','red'))
plot(DVEC,col=COL, pch=16)


Z=fields::interp.surface(KDEN, VEC)

P=ecdf(DEN)(Z)







