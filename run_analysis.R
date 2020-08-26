library(dplyr)

#Load variable name list. 
setwd("C:\\Users\\gherrera\\Documents\\DataScience\\RProg\\CleanDat\\quizz4\\UCI HAR Dataset")
lo<-read.table("features.txt", header=FALSE )
colnames(lo)[2] <- "names"
lo<-lo %>% select(names)

#Load test data set
setwd("C:\\Users\\gherrera\\Documents\\DataScience\\RProg\\CleanDat\\quizz4\\UCI HAR Dataset\\test")
dft<-read.table("X_test.txt", header=FALSE)
lbt<-read.table("y_test.txt", header=FALSE) 

#Load train data set
setwd("C:\\Users\\gherrera\\Documents\\DataScience\\RProg\\CleanDat\\quizz4\\UCI HAR Dataset\\train")
dftr<-read.table("X_train.txt", header=FALSE)
lbtr<-read.table("y_train.txt", header=FALSE) 

#merge two data sets
ods<-rbind(dft,dftr)


##extracts measurements with mean and std variables
totlist<-grep("-std|-mean\\(", lo$names)
lonames<-lo[c(totlist),]

##Subset DF with the previous step & paste col names
ods1<-ods[,c(totlist)]
colnames(ods1)[1:ncol(ods1)]<-c(lonames)


##Paste activity codes into merged data set
act<-rbind(lbt,lbtr)
ods1<-cbind(act,ods1)
colnames(ods1)[1] <- "Activity_code"
##Changed name in order to not tu run my messy previous code
ods2<-ods1

##Merge activity names into final data set
setwd("C:\\Users\\gherrera\\Documents\\DataScience\\RProg\\CleanDat\\quizz4\\UCI HAR Dataset")
act1<-read.table("activity_labels.txt", header=FALSE)
colnames(act1)[1] <- "Activity_code"
colnames(act1)[2] <- "AName"
final<-merge(act1,ods2, by.x="Activity_code", by.y="Activity_code")
colnames(final)[2] <- "ActivityName"

##Merge subject id into final data set
setwd("C:\\Users\\gherrera\\Documents\\DataScience\\RProg\\CleanDat\\quizz4\\UCI HAR Dataset\\train")
subtr<-read.table("subject_train.txt", header=FALSE)
setwd("C:\\Users\\gherrera\\Documents\\DataScience\\RProg\\CleanDat\\quizz4\\UCI HAR Dataset\\test")
subte<-read.table("subject_test.txt", header=FALSE)
subtot<-rbind(subte,subtr)
final<-cbind(subtot,final)
colnames(final)[1] <- "SubjectID"
final<-final %>% select(-Activity_code)
final2<-final %>% group_by(SubjectID, ActivityName) %>% 
  summarise_all("mean")
write.table(final2,"Final_Project_CD.txt", row.names = FALSE)