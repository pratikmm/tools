#Script for common package installation on MatrixDS docker image
p<-c('gmp','rJava','partitions','Rmpfr','RJDBC','binGroup','mailR',
	'rgl')

install.packages(p,dependencies = TRUE)

.libPaths( c( .libPaths(), "/srv/R/library") )
