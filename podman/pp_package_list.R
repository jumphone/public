install.packages(c("remotes",'Matrix'))
install.packages('stringi')

install.packages(c('sitmo', 'vctrs', 'lifecycle', 'spatstat.geom', 'spatstat.data'))
install.packages(c('ellipsis', 'sass', 'memoise', 'jquerylib', 'htmltools', 'cachem', 'promises', 'later'))
install.packages(c('gtable', 'stringi', 'stringr', 'plyr', 'colorspace', 'dotCall64', 'parallelly', 'listenv', 'globals', 'future'))
install.packages(c('bitops', 'caTools','gtools', 'rprojroot', 'lazyeval', 'withr', 'pkgconfig', 'tidyselect', 'tibble', 'pillar', 'generics'))
install.packages(c('cpp11', 'purrr', 'dplyr', 'tinytex', 'fontawesome', 'bslib', 'xfun', 'highr', 'evaluate', 'yaml'))
install.packages(c('rmarkdown', 'knitr', 'sys', 'askpass', 'openssl', 'curl', 'commonmark', 'crayon', 'sourcetools', 'xtable', 'httpuv'))
install.packages(c('png', 'here', 'RcppTOML', 'viridisLite', 'RColorBrewer', 'munsell', 'labeling', 'farver', 'scales', 'isoband', 'dqrng'))
install.packages(c('RcppProgress', 'irlba', 'RcppAnnoy', 'FNN', 'goftest', 'spatstat.sparse', 'spatstat.random', 'RcppArmadillo', 'matrixStats'))
install.packages(c('gridExtra', 'reshape2', 'ggplot2', 'future.apply', 'RcppEigen','spam', 'progressr', 'sp', 'gplots', 'data.table', 'crosstalk', 'tidyr'))
install.packages(c('htmlwidgets', 'httr', 'shiny', 'zoo', 'igraph', 'reticulate', 'uwot', 'spatstat.explore', 'sctransform', 'scattermore'))
install.packages(c('SeuratObject','Rtsne', 'ROCR', 'RANN', 'plotly', 'pbapply', 'patchwork', 'miniUI', 'lmtest', 'leiden', 'ica', 'ggridges','ggrepel', 'fitdistrplus', 'cowplot'))


remotes::install_version("Seurat", "4.4.0", repos = c("https://satijalab.r-universe.dev", getOption("repos")))

install.packages('devtools')
install.packages("BiocManager")

BiocManager::install('Biostrings')
BiocManager::install('GenomeInfoDbData')
BiocManager::install('GenomeInfoDb')
BiocManager::install('GenomicRanges')
BiocManager::install('IRanges')
BiocManager::install('Rsamtools')
BiocManager::install('S4Vectors')
BiocManager::install('BiocGenerics')

install.packages("Signac")

install.packages('circlize')

install.packages('GetoptLong')
install.packages('clue')
install.packages('foreach')
install.packages('doParallel')

BiocManager::install("ComplexHeatmap")
BiocManager::install("motifmatchr")
BiocManager::install("chromVAR")
devtools::install_github("GreenleafLab/ArchR", ref="master", repos = BiocManager::repositories())

install.packages('hash')

