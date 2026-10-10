**CUSTOMER CHURN ANALYSIS USING R**
**README - Project Report**

*1. Project Objective*
The main objective of this project is to analyze customer churn behavior and to build a machine learning model to predict whether a customer will churn or not. This helps the company to identify at-risk customers and take retention actions.

*2. Dataset Description*
The dataset used is `churn_clean` with 500 observations and 8 variables.
Variables are:
- customer_id, gender, senior_citizen, tenure_months, contract_type, monthly_charges, total_charges, churn
The dataset is a balanced sample dataset with 250 churned (Yes) and 250 retained (No) customers.

*3. Tools and Libraries Used*
- R Version 4.6.1 (Posit Cloud)
- Libraries: ggplot2, dplyr, caTools, rpart, http://rpart.plot

*4. Steps Performed*

*Step 1: Installation and Data Loading*
Installed all required packages and loaded the dataset from Google Drive using file_id. The file was read using http://read.csv() function.

*Step 2: Data Exploration*
Used `head()` and `str()` to understand the structure of the data. Checked data types of all columns.

*Step 3: Data Cleaning*
- Checked for missing values using `colSums(is.na())` - No missing values found.
- Converted categorical columns (gender, contract_type, churn) into factor type for analysis.

*Step 4: Churn Percentage Calculation*
Used `table()` and `prop.table()` to calculate churn percentage.
Result: 50% No, 50% Yes.

*5. Data Visualizations*

*VISUALIZATION 1 - Customer Churn Count*
A bar chart to show overall distribution of churned vs retained customers. It shows equal distribution of 250-250.

*VISUALIZATION 2 - Churn by Contract Type*
A dodged bar chart to analyze how churn varies by contract type. In this sample data, Month-to-month shows mixed churn, One-year shows no churn, and Two-year shows full churn.

*VISUALIZATION 3 - Tenure Distribution*
A histogram with density curve to visualize tenure distribution of customers.

*6. Machine Learning Model - Decision Tree*
A Decision Tree model was built using `rpart` to predict churn.
- Data was split into 70% training and 30% testing using `sample.split`
- Formula used: churn ~ gender + senior_citizen + tenure_months + contract_type + monthly_charges + total_charges
- Model was visualized using `rpart.plot`

In this particular sample dataset, the model identified `gender` as the root node, with Female = No and Male = Yes, showing a pattern in the synthetic data.

*7. Conclusion*
The project successfully demonstrates the end-to-end process of churn analysis from data loading to visualization and predictive modeling. The R code was executed successfully on Posit Cloud and all visualizations were generated. For real business application, the same code can be applied to the original Telco dataset for more realistic insights.

*8. Files Included*
1. R Code Screenshots
2. Visualization Plots (3 plots)
3. Decision Tree Plot
4. Console Output Screenshots

---

