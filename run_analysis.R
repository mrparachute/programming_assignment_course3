setwd("/Users/Flo/coursera_R/Class 3 - Getting and cleaning data/Project")

library(dplyr)
library(tidyr)
library(tibble)

# Gather files which are common to both train and test datasets
features_names <- read.table("/Users/Flo/coursera_R/Class 3 - Getting and cleaning data/Project/UCI HAR Dataset/features.txt",
                             col.names = c("feature_number","feature_name"))
activity_labels <- read.table("/Users/Flo/coursera_R/Class 3 - Getting and cleaning data/Project/UCI HAR Dataset/activity_labels.txt",
                              col.names = c("activity_id","activity_name"))


# Step 1 = Cleaning test dataset

test_raw <- read.table("/Users/Flo/coursera_R/Class 3 - Getting and cleaning data/Project/UCI HAR Dataset/test/X_test.txt")
## Assign variable names
colnames(test_raw) <- features_names$feature_name
## Add activity id and name
test_labels <- read.table("/Users/Flo/coursera_R/Class 3 - Getting and cleaning data/Project/UCI HAR Dataset/test/y_test.txt",
                          col.names = c("activity_id"))
test_labels <- test_labels %>% left_join(activity_labels)
## Add subject id and specify from which partition it belongs between train and set
test_subject <- read.table("/Users/Flo/coursera_R/Class 3 - Getting and cleaning data/Project/UCI HAR Dataset/test/subject_test.txt",
                           col.names = c("subject_id")) %>% 
        mutate(partition_name = "test")
## Add to test dataset subject and activity info and specify it is the test data
test_final <- test_raw %>% cbind(test_labels,test_subject)


# Step 2 = Cleaning training dataset

train_raw <- read.table("/Users/Flo/coursera_R/Class 3 - Getting and cleaning data/Project/UCI HAR Dataset/train/X_train.txt")
## Assign variable names
colnames(train_raw) <- features_names$feature_name
## Add activity id and name
train_labels <- read.table("/Users/Flo/coursera_R/Class 3 - Getting and cleaning data/Project/UCI HAR Dataset/train/y_train.txt",
                          col.names = c("activity_id"))
train_labels <- train_labels %>% left_join(activity_labels)
## Add subject id and specify from which partition it belongs between train and set
train_subject <- read.table("/Users/Flo/coursera_R/Class 3 - Getting and cleaning data/Project/UCI HAR Dataset/train/subject_train.txt",
                           col.names = c("subject_id")) %>% 
        mutate(partition_name = "train")
## Add to train dataset subject and activity info and specify it is the train data
train_final <- train_raw %>% cbind(train_labels,train_subject)


# Step 3 = merge data sets and create a dataset with only mean and std variables
full_data <- rbind.data.frame(test_final, train_final)
full_data_base <- full_data[,c("activity_name","subject_id","partition_name")]
full_data_std <- full_data[,grep("std()",names(full_data),value = TRUE)]
full_data_mean <- full_data[,grep("mean()",names(full_data),value = TRUE)]
mean_std_data <- cbind(full_data_base,full_data_mean,full_data_std)


# Step 4 = Create a summary dataset with the average of all variables in mean_std_data for each subject for each activity

summarized_data <- mean_std_data %>%
        group_by(mean_std_data$activity_name, mean_std_data$subject_id) %>%
        summarise_all(mean) %>% select(-activity_name,-subject_id)



