# Employee Attrition Prediction

[![Python](https://img.shields.io/badge/Python-3.9-green?logo=python)](#)
[![SQL](https://img.shields.io/badge/SQL-Analysis-blue?logo=postgresql)](#)
[![PowerBI](https://img.shields.io/badge/PowerBI-Dashboard-yellow?logo=powerbi)](#)
[![GoogleColab](https://img.shields.io/badge/GoogleColab-Notebook-orange?logo=googlecolab)](#)

## 📊 Dashboard Preview

![HR Attrition Dashboard](dashboard.png)

---

## Project Description

This project analyzes and predicts **employee attrition** using the IBM HR Employee Attrition dataset (1,470 records, 35 features). Attrition drives up recruitment costs, lowers productivity, and hurts morale — the goal here was to identify the strongest predictors of turnover and build a model accurate enough to support real retention decisions.

The analysis combines:
- **SQL** — descriptive queries and attrition rate breakdowns by department, job role, and satisfaction level
- **Power BI** — interactive dashboards visualizing attrition trends
- **Python (scikit-learn, XGBoost, SHAP)** — predictive modeling and model explainability

---

## Key Results

- **Best model: Logistic Regression — 86.5% accuracy, 0.808 ROC-AUC**, outperforming Decision Tree, Random Forest, and XGBoost on this dataset
- **Overall attrition rate: ~16%**, highest in **Sales and R&D**
- **SHAP analysis identified the top 5 attrition drivers:** Overtime, Business Travel, Job Role, Environment Satisfaction, and Years Since Last Promotion
- Employees with **low satisfaction + high overtime** showed the highest attrition risk
- **Younger employees and those with fewer years of service** were disproportionately likely to leave

---

## Methodology

**Data Preprocessing:**
- Removed redundant columns (`EmployeeCount`, `EmployeeNumber`, `Over18`, `StandardHours`)
- One-hot encoded categorical variables (`BusinessTravel`, `Department`, `EducationField`, `JobRole`, `MaritalStatus`)
- Standardized numerical features using `StandardScaler`
- 80/20 train-test split

**Models tested:** Logistic Regression, Decision Tree, Random Forest, XGBoost
**Explainability:** SHAP values used to interpret which features drove individual and overall predictions, not just to optimize accuracy

**Outputs:**
- SQL queries for descriptive analysis
- Power BI dashboard for visualization
- Python notebook for predictive modeling
- Predicted CSV (`Predicted_Attrition` = 0/1, `Attrition_Probability`, human-readable `Prediction` label)

---

## Recommendations

- Introduce flexible work policies to reduce overtime-driven attrition
- Build structured, predictable promotion timelines
- Strengthen engagement programs in Sales and R&D specifically
- Review business travel frequency for high-risk roles

---

## Limitations

- Dataset is synthetic (IBM sample data), not real organizational data
- External factors (market conditions, compensation benchmarking) not included
- Logistic Regression assumes linear relationships between features and outcome

---

## Future Scope

- Apply this methodology to real organizational HR data
- Incorporate behavioral and performance metrics
- Hyperparameter tuning for ensemble models (Random Forest, XGBoost)
- Deploy as a live, real-time HR monitoring dashboard

---

**Author:** Jahnavi Jammi
Aspiring Data Analyst | SQL · Python · Power BI · Machine Learning
