/* Q.8 Create a patient summary that shows patient_id, full name in uppercase, 
	service in lowercase, age category (if age >= 65 then 'Senior', if age >= 18 then 'Adult', 
    else 'Minor'), and name length. Only show patients whose name length is greater than 10 
    characters.*/
    
-- Solution 8:
SELECT
 patient_id,
 UPPER(name) AS Name,
 LOWER(service) AS Service,
 CASE
	WHEN age >= 65 THEN 'Senior'
	WHEN age >= 18 THEN 'Adult'
	ELSE 'Minor'
 END AS Age_category
FROM patients
WHERE LENGTH(name) > 10;

/*
Imagine you’re sitting with a cup of chai and someone from the hospital team tells you,

“Krishna, ek cool summary bana do of patients. Bas thoda stylish format me…
naam pura capital me, service chhoti letters me,
age ke hisaab se category… aur naam ka length bhi dikha do.”

So you start thinking like a coder-friend:

Full name uppercase? Easy — UPPER().
Service lowercase? Another easy one — LOWER().

Age category? Bas simple logic…
65+ means Senior
18 to 64 means Adult
18 se chhote toh Minor
Name length? LENGTH() does that.

Phir woh bolte hain,
“Par bhai… sirf un patients ko dikhana jinka naam 10 letters se lamba ho.”

Toh last me ek filter laga diya:
WHERE LENGTH(name) > 10
And SQL neatly spits out a clean, well-formatted list.

It feels like you’re cleaning data for a Netflix show — making everything look perfect.*/
