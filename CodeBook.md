# Codebook for this project

##Tidy Data

The data that was already given, was used to make the tidy data.
The final change after extracting the required variables was to "take the mean of every measurement by activity per subject.

### Variables in the tidy data
subject : The people whose physical activity has been recorded on wearable devise.

    number of subjects: 1 to 30

activity : The physical activity being done.
        activity codes:
           
            1 WALKING
            
            2 WALKING_UPSTAIRS
            
            3 WALKING_DOWNSTAIRS
            
            4 SITTING
            
            5 STANDING
            
            6 LAYING

 Feature Selection:
        
     tBodyAcc-XYZ
     
    tGravityAcc-XYZ
    
    tBodyAccJerk-XYZ
    
    tBodyGyro-XYZ
    
    tBodyGyroJerk-XYZ
    
    tBodyAccMag
    
    tGravityAccMag
    
    tBodyAccJerkMag
    
    tBodyGyroMag
    
    tBodyGyroJerkMag
    
    fBodyAcc-XYZ
    
    fBodyAccJerk-XYZ
    
    fBodyGyro-XYZ
    
    fBodyAccMag
    
    fBodyAccJerkMag
    
    fBodyGyroMag
    
    fBodyGyroJerkMag

Measurements estimated:
    
    mean(): Mean value

    std(): Standard deviation

### Data sets required in making the tidy data

- 'features_info.txt': Shows information about the variables used on the feature vector.

- 'features.txt': List of all features.

- 'activity_labels.txt': Links the class labels with their activity name.

- 'X_train.txt': Training set.

- 'y_train.txt': Training labels.

- 'X_test.txt': Test set.

- 'y_test.txt': Test labels.

- 'subject_train.txt' & 'subject_test.txt': Each row identifies the subject who performed the activity for each window sample. Its range is from 1 to 30.

THE END







