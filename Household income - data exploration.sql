SELECT * 
FROM Household_income.household_income_table;

SELECT * 
FROM Household_income.household_income_statistics;

---

SELECT State_Name, SUM(ALand), SUM(AWater)
FROM Household_income.household_income_table
GROUP BY State_name
ORDER BY 2 DESC 
LIMIT 10;

SELECT State_Name, SUM(ALand), SUM(AWater)
FROM Household_income.household_income_table
GROUP BY State_name
ORDER BY 3 DESC 
LIMIT 10;


SELECT* 
FROM Household_income.household_income_table 
INNER JOIN Household_income.household_income_statistics
ON u.id = us.id
WHERE mean <> 0;

SELECT u.State_Name, County, Type, 'Primary' Mean, Median 
FROM Household_income.household_income_table u 
INNER JOIN Household_income.household_income_statistics us 
ON u.id = us.id
WHERE Mean <> 0;


SELECT u.State_Name, ROUND(AVG(MEAN),1), ROUND(AVG(Median),1)
FROM Household_income.household_income_table u 
INNER JOIN Household_income.household_income_statistics us 
ON u.id = us.id
WHERE Mean <> 0
GROUP BY u.State_Name
ORDER BY 3 DESC 
LIMIT 10 
;

SELECT Type, COUNT(Type), ROUND(AVG(Mean),1), ROUND(AVG(Median),1) 
FROM Household_income.household_income_table u 
INNER JOIN Household_income.household_income_statistics us 
ON u.id = us.id
WHERE MEan <> 0
GROUP BY 1
HAVING COUNT(Type) > 100
ORDER BY 4 DESC 
LIMIT 20 
;

SELECT*
FROM Household_income.household_income_table
WHERE Type = 'Community';

SELECT u.State_Name, City, ROUND(AVG(Mean),1), ROUND(AVG(Median),1)
FROM Household_income.household_income_table u
JOIN household_income.household_income_statistics us
ON u.id = us.id
GROUP BY u.State_name, City
ORDER BY ROUND(AVG(Mean),1) DESC;  












