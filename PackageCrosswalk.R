rm(list=ls(all=T))
#load existing paks from RDS
load('currentPaks.rds')
   
#ipak function: install and load multiple R packages.
## check to see if packages are installed. Install them if they are not, then load them into the R session.
ipak <- function(pkg){
     new.pkg <- pkg[!(pkg %in% installed.packages()[, "Package"])]
     if (length(new.pkg)) 
       install.packages(new.pkg, dependencies = TRUE)
     #sapply(pkg, require, character.only = TRUE)
}
# usage
ipak(pak.install)
   
paks <- as.data.frame(installed.packages()[,c(1,3:4)]) #Get Packages and truncate
rownames(paks) <- NULL #Remove Row Names
paks <- paks[is.na(paks$Priority),1:2,drop=T] #Strips out irrelevant packages
print(paks, row.names=FALSE)
#write.csv(paks, 'DoD Packages.csv')
   
pak.install=paks$Package
   
save(pak.install, file = 'currentPaks.rds')
