## Note the dataset is not included in the GitHUB for this project
## If running this script, please see the readme on where download the dataset and where to extract it.
##


library(dplyr)
library(tidyr)

#Read in Activity Labels and Feature Labels
activity_labels <- read.table('UCI HAR Dataset\\activity_labels.txt')
feature_labels <- read.table('UCI HAR Dataset\\features.txt')

#Find the desired columns.  Note this excludes the angle features which use a mean as a parameter.
desired_features <- c(grep('mean',feature_labels$V2),grep('std',feature_labels$V2))
desired_features <- sort(desired_features)


#Read in training data.
data_training_y <- read.table('UCI HAR Dataset\\train\\y_train.txt',col.names="y")
data_training_x <- read.table('UCI HAR Dataset\\train\\x_train.txt')
data_training_subject <- read.table('UCI HAR Dataset\\train\\subject_train.txt')


# Read in test data.
data_test_y <- read.table('UCI HAR Dataset\\test\\y_test.txt',col.names='y')
data_test_x <- read.table('UCI HAR Dataset\\test\\x_test.txt')
data_test_subject <- read.table('UCI HAR Dataset\\test\\subject_test.txt')

# combine our data.
combined_data_y <- rbind(data_training_y,data_test_y)
combined_data_x <- rbind(data_training_x,data_test_x)
combined_data_subject <-rbind(data_training_subject, data_test_subject)

# change numeric activity labels to text.
combined_data_y[,1] = activity_labels[combined_data_y$y,2]

#Final combine for data.
combined_data <- cbind(combined_data_subject,combined_data_y,combined_data_x)

# label columns.
colnames(combined_data) <- c('Subject','Activity',feature_labels[,2] )

#Extract out the desired columns using the desired_features vector. 
#To account for the Subject and Activity columns, we offset the
#desired_features vector by 2, to ensure the desired columns are obtained.
data_wide <- combined_data[ ,c(1,2,desired_features+2)  ]
data_tall <- pivot_longer(data_wide,c(-Subject,-Activity),names_to = "Measurement.Name", values_to = "reading")

#then the desired averages are computed by
final_data_tall <- data_tall %>% group_by(Subject,Activity,Measurement.Name) %>% summarize(measurement.means = mean(reading))
final_data_tall

#final_data_wide <- data_wide %>% group_by(Subject,Activity) %>% summarize_all( list(mean=mean))



