/* Q.5 Calculate the total number of patients admitted, total patients refused, 
	and the average patient satisfaction across all services and weeks. 
	Round the average satisfaction to 2 decimal places.*/
    
-- Solution:
select
    sum(patients_admitted) as total_admitted,
    sum(patients_refused) as total_refused,
    round(avg(patient_satisfaction),2) as avg_satisfaction
from services_weekly;



/* 
Think of this like checking monthly performance of your shop.

Someone from the hospital team says,
“Krishna, ek kaam kar… sabhi weeks ko mila kar bata
total kitne patients aaye,
kitne mana kiye,
aur overall satisfaction kitna raha?”

So what do you do?
For total admitted → you add all weeks
For total refused → again add everything
For satisfaction → you don’t add, you take the average

And because averages come with long decimals, you round it to 2 digits so it looks clean

It’s literally like checking your shop’s total sales, total lost customers, and overall feedback score in a month.

And SQL makes it super simple with just three functions:
SUM, SUM, and AVG wrapped in ROUND.

Done. Clean. Sorted.*/
