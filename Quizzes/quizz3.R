#####################
df <- read.csv("./data/getdata-data-ss06hid.csv")

head(df)

agricultureLogical <- (df$ACR==3 & df$AGS==6)
df1 <- df[which(df$ACR==3 & df$AGS==6),]

which(agricultureLogical)

df1 <- df[which(agricultureLogical),]

head(df1[df1$ACR])
###################################################

library(jpeg) 

fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fjeff.jpg"
download.file(fileUrl,destfile="./pic.jpg",mode="wb")


img <- readJPEG("./pic.jpg", native=TRUE)

head(img,n=30)

quantile(img,probs=c(0, 0.25, 0.3,0.8, 1))
############################################################

fileurl1 <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FGDP.csv"
fileurl2 <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FEDSTATS_Country.csv"
download.file(fileurl1,destfile="./data/df1.csv")
download.file(fileurl2,destfile="./data/df2.csv")
df1 <- read.csv("./data/df1.csv",header=TRUE, stringsAsFactors=FALSE)
df2 <- read.csv("./data/df2.csv",header=TRUE, stringsAsFactors=FALSE)

head(df1)

df3<-sort(df1$"Gross.domestic.product.2012",na.last=TRUE)
df3<-df1[order(df1$"Gross.domestic.product.2012"),]

head(df3)
summary(df1)

colnames(df1)

df2$Short.Name

df1[which(df1$x==df2$Short.Name),]

df1$new <- df2$Short.Name[match( df2$Short.Name,df1$x)]
merge(df1,df2, by.x=x, by.y=Short.Name, sort=F)

table(df1$"Gross.domestic.product.2012",useNA="ifany")

df1[df1==''] <- NA
df3<-df1[!is.na(df1$"Gross.domestic.product.2012"),]

df3<-df3[3:191,]
nrow(df3)
df3[df3$"Gross.domestic.product.2012"==13,]

##################################################

total <- merge(df1,df2,by.x="X",by.y="CountryCode",all=FALSE)
head(total,n=30)

tail(total,n=3)

nrow(total)

t1 <- total[(total$Income.Group=="High income: OECD"),]
t1[t1==''] <- NA
t2<-t1[!is.na(t1$"Gross.domestic.product.2012"),]

head(t2,n=30)

mean(as.numeric(t2$"Gross.domestic.product.2012"))

t1 <- total[(total$Income.Group=="High income: nonOECD"),]
t1[t1==''] <- NA
t2<-t1[!is.na(t1$"Gross.domestic.product.2012"),]

head(t2,n=30)

mean(as.numeric(t2$"Gross.domestic.product.2012"))
###################################################################

t1 <- total[!is.na(total$"Gross.domestic.product.2012"),]
t1[t1==''] <- NA
t1 <- t1[!is.na(t1$"Gross.domestic.product.2012"),]
qt<-quantile(as.numeric(t1$"Gross.domestic.product.2012"),probs=c(0, 0.25, 0.5,0.75, 1))

edit(t1)

t2<-t1[order(as.numeric(t1$"Gross.domestic.product.2012")),][1:38,]
nrow(t2)

nrow(t2[t2$Income.Group=="Lower middle income",])



