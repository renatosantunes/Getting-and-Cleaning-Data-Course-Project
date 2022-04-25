

1) Reading all the datasets

2) merging the train and test datasets with rbind function
    body_acc_x = body_acc_x_test + body_acc_x_train
    (same for body_acc_y and body_acc_z)
    
    body_gyro_x = body_gyro_x_test + body_gyro_x_train
    (same for body_gyro_y and body_gyro_z)
    
    total_acc_x = total_acc_x_test + total_acc_x_train
    (same for total_acc_y and total_acc_z)
    
    subject = subject_test + subject_train

    X = X_test + X_train

    y = y_test + y_train

3) renaming the activities accordingly

4) renaming the columns of the individual merges datasets accordingly

5) merging the merged datasets in one big dataset with cbind function
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

6) selecting the columns with mean and standard deviation values of the measurements

7) creating a new dataset only with mean and standard deviation values of the measurements

8) splitting the dataset for each subject and each activity
    30 subjects * 6 activities = 180 parts

9) calculating mean and standard deviation for each measurement in each part of the splitted dataset (final dataset)

10) saving the final dataset for submission
