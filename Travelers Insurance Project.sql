'Full Data of Profit, Policy Type, Accident Report Type:
SELECT pip.type AS 'Policy Type', ROUND(pp.premium*1750) AS 'Premium', ROUND(pip.coverage_amount) AS 'Coverage Amount', 
ROUND((pp.premium*1750)-pip.coverage_amount) AS 'Profit', par.type AS 'Accident Report Type', par.location AS 'Accident Location'
FROM PJ_purchase pp 
JOIN PJ_Insurance_policy pip ON pp.policy_ID=pip.policy_ID 
JOIN PJ_Insurance_Claim pic ON pip.policy_ID=pic.policy_ID 
JOIN PJ_Accident_Report par ON pic.report_ID=par.report_ID
ORDER BY ROUND((pp.premium*1750)-pip.coverage_amount) DESC;'

1. 'Average Profits By Policy Type'
SELECT pip.type AS 'Policy Type', ROUND(AVG(pp.premium*1750)) AS 'Average Premium Amount',ROUND(AVG(pip.coverage_amount)) AS 'Average Coverage Amount', ROUND(AVG((pp.premium*1750)-pip.coverage_amount)) AS 'Average Profit', (COUNT(*)/50)*100 AS '% of Total Policy Types'
FROM PJ_purchase pp 
JOIN PJ_Insurance_policy pip ON pp.policy_ID=pip.policy_ID 
JOIN PJ_Insurance_Claim pic ON pip.policy_ID=pic.policy_ID 
JOIN PJ_Accident_Report par ON pic.report_ID=par.report_ID
GROUP BY pip.type
ORDER BY ROUND(AVG((pp.premium*1750)-pip.coverage_amount)) DESC;

2. 'Avg Profits of Policy Type: Full'
SELECT AVG(ROUND(pp.premium*1750)) AS 'Premium', AVG(ROUND(pip.coverage_amount)) AS 'Coverage Amount', AVG(ROUND((pp.premium*1750)-pip.coverage_amount)) AS 'Profit', pip.type AS 'Policy Type'
FROM PJ_purchase pp 
JOIN PJ_Insurance_policy pip ON pp.policy_ID=pip.policy_ID 
JOIN PJ_Insurance_Claim pic ON pip.policy_ID=pic.policy_ID 
JOIN PJ_Accident_Report par ON pic.report_ID=par.report_ID
WHERE pip.type LIKE 'FULL';

3. 'Average Profits By Accident Report Type'
SELECT par.type AS 'Accident Report Type', ROUND(AVG(pp.premium*1750)) AS 'Average Premium Amount',ROUND(AVG(pip.coverage_amount)) AS 'Average Coverage Amount', ROUND(AVG((pp.premium*1750)-pip.coverage_amount)) AS 'Average Profit', (COUNT(*)/50)*100 AS '% of Total Accident Report Types'
FROM PJ_purchase pp 
JOIN PJ_Insurance_policy pip ON pp.policy_ID=pip.policy_ID 
JOIN PJ_Insurance_Claim pic ON pip.policy_ID=pic.policy_ID 
JOIN PJ_Accident_Report par ON pic.report_ID=par.report_ID
GROUP BY par.type
ORDER BY ROUND(AVG((pp.premium*1750)-pip.coverage_amount)) DESC;

4. 'Avg Profits of Accident Report Type: Theft'
SELECT AVG(ROUND(pp.premium*1750)) AS 'Premium', AVG(ROUND(pip.coverage_amount)) AS 'Coverage Amount', AVG(ROUND((pp.premium*1750)-pip.coverage_amount)) AS 'Profit', par.type AS 'Accident Report Type'
FROM PJ_purchase pp 
JOIN PJ_Insurance_policy pip ON pp.policy_ID=pip.policy_ID 
JOIN PJ_Insurance_Claim pic ON pip.policy_ID=pic.policy_ID 
JOIN PJ_Accident_Report par ON pic.report_ID=par.report_ID
WHERE par.type LIKE 'Theft';

'Full Data On Class, Model, Accident Report Type, And Damage Of Motorhomes:
SELECT pm.class AS 'Class', pm.model AS 'Model', par.type AS 'Accident Report Type', ROUND(par.damage) AS 'Damage'
FROM PJ_Accident_Report par 
JOIN PJ_motorhome pm ON par.VIN_number=pm.VIN_number
ORDER BY pm.class;'

5. 'Average Damage By Class Of Motorhome'
SELECT pm.class AS 'Class', AVG(ROUND(par.damage)) AS 'Average Damage', (COUNT(*)/50)*100 AS '% of Total Class Reports'
FROM PJ_Accident_Report par 
JOIN PJ_motorhome pm ON par.VIN_number=pm.VIN_number
GROUP BY pm.class
ORDER BY AVG(ROUND(par.damage)) DESC;

6. 'Average Damage By Model Of Motorhome'
SELECT pm.model AS 'Model', AVG(ROUND(par.damage)) AS 'Average Damage', (COUNT(*)/50)*100 AS '% of Total Model Reports'
FROM PJ_Accident_Report par 
JOIN PJ_motorhome pm ON par.VIN_number=pm.VIN_number
GROUP BY pm.model
ORDER BY AVG(ROUND(par.damage)) DESC;