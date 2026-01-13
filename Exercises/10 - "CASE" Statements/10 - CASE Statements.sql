/* ============================================================
   10 - CASE WHEN.sql
   Goal: Learn how to create derived columns using CASE WHEN.

   Key ideas:
     - "CASE" allows conditional logic in SQL.
     - Conditions are evaluated top-to-bottom.
     - The FIRST matching WHEN is used.
     - "ELSE" acts as a fallback value.
     - "CASE" changes the OUTPUT, not the stored data.

   Think of CASE as:
     "If this condition is true, return this value."

   Reference Documentation:
     - https://www.w3schools.com/sql/sql_case.asp
     
   ============================================================ 

   1) Label loans as Returned / Active

   Business rule:
     - If return_date IS NULL → Active Loan
     - Otherwise (Else) → Returned
   ------------------------------------------------------------ */
SELECT
    loan_id,
    loan_date,
    return_date,
    CASE
        WHEN return_date IS NULL THEN 'Active Loan'
        ELSE 'Returned'
    END AS LoanStatus
FROM 
    Loans;


/* ------------------------------------------------------------
   2) Label copies as Available / Not Available

   Business rule:
     - AVAILABLE copies can be borrowed
     - All other statuses cannot
   ------------------------------------------------------------ */
SELECT
    copy_id,
    status,
    CASE
        WHEN status = 'AVAILABLE' THEN 'Can Borrow'
        ELSE 'Unavailable'
    END AS Availability
FROM 
    Book_Copies;


/* ------------------------------------------------------------
   3) Identify overdue loans

   Business rules:
     - Loan must NOT be returned
     - Due date must be before today
   ------------------------------------------------------------ */
SELECT
    m.full_name,
    b.title,
    l.due_date,
    CASE
        WHEN l.return_date IS NULL AND 
             l.due_date < DATE('now')
        THEN 'Overdue'
        ELSE 'Not Overdue'
    END AS LoanHealth
FROM 
    Loans       AS l                               JOIN 
    Members     AS m  ON l.member_id = m.member_id JOIN 
    Book_Copies AS bc ON l.copy_id   = bc.copy_id  JOIN 
    Books       AS b  ON bc.book_id  = b.book_id;


/* ============================================================
   EXERCISES
   ============================================================ */

/* Exercise 1:
   Create a query that labels each book copy as:
     - 'Healthy' if status = 'AVAILABLE'
     - 'Issue'   for all other statuses
*/


/* Exercise 2:
   Create a query that labels loans as:
     - 'Returned Early' if return_date < due_date
     - 'Returned Late'  if return_date > due_date
     - 'Not Returned'   if return_date IS NULL

   Hint:
     Order of WHEN clauses matters.
*/


/* Exercise 3:
   Create a query that shows:
     - Member name
     - Book title
     - LoanState with values:
         'Active', 'Overdue', 'Returned'

   Hint:
     Overdue is a special case of Active.
*/


/* Exercise 4 (thinking exercise):
   What happens if you remove the ELSE clause?
   What value appears in the results?
*/
