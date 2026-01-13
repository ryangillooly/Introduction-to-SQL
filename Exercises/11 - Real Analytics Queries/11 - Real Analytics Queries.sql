/* ============================================================
   11 - Real Analytics Queries.sql
   Goal: Apply everything learned so far to answer real-world analytical questions.

   This file combines:
     - JOINs
     - WHERE filters
     - GROUP BY
     - HAVING
     - ORDER BY
     - CASE (conceptually)

   Think of this file as:
     "How would I answer real business questions with SQL?"

   ============================================================ 

   1) Current books on loan

   Question:
     - Which members currently have books borrowed?
   ------------------------------------------------------------ */
SELECT
    m.full_name,
    b.title,
    l.loan_date,
    l.due_date
FROM 
    Loans       AS l                                JOIN
    Members     AS m  ON l.member_id = m.member_id  JOIN
    Book_Copies AS bc ON l.copy_id   = bc.copy_id   JOIN
    Books       AS b  ON bc.book_id  = b.book_id    
WHERE 
    l.return_date IS NULL;


/* ------------------------------------------------------------
   2) Overdue loans

   Question:
     - Which loans are overdue as of today?
   ------------------------------------------------------------ */
SELECT
    m.full_name,
    b.title,
    l.due_date
FROM 
    Loans       AS l                                JOIN
    Members     AS m  ON l.member_id = m.member_id  JOIN
    Book_Copies AS bc ON l.copy_id   = bc.copy_id   JOIN
    Books       AS b  ON bc.book_id  = b.book_id    
WHERE 
    l.return_date IS NULL AND
    l.due_date < DATE('now');


/* ------------------------------------------------------------
   3) Most borrowed books

   Question:
     - Which books are borrowed most frequently?
   ------------------------------------------------------------ */
SELECT
    b.title,
    COUNT(l.loan_id) AS TimesBorrowed
FROM 
    Loans       AS l                             JOIN    
    Book_Copies AS bc ON l.copy_id  = bc.copy_id JOIN
    Books       AS b  ON bc.book_id = b.book_id  
GROUP BY 
    b.title
ORDER BY 
    TimesBorrowed DESC;


/* ------------------------------------------------------------
   4) Members with no active loans

   Question:
     - Which members currently have nothing borrowed?

   Technique:
     - LEFT JOIN + IS NULL
   ------------------------------------------------------------ */
SELECT
    m.full_name
FROM 
    Members AS m LEFT JOIN 
    Loans AS l ON m.member_id = l.member_id AND 
                  l.return_date IS NULL
WHERE 
    l.loan_id IS NULL;


/* ------------------------------------------------------------
   5) Inventory health summary

   Question:
     - How many copies exist in each status?
   ------------------------------------------------------------ */
SELECT
    status,
    COUNT(*) AS NumberOfCopies
FROM 
    Book_Copies
GROUP BY 
    status;


/* ------------------------------------------------------------
   6) Outstanding fines (unpaid)

   Question:
     - Which members currently owe fines, and how much?
   ------------------------------------------------------------ */
SELECT
    m.full_name,
    SUM(f.amount) AS TotalOutstandingFines
FROM 
    Members AS m                              JOIN
    Loans   AS l ON m.member_id = l.member_id JOIN
    Fines   AS f ON l.loan_id   = f.loan_id
WHERE
    f.paid = 0
GROUP BY
    m.full_name
ORDER BY
    TotalOutstandingFines DESC;


/* ------------------------------------------------------------
   7) Biggest single fine

   Question:
     - What is the largest fine, and who received it?
   ------------------------------------------------------------ */
SELECT
    m.full_name,
    MAX(f.amount) AS LargestFine
FROM 
    Members AS m                              JOIN
    Loans   AS l ON m.member_id = l.member_id JOIN
    Fines   AS f ON l.loan_id   = f.loan_id
GROUP BY
    m.full_name
ORDER BY
    LargestFine DESC;


/* ============================================================
   EXERCISES
   ============================================================ */

/* Exercise 1:
   Write a query to find:
     - Member name
     - Number of ACTIVE loans

   Only include members who currently have at least 1 book on loan.
*/


/* Exercise 2:
   Write a query to find:
     - Book title
     - Total number of copies
     - Total number of times borrowed

   Tables involved:
     - Books
     - Book_Copies
     - Loans
*/


/* Exercise 3:
   Write a query to list:
     - Publisher name
     - Number of books published
     - Total number of loans across all their books
*/


/* Exercise 4:
   Write a query to find the TOP 3 most borrowed books.
*/


/* Exercise 5:
   Write a query to find:
     - Member name
     - Total fines (paid + unpaid)
     - Total unpaid fines only
   Hint:
     Use SUM(amount) for total, and SUM(amount) with a WHERE paid = 0 for unpaid.
*/


/* Exercise 6:
   Write a query to find:
     - The top 3 members with the highest outstanding (unpaid) fines.
   Hint:
     GROUP BY member, SUM(amount), ORDER BY, LIMIT
*/

