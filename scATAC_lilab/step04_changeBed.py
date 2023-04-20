
INPUT='ALL_BC_PAIR.bam.bedpe'
fi=open(INPUT)
fo=open(INPUT+'.changed.bed','w')

for line in fi:
    seq=line.rstrip().split('\t')
    if seq[0] == seq[3]:
        loc=[int(seq[1]),int(seq[2]),int(seq[4]),int(seq[5])]
        this_out=seq[0]+'\t'+str(min(loc))+'\t'+str(max(loc))+'\t'+'_'.join(seq[6].split(':')[:2])+'\t1\n'
        fo.write(this_out)

fi.close()
fo.close()



