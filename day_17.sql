/* Q.17 Create a report showing each service with: service name, total patients 
	admitted, the difference between their total admissions and the average 
    admissions across all services, and a rank indicator ('Above Average', 
    'Average', 'Below Average'). Order by total patients admitted descending.*/
    
-- Solution 17:

SELECT 
 s.service,
 s.total_admitted,
 ROUND(s.total_admitted - o.avg_total_admitted, 2) AS diff_from_avg,
 CASE
 WHEN s.total_admitted > o.avg_total_admitted THEN 'Above Average'
 WHEN s.total_admitted = o.avg_total_admitted THEN 'Average'
 ELSE 'Below Average'
 END AS performance_rank
FROM (
 SELECT 
 service,
 SUM(patients_admitted) AS total_admitted
 FROM services_weekly
 GROUP BY service
) AS s
CROSS JOIN (
 SELECT 
 AVG(total_per_service) AS avg_total_admitted
 FROM (
 SELECT 
 SUM(patients_admitted) AS total_per_service
 FROM services_weekly
 GROUP BY service
 ) AS x
) AS o
ORDER BY s.total_admitted DESC;
