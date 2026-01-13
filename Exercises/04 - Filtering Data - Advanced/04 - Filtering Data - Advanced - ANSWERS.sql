/* ============================================================
   04 - Filtering Data - Advanced - ANSWERS.sql

   This file contains the answers and explanations for the exercises in:
     04 - Filtering Data - Advanced.sql

   Always try the exercises yourself first before reading these answers.
   
============================================================ 

Exercise 1:
Select all publishers where the country
CONTAINS the word "King".
------------------------------------------------------------ */
SELECT *
FROM 
    Publishers
WHERE 
    country LIKE '%King%';

-- Expected rows (sample dataset): 3

/*
Explanation:
- LIKE is used for pattern matching on text.
- % allows any number of characters before and after "King".
- This returns countries such as "United Kingdom".


------------------------------------------------------------
  Exercise 2:
  Select all Book_Copies where:
    - status is 'AVAILABLE'
    - AND shelf_location is 'C2'
  ------------------------------------------------------------ */
SELECT *
FROM 
    Book_Copies
WHERE 
    status = 'AVAILABLE' AND
    shelf_location = 'C2';

-- Expected rows (sample dataset): 2

/*
Explanation:
- AND requires both conditions to be true.
- Only copies that are AVAILABLE and located at C2 are returned.


------------------------------------------------------------
Exercise 3:
Select all Book_Copies where:
  - status is 'LOST'
  - OR status is 'DAMAGED'
  - AND shelf_location is 'B2'
------------------------------------------------------------ */
SELECT *
FROM 
    Book_Copies
WHERE 
    shelf_location = 'B2' AND
    (
        status = 'LOST' OR
        status = 'DAMAGED'
    );

-- Expected rows (sample dataset): 1

/*
Explanation:
- Parentheses control how conditions are evaluated.
- The status condition is grouped together first.
- Without parentheses, the result would be different.



------------------------------------------------------------
Exercise 4:
Select all publishers where:
  - publisher_id is greater than 5
  - AND the country starts with 'United'
------------------------------------------------------------ */
SELECT *
FROM 
    Publishers
WHERE 
    publisher_id > 5 AND
    country LIKE 'United%';

-- Expected rows (sample dataset): 6

/*
Explanation:
- publisher_id > 5 filters numerically.
- LIKE 'United%' matches countries beginning with "United".
- Both conditions must be true.




------------------------------------------------------------
Exercise 5:
Rewrite this query using IN instead of OR:

  status = 'DAMAGED' OR status = 'LOST'
------------------------------------------------------------ */
SELECT *
FROM 
    Book_Copies
WHERE 
    status IN ('DAMAGED', 'LOST');

-- Expected rows (sample dataset): 2

/*
Explanation:
- IN replaces multiple OR conditions.
- This is easier to read and easier to extend later.



------------------------------------------------------------
Exercise 6:
Select all Book_Copies where status is
one of the following:
  - AVAILABLE
  - ON_LOAN
------------------------------------------------------------ */
SELECT *
FROM 
    Book_Copies
WHERE 
    status IN ('AVAILABLE', 'ON_LOAN');

-- Expected rows (sample dataset): 28

/*
Explanation:
- IN checks the column against a list of allowed values.
- This is equivalent to using OR between each value.



------------------------------------------------------------
Exercise 7:
Select all publishers where the country is NOT
one of the following:
  - United States
  - Canada
------------------------------------------------------------ */
SELECT *
FROM 
    Publishers
WHERE 
    country NOT IN ('United States', 'Canada');

-- Expected rows (sample dataset): 13

/*
Explanation:
- NOT IN excludes rows that match the list.
- Only publishers outside those countries are returned.




------------------------------------------------------------
Exercise 8 (thinking exercise):
Why is IN often preferred over many OR conditions?
When might OR still be useful?
------------------------------------------------------------

Explanation:
- IN is cleaner and easier to maintain when checking
  against a list of known values.
- OR can still be useful for:
    - mixing different conditions
    - complex logic that cannot be expressed as a list
*/
