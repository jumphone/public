
library(Seurat)
ori.pbmc=readRDS('8ef95311-5b26-4cb2-816d-6883f794ddb7.rds')

DATA=ori.pbmc[['RNA']]@data

library(clusterProfiler)  
library(org.Hs.eg.db)


ensg_to_symbol <- toTable(org.Hs.egENSEMBL)  
  
# 只保留你数据中存在的ENSG号  
ensg_in_data <- rownames(DATA)  
ensg_to_symbol <- ensg_to_symbol[ensg_to_symbol$ensembl_id %in% ensg_in_data,]  
  
# 确保所有的ENSG号都能找到对应的基因符号  
# 如果有找不到的，你可能需要手动处理或排除这些ENSG号  
missing_ensg <- setdiff(ensg_in_data, ensg_to_symbol$ensembl_id)  


###############################

DATA=DATA[which(!rownames(DATA) %in% missing_ensg),]

ensg_to_symbol <- toTable(org.Hs.egENSEMBL)  
ensg_in_data <- rownames(DATA)  
ensg_to_symbol <- ensg_to_symbol[ensg_to_symbol$ensembl_id %in% ensg_in_data,]  
  
# 创建一个从ENSG号到基因符号的映射向量  
ensg_to_symbol_vec <- setNames(as.character(ensg_to_symbol$symbol), ensg_to_symbol$ensembl_id)  
rownames(DATA) <- ensg_to_symbol_vec[rownames(DATA)]



