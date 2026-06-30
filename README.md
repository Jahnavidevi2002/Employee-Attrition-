# Employee-Attrition-
##  Repository Structure

├── WA_Fn-UseC_-HR-Employee-Attrition/           # Original dataset  
├── EmployeeAttrition/                           # Colab notebook  
├── HrAnalytics query/                           # SQL queries  
├── Hr Attrition Dashboard/                      # Power BI dashboard  
├── Employee Attrition Analysis Report/          # Final report  
├── HrPredictions/                               # Predicted CSV output  

##  Project Description

This project focuses on analyzing and predicting **employee attrition** using the IBM HR dataset. Attrition is a critical challenge for organizations, leading to increased recruitment costs, reduced productivity, and lower morale. The goal of this project is to uncover the key drivers of employee turnover and build predictive models that help HR teams design effective retention strategies.

The analysis integrates:
- **SQL** → for descriptive queries and calculating attrition rates by department, job role, and satisfaction levels.  
- **Power BI** → for interactive dashboards and visual storytelling of attrition trends.  
- **Python (scikit‑learn, XGBoost, SHAP)** → for predictive modeling and explainability.  

---

## Key Details

- **Dataset:** IBM HR Employee Attrition (1,470 records, 35 features).  
- **Target Variable:** Attrition (Yes = 1, No = 0).  
- **Data Preprocessing:**  
  - Removed redundant columns (`EmployeeCount`, `EmployeeNumber`, `Over18`, `StandardHours`).  
  - One‑hot encoded categorical variables (`BusinessTravel`, `Department`, `EducationField`, `JobRole`, `MaritalStatus`).  
  - Standardized numerical features using `StandardScaler`.  
  - Train‑test split (80/20).  

- **Models Tested:** Logistic Regression, Decision Tree, Random Forest, XGBoost.  
- **Best Model:** Logistic Regression (Accuracy: 86.5%, ROC‑AUC: 0.808).  
- **Explainability:** SHAP analysis identified **Overtime, Business Travel, Job Role, Environment Satisfaction, and Years Since Last Promotion** as the strongest predictors of attrition.  

- **Outputs:**  
  - SQL queries for descriptive analysis.  
  - Power BI dashboard for visualization.  
  - Python notebook for predictive modeling.  
  - **Predicted CSV file** (`results/Predicted_Attrition_Output.csv`) containing:  
    - `Predicted_Attrition` → 0 = Stay, 1 = Leave  
    - `Attrition_Probability` → Probability score from the model  
    - `Prediction` → Human‑readable label ("Stay" or "Leave")  

---

##  Insights & Recommendations

- Employees with **low satisfaction** and **high overtime** are more likely to leave.  
- **Sales** and **R&D** departments show the highest attrition rates.  
- **Younger employees** and those with fewer years of service are at greater risk.  
- Recommendations include improving work‑life balance, structured promotions, employee engagement programs, and reviewing travel policies.  

---

##  Limitations

- Dataset is synthetic (IBM sample data).  
- External market factors not included.  
- Logistic regression assumes linear relationships.  

---

##  Future Scope

- Apply methodology to real organizational HR data.  
- Add behavioral and performance metrics.  
- Perform hyperparameter tuning for ensemble models.  
- Deploy predictive dashboards for real‑time HR monitoring.  
