/* ============================================================
   09 - Aggregations.sql
   Goal: Learn additional aggregate functions beyond COUNT.

   Key ideas:
     - MIN finds the smallest value
     - MAX finds the largest value
     - AVG calculates an average
     - Multiple aggregates can be used together

   Think of aggregates as:
     "Summarise a group of rows into a single value."

   Reference Documentation:
     - https://www.w3schools.com/sql/sql_min_max.asp
     - https://www.w3schools.com/sql/sql_avg.asp

  ============================================================ 

  1) MIN and MAX across an entire table

  Using Fines.amount is beginner-friendly because it is numeric.
  ------------------------------------------------------------ */
SELECT
    MIN(amount) AS SmallestFine,
    MAX(amount) AS LargestFine
FROM 
    Fines;

/* ------------------------------------------------------------
   2) MIN and MAX per group

   Example:
     - smallest and largest fine per member
   ------------------------------------------------------------ */
SELECT
    m.full_name,
    MIN(f.amount) AS SmallestFine,
    MAX(f.amount) AS LargestFine
FROM 
    Members AS m                              JOIN
    Loans   AS l ON m.member_id = l.member_id JOIN
    Fines   AS f ON l.loan_id   = f.loan_id
GROUP BY
    m.full_name;

/* ------------------------------------------------------------
   3) AVG (average)

   Example:
     - average fine amount
   ------------------------------------------------------------ */
SELECT
    AVG(amount) AS AverageFineAmount
FROM 
    Fines;

/* ------------------------------------------------------------
   4) SUM (total)

   Example:
     - total value of all fines
   ------------------------------------------------------------ */
SELECT
    SUM(amount) AS TotalFines
FROM 
    Fines;

/* ------------------------------------------------------------
   5) Multiple aggregations in one query

   You can calculate many summary values at once.
   ------------------------------------------------------------ */
SELECT
    COUNT(*)     AS NumberOfFines,
    SUM(amount)  AS TotalFines,
    AVG(amount)  AS AverageFine,
    MIN(amount)  AS SmallestFine,
    MAX(amount)  AS LargestFine
FROM 
    Fines;

/* ------------------------------------------------------------
   6) Multiple aggregations per group

   Example:
     - total fines per member
     - number of fines per member
     - average fine per member
   ------------------------------------------------------------ */
SELECT
    m.full_name,
    COUNT(f.fine_id) AS NumberOfFines,
    SUM(f.amount)    AS TotalFines,
    AVG(f.amount)    AS AverageFine
FROM 
    Members AS m JOIN
    Loans   AS l ON m.member_id = l.member_id JOIN
    Fines   AS f ON l.loan_id   = f.loan_id
GROUP BY
    m.full_name
ORDER BY
    TotalFines DESC;

/* ============================================================
   EXERCISES
   ============================================================ */

/* Exercise 1:
   Find the total number of fines in the system.
   (Hint: COUNT(*))
*/


/* Exercise 2:
   Find the total value of all fines.
   (Hint: SUM(amount))
*/


/* Exercise 3:
   Find the average fine amount.
   (Hint: AVG(amount))
*/


/* Exercise 4:
   Find the smallest fine and the largest fine.
   (Hint: MIN(amount) and MAX(amount))
*/


/* Exercise 5:
   Find the number of PAID fines vs UNPAID fines.
   Return:
     - paid
     - NumberOfFines
   (Hint: GROUP BY paid)
*/


/* Exercise 6:
   For each member, calculate:
     - NumberOfFines
     - TotalFines
   Order by TotalFines DESC.
   Tables involved:
     - Members
     - Loans
     - Fines
*/


/* Exercise 7 (stretch):
   For each member, return:
     - NumberOfFines
     - TotalFines
     - SmallestFine
     - LargestFine
   Order by TotalFines DESC.
*/
