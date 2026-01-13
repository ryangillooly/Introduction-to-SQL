/* ============================================================
   09 - Aggregations - ANSWERS.sql

   This file contains the answers and explanations for the exercises in:
     09 - Aggregations.sql

   Always try the exercises yourself first before reading these answers.

============================================================ 
   Exercise 1:
   Find the total number of fines in the system.
------------------------------------------------------------ */
SELECT
    COUNT(*) AS NumberOfFines
FROM 
    Fines;

-- Expected rows (sample dataset): 1  
-- Value: NumberOfFines = 10

/*
Explanation:
- COUNT(*) counts how many rows exist in the Fines table.
- Each row represents a fine.


------------------------------------------------------------
   Exercise 2:
   Find the total value of all fines.
------------------------------------------------------------ */
SELECT
    SUM(amount) AS TotalFines
FROM 
    Fines;

-- Expected rows (sample dataset): 1  
-- Value: TotalFines = 24.75

/*
Explanation:
- SUM(amount) adds up all values in the amount column.
- This gives the total money value of fines in the system.


------------------------------------------------------------
   Exercise 3:
   Find the average fine amount.
------------------------------------------------------------ */
SELECT
    AVG(amount) AS AverageFineAmount
FROM 
    Fines;

-- Expected rows (sample dataset): 1  
-- Value: AverageFineAmount = 2.475

/*
Explanation:
- AVG(amount) calculates the average of the amount column.
- AVG ignores NULL values automatically (if any exist).


------------------------------------------------------------
   Exercise 4:
   Find the smallest fine and the largest fine.
------------------------------------------------------------ */
SELECT
    MIN(amount) AS SmallestFine,
    MAX(amount) AS LargestFine
FROM 
    Fines;

-- Expected rows (sample dataset): 1  
-- Values: SmallestFine = 0.75, LargestFine = 6.00

/*
Explanation:
- MIN(amount) returns the smallest numeric fine.
- MAX(amount) returns the largest numeric fine.
- This is useful to understand the range of fine values.


------------------------------------------------------------
   Exercise 5:
   Find the number of PAID fines vs UNPAID fines.
   Return:
     - paid
     - NumberOfFines
------------------------------------------------------------ */
SELECT
    paid,
    COUNT(*) AS NumberOfFines
FROM 
    Fines
GROUP BY
    paid;

-- Expected rows (sample dataset): 2  
-- Values: paid=0 -> 5 fines, paid=1 -> 5 fines

/*
Explanation:
- GROUP BY paid creates one group per paid value (usually 0 and 1).
- COUNT(*) counts how many rows exist in each group.
- This produces a small summary table: paid vs count.



 ------------------------------------------------------------
   Exercise 6:
   For each member, calculate:
     - NumberOfFines
     - TotalFines
   Order by TotalFines DESC.
------------------------------------------------------------ */
SELECT
    m.full_name,
    COUNT(f.fine_id) AS NumberOfFines,
    SUM(f.amount)    AS TotalFines
FROM 
    Members AS m                              JOIN
    Loans   AS l ON m.member_id = l.member_id JOIN
    Fines   AS f ON l.loan_id   = f.loan_id
GROUP BY
    m.full_name
ORDER BY
    TotalFines DESC;

-- Expected rows (sample dataset): 8  
-- Note: only members with fines appear

/*
Explanation:
- Members are linked to Loans using member_id.
- Fines are linked to Loans using loan_id.
- Once joined, we can group by member and summarise their fines.
- COUNT gives number of fines, SUM gives total amount.


------------------------------------------------------------
Exercise 7 (stretch):
For each member, return:
  - NumberOfFines
  - TotalFines
  - SmallestFine
  - LargestFine
Order by TotalFines DESC.
------------------------------------------------------------ */
SELECT
    m.full_name,
    COUNT(f.fine_id) AS NumberOfFines,
    SUM(f.amount)    AS TotalFines,
    MIN(f.amount)    AS SmallestFine,
    MAX(f.amount)    AS LargestFine
FROM 
    Members AS m                              JOIN
    Loans   AS l ON m.member_id = l.member_id JOIN
    Fines   AS f ON l.loan_id   = f.loan_id
GROUP BY
    m.full_name
ORDER BY
    TotalFines DESC;

-- Expected rows (sample dataset): 8  
-- Note: only members with fines appear

/*
Explanation:
- This combines multiple aggregate functions in one query.
- Grouping by member means each output row is one member.
- COUNT / SUM / MIN / MAX are all calculated per member group.
*/
