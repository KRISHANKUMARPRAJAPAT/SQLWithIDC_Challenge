/* Q.15 Create a comprehensive service analysis report for week 20 showing: 
	service name, total patients admitted that week, total patients refused, average 
	patient satisfaction, count of staff assigned to service, and count of staff 
    present that week. Order by patients admitted descending.*/
    
-- Solution 15:

SELECT 
 sw.service,
 sw.patients_admitted,
 sw.patients_refused,
 ROUND(sw.patient_satisfaction, 2) AS avg_satisfaction,
 COUNT(DISTINCT s.staff_id) AS total_staff,
 SUM(CASE WHEN ss.present = 1 THEN 1 ELSE 0 END) AS staff_present
FROM services_weekly sw
LEFT JOIN staff s 
 ON sw.service = s.service
LEFT JOIN staff_schedule ss 
 ON s.staff_id = ss.staff_id 
 AND sw.week = ss.week
WHERE sw.week = 20
GROUP BY 
 sw.service,
 sw.patients_admitted,
 sw.patients_refused,
 sw.patient_satisfaction
ORDER BY sw.patients_admitted DESC;