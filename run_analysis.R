library(tidyverse)

rm(list=ls())

setwd("C:/Users/renat/Programming/coursera/Getting and Cleaning Data/final_project")

##### Reading the Datasets

# Test Data
X_test <- read.table("./UCI HAR Dataset/test/X_test.txt", quote="\"", comment.char="")
y_test <- read.table("./UCI HAR Dataset/test/y_test.txt", quote="\"", comment.char="")
subject_test <- read.table("./UCI HAR Dataset/test/subject_test.txt", quote="\"", comment.char="")

body_acc_x_test <- read.table("./UCI HAR Dataset/test/Inertial Signals/body_acc_x_test.txt", quote="\"", comment.char="")
body_acc_y_test <- read.table("./UCI HAR Dataset/test/Inertial Signals/body_acc_y_test.txt", quote="\"", comment.char="")
body_acc_z_test <- read.table("./UCI HAR Dataset/test/Inertial Signals/body_acc_z_test.txt", quote="\"", comment.char="")

body_gyro_x_test <- read.table("./UCI HAR Dataset/test/Inertial Signals/body_gyro_x_test.txt", quote="\"", comment.char="")
body_gyro_y_test <- read.table("./UCI HAR Dataset/test/Inertial Signals/body_gyro_y_test.txt", quote="\"", comment.char="")
body_gyro_z_test <- read.table("./UCI HAR Dataset/test/Inertial Signals/body_gyro_z_test.txt", quote="\"", comment.char="")

total_acc_x_test <- read.table("./UCI HAR Dataset/test/Inertial Signals/total_acc_x_test.txt", quote="\"", comment.char="")
total_acc_y_test <- read.table("./UCI HAR Dataset/test/Inertial Signals/total_acc_y_test.txt", quote="\"", comment.char="")
total_acc_z_test <- read.table("./UCI HAR Dataset/test/Inertial Signals/total_acc_z_test.txt", quote="\"", comment.char="")

# Training Data
X_train <- read.table("./UCI HAR Dataset/train/X_train.txt", quote="\"", comment.char="")
y_train <- read.table("./UCI HAR Dataset/train/y_train.txt", quote="\"", comment.char="")
subject_train <- read.table("./UCI HAR Dataset/train/subject_train.txt", quote="\"", comment.char="")

body_acc_x_train <- read.table("./UCI HAR Dataset/train/Inertial Signals/body_acc_x_train.txt", quote="\"", comment.char="")
body_acc_y_train <- read.table("./UCI HAR Dataset/train/Inertial Signals/body_acc_y_train.txt", quote="\"", comment.char="")
body_acc_z_train <- read.table("./UCI HAR Dataset/train/Inertial Signals/body_acc_z_train.txt", quote="\"", comment.char="")

body_gyro_x_train <- read.table("./UCI HAR Dataset/train/Inertial Signals/body_gyro_x_train.txt", quote="\"", comment.char="")
body_gyro_y_train <- read.table("./UCI HAR Dataset/train/Inertial Signals/body_gyro_y_train.txt", quote="\"", comment.char="")
body_gyro_z_train <- read.table("./UCI HAR Dataset/train/Inertial Signals/body_gyro_z_train.txt", quote="\"", comment.char="")

total_acc_x_train <- read.table("./UCI HAR Dataset/train/Inertial Signals/total_acc_x_train.txt", quote="\"", comment.char="")
total_acc_y_train <- read.table("./UCI HAR Dataset/train/Inertial Signals/total_acc_y_train.txt", quote="\"", comment.char="")
total_acc_z_train <- read.table("./UCI HAR Dataset/train/Inertial Signals/total_acc_z_train.txt", quote="\"", comment.char="")

features <- read.table("./UCI HAR Dataset/features.txt", quote="\"", comment.char="")

##### Merging the Datasets

body_acc_x <- rbind(body_acc_x_test, body_acc_x_train)
body_acc_y <- rbind(body_acc_y_test, body_acc_y_train)
body_acc_z <- rbind(body_acc_z_test, body_acc_z_train)

body_gyro_x <- rbind(body_gyro_x_test, body_gyro_x_train)
body_gyro_y <- rbind(body_gyro_y_test, body_gyro_y_train)
body_gyro_z <- rbind(body_gyro_z_test, body_gyro_z_train)

total_acc_x <- rbind(total_acc_x_test, total_acc_x_train)
total_acc_y <- rbind(total_acc_y_test, total_acc_y_train)
total_acc_z <- rbind(total_acc_z_test, total_acc_z_train)

subject <- rbind(subject_test, subject_train)

X <- rbind(X_test, X_train)

y <- rbind(y_test, y_train)

##### naming the activities in the data set
y[[1]] <- case_when(y[[1]] == 1 ~ "walking",
                    y[[1]] == 2 ~ "walking_upstairs",
                    y[[1]] == 3 ~ "walking_downstairs",
                    y[[1]] == 4 ~ "sitting",
                    y[[1]] == 5 ~ "standing",
                    TRUE ~ "laying")

##### labeling the data set with descriptive variable names

for(i in 1:ncol(body_acc_x)){
  names(body_acc_x)[i] <- paste("body_acc_x_", i, sep = "")
}

for(i in 1:ncol(body_acc_y)){
  names(body_acc_y)[i] <- paste("body_acc_y_", i, sep = "")
}

for(i in 1:ncol(body_acc_z)){
  names(body_acc_z)[i] <- paste("body_acc_z_", i, sep = "")
}

for(i in 1:ncol(body_gyro_x)){
  names(body_gyro_x)[i] <- paste("body_gyro_x_", i, sep = "")
}

for(i in 1:ncol(body_gyro_y)){
  names(body_gyro_y)[i] <- paste("body_gyro_y_", i, sep = "")
}

for(i in 1:ncol(body_gyro_z)){
  names(body_gyro_z)[i] <- paste("body_gyro_z_", i, sep = "")
}

for(i in 1:ncol(total_acc_x)){
  names(total_acc_x)[i] <- paste("total_acc_x_", i, sep = "")
}

for(i in 1:ncol(total_acc_y)){
  names(total_acc_y)[i] <- paste("total_acc_y_", i, sep = "")
}

for(i in 1:ncol(total_acc_z)){
  names(total_acc_z)[i] <- paste("total_acc_z_", i, sep = "")
}
# renaming the subject dataset
names(subject) <- "subject"

#renaming the activities dataset
names(y) <- "activity"

# renaming the columns of the X dataset
names(X) <- features$V2

##### Final Dataset

data_final <- cbind(body_acc_x,
                    body_acc_y,
                    body_acc_z,
                    body_gyro_x,
                    body_gyro_y,
                    body_gyro_z,
                    total_acc_x,
                    total_acc_y,
                    total_acc_z,
                    subject,
                    X,
                    y)

# features variables with mean and standard deviation for each measurement
mean_std <- features[c(1:6, 41:46, 121:126), 2]

# dataset with features variables with mean and standard deviation for each measurement
df_mean_std <- select(data_final, c("subject", "activity", mean_std))
df_mean_std$sub_act <- paste(df_mean_std$subject, df_mean_std$activity, sep = "-")

# dataset with the average of each variable for each activity and each subject

df_mean <- split(df_mean_std, ~ sub_act)
for(i in 1:length(df_mean)){
  df_mean[[i]] <- map_df(df_mean[[i]][3:20], mean, na.rm = TRUE)
}

sub_act_sorted <- sort(unique(df_mean_std$sub_act))

for(i in 1:length(df_mean)){
  df_mean[[i]][[19]] <- sub_act_sorted[i]
}

for(i in 1:length(df_mean)){
  df[i, ] <- as.data.frame(df_mean[[i]])
}

df <- separate(df, ...19, c("subject", "activity"), sep = "-")

df <- select(df, c(19, 20, 1:18))

df$subject <- as.numeric(df$subject)

df <- arrange(df, subject, activity)

write.table(df, file = "tidy_data.txt", sep = ",", row.names = FALSE)
