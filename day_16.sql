/* Q.16 Find all patients who were admitted to services that had at least one 
	week where patients were refused AND the average patient satisfaction for 
    that service was below the overall hospital average satisfaction. 
    Show patient_id, name, service, and their personal satisfaction score.*/
    
-- Solution 16:


SELECT 
 p.patient_id,
 p.name,
 p.service,
 p.satisfaction AS patient_satisfaction
FROM patients p
WHERE p.service IN (
 SELECT sw.service
 FROM services_weekly sw
 GROUP BY sw.service
 HAVING SUM(CASE WHEN sw.patients_refused > 0 THEN 1 ELSE 0 END) >= 1
 AND AVG(sw.patient_satisfaction) < (
 SELECT AVG(patient_satisfaction) 
 FROM services_weekly
 )
);