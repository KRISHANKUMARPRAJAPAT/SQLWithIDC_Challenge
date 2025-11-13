/* Q.4 Find the 3rd to 7th highest patient satisfaction scores from the patients table, 
	showing patient_id, name, service, and satisfaction. Display only these 5 records..*/
    
-- Solution: 
select 
	patient_id, name, service, satisfaction
from patients
order by satisfaction desc
limit 5 offset 2


/*
Think of it like ranking cricket scores.

You have a list of players sorted from highest to lowest runs.
Now someone asks you,
“Krishna, mujhe top 1 ya top 2 nahi chahiye. Bas unke baad wale 5 players bata do… rank 3 se 7 tak.”

So what you do?
Take the full list sorted by highest score
Ignore the first 2
Pick the next 5

That exact logic we use in SQL.

OFFSET 2 is like saying,
“Bhai, pehle do ko side me rakh do.”

LIMIT 5 is like saying,
“Ab jo next 5 aaye, bas woh de do.”
And MySQL gives you the clean list of the 3rd to 7th highest satisfaction scores.*/
