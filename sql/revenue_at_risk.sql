--ARPU (Average Revenue Per User)--
SELECT
    AVG(MonthlyCharges) AS ARPU
FROM dbo.TelcoChurn_Clean

--Revenue at risk (monthly)--
SELECT
    SUM(MonthlyCharges) AS revenue_at_risk
FROM dbo.TelcoChurn_Clean
WHERE Churn = 'Yes'

--Revenue at risk by segment--
SELECT
    price_segment,
    SUM(MonthlyCharges) AS revenue_at_risk
FROM dbo.TelcoChurn_Clean
WHERE Churn = 'Yes'
GROUP BY price_segment