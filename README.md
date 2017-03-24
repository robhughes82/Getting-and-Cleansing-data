# Getting-and-Cleansing-data
Explanation of the run_analysis.R script 

Overview
The aim of the run_analysis.R script is to create 1 tidy data table from a collection of text files.

The data consists of 8 text files that we are interested in
a. activity_labels - a lookup table showing the 6 activityid and the activity full description
b. features - a lookup table containing the featureid and the feature full description
c. subject_test - a table showing which of the 30 subjects the observation belongs to, for the test data set
d. X_test - a table with each of the results for each variable for each subject and activity, for the test data set
e. y_test - a table showing which of the activities belongs to each result, for the test data set
f. subject_train - a table showing which of the 30 subjects the observation belongs to, for the training data set
g. X_train - a table with each of the results for each variable for each subject and activity, for the training data set
h. y_train - a table showing which of the activities belongs to each result, for the training data set

The script follows these steps
1. Set the working directory to be the folder that contains all of the data
2. Read all the relevant tables in to R and store them as relevant variables
3. Give each of the tables relevant column names, including X_test and X_train being giveb column names of the second column in features
4. Combine the test and training data in to one table for each, by combining the subjects, the activities and the results
5. Combine the test and training data in to one table combined
6. Add the activity name to the data instead of just having the activityid, by doing a merge with the activity label table
7. Create a new table which only contains the subjectid, activityid, activityname along with the mean and std based variables
8. Change the varibale names to more meaningful names, by substituting the shortened versions in the names e.g. t to time, f to frequency
9. Summarise the data in to a new table giving the mean of all results for each subject/activity combination for each variable, then remove the activityname from the table (as becomes NA when aggregate applied), then add it in again with another merge
10. Write the final table as a text file in to the working directory
