install.packages(c("ggplot2","dplyr","caTools","rpart","rpart.plot"))

library(ggplot2)
library(dplyr)
library(caTools)
library(rpart)
library(rpart.plot)

# 1. FILE OPEN
file_id <- "1sxUEn8ou20thcftd__enmnJsCXHtJ6MZ"
url <- paste0("https://drive.google.com/uc?export=download&id=", file_id)
churn_clean <- read.csv(url)

# Basic check
head(churn_clean)
str(churn_clean)

# 2. CLEANING
colSums(is.na(churn_clean))
churn_clean$gender <- as.factor(churn_clean$gender)
churn_clean$contract_type <- as.factor(churn_clean$contract_type)
churn_clean$churn <- as.factor(churn_clean$churn)

# 3. CHURN %
table(churn_clean$churn)
prop.table(table(churn_clean$churn)) * 100

# 4. VISUALIZATION 1 - Churn Count
ggplot(churn_clean, aes(x=churn))+
  geom_bar(fill="steelblue") +
  labs(title = "Customer Churn Count", x="Churn Status",y="Number of Customers") +
  theme_minimal()

# 5. VISUALIZATION 2 - Churn by Contract
ggplot(churn_clean, aes(x = contract_type, fill = churn)) +
  geom_bar(position = "dodge") +
  labs(title = "Churn by Contract Type", x = "Contract Type", y = "Number of Customers") +
  scale_fill_manual(values = c("Yes" = "red", "No" = "green")) +
  theme_minimal()

# 6. VISUALIZATION 3 - Tenure Histogram
ggplot(churn_clean, aes(x = tenure_months)) +
  geom_histogram(aes(y = after_stat(density)), bins = 20, fill = "skyblue", color = "black", alpha = 0.7) +
  geom_density(color = "red", size = 1) +
  labs(title = "Tenure Distribution with Density Curve", x = "Tenure (Months)", y = "Density") +
  theme_minimal()

# 7. ML MODEL
set.seed(123) 
split <- sample.split(churn_clean$churn, SplitRatio = 0.7)
train_data <- subset(churn_clean, split==TRUE)
test_data <- subset(churn_clean , split == FALSE)

dt_model <- rpart(churn ~ gender + senior_citizen + tenure_months + contract_type + monthly_charges + total_charges,
                  data = train_data, method = "class")

rpart.plot(dt_model, type = 3, extra = 104, fallen.leaves = TRUE)

dt_predictions <- predict(dt_model, test_data, type = "class")
table(Predicted = dt_predictions, Actual = test_data$churn)

accuracy <- sum(dt_predictions == test_data$churn) / nrow(test_data)
print(paste("Accuracy:", round(accuracy*100,2), "%"))

# MODEL: To predict churn using Decision Tree
set.seed(123)
split <- sample.split(churn_clean$churn, SplitRatio=0.7)
train_data <- subset(churn_clean, split==TRUE)
test_data <- subset(churn_clean, split==FALSE)

dt_model <- rpart(churn ~ gender + senior_citizen + tenure_months + contract_type + monthly_charges + total_charges, data=train_data, method="class")
rpart.plot(dt_model, type=3, extra=104, fallen.leaves=TRUE)

# Accuracy
dt_predictions <- predict(dt_model, test_data, type="class")
table(Predicted=dt_predictions, Actual=test_data$churn)
mean(dt_predictions==test_data$churn)



