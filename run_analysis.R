setwd("~/datasciencecoursera/Gettingandcleaningdata/Course Project/UCI HAR Dataset/test")

##  Step1: 
# read in test data#
test<-read.table("X_test.txt")
testlabels<-read.table("y_test.txt")
subjecttest<-read.table("subject_test.txt")


# read in train data# 
setwd("../train")
train<-read.table("X_train.txt")
trainlabels<-read.table("y_train.txt")
subjecttrain<-read.table("subject_train.txt")

# Combine test and train data sets
combinesets<-rbind(test,train)
combinesubject<-rbind(subjecttest,subjecttrain)
combinelabels<-rbind(testlabels,trainlabels)
colnames(combinesubject)<-"subjectnum"

#Step2# 
setwd("..//")
#Read in column names 
columnnames<-read.table("features.txt")
#Uniform all the column names --lowercase all the column names
unicolumnnames<-tolower(columnnames[,2])
#Combine column names into the combined data sets (test+train)
colnames(combinesets)<-unicolumnnames
#get the mean() columns and the std() columns
exactcolumn<-grep("mean\\(|std",unicolumnnames)
#Extract only the measurements on the mean and std for each measurement
extractdataset<-combinesets[,exactcolumn]

#Step 3#
#match the activity names with activity number//Uses descriptive activity names to name the activities in the data set#
activityname<-read.table("activity_labels.txt")
#Add a new column of activity name to the combinelabels dataset
combinelabels$V2<-activityname[combinelabels[,1],2]
colnames(combinelabels)<-c("activitynum","activityname")

#Step4#
#Appropriately labels the data set with descriptive variable names. #
acolnames<-sub("acc","accelerometer",colnames(extractdataset))
bcolnames<-sub("gyro","gyroscope",acolnames)
ccolnames<-sub("^t","timedomain",bcolnames)
dcolnames<-sub("^f","frequencydomain",ccolnames)
ecolnames<-sub("mag","magnitude",dcolnames)
fcolnames<-gsub("-","",ecolnames)
extractcolnames<-gsub("\\()","",fcolnames)
colnames(extractdataset)<-extractcolnames

completedataset<- cbind(combinesubject,combinelabels,extractdataset)

#Step5#
# Create another data set 
seconddata<-completedataset[,]

# Melt data frames
install.packages("reshape")
library(reshape)
newdata<-melt(seconddata,id=c("subjectnum","activitynum","activityname"),measure.vars=colnames(seconddata[,4:68]))
#Cast data frames
install.packages("reshape2")
library(reshape2)
tidydata<-dcast(newdata,subjectnum+activitynum+activityname~variable,mean)

write.table(newcast,file="~/datasciencecoursera/Gettingandcleaningdata/Course Project/UCI HAR Dataset/tidydata.txt",sep=",",col.names=TRUE)


