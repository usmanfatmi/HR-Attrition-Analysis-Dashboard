-- Database Create
CREATE DATABASE hr_attrition;

-- Table Create
CREATE TABLE hr_attrition (

Age INT,
Attrition VARCHAR(10),
BusinessTravel VARCHAR(50),
DailyRate INT,
Department VARCHAR(50),
DistanceFromHome INT,
Education INT,
EducationField VARCHAR(50),
EmployeeCount INT,
EmployeeNumber INT PRIMARY KEY,
EnvironmentSatisfaction INT,
Gender VARCHAR(20),
HourlyRate INT,
JobInvolvement INT,
JobLevel INT,
JobRole VARCHAR(100),
JobSatisfaction INT,
MaritalStatus VARCHAR(30),
MonthlyIncome INT,
MonthlyRate INT,
NumCompaniesWorked INT,
Over18 VARCHAR(5),
OverTime VARCHAR(10),
PercentSalaryHike INT,
PerformanceRating INT,
RelationshipSatisfaction INT,
StandardHours INT,
StockOptionLevel INT,
TotalWorkingYears INT,
TrainingTimesLastYear INT,
WorkLifeBalance INT,
YearsAtCompany INT,
YearsInCurrentRole INT,
YearsSinceLastPromotion INT,
YearsWithCurrManager INT

);

-- Import CSV
COPY hr_attrition
FROM 'D:\portfolio project\HR Analytics\WA_Fn-UseC_-HR-Employee-Attrition.csv'
DELIMITER ','
CSV HEADER;

-- Check Data
SELECT *
FROM hr_attrition
LIMIT 10;

-- Null Value
SELECT *
FROM hr_attrition
WHERE Age IS NULL
OR Attrition IS NULL
OR Department IS NULL;

-- Remove Unnecessary Columns
ALTER TABLE hr_attrition
DROP COLUMN employeecount;

ALTER TABLE hr_attrition
DROP COLUMN over18;

ALTER TABLE hr_attrition
DROP COLUMN standardhours;

-- Total Employees
SELECT COUNT(*) AS Total_Employees
FROM hr_attrition;

-- Attrition Count
SELECT Attrition,
COUNT(*) AS Employees
FROM hr_attrition
GROUP BY Attrition;

-- Attrition Rate
SELECT ROUND(100.0 * SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) / COUNT(*), 2) AS Attrition_Rate
FROM hr_attrition;

-- Department Wise Employees
SELECT Department,
COUNT(*) AS Employees
FROM hr_attrition
GROUP BY Department
ORDER BY Employees DESC;

-- Department Wise Attrition
SELECT Department,
COUNT(*) AS Attrition
FROM hr_attrition
WHERE Attrition='Yes'
GROUP BY Department
ORDER BY Attrition DESC;

-- Gender Wise Employees
SELECT Gender,
COUNT(*)
FROM hr_attrition
GROUP BY Gender;

-- Gender Wise Attrition
SELECT Gender,
COUNT(*)
FROM hr_attrition
WHERE Attrition='Yes'
GROUP BY Gender;

-- Job Role Wise Attrition
SELECT JobRole,
COUNT(*)
FROM hr_attrition
WHERE Attrition='Yes'
GROUP BY JobRole
ORDER BY COUNT(*) DESC;

-- Business Travel
SELECT BusinessTravel,
COUNT(*)
FROM hr_attrition
GROUP BY BusinessTravel;

-- Overtime Analysis
SELECT OverTime,Attrition,
COUNT(*)
FROM hr_attrition
GROUP BY OverTime,Attrition;

-- Average Monthly Income
SELECT ROUND(AVG(MonthlyIncome),2)AS Average_Salary
FROM hr_attrition;

-- Maximum Salary
SELECT MAX(MonthlyIncome)
FROM hr_attrition;

-- Minimum Salary
SELECT MIN(MonthlyIncome)
FROM hr_attrition;

-- Average Age
SELECT ROUND(AVG(Age),2)
FROM hr_attrition;

-- Average Experience
SELECT ROUND(AVG(TotalWorkingYears),2)
FROM hr_attrition;

-- Average Years at Company
SELECT ROUND(AVG(YearsAtCompany),2)
FROM hr_attrition;

-- Top 10 Highest Salary
SELECT EmployeeNumber,MonthlyIncome
FROM hr_attrition
ORDER BY MonthlyIncome DESC
LIMIT 10;

-- Department + Average Salary
SELECT Department,ROUND(AVG(MonthlyIncome),2)AS AvgSalary
FROM hr_attrition
GROUP BY Department
ORDER BY AvgSalary DESC;

-- Job Role + Average Salary
SELECT JobRole,ROUND(AVG(MonthlyIncome),2)AS AvgSalary
FROM hr_attrition
GROUP BY JobRole
ORDER BY AvgSalary DESC;

-- Marital Status
SELECT MaritalStatus,
COUNT(*)
FROM hr_attrition
GROUP BY MaritalStatus;

-- Education Field
SELECT EducationField,
COUNT(*)
FROM hr_attrition
GROUP BY EducationField
ORDER BY COUNT(*) DESC;

-- Performance Rating
SELECT PerformanceRating,
COUNT(*)
FROM hr_attrition
GROUP BY PerformanceRating;

SELECT *
FROM hr_attrition