/* Q.9 Calculate the average length of stay (in days) for each service, 
	showing only services where the average stay is more than 7 days. 
	Also show the count of patients and order by average stay descending.*/
    
-- Solution 9:
SELECT
    service,
    COUNT(*) AS total_patients,
    ROUND(AVG(DATEDIFF(departure_date, arrival_date)), 2) AS avg_stay_days
FROM patients
GROUP BY service
HAVING ROUND(AVG(DATEDIFF(departure_date, arrival_date)), 2) > 7
ORDER BY avg_stay_days DESC;