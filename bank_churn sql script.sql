Create database Bank_Churndb;
use Bank_churndb;
 CREATE TABLE customers (
    CustomerID INT,
    Age INT,
    gender VARCHAR(10),
    Tenure INT,
    balance DECIMAL(15 , 2 ),
    No_of_product INT,
    has_cr_card INT,
    Is_active_member INT,
    Estimated_Salary DECIMAL(15 , 2 ),
    Exited INT
);


use bankchurndb;
select * from customers ;

# Total customers and Churned customers 
SELECT 
    COUNT(*) AS total_customer,
    SUM(CASE
                WHEN exited = 'yes' THEN 1
                ELSE 0
            END) AS churned_customers,
    ROUND(100.0 * SUM(CASE
                        WHEN exited = 'yes' THEN 1
                        ELSE 0
                    END) / COUNT(*),
            2) AS Churn_rate_percent
FROM
    customers;
    
    # Churned vs Non-Churned by Gender
   SELECT 
    gender,
    COUNT(*) AS total_customers,
    SUM(CASE
        WHEN exited = 'yes' THEN 1
        ELSE 0
    END) AS Churned_customers,
    ROUND(100.0 * SUM(CASE
                WHEN exited = 'yes' THEN 1
                ELSE 0
            END) / COUNT(*),
            2) AS Churn_rate_percent
FROM
    customers
GROUP BY gender;
    
    
    # Churn by Age Group
    
SELECT 
    CASE
        WHEN age BETWEEN 18 AND 30 THEN '18-30'
        WHEN age BETWEEN 31 AND 45 THEN '31-45'
        WHEN age BETWEEN 46 AND 60 THEN '46-60'
        ELSE '60+'
    END AS Age_Group,
    COUNT(*) AS Total_Customers,
    SUM(CASE
        WHEN exited = 'yes' THEN 1
        ELSE 0
    END) AS Churned_Customers,
    ROUND(100.0 * SUM(CASE
                WHEN exited = 'yes' THEN 1
                ELSE 0
            END) / COUNT(*),
            2) AS Churn_rate_percent
FROM
    customers
GROUP BY Age_Group
ORDER BY Age_Group;

# Churn by Tenure

SELECT 
    tenure,
    COUNT(*) AS total_customers,
    SUM(CASE
        WHEN exited = 'yes' THEN 1
        ELSE 0
    END) AS Churned_Customers,
    ROUND(100.0 * SUM(CASE
                WHEN exited = 'yes' THEN 1
                ELSE 0
            END) / COUNT(*),
            2) AS Churn_rate_percent
FROM
    customers
GROUP BY Tenure
ORDER BY Tenure;


# Churn by CreditCard Usage

select has_cr_card,count(*) as total_cutomers,
  SUM(CASE
        WHEN exited = 'yes' THEN 1
        ELSE 0
    END) AS Churned_Customers,
    ROUND(100.0 * SUM(CASE
                WHEN exited = 'yes' THEN 1
                ELSE 0
            END) / COUNT(*),
            2) AS Churn_rate_percent
FROM
    customers
    group by has_cr_card;
    
    
    
    #Churn by Active Member Status
    
    SELECT 
    Is_Active_Member,
    COUNT(*) AS total_cutomers,
    SUM(CASE
        WHEN exited = 'yes' THEN 1
        ELSE 0
    END) AS Churned_Customers,
    ROUND(100.0 * SUM(CASE
                WHEN exited = 'yes' THEN 1
                ELSE 0
            END) / COUNT(*),
            2) AS Churn_rate_percent
FROM
    customers
GROUP BY Is_Active_Member;