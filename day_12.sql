
/* Q.12 Analyze the event impact by comparing weeks with events vs weeks without 
	events. Show: event status ('With Event' or 'No Event'), count of weeks, 
    average patient satisfaction, and average staff morale. 
    Order by average patient satisfaction descending.*/
    
-- Solution 12:
select * from services_weekly

WITH weekly AS (
  SELECT
    week,
    CASE
      WHEN MAX(CASE WHEN event IS NULL OR LOWER(event) = 'none' THEN 0 ELSE 1 END) = 1
        THEN 'With Event'
      ELSE 'No Event'
    END AS event_status,
    AVG(patient_satisfaction) AS week_avg_satisfaction,
    AVG(staff_morale) AS week_avg_morale
  FROM services_weekly
  GROUP BY week)
SELECT
  event_status,
  COUNT(*) AS weeks_count,
  ROUND(AVG(week_avg_satisfaction), 2) AS avg_patient_satisfaction,
  ROUND(AVG(week_avg_morale), 2) AS avg_staff_morale
FROM weekly
GROUP BY event_status
ORDER BY avg_patient_satisfaction DESC;
