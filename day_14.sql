/* Q.14 Create a staff utilisation report showing all staff members 
	(staff_id, staff_name, role, service) and the count of weeks they were present 
    (from staff_schedule). Include staff members even if they have no schedule 
    records. Order by weeks present descending.*/
    
-- Solution 14:

SELECT 
    st.staff_id,
    st.staff_name,
    st.role,
    st.service,
    COUNT(ss.week) AS weeks_present
FROM staff st
LEFT JOIN staff_schedule ss
    ON st.staff_id = ss.staff_id
GROUP BY 
    st.staff_id,st.staff_name,st.role,st.service
ORDER BY weeks_present DESC;
  
  
