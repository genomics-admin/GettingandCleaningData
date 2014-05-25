########Import library
library(plyr)
##########################Import data
#features
f <- read.table("./UCI HAR Dataset/features.txt")


###subject
tr1<-read.table("./UCI HAR Dataset/test/subject_test.txt")
###core data
tr2<-read.table("./UCI HAR Dataset/test/X_test.txt")
###Activity
tr3<-read.table("./UCI HAR Dataset/test/Y_test.txt")

###subject
tr11<-read.table("./UCI HAR Dataset/train/subject_train.txt")
###core data
tr12<-read.table("./UCI HAR Dataset/train/X_train.txt")
###Activity
tr13<-read.table("./UCI HAR Dataset/train/Y_train.txt")

#################################################
###add group partition
tr2$group_partition <- "test"
tr12$group_partition <- "train"
head(tr12)

###add subject column to the t2 and t12
tr2$Subject_Number <- tr1$V1
tr12$Subject_Number <- tr11$V1
head(tr12)

###Convert and add activity column to the t2 and t12
tr2$Activity_name <- ifelse(as.numeric(tr3$V1)==1,"WALKING",
                            ifelse(as.numeric(tr3$V1)==2,"WALKING_UPSTAIRS",
                                   ifelse(as.numeric(tr3$V1)==3,"WALKING_DOWNSTAIRS",
                                          ifelse(as.numeric(tr3$V1)==4,"SITTING",
                                                 ifelse(as.numeric(tr3$V1)==5,"STANDING",
                                                        ifelse(as.numeric(tr3$V1)==6,"LAYING","other"))))))
head(tr2)

tr12$Activity_name <- ifelse(as.numeric(tr13$V1)==1,"WALKING",
                             ifelse(as.numeric(tr13$V1)==2,"WALKING_UPSTAIRS",
                                    ifelse(as.numeric(tr13$V1)==3,"WALKING_DOWNSTAIRS",
                                           ifelse(as.numeric(tr13$V1)==4,"SITTING",
                                                  ifelse(as.numeric(tr13$V1)==5,"STANDING",
                                                         ifelse(as.numeric(tr13$V1)==6,"LAYING","other"))))))
head(tr12)




################################Process data

######find columns-index in features responsible for mean
fmean_all<-f[grepl("mean()",f$V2),]
fmean<-as.list(fmean_all$V1)
fmean_name <- as.character(fmean_all$V2)
######find columns-index in features responsible for std
fstd_all<-f[grepl("std()",f$V2),]
fstd<-as.list(fstd_all$V1)
fstd_name <- as.character(fstd_all$V2)

###join 2 lists
f_all <- c(fmean,fstd)
f_all_name <- c(fmean_name,fstd_name,"group_partition","Subject_Number","Activity_name")

###Cross check 
length(f_all)+3==length(f_all_name)

###filter out only the mean/std column data from tr2
t_all_2 <- tr2[,as.numeric(f_all)]
t_all_2$group_partition <- tr2$group_partition
t_all_2$Subject_Number <- tr2$Subject_Number
t_all_2$Activity_name <- tr2$Activity_name

###checking for data consistancy
f_all
head(t_all_2)

###filter out only the mean/std column data from tr12
t_all_12 <- tr12[,as.numeric(f_all)]
t_all_12$group_partition <- tr12$group_partition
t_all_12$Subject_Number <- tr12$Subject_Number
t_all_12$Activity_name <- tr12$Activity_name

###checking for data consistancy
f_all
head(t_all_12)

### build a single tidy data set from t_all_2 and t_all_12
t_all <- rbind(t_all_2,t_all_12)
head(t_all)

###cross check row number count
nrow(t_all_12) #7352
nrow(t_all_2)  #2947
               #7352+2947=10299
nrow(t_all)    #10299

#### Consistancy check passed :)

###Writing to a file 
write.table(t_all, file = "tidy_data_set_1.txt", sep = ",", row.names= FALSE, col.names = f_all_name, qmethod = "double")
##################################################################
#Tidy_data_set_2 : each_variable_each_activity_each_subject


aggdata <-aggregate(t_all, by=list(t_all$Subject_Number,t_all$group_partition,t_all$Activity_name), 
                    FUN=mean, na.rm=TRUE)

print(aggdata)
