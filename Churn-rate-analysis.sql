SELECT * FROM customers LIMIT 10;
SELECT Surname, Age, Geography, Exited
FROM customers
LIMIT 10;
SELECT Surname, Age, Geography, Exited
FROM customers
WHERE Exited = 1;
SELECT Surname, Age, Geography, Balance
FROM customers
WHERE Geography = 'France';
SELECT COUNT(*) 
FROM customers
WHERE Exited = 1;
SELECT AVG(Age)
FROM customers;
SELECT AVG(Age)
FROM customers
WHERE Exited = 1;
SELECT AVG(Age)
FROM customers
WHERE Exited = 0;
SELECT 
    AVG(Balance),
    AVG(EstimatedSalary),
    MIN(Balance),
    MAX(Balance)
FROM customers;
SELECT SUM(Balance)
FROM customers;
SELECT Geography, COUNT(*) AS TotalCustomers
FROM customers
GROUP BY Geography;
SELECT Geography, COUNT(*) AS ChurnedCustomers
FROM customers
WHERE Exited = 1
GROUP BY Geography;
SELECT Geography,
       COUNT(*) AS Total,
       SUM(Exited) AS Churned,
       ROUND(SUM(Exited) / COUNT(*) * 100, 1) AS ChurnRate
FROM customers
GROUP BY Geography;
SELECT Gender,
       COUNT(*) AS Total,
       ROUND(AVG(CreditScore), 1) AS AvgCreditScore
FROM customers
GROUP BY Gender;
SELECT Geography, CardType,
       COUNT(*) AS Total
FROM customers
GROUP BY Geography, CardType
HAVING Total > 500;
SELECT Surname, Age,
       CASE
           WHEN Age < 30 THEN 'Young'
           WHEN Age BETWEEN 30 AND 50 THEN 'Middle'
           ELSE 'Senior'
       END AS AgeGroup
FROM customers
LIMIT 20;
SELECT 
    CASE
        WHEN Age < 30 THEN 'Young'
        WHEN Age BETWEEN 30 AND 50 THEN 'Middle'
        ELSE 'Senior'
    END AS AgeGroup,
    COUNT(*) AS Total,
    SUM(Exited) AS Churned,
    ROUND(SUM(Exited) / COUNT(*) * 100, 1) AS ChurnRate
FROM customers
GROUP BY AgeGroup;
SELECT 
    UPPER(Surname) AS SurnameCaps,
    LOWER(Geography) AS CountryLower,
    LENGTH(Surname) AS NameLength
FROM customers
LIMIT 10;
SELECT Surname, Age, CreditScore
FROM customers
WHERE CreditScore > (SELECT AVG(CreditScore) FROM customers);
SELECT 
    Geography,
    CASE
        WHEN Age < 30 THEN 'Young'
        WHEN Age BETWEEN 30 AND 50 THEN 'Middle'
        ELSE 'Senior'
    END AS AgeGroup,
    COUNT(*) AS Total,
    ROUND(AVG(CreditScore), 1) AS AvgCreditScore,
    ROUND(SUM(Exited) / COUNT(*) * 100, 1) AS ChurnRate
FROM customers
GROUP BY Geography, AgeGroup
ORDER BY ChurnRate DESC;