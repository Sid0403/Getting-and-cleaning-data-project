## STEP 1:
# Merging the training and test sets

#Read all the data
features <- read.table("features.txt", quote="\"")
abc = as.character(features$V2)                     ## Store the variable names from features in abc

##Train set
subject_train <- read.table("subject_train.txt", quote="\"")

X_train = read.table(file= "X_train.txt", quote = "\t", header = FALSE, col.names= abc)   ##Read file and Use abc as column names in X_train
y_train <- read.table("y_train.txt", quote="\"")

train_mergedata = cbind(subject_train$V1, y_train$V1, X_train)
colnames(train_mergedata) = c("subject", "activity", abc)

## Test set
subject_test <- read.table("subject_test.txt", quote="\"")

X_test = read.table(file= "X_test.txt", quote = "\t", header = FALSE, col.names= abc)  ##Read file and Use abc as column names in X_train
y_test <- read.table("y_test.txt", quote="\"")

test_mergedata = cbind(subject_test$V1, y_test$V1, X_test)
colnames(test_mergedata) = c("subject", "activity", abc)

## Merge both data sets
mergedata = rbind(train_mergedata, test_mergedata)
#Sort them according to subject and activity
mergedata = mergedata[order(mergedata$subject, mergedata$activity, row.names = NA), ]     ##Sorting data according to subject and activity



#STEP 2
## Extracting measurements on mean and std


column_names = grepl("[Mm]ean\\(\\)|std\\(\\)",features$V2)   ##Pattern finding for 'mean' and 'std' names
extract_col = vector("character", length = sum(column_names))
a = 1
for( i in 1:561){
  if(column_names[i]==TRUE){
    extract_col[a]= features$V2[i]
    a = a+1
  }
  
}

extracted_data = mergedata[c("subject", "activity", extract_col)]



##STEP 3 & 4
#activity label
for( i in 1:10299){                             ##Setting activity names for coed for readability
  if(extracted_data$activity[i] == 1)
    label[i]= "WALKING"
  if(extracted_data$activity[i] == 2)
    label[i]= "WALKING_UPSTAIRS"
  if(extracted_data$activity[i] == 3)
    label[i]= "WALKING_DOWNSTAIRS"
  if(extracted_data$activity[i] == 4)
    label[i]= "SITTING"
  if(extracted_data$activity[i] == 5)
    label[i]= "STANDING"
  if(extracted_data$activity[i] == 6)
    label[i]= "LAYING"
}

extracted_data$activity = label



##Step 5 : Making tidy data
#Average of each variable for each activity and each subject
tidy_data = data.frame()

activity_name = activity_labels$V2

for( s in 1:30){
  for(ac in 1:6){
    actvty = extracted_data[(extracted_data$subject == s & extracted_data$activity ==activity_name[ac]), 3:68]    ##subsetting the variable measures for taking mean
    tidy_data = rbind(colMeans(actvty), tidy_data)
  }
}
subject = vector("integer", length = 180)
idx = 1
for( s in 1:30){
  for(ac in 1:6){
    subject[idx]= s
    idx = idx+1
  }
}
tidy_data = cbind(subject, rep(activity_name[1:6],30 ), tidy_data)

##Finally, storing it in a text file

col_names = c("subject", "activity", extract_col)
write.table(tidy_data, file = "tidydata.txt", sep = "\t", row.names= FALSE, col.names = col_names)    ##Writing the required text file for tidy data

##THE END ##
