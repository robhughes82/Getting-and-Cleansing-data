setwd("C:/Users/robhu/OneDrive/Documents/UCI HAR Dataset")

##1. Merges the training and the test sets to create one data set.

## load in all the files

activity_labels<-read.table("activity_labels.txt",header=FALSE)
features<-read.table("features.txt",header=FALSE)
subject_test<-read.table("./test/subject_test.txt",header=FALSE)
X_test<-read.table("./test/X_test.txt",header=FALSE)
y_test<-read.table("./test/y_test.txt",header=FALSE)
subject_train<-read.table("./train/subject_train.txt",header=FALSE)
X_train<-read.table("./train/X_train.txt",header=FALSE)
y_train<-read.table("./train/y_train.txt",header=FALSE)

## give the tables column names
colnames(activity_labels)<-c("activityid","activityname")
colnames(features)<-c("featureid","featurename")
colnames(subject_test)<-("subjectid")
colnames(X_test)<-features[,2]
colnames(y_test)<-("activityid")
colnames(subject_train)<-("subjectid")
colnames(X_train)<-features[,2]
colnames(y_train)<-("activityid")

## create the test and train combined tables
test<-cbind(subject_test,y_test,X_test)
train<-cbind(subject_train,y_train,X_train)

## combine the 2 tables
combined<-rbind(test,train)

## finally for section 1, bring in the activity names (part 3 done early)
combined2<-merge(combined,activity_labels,by.x="activityid",by.y="activityid",x.all=TRUE)

## 2. Extracts only the measurements on the mean and standard deviation for each measurement

combined3<-combined2[,grepl("subjectid|activityid|activityname|mean\\(|std\\(",colnames(combined2))]


## 3. Uses descriptive activity names to name the activities in the data set

## assumed this meant joining the data from activity_lables which was done in part 1

## 4. Appropriately label the data set with descriptive variable names 



for (i in 1:ncol(combined3)){
  
    names(combined3)[i]=sub("^t","Time_",names(combined3)[i])
    names(combined3)[i]=sub("^f","Frequency_",names(combined3)[i])
    names(combined3)[i]=sub("Acc","Accelerometer_",names(combined3)[i])
    names(combined3)[i]=sub("Gyro","Gyroscope_",names(combined3)[i])
    names(combined3)[i]=sub("Mag","Magnitude_",names(combined3)[i])
    names(combined3)[i]=sub("Jerk","Jerk_",names(combined3)[i])
    names(combined3)[i]=sub("-mean\\(\\)","Mean",names(combined3)[i])
    names(combined3)[i]=sub("-std\\(\\)","Standard_Deviation",names(combined3)[i])
  
  }

## 5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable 
## for each activity and each subject

combined4<-aggregate(combined3,list(combined3$activityid,combined3$subjectid),mean)
combined5<-combined4[,!grepl("activityname|Group",colnames(combined4))]
final_data<-merge(combined5,activity_labels,by.x="activityid",by.y="activityid",x.all=TRUE)
write.table(final_data,"./final_data.txt",row.names = FALSE)
