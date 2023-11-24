library(matrixStats)

rowScale = function(x,
    center = TRUE,
    scale = TRUE,
    add_attr = TRUE,
    rows = NULL,
    cols = NULL) {
    if (!is.null(rows) && !is.null(cols)) {
        x <- x[rows, cols, drop = FALSE]
        } else if (!is.null(rows)) {
        x <- x[rows, , drop = FALSE]
        } else if (!is.null(cols)) {
        x <- x[, cols, drop = FALSE]
        }
  ################
  # Get the column means
  ################
    cm = rowMeans(x, na.rm = TRUE)
  ################
  # Get the column sd
  ################
    if (scale) {
        csd = rowSds(x, center = cm)
        } else {
        # just divide by 1 if not
        csd = rep(1, length = length(cm))
        }
    if (!center) {
        # just subtract 0
        cm = rep(0, length = length(cm))
        }
    x = (x - cm) / csd
    if (add_attr) {
        if (center) {
            attr(x, "scaled:center") <- cm
        }
        if (scale) {
            attr(x, "scaled:scale") <- csd
        }
        }
    return(as.matrix(x))
    }


.norm1 <- function(x){
    y=(x-min(x))/(max(x)-min(x))
    y[which(is.na(y))]=0
    return(y)
    }

.stepClst <- function(MAT){
    MAT=MAT
    ######################
    print('scaling...')
    #SMAT=t(apply(MAT,1,scale))
    SMAT=rowScale(MAT)
    rownames(SMAT)=rownames(MAT)
    colnames(SMAT)=colnames(MAT)
    SMAT[which(is.na(SMAT))]=0
    ###################
    print('scoring...')
    TMP=SMAT
    TMP_FLAG=matrix(0,nrow=nrow(SMAT),ncol=ncol(SMAT))
    MAX.COL=max.col(SMAT)
    i=1
    while(i<=nrow(SMAT)){
        TMP_FLAG[i,MAX.COL[i]]=1
        i=i+1}
    ####################
    COL_INDEX=c(1:ncol(TMP))
    ####################
    DDD=COL_INDEX - median(COL_INDEX)
    WWW=  10 ** abs(DDD) * sign(DDD)
    ####################
    TMP_POS=TMP
    TMP_POS[which(TMP<0)]=0
    SCORE1 = .norm1(TMP_POS %*% WWW )*0.99
    ####################
    SCORE2 = TMP_FLAG %*% COL_INDEX
    SCORE = SCORE1 + SCORE2
    SPLIT = as.integer(SCORE)
    #####################
    print('finished!')
    #####################
    OUT=list()
    OUT$smat=SMAT
    OUT$score=SCORE
    OUT$split=SPLIT
    return(OUT)
    }

