
/* Q.13 Create a comprehensive report showing patient_id, patient name, age, service, 
	and the total number of staff members available in their service. 
    Only include patients from services that have more than 5 staff members. 
    Order by number of staff descending, then by patient name.*/
    
-- Solution 13:

SELECT 
    p.patient_id,
    p.name AS patient_name,
    p.age,
    p.service,
    s.staff_count
FROM patients p
JOIN (
    SELECT 
        service,
        COUNT(staff_id) AS staff_count
    FROM staff
    GROUP BY service
) s ON p.service = s.service-
WHERE s.staff_count > 5
ORDER BY s.staff_count DESC, p.name ASC;
