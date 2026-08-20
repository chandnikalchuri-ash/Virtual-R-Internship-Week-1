# Week 1 Task: Data Cleaning and Preliminary Analysis with R
# Submitted by: Chandni Kalchuri

# 1. Load the dataset
titanic_data <- read.csv("Titanic-Dataset.csv")

# 2. View summary statistics and structure
summary(titanic_data)
str(titanic_data)

# 3. Data Cleaning: Handle missing values in 'Age'
titanic_data$Age[is.na(titanic_data$Age)] <- median(titanic_data$Age, na.rm = TRUE)

# 4. Data Transformation: Encoding categorical variables
titanic_data$Sex <- as.factor(titanic_data$Sex)
titanic_data$Survived <- as.factor(titanic_data$Survived)

# 5. Exploratory Analysis: Age Distribution
hist(titanic_data$Age, main="Passenger Age Distribution", xlab="Age", col="lightblue")

# 6. Exploratory Analysis: Survival Count
plot(titanic_data$Survived, main="Survival Count (0 = No, 1 = Yes)", xlab="Survived", ylab="Count", col=c("salmon", "lightgreen"))

# 7. Outlier Detection: Boxplot for Fare
boxplot(titanic_data$Fare, main="Boxplot for Fare (Outlier Detection)", col="orange")

# 8. Data Normalization: Min-Max scaling for Fare
normalize <- function(x) { return ((x - min(x, na.rm = TRUE)) / (max(x, na.rm = TRUE) - min(x, na.rm = TRUE))) }
titanic_data$Fare_Normalized <- normalize(titanic_data$Fare)

# 9. Correlation: Age and Fare
cor(titanic_data$Age, titanic_data$Fare, use = "complete.obs")
