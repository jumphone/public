import os,sys

PATH=sys.argv[1]
OUT_PATH=sys.argv[2]
print(PATH)
print(OUT_PATH)

LST=os.listdir(PATH)

for file_name in LST:
    this_file=PATH+'/'+file_name
    this_out=OUT_PATH+'/'+file_name
    fi=open(this_file)
    fo=open(this_out,'w')
    i=1
    l1=fi.readline()
    l2=fi.readline()
    l3=fi.readline()
    l4=fi.readline()
    while l1 !='':
        #l1_out='@'+':'.join(file_name.split('.')[0].split('_')[0:2])+':XXX:'+str(i)+':'+l1[1:].split()[1].replace('+',':')+'\n'
        l1_out='@'+':'.join(file_name.split('.')[0].split('_')[0:2])+':ID:'+str(i)+':END'+'\n'
        fo.write(l1_out)
        fo.write(l2)
        fo.write(l3)
        fo.write(l4)
        i=i+1
        l1=fi.readline()
        l2=fi.readline()
        l3=fi.readline()
        l4=fi.readline()
    fi.close()
    fo.close()
