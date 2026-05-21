CREATE DATABASE churn_db;
USE churn_db;
CREATE TABLE customers (
    RowNumber       INT,
    CustomerId      BIGINT,
    Surname         VARCHAR(100),
    CreditScore     INT,
    Geography       VARCHAR(50),
    Gender          VARCHAR(10),
    Age             INT,
    Tenure          INT,
    Balance         DECIMAL(15,2),
    NumOfProducts   INT,
    HasCrCard       INT,
    IsActiveMember  INT,
    EstimatedSalary DECIMAL(15,2),
    Exited          INT,
    Complain        INT,
    SatisfactionScore INT,
    CardType        VARCHAR(20),
    PointEarned     INT
);
SELECT COUNT(*) FROM customers;
SELECT * FROM customers LIMIT 5;