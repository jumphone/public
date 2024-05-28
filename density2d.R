library(MASS)
set.seed(123)
KDEN=kde2d(x=VEC[,1],y=VEC[,2],n=100)


ALL_INDEX=c(1:length(KDEN$z))
COL_INDEX=(ALL_INDEX-1) %% ncol(KDEN$z)+1
ROW_INDEX=(ALL_INDEX-1) %/% ncol(KDEN$z) +1

DVEC=cbind(KDEN$x[COL_INDEX],KDEN$y[ROW_INDEX])


DINDEX=rep(0,nrow(VEC))
j=1
while(j<=nrow(VEC)){
    this_vec=VEC[j,]
    this_dist=sqrt((DVEC[,1]-this_vec[1])**2+(DVEC[,2]-this_vec[2])**2)
    this_index=which(this_dist==min(this_dist))[1]
    DINDEX[j]=this_index
    if(j %%1000==1){print(j)}
    j=j+1
    }


VDEN=KDEN$z[DINDEX]
