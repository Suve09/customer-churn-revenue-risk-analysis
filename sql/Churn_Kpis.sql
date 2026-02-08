--Overall Churn Rate--
SELECT
    COUNT(CASE WHEN Churn = 'Yes' THEN 1 END) * 100.0 / COUNT(*) AS churn_rate_pct
FROM dbo.TelcoChurn_Clean

--Churn by contract type--
SELECT
    Contract,
    COUNT(CASE WHEN Churn = 'Yes' THEN 1 END) * 100.0 / COUNT(*) AS churn_rate_pct,
    COUNT(*) AS customers
FROM dbo.TelcoChurn_Clean
GROUP BY Contract;
--Churn by tenure group
SELECT
    tenure_group,
    COUNT(CASE WHEN Churn = 'Yes' THEN 1 END) * 100.0 / COUNT(*) AS churn_rate_pct,
    COUNT(*) AS customers
FROM dbo.TelcoChurn_Clean
GROUP BY tenure_group
--Churn by payment method
SELECT
    PaymentMethod,
    COUNT(CASE WHEN Churn = 'Yes' THEN 1 END) * 100.0 / COUNT(*) AS churn_rate_pct,
    COUNT(*) AS customers
FROM dbo.TelcoChurn_Clean
GROUP BY PaymentMethod;
--Churn by price segment
SELECT
    price_segment,
    COUNT(CASE WHEN Churn = 'Yes' THEN 1 END) * 100.0 / COUNT(*) AS churn_rate_pct,
    COUNT(*) AS customers
FROM dbo.TelcoChurn_Clean
GROUP BY price_segment;
--Tech support impact on churn
SELECT
    TechSupport,
    COUNT(CASE WHEN Churn = 'Yes' THEN 1 END) * 100.0 / COUNT(*) AS churn_rate_pct
FROM dbo.TelcoChurn_Clean
GROUP BY TechSupport;

