#access token -- 0d64f76064216fc6155ecfd4d23d557114307318

install.packages("httr")

library(httr)
library(httpuv)
library(jsonlite)

oauth_endpoints("github")

Sys.setenv(GITHUB_CONSUMER_SECRET = "ccd860562fc516ef9683e0805f781e1197ea2a17")
myapp <- oauth_app("github", "251481aa04e2e87cbef6")

github_token <- oauth2.0_token(oauth_endpoints("github"), myapp)

req <- GET("https://api.github.com/rate_limit", config(token = github_token))
stop_for_status(req)
content(req)

req <- GET("https://api.github.com/repos/jtleek/datasharing", config(token = github_token))
stop_for_status(req)
content(req)

################################################################
getwd()

library(sqldf)
acs<-read.csv("./data/getdata_data_ss06pid.csv")

head (acs)
sqldf("select pwgtp1,AGEP from acs where AGEP < 50")

sqldf("select distinct AGEP from acs order by AGEP")
sqldf("select AGEP where unique from acs")

###############################################################

con <- url("http://biostat.jhsph.edu/~jleek/contact.html")

HTML <- readLines(con)

close(con)

nchar(c(HTML[10],HTML[20],HTML[30],HTML[100]))

#########################################################################

df <- read.csv("https://d396qusza40orc.cloudfront.net/getdata%2Fwksst8110.for",header=FALSE,skip=4,col.names=c("week","Nino1+2","Nino3","Nino34","Nino4"))
df <- read.fwf("https://d396qusza40orc.cloudfront.net/getdata%2Fwksst8110.for", c(1,9,5,4,4,5,4,4,5,4,4,5,4,4), header =FALSE,skip=4)
head(df)

df[,10] 
df[,4] <- as.numeric(df[,4])
df[,6] <- as.numeric(df[,6])
df[,8] <- as.numeric(df[,8])
df[,10] <- as.numeric(df[,10])

for (i in 1:14){
  try(print(sum(df[,i])))  
  
}
sum(df[,c(4,5)]) 28893.3


###################################################################
R.home()

install.packages('RMySQL',type='source')

Sys.getenv('MYSQL_HOME')
library(RMySQL)
#########################################################################
