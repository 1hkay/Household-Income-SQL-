SELECT * 
FROM Household_income.household_income_table;


SELECT * 
FROM Household_income.household_income_statistics;

SELECT Count(ID)
FROM Household_income.household_income_table;

SELECT id, Count(id)
FROM Household_income.household_income_table
GROUP BY id 
HAVING count(id) > 1 
;

SELECT *
FROM (
SELECT row_id, 
id, 
ROW_NUMBER() OVER (PARTITION BY id ORDER BY id) row_num
FROM Household_income.household_income_table
) dublicates 
WHERE row_num > 1
;

SELECT *
FROM (
SELECT row_id, 
id, 
ROW_NUMBER() OVER (PARTITION BY id ORDER BY id) row_num
FROM Household_income.household_income_table
) dublicates 
WHERE row_num > 1
;

DELETE FROM Household_income.household_income_table
WHERE row_id IN (
SELECT row_id
FROM (
SELECT row_id, 
id, 
ROW_NUMBER() OVER (PARTITION BY id ORDER BY id) row_num
FROM Household_income.household_income_table
) dublicates 
WHERE row_num > 1)
;

SELECT state_name, count(state_name) 
FROM Household_income.household_income_table
GROUP BY state_name;

SELECT DISTICT State_name
FROM Household_income.household_income_table
ORDER BY 1;

UPDATE household_income.household_income_table
SET State_name = 'Georgia'
WHERE state_name = 'geoia';


UPDATE household_income.household_income_table
SET State_name = 'Alabama'
WHERE state_name = 'alabama';

UPDATE household_income.household_income_table
SET Place = 'Autaugaville' 
WHERE County = 'Autauga County'
AND City = 'Vinemont';

SELECT Type, COUNT(Type)
FROM household_income.household_income_table
GROUP BY Type
#ORDER BY 1
;


UPDATE household_income.household_income_table
SET TYPE = 'Borough'
WHERE Type = 'Boroughs';

















