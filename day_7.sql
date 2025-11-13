/* Q.7 Identify services that refused more than 100 patients in total and had 
	an average patient satisfaction below 80. Show service name, total refused, 
    and average satisfaction..*/
    
-- Solution:
SELECT
 service AS service_name,
 SUM(patients_refused) AS total_refused,
 ROUND(AVG(patient_satisfaction), 2) AS avg_satisfaction
FROM services_weekly
GROUP BY service
HAVING SUM(patients_refused) > 100
	AND AVG(patient_satisfaction) < 80;



/*
So imagine you’re reviewing the hospital’s weekly performance and someone says,

“Krishna bhai, mujhe un services ki list chahiye jahan do problems ho rahi hain —
pehli, jahan 100 se zyada logon ne mana kar diya,
aur dusri, jahan satisfaction score 80 ke niche chal raha hai.”

Ab tum sochoge…

Pehle toh har service ka total refused nikalo
Saath me uska average satisfaction bhi
Fir dekho kaun se services dono conditions poori karti hain

It’s like checking which items in your shop got too many returns and low customer ratings.
Dono galat signs ek hi jagah mil rahe hain.

SQL me bas group karo, totals nikaalo, averages nikaalo…
phir HAVING ke through condition laga do:

“Bhai, sirf wo services dikhana jahan refusals 100 se upar hain
aur satisfaction 80 se niche hai.”*/

And MySQL ekdum saaf list de deta hai.
