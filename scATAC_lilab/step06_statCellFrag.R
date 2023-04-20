

a=read.table('ALL_BC_PAIR.bam.bedpe.changed.bed.cell_stat.txt')

pdf('cell_stat.pdf',width=5,height=5)
plot(sort(a[,2]),col='grey50',pch=16,cex=2)
plot(density(a[,2]),type='h',lwd=2,col='grey70')
dev.off()


