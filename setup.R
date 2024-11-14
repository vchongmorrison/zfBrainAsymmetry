##### Set libPaths and memory/parallel cores usage #####
.libPaths(c("/home/chongmorrison/R/x86_64-pc-linux-gnu-library/4.3",
            "/home/chongmorrison/R/4.4.1-Bioc3.19"))
.libPaths() # check .libPaths

options(Ncpus = 12) # adjust no. of cores for base R
getOption("Ncpus", 1L)

library(future)
options(future.globals.maxSize = 2000 * 1024^2) # adjust limit of allowable object size = 2G
# *could* enable parallelisation i.e. workers > 1, for Seurat etc. but breaks Python processes currently...
future::plan("multisession", workers = 1) # or use "sequential" mode
future::plan()

library(BiocParallel) # for parallelising Bioconductor packages