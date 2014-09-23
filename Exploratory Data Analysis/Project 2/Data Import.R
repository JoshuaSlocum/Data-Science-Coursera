path <- paste(getwd(),"Data","exdata-data-NEI_data",sep="/")
NEI <- readRDS(paste(path,"summarySCC_PM25.rds",sep="/"))
SCC <- readRDS(paste(path,"Source_Classification_Code.rds",sep="/"))
