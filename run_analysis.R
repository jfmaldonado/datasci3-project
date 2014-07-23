readData <- function(Y_file, x_file, subject_file, features_file) {
  # Read file with 'y' data.
  y_data <- read.csv(Y_file, colClasses = "character", header = FALSE)
  
  # Assign column name to 'y' data.
  colnames(y_data) <- c("Activity")
  
  # Replace the numerical values of the 'activity' column for human-friendly values.
  y_data[y_data == 1] = 'Walking'
  y_data[y_data == 2] = 'Walking_uptairs'
  y_data[y_data == 3] = 'Walking_downtairs'
  y_data[y_data == 4] = 'Sitting'
  y_data[y_data == 5] = 'Staying'
  y_data[y_data == 6] = 'Laying'
  
  # ----- #
  
  # Read file with 'subject' data.
  subject_data <- read.csv(subject_file, colClasses = "character", header = FALSE)

  # Assign column name to 'subject' data.
  colnames(subject_data) <- c("Subject")
  
  # ----- #

  # Read file with 'features' description.
  features <- read.csv(features_file, colClasses = "character", header = FALSE, sep=" ")
  
  # Remove columns that are not neither 'mean' or 'std'.
  features_mean_std <- features[grep('mean|std', features[,2]),]
  
  # Transform the first column to numerical values.
  features_mean_std[,1] <- as.numeric(features_mean_std[,1])
  
  # ----- #
  
  # Read file with 'x' data.
  x_data <- unlist(strsplit(readLines(x_file), " "))
  x_data <- as.numeric(x_data[x_data != ""]) # Remove "" elements, cvt to numeric
  x_data <- as.data.frame(matrix(x_data, ncol=561, byrow=TRUE)) # Transform to data.frame
  
  # Remove columns that are not neither 'mean' or 'std'.
  x_data <- x_data[features_mean_std[,1]]
  
  # Assign column names.
  colnames(x_data) <- features_mean_std[,2]
  
  # ----- #
  
  # Merge all data and return it.
  df <- data.frame(subject_data, y_data, x_data)
  
  df
}

getMergedData <- function(y_test = "test/y_test.txt",
                      x_test = "test/x_test.txt",
                      subject_test = "test/subject_test.txt",
                      y_train = "train/y_train.txt",
                      x_train = "train/x_train.txt",
                      subject_train = "train/subject_train.txt",
                      features = "features.txt") {

  # Get test data.
  test <- readData(y_test, x_test, subject_test, features)
  
  # Get train data.
  train <- readData(y_train, x_train, subject_train, features)
  
  # Merge data.
  result <- rbind(test, train)

  # Return result.
  result
}

# Set working directory as the folder in which the input data has been descompressed.
setwd("C:/Users/jmaldonado.OFFICE/Downloads/UCI HAR Dataset")

# Merge data (using the default names for the input files).
merged <- getMergedData()

# Save merged data into a CSV file.
write.csv(file="merged_data.csv", x=merged)

# Calculate the average of each variable for each activity and each subject
means <- aggregate(merged[-c(1,2)],list(merged[,1],merged[,2]),mean) 

# Set again the columns name for the first two columns (that were overrided when aggregating)
names(means)[1] <- "Subject"
names(means)[2] <- "Activity"

# Save average data into a CSV file.
write.csv(file="average_data.csv", x=means)