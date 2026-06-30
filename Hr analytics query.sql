CREATE DATABASE hr_analytics;
USE hr_analytics;

SELECT COUNT(*) AS Total_Employees
FROM dbo.[HR-Employee-Attrition]

---overall attrition rate
SELECT
    COUNT(*) AS Total_Employees,
    SUM(CASE WHEN Attrition = 1 THEN 1 ELSE 0 END) AS Employees_Left
FROM dbo.[HR-Employee-Attrition]

SELECT
    ROUND(
        100.0 * SUM(CASE WHEN Attrition = 1 THEN 1 ELSE 0 END) / COUNT(*),
        2
    ) AS Attrition_Rate
FROM dbo.[HR-Employee-Attrition]

--- department wise attrition 
SELECT
    Department,
    COUNT(*) AS Total_Employees,
    SUM(CASE WHEN Attrition = 1 THEN 1 ELSE 0 END) AS Employees_Left,
    CAST(
        ROUND(
            100.0 * SUM(CASE WHEN Attrition = 1 THEN 1 ELSE 0 END) / COUNT(*),
            2
        ) AS DECIMAL(5,2)
    ) AS Attrition_Rate
FROM dbo.[HR-Employee-Attrition]
GROUP BY Department
ORDER BY Attrition_Rate DESC;

---Business Travel vs Attrition
SELECT
    JobRole,
    COUNT(*) AS Total_Employees,
    SUM(CASE WHEN Attrition = 1 THEN 1 ELSE 0 END) AS Employees_Left,
    CAST(
        ROUND(
            100.0 * SUM(CASE WHEN Attrition = 1 THEN 1 ELSE 0 END) / COUNT(*),
            2
        ) AS DECIMAL(5,2)
    ) AS Attrition_Rate
FROM dbo.[HR-Employee-Attrition]
GROUP BY JobRole
ORDER BY Attrition_Rate DESC;
--- overtime vs attrition
SELECT
    OverTime,
    COUNT(*) AS Total_Employees,
    SUM(CASE WHEN Attrition = 1 THEN 1 ELSE 0 END) AS Employees_Left,
    ROUND(100.0 * SUM(CASE WHEN Attrition = 1 THEN 1 ELSE 0 END) / COUNT(*), 2) AS Attrition_Rate
FROM dbo.[HR-Employee-Attrition]
GROUP BY OverTime;

---Average Monthly Income
SELECT
    Attrition,
    AVG(MonthlyIncome) AS Average_Salary
FROM dbo.[HR-Employee-Attrition]
GROUP BY Attrition;

--Average Years at Company
SELECT
    Attrition,
    AVG(YearsAtCompany) AS Average_Years
FROM dbo.[HR-Employee-Attrition]
GROUP BY Attrition;

---Environment Satisfaction
SELECT
    EnvironmentSatisfaction,
    COUNT(*) AS Total_Employees,
    SUM(CASE WHEN Attrition = 1 THEN 1 ELSE 0 END) AS Employees_Left,
    ROUND(100.0 * SUM(CASE WHEN Attrition = 1 THEN 1 ELSE 0 END) / COUNT(*), 2) AS Attrition_Rate
FROM dbo.[HR-Employee-Attrition]
GROUP BY EnvironmentSatisfaction
ORDER BY EnvironmentSatisfaction;

--Job Satisfaction
SELECT
    JobSatisfaction,
    COUNT(*) AS Total_Employees,
    SUM(CASE WHEN Attrition = 1 THEN 1 ELSE 0 END) AS Employees_Left,
    ROUND(100.0 * SUM(CASE WHEN Attrition = 1 THEN 1 ELSE 0 END) / COUNT(*), 2) AS Attrition_Rate
FROM dbo.[HR-Employee-Attrition]
GROUP BY JobSatisfaction
ORDER BY JobSatisfaction;

--Rank Job Roles by Attrition Rate 
WITH JobRoleAttrition AS (
    SELECT
        JobRole,
        COUNT(*) AS Total_Employees,
        SUM(CASE WHEN Attrition = 1 THEN 1 ELSE 0 END) AS Employees_Left,
        ROUND(
            100.0 * SUM(CASE WHEN Attrition = 1 THEN 1 ELSE 0 END) / COUNT(*),
            2
        ) AS Attrition_Rate
    FROM dbo.[HR-Employee-Attrition]
    GROUP BY JobRole
)

SELECT *,
       RANK() OVER (ORDER BY Attrition_Rate DESC) AS Attrition_Rank
FROM JobRoleAttrition;

--Top 3 Highest Paid Job Roles
SELECT TOP 3
    JobRole,
    AVG(MonthlyIncome) AS Avg_Salary
FROM dbo.[HR-Employee-Attrition]
GROUP BY JobRole
ORDER BY Avg_Salary DESC;

--Departments Above Company Average Salary
SELECT
    Department,
    AVG(MonthlyIncome) AS Avg_Salary
FROM dbo.[HR-Employee-Attrition]
GROUP BY Department
HAVING AVG(MonthlyIncome) >
(
    SELECT AVG(MonthlyIncome)
    FROM dbo.[HR-Employee-Attrition]
);

---High-Risk Employees
SELECT
    JobRole,
    Department,
    MonthlyIncome,
    OverTime,
    BusinessTravel
FROM dbo.[HR-Employee-Attrition]
WHERE Attrition = 1
AND OverTime = 1;

--Salary Category
SELECT
    MonthlyIncome,
    CASE
        WHEN MonthlyIncome < 3000 THEN 'Low'
        WHEN MonthlyIncome < 7000 THEN 'Medium'
        ELSE 'High'
    END AS Salary_Category
FROM dbo.[HR-Employee-Attrition];