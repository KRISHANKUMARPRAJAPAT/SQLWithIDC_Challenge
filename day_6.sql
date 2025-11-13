/* Q.6 For each hospital service, calculate the total number of patients admitted, 
	total patients refused, and the admission rate (percentage of requests that were 
	admitted). Order by admission rate descending.*/
    
-- Solution:
SELECT 
    service,
    SUM(patients_admitted) AS total_admitted,
    SUM(patients_refused) AS total_refused,
    ROUND((SUM(patients_admitted) / SUM(patients_request)) * 100 , 2 ) AS admission_rate
FROM services_weekly
GROUP BY service
ORDER BY admission_rate DESC;


/*
Picture this: You’re sitting with the hospital management team, and they say,

“Krishna, humein yeh samajhna hai ki kaun si service patients ko sabse zyada admit kar paayi.
Matlab total kitne aaye, kitne mana hue, aur admission ka percentage kya hai.”

So tum kya karoge?

Har service ke data ko ek group me jod doge
Like Surgery ka total, Cardiology ka total, Emergency ka total… sab alag alag.

Total admitted = sum of admitted for that service
Total refused = sum of refused for that service
Admission rate = (admitted / requests) × 100
Bas ek simple percentage formula.

Phir bol doge MySQL ko,
“Ab is list ko is basis pe sort kar — jiska admission rate sabse zyada hai, wo sabse upar.”

And SQL neatly gives you a proper ranking of services.

It’s the same feeling as checking which product in your shop sold the best based on conversion rate.
*/

