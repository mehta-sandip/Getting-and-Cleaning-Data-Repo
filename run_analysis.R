# This script merges test and training data from a number of .txt files and produces a tidy data set 

library(reshape2)

#read features information
features = read.table("./features.txt")
featureNames = features[,2]

#read activity labels assign columns names to activity data
activityLabels = read.table("./activity_labels.txt")
colnames(activityLabels) = c("activityID","activity")

#read training set data and assign column names to training data
trainingData = read.table("./train/X_train.txt")
colnames(trainingData) = featureNames

#read training set labels and assign column names
trainingDataActivity = read.table("./train/y_train.txt")
colnames(trainingDataActivity) = "activityID"

#read training subject and assign column names
trainingSubject = read.table("./train/subject_train.txt")
colnames(trainingSubject) = "subjectID"

#read test set data and assign column names to training data
testData = read.table("./test/X_test.txt")
colnames(testData) = featureNames

#read test set labels and assign column names
testDataActivity = read.table("./test/y_test.txt")
colnames(testDataActivity) = "activityID"

#read training subject and assign column names
testSubject = read.table("./test/subject_test.txt")
colnames(testSubject) = "subjectID"

#column bind training and test data
allTrainingData = cbind(trainingData,trainingDataActivity,trainingSubject)
allTestData = cbind(testData,testDataActivity,testSubject)

#merge training and test data
allData = rbind(allTrainingData,allTestData)

#get indexes of columns which has mean word in it
meanColumnsIndex = grep("mean",names(allData),ignore.case=TRUE)
# extract all such columns names from all data
meanDataColumnsNames = names(allData)[meanColumnsIndex]

#get indexes of columns which has std word in it
stdColumnsIndex = grep("std",names(allData),ignore.case=TRUE)
#extract all such column names from all data
stdDataColumnsNames = names(allData)[stdColumnsIndex]

#select interested data based on meanDataColumnsNames and  stdDataColumnsNames
summaryDataRequired = allData[,c(meanDataColumnsNames,stdDataColumnsNames,"activityID","subjectID")]

#add activity names to summary data
summaryDataDescriptive = merge(activityLabels,summaryDataRequired,by.x="activityID",by.y="activityID",all=TRUE)

#melt data with id variable as activity, activityID and subjectId
meltActivityData = melt(summaryDataDescriptive,id=c("activity","activityID","subjectID"))

#create tidy data set
tidyData = dcast(meltActivityData,activity+activityID+subjectID~variable,mean)

#write to file
write.table(tidyData,"./activity_tidy_data.txt")