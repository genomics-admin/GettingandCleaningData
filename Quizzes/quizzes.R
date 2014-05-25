if (!file.exists("data")){
  dir.create("data")
}

fileURL <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06hid.csv "
download.file(fileURL, destfile="./data/housing_idaho.csv")

#dateDownloaded <- date()
#dateDownloaded
#"Tue May 06 12:28:45 2014"

rawData <- read.csv("./data/housing_idaho.csv", colClasses = "character")
head(rawData)
nrow(rawData)

idahoData <- rawData[rawData["ST"]==16,][rawData["TYPE"]==1,][rawData["VAL"]==24,][c("ST","TYPE","ADJUST","VAL")]
head(idahoData)
nrow(idahoData)

idahoData1 <- idahoData[idahoData["VAL"]=24,][c("ST","TYPE","ADJUST","VAL")]
head(idahoData1,nrow(idahoData1))
nrow(idahoData1)

########################################################################################################
if (!file.exists("data")){
  dir.create("data")
}

fileURL <- "http://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FDATA.gov_NGAP.xlsx"
download.file(fileURL, destfile="./data/gov_NGAP.xlsx")
dateDownloaded <- date()
dateDownloaded
#"Wed May 07 01:44:23 2014"

Sys.getenv("JAVA_HOME")
if (Sys.getenv("JAVA_HOME")!="")
  Sys.setenv(JAVA_HOME="")
library(rJava)
library(xlsx)
dat <- read.xlsx("./data/getdata-data-DATA.gov_NGAP.xlsx", sheetIndex=1, rowIndex=18:23, colIndex=7:15)
str(dat)
d1 <- sum(dat$Zip*dat$Ext,na.rm=T)

################################################################################################################
install.packages("XML")
install.packages("XPATH")
library(XML)
fileURL <- "http://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Frestaurants.xml"
#fileURL <- "./data/getdata_data_restaurants.xml"
doc <- xmlTreeParse(fileURL,useInternal = TRUE)

rootNode <- xmlRoot(doc)
xmlName(rootNode)
names(rootNode)
rootNode[[1]][[1]]
doc1 <- xmlSApply(rootNode[[1]],xmlValue)

length(doc1)
j<-0
for(i in 1:length(doc1)){
  print(i)
  doc2 <- xmlSApply(rootNode[[1]][[i]],xmlValue)
  #print(doc2)
  if ((names(doc2[2])=="zipcode") & (doc2[[2]]==21231)){
    j<-j+1
    print("hit")
  } 
}
print(j)

doc1[1]

doc1 <- xpathSApply(rootNode, "//row[zipcode=21231]", xmlValue)
doc1





fileURL <- "http://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Frestaurants.xml"
doc <- xmlTreeParse(fileURL,useInternal = TRUE)
rootNode <- xmlRoot(doc)
doc1 <- xmlSApply(rootNode[[1]],xmlValue)
j<-0
for(i in 1:length(doc1)){
  print(i)
  doc2 <- xmlSApply(rootNode[[1]][[i]],xmlValue)
  #print(doc2)
  if ((names(doc2[2])=="zipcode") & (doc2[[2]]==21231)){
    j<-j+1
    print("hit")
  } 
}
print(j)





###################################################################################################
if (!file.exists("data")){
  dir.create("data")
}

fileURL <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06pid.csv"
download.file(fileURL, destfile="./data/getdata_data_ss06pid.csv")

install.packages("data.table")
library(data.table)
DT <- fread("./data/getdata_data_ss06pid.csv",header=TRUE)
head(DT)

system.time({mean(DT[DT$SEX==1,]$pwgtp15);mean(DT[DT$SEX==2,]$pwgtp15)})

DT <- fread("./data/getdata_data_ss06pid.csv",header=TRUE)
head(DT)

system.time(tapply(DT$pwgtp15,DT$SEX,mean))

#DT <- fread("./data/getdata_data_ss06pid.csv",header=TRUE)
#head(DT)

#system.time(mean(DT$pwgtp15,by=DT$SEX))

DT <- fread("./data/getdata_data_ss06pid.csv",header=TRUE)
head(DT)


system.time(DT[,mean(pwgtp15),by=SEX])

DT <- fread("./data/getdata_data_ss06pid.csv",header=TRUE)
head(DT)


system.time(sapply(split(DT$pwgtp15,DT$SEX),mean))

#DT <- fread("./data/getdata_data_ss06pid.csv",header=TRUE)
#head(DT)


#system.time({rowMeans(DT)[DT$SEX==1]; rowMeans(DT)[DT$SEX==2]})

#############################################################################################

trial_size <- 200
collected_results <- numeric(trial_size)
for (i in 1:trial_size){
  single_function_time <- system.time({mean(DT[DT$SEX==1,]$pwgtp15);mean(DT[DT$SEX==2,]$pwgtp15)})
  collected_results[i] <- single_function_time[1]
}
print(mean(collected_results))


