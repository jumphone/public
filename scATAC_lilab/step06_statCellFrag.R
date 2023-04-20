

a=read.table('ALL_BC_PAIR.bam.bedpe.changed.bed.cell_stat.txt')

nFrag=a[,2]

pdf('cell_stat.pdf',width=5,height=5)
plot(sort(nFrag,decreasing=TRUE),col='grey50',pch=16,cex=1)
plot(density(nFrag),type='h',lwd=2,col='grey70')
dev.off()
