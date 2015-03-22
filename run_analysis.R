library("dplyr")
##assuming the working directery contains the "UCI HAR Dataset" folder

setwd("./UCI HAR Dataset")
features<-read.table("features.txt")
activertys<-read.table("activity_labels.txt")
meanCol<-grep("mean",features[,2])
stdCol<-grep("std",features[,2])
keepCol<-append(meanCol,stdCol)

##read in the training data
setwd("train")
TrainSubject<-as.integer(readLines("subject_train.txt",-1))
TrainData<-read.table("X_train.txt")
TrainActivitys<-readLines("y_train.txt")
names(TrainData)<-features[,2]
TrainData<-TrainData[,keepCol]
TrainData<-mutate(TrainData,Subject=TrainSubject,Activity=TrainActivitys)

## move bake to "UCI HAR Dataset"
setwd("../")


## read the test data
setwd("test")
TestSubject<-as.integer(readLines("subject_test.txt"))
TestData<-read.table("X_test.txt")
TestActivitys<-readLines("y_test.txt")
names(TestData)<-features[,2]
TestData<-TestData[,keepCol]
TestData<-mutate(TestData,Subject=TestSubject,Activity=TestActivitys)

## merg tables and clean up
DataMerg<-rbind(TrainData,TestData)
remove(features,meanCol,stdCol,keepCol,TrainSubject,TrainData,TrainActivitys,
       TestSubject,TestData,TestActivitys)

## lable activitys
DataMerg<-mutate(DataMerg,Activity=activertys[Activity,2])
names(DataMerg)<-gsub("\\(\\)","",names(DataMerg))
names(DataMerg)<-gsub("-","",names(DataMerg))
names(DataMerg)<-gsub("^t","Time",names(DataMerg))
names(DataMerg)<-gsub("^f","frequency",names(DataMerg))
names(DataMerg)<-gsub("Acc","Acceleration",names(DataMerg))
names(DataMerg)<-gsub("Mag","Magnitued",names(DataMerg))

## means of all veriables grouped by activerty and subject
DataSummery<-DataMerg %>% group_by(Activity,Subject) %>% summarise_each(funs(mean))

##w rite tet file of the sumerised data
setwd("../")
write.table(DataSummery,file = "Data set summery.txt",row.names = FALSE)
