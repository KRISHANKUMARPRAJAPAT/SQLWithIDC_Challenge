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

/*
Imagine you’re analysing hospital stay data and someone says,

“Krishna, mujhe yeh pata lagana hai ki kaun si services me patients 7 din se zyada ruk rahe hain on average.
Aur saath me yeh bhi bata kitne patients the.”

So you think…

Har service ka data ek group me le lo.
Phir uska average stay nikaalo.
Saath me patient count bhi nikaal do.

Fir ek simple condition:
“Sirf wo services dikhana jahan average stay 7 din se upar ho.”

It’s exactly like checking which type of product stays longest in your shop’s storage room.
Sabka average nikaalo, phir jisko zyada time laga, us par dhyan do.

SQL me yeh kaam easily ho jata hai:
AVG(length_of_stay) → average nikaal diya
COUNT(patient_id) → patient count
HAVING AVG(length_of_stay) > 7 → filter

ORDER BY avg_stay DESC → longest average stay sabse upar
MySQL ekdum clean ranking de deta hai.
