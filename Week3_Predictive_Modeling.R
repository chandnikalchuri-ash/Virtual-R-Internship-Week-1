# Week 3 Task: Statistical Analysis and Predictive Modeling using R
# Submitted by: Chandni Kalchuri

# 1. Data Preparation
titanic_data <- read.csv("Titanic-Dataset.csv")
titanic_data$Age[is.na(titanic_data$Age)] <- median(titanic_data$Age, na.rm = TRUE)
titanic_data$Survived <- as.factor(titanic_data$Survived)
titanic_data$Pclass <- as.factor(titanic_data$Pclass)
titanic_data$Sex <- as.factor(titanic_data$Sex)

# 2. Hypothesis Testing: Chi-Square Test
cat("Chi-Square Test between Sex and Survival:\n")
print(chisq.test(titanic_data$Sex, titanic_data$Survived))

# 3. Data Splitting (80% Train, 20% Test)
set.seed(123) 
split_index <- sample(1:nrow(titanic_data), 0.8 * nrow(titanic_data))
train_data <- titanic_data[split_index, ]
test_data <- titanic_data[-split_index, ]

# 4. Building Logistic Regression Model
logistic_model <- glm(Survived ~ Pclass + Sex + Age + Fare, family = "binomial", data = train_data)

# 5. View Model Summary
cat("\nLogistic Regression Model Summary:\n")
print(summary(logistic_model))

# 6. Making Predictions & Confusion Matrix
predictions <- predict(logistic_model, test_data, type = "response")
predicted_classes <- ifelse(predictions > 0.5, 1, 0)

confusion_matrix <- table(Actual = test_data$Survived, Predicted = predicted_classes)
cat("\nConfusion Matrix (Test Data):\n")
print(confusion_matrix)
