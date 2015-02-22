# Getting-and-cleaning-data-project
## run_analysis.R

The project required us to do a number of steps to finally form a tidy set of data(that follows all the principles of the tidy
dataset.
The code run_analysis.R, therfore has been written step wise for covering all the action.

  The 1st step has been to merge the two datasets (train and test data), for this first I formed the two datasets completely
(eg. by combining X_train with y_train and and subject_train data) and after combining them I merged the two data sets.
In the same step I have also sorted the whole data( of 10,299 observations), based on the ID (1-30) and activity given to each
subject.

  Next I extracted all the required variables (i.e, measurements on mean and standard deviation ) by using the 'grepl' function
to extract the mean and sd measurements, out of the 563 total variables , 66 were relevent to the project( i.e. mean & sd measurement
)and additional 2 variables 'subject', and 'activity' ; making a total of 68 variables.

  In the next step I replaced all the activity numbers(1-6) with 'activity_labels',as required , to enhance clarity for the data.
This was done with a simple for loop over the activity column. Additionally I believe the data set was clearly labeled with the variables
which specified what each variable measured.

  Finally, another dataset from the extracted dataset was created which calculated the average for each activity for each subject.
As I had already sorted the data according to subject and activity in Step 1, the mean for every activity per subject for all variables
could be easily calculated. As there were 30 subjects and each subject did 6 activities total number of observation would come out
to be 180.. (i.e. 30*6).
 
  Lastly the data was stored in a text file using write.table command and the output for the same was published in the required
  space on coursera website.

THE END
