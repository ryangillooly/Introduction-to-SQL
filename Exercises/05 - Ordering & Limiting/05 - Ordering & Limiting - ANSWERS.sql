/* ============================================================
   05 - Ordering & Limiting - ANSWERS.sql

   This file contains the answers and explanations
   for the exercises in:

     05 - Ordering & Limiting.sql

   Always try the exercises yourself first before
   reading these answers.
   ============================================================ */


/* ------------------------------------------------------------
   Exercise 1:
   Select all books and order them by title in descending order.
   ------------------------------------------------------------ */
SELECT *
FROM 
    Books
ORDER BY
    title DESC;

-- Expected rows (sample dataset): 40

/*
Explanation:
- ORDER BY controls the order of rows in the result.
- DESC means descending (Z → A).
- Without DESC, the default would be ascending.



------------------------------------------------------------
Exercise 2:
Select all members and order them alphabetically by full_name.
------------------------------------------------------------ */
SELECT *
FROM 
    Members
ORDER BY
    full_name;

-- Expected rows (sample dataset): 15

/*
Explanation:
- ORDER BY full_name sorts members alphabetically.
- ASC (ascending) is the default and does not need to be written.



------------------------------------------------------------
Exercise 3:
Select all loans and order them by due_date (earliest first).
------------------------------------------------------------ */
SELECT *
FROM 
    Loans
ORDER BY
    due_date;

-- Expected rows (sample dataset): 20

/*
Explanation:
- Ordering by due_date without DESC sorts from earliest to latest.
- This is useful for seeing which loans are due soonest.



------------------------------------------------------------
Exercise 4:
Select the first 3 rows from the Publishers table.
------------------------------------------------------------ */
SELECT *
FROM 
    Publishers
LIMIT 3;

-- Expected rows (sample dataset): 3 (LIMIT)

/*
Explanation:
- LIMIT controls how many rows are returned.
- Without ORDER BY, the rows returned are not guaranteed
  to be in any specific order.



------------------------------------------------------------
Exercise 5:
Select the 5 oldest loans.
------------------------------------------------------------ */
SELECT *
FROM 
    Loans
ORDER BY
    loan_date
LIMIT 5;

-- Expected rows (sample dataset): 5 (LIMIT)

/*
Explanation:
- ORDER BY loan_date sorts loans from oldest to newest.
- LIMIT 5 returns only the first five rows after sorting.
- ORDER BY always runs before LIMIT.
*/
