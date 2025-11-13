/* Q.5 Calculate the total number of patients admitted, total patients refused, 
	and the average patient satisfaction across all services and weeks. 
	Round the average satisfaction to 2 decimal places.*/
    
-- Solution:
select
    sum(patients_admitted) as total_admitted,
    sum(patients_refused) as total_refused,
    round(avg(patient_satisfaction),2) as avg_satisfaction
from services_weekly;
