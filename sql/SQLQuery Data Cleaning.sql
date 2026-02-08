-- 1. Create clean analytical table
DROP TABLE IF EXISTS dbo.TelcoChurn_Clean

SELECT
    customerID,
    gender,
    SeniorCitizen,
    Partner,
    Dependents,
    tenure,
    PhoneService,
    MultipleLines,
    InternetService,
    OnlineSecurity,
    OnlineBackup,
    DeviceProtection,
    TechSupport,
    StreamingTV,
    StreamingMovies,
    Contract,
    PaperlessBilling,
    PaymentMethod,

    CAST(MonthlyCharges AS DECIMAL(10,2)) AS MonthlyCharges,
    CAST(NULLIF(TotalCharges, ' ') AS DECIMAL(12,2)) AS TotalCharges,

    CASE 
        WHEN tenure BETWEEN 0 AND 12 THEN '0-12 months'
        WHEN tenure BETWEEN 13 AND 24 THEN '12-24 months'
        ELSE '24+ months'
    END AS tenure_group,

    CASE 
        WHEN CAST(MonthlyCharges AS DECIMAL(10,2)) < 40 THEN 'Low Charge'
        WHEN CAST(MonthlyCharges AS DECIMAL(10,2)) BETWEEN 40 AND 80 THEN 'Medium Charge'
        ELSE 'High Charge'
    END AS price_segment,

    Churn
INTO dbo.TelcoChurn_Clean
FROM dbo.TelcoChurn_Raw

