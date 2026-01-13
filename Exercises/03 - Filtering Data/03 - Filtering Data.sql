/* ============================================================
   03 - Filtering Data.sql
   Goal: Learn how to filter rows using the WHERE clause.

   Key idea:
     - "WHERE" controls which ROWS are returned.
     - "SELECT" controls which COLUMNS are returned.
     - Without "WHERE", you get every row in the table.

   Think of WHERE as asking a question:
     "Only show me rows where this condition is true."

   Reference Documentation:
     - https://www.w3schools.com/sql/sql_where.asp

  ============================================================ 

   1) Filter rows by a text value
   ------------------------------------------------------------ */
SELECT *
FROM Book_Copies
WHERE status = 'AVAILABLE';

/* ------------------------------------------------------------
   2) Filter rows AND select specific columns

   Notice:
     - "WHERE" still filters rows
     - "SELECT" still controls which columns appear
   ------------------------------------------------------------ */
SELECT
    copy_id,
    shelf_location
FROM 
    Book_Copies
WHERE 
    status = 'ON_LOAN';

/* ------------------------------------------------------------
   3) Filter using numbers

   Useful comparison operators:
     =   equal to
     <   less than
     >   greater than
     <=  less than or equal to
     >=  greater than or equal to
   ------------------------------------------------------------ */
SELECT *
FROM Books
WHERE book_id <= 10;

/* ------------------------------------------------------------
   4) Filter using dates

   Dates are compared as strings in the format:
     'YYYY-MM-DD'

   This returns loans on or after 1st Jan 2026.
   ------------------------------------------------------------ */
SELECT *
FROM Loans
WHERE loan_date >= '2026-01-01';

/* ------------------------------------------------------------
   5) Filter using date ranges (BETWEEN)

   BETWEEN is inclusive:
     - start date IS included
     - end date IS included
   ------------------------------------------------------------ */
SELECT *
FROM Loans
WHERE loan_date BETWEEN '2026-01-01' AND '2026-02-01';

/* ============================================================
   EXERCISES
   ============================================================ */

/* Exercise 1:
   Select all columns from Book_Copies
   where the status is 'DAMAGED'.
*/


/* Exercise 2:
   Select copy_id and status from Book_Copies
   where the status is 'LOST'.
*/


/* Exercise 3:
   Select all books where the book_id is greater than 20.
*/


/* Exercise 4:
   Select all loans that happened before '2026-01-01'.
*/


/* Exercise 5:
   Select loans with a loan_date BETWEEN
   '2025-12-01' and '2025-12-31'.
*/
