.stepNorm <-function(X, DP, EX=1, UP=0.8, LW=0.2,  STEP=100){
    X=X
    DP=DP
    EX=EX
    STEP=STEP
    ##############
    OUT=X
    START=min(DP)
    END=max(DP)
    i=START
    while(i<END){
        this_start=i
        this_end=i+STEP
        this_index = which(DP>=this_start & DP<this_end & X>0)
        this_index_extand = which(DP>=this_start-STEP*EX & DP<this_end +STEP*EX & X>0)
        if(length(this_index)>0){
            this_x=X[this_index]
            this_x_extend=X[this_index_extand]
            this_dp=DP[this_index]
            this_dp_extend=DP[this_index_extand]
            if(length(this_index)>3){
                this_data=data.frame(x=this_dp,y=this_x)
                this_data_extend=data.frame(x=this_dp_extend,y=this_x_extend)
                this_lm=lm(y~x, data=this_data_extend)
                this_x_p=predict(this_lm, newdata=this_data)
                this_x_p_extend=predict(this_lm, newdata=this_data_extend)
                }else{
                this_x_p=mean(this_x)
                this_x_p_extend=mean(this_x_extend)
                }
            this_x_r=this_x-this_x_p
            this_x_r_extend=this_x_extend-this_x_p_extend
            this_x_final=(this_x_r -  qnorm(LW,mean=mean(this_x_r_extend),sd=sd(this_x_r_extend))  ) * qnorm(UP,mean=mean(this_x_r_extend),sd=sd(this_x_r_extend)) 
            OUT[this_index]=this_x_final
            }
        i=i+STEP}
    OUT[which(OUT<0)]=0
    return(OUT)
    }
