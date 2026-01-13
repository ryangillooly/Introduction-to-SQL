/* ============================================================
   03 - Filtering Data - ANSWERS.sql

   This file contains the answers and explanations for the exercises in:
     03 - Filtering Data.sql

   Always try the exercises yourself first before reading these answers.
   
   ============================================================ 
   
   Exercise 1:
   Select all columns from Book_Copies
   where the status is 'DAMAGED'.
   ------------------------------------------------------------ */
SELECT *
FROM 
    Book_Copies
WHERE 
    status = 'DAMAGED';

-- Expected rows (sample dataset): 1

/*
Explanation:
- WHERE filters which rows are returned.
- Only rows where status equals 'DAMAGED' are included.
- SELECT * returns all columns for those rows.



------------------------------------------------------------
Exercise 2:
Select copy_id and status from Book_Copies
where the status is 'LOST'.
------------------------------------------------------------ */
SELECT
    copy_id,
    status
FROM 
    Book_Copies
WHERE 
    status = 'LOST';

-- Expected rows (sample dataset): 1

/*
Explanation:
- SELECT controls which columns are shown.
- WHERE controls which rows are returned.
- This query limits both the columns and the rows.



------------------------------------------------------------
Exercise 3:
Select all books where the book_id is greater than 20.
------------------------------------------------------------ */
SELECT *
FROM 
    Books
WHERE 
    book_id > 20;

-- Expected rows (sample dataset): 20

/*
Explanation:
- Numeric comparisons use operators like >, <, >=, <=.
- Only books with a book_id greater than 20 are returned.



------------------------------------------------------------
Exercise 4:
Select all loans that happened before '2026-01-01'.
------------------------------------------------------------ */
SELECT *
FROM 
    Loans
WHERE 
    loan_date < '2026-01-01';

-- Expected rows (sample dataset): 7

/*
Explanation:
- Dates are stored as text in 'YYYY-MM-DD' format.
- This format allows correct comparison using < and >.
- Only loans before 1st January 2026 are returned.



------------------------------------------------------------
Exercise 5:
Select loans with a loan_date BETWEEN
'2025-12-01' and '2025-12-31'.
------------------------------------------------------------ */
SELECT *
FROM 
    Loans
WHERE 
    loan_date BETWEEN '2025-12-01' AND '2025-12-31';

-- Expected rows (sample dataset): 6

/*
Explanation:
- BETWEEN includes both the start and end values.
- This returns loans made during December 2025.
- BETWEEN is often clearer than writing two comparisons.
*/
