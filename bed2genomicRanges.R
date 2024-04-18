
this_chr=as.character(this_peak@seqnames)
this_start=this_peak@ranges@start
this_end=this_peak@ranges@start+this_peak@ranges@width-1

BED=cbind(this_chr,this_start,this_end)

gr <- GenomicRanges::GRanges(BED[,1], ranges=IRanges::IRanges(as.numeric(BED[,2]),as.numeric(BED[,3])))



