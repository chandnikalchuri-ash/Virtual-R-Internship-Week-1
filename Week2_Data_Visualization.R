# Week 2 Task: Data Visualization and Insight Communication using R
# Submitted by: Chandni Kalchuri
# Note: Ensure ggplot2 is installed -> install.packages("ggplot2")

library(ggplot2)

# Load and prepare data
titanic_data <- read.csv("Titanic-Dataset.csv")
titanic_data$Age[is.na(titanic_data$Age)] <- median(titanic_data$Age, na.rm = TRUE)
titanic_data$Survived <- as.factor(titanic_data$Survived)
titanic_data$Pclass <- as.factor(titanic_data$Pclass)
titanic_data$Sex <- as.factor(titanic_data$Sex)

# 1. Bar Graph: Survival by Passenger Class
ggplot(titanic_data, aes(x=Pclass, fill=Survived)) +
  geom_bar(position="dodge", color="black") +
  scale_fill_manual(values=c("#FF9999", "#99CC99"), labels=c("Did not survive", "Survived")) +
  labs(title="Survival Rate by Passenger Class", x="Ticket Class (1=1st, 2=2nd, 3=3rd)", y="Number of Passengers") +
  theme_minimal()

# 2. Histogram: Age Distribution by Survival
ggplot(titanic_data, aes(x=Age, fill=Survived)) +
  geom_histogram(binwidth=5, alpha=0.7, position="identity", color="black") +
  scale_fill_manual(values=c("#FF9999", "#99CC99"), labels=c("Did not survive", "Survived")) +
  labs(title="Age Distribution of Passengers by Survival", x="Age of Passengers", y="Frequency") +
  theme_minimal()

# 3. Scatter Plot: Passenger Age vs Ticket Fare
ggplot(titanic_data, aes(x=Age, y=Fare, color=Survived)) +
  geom_point(alpha=0.7, size=2) +
  scale_color_manual(values=c("red", "green"), labels=c("Did not survive", "Survived")) +
  labs(title="Scatter Plot: Passenger Age vs Ticket Fare", x="Passenger Age", y="Fare Paid") +
  theme_minimal()

# 4. Line Chart Trend: Age Distribution
ggplot(titanic_data, aes(x=Age, color=Survived)) +
  geom_freqpoly(binwidth=5, linewidth=1) +
  scale_color_manual(values=c("red", "green"), labels=c("Did not survive", "Survived")) +
  labs(title="Line Chart Trend: Age Distribution", x="Age", y="Count") +
  theme_minimal()
