###Peer Assessments /Getting and Cleaning Data Course Project

Folder structure:

Main Folder / UCI HAR Dataset /  <- this folder should contain the data extracted from the zip file. for example : activity_labels,features,features_info,README and test and train folder.

You may launch the run_analysis.R file and run it. in that case you might have to set the working directory.

Or you may launch the Course Project_Peer Assessment.Rproj in RStudio, in which case all you need to do is launch the run_analysis.R file inside that project and it will run and create 
the tidy_data_set_1.txt. This is the output file which is also uploaded in coursera.



Steps-Walk through:-

1. Import library - Plyr 
2. Import data - Features.txt(into table f)
			- subject_test.txt(into table tr1 for test data and tr11 for train data)
			- X_test.txt(into table tr2 for test data and tr12 for train data)
			- Y_test.txt(into table tr3 for test data and tr13 for train data)
3. Add group partition column to table tr2 & tr12
4. Add subject column to the t2 and t12.
5. Convert and add activity column to the t2 and t12.
6. Process data:
		- find columns-index in features table matching with keyword - "mean".
			-build a list of such column-index in vector fmean. Also make another vector fmean_name containing the names that match keyword.
		- find columns-index in features table matching with keyword - "std".(this represents stranded deviation)
			-build a list of such column-index in vector fstd. Also make another vector fstd_name containing the names that match keyword.
		- Join the lists[(fmean,fstd) & (fmean_name,fstd_name)] to get a common list of indices that is needed to build the tidy data set.
		- Add those extra columns to this common list of column names that will be pulled in addition to the previously mentioned list of column names.
			- They are"group_partition","Subject_Number","Activity_name"
		- Filter out only the mean/std column data from tr2 and store it into t_all_2.
		- Filter out only the mean/std column data from tr12 and store it into t_all_12.
		- Build a single tidy data set from t_all_2 and t_all_12 using rbind command.
		- Cross check if the count of rows populated is same as the original data tables.
7. Write tidy data set to a file named tidy_data_set_1.txt.
8. build the secondary tidy data set for aggregrated values for each variable & each activity &each subject.
		- verified the output row count in discussion board. It contains 180 subgroups as there are 30 subjects and 6 activities.
		
 