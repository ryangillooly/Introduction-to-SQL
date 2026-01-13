/* ============================================================
   07 - Grouping Data.sql
   Goal: Learn how to summarise data using GROUP BY and COUNT.

   Key ideas:
     - COUNT() counts rows.
     - GROUP BY defines how rows are grouped.
     - Every column in SELECT must either:
         - appear in GROUP BY, OR
         - be inside an aggregate function (COUNT).

   Think of GROUP BY as:
     "Group rows first, then count each group."

   Reference Documentation:
     - https://www.w3schools.com/sql/sql_groupby.asp

   ============================================================ 
   
   1) Count all rows in a table

   COUNT(*) counts how many rows exist in total.
   ------------------------------------------------------------ */
SELECT
    COUNT(*) AS TotalBooks
FROM 
    Books;


/* ------------------------------------------------------------
   2) Count how many books each publisher has

   Steps:
     1) Join Publishers to Books
     2) Group rows by publisher
     3) Count books per publisher
   ------------------------------------------------------------ */
SELECT
    p.name           AS Publisher,
    COUNT(b.book_id) AS NumberOfBooks
FROM 
    Publishers AS p JOIN
    Books      AS b ON p.publisher_id = b.publisher_id
GROUP BY
    p.name
ORDER BY
    NumberOfBooks DESC;


/* ------------------------------------------------------------
   3) Count how many copies exist per book

   Relationship:
     - One book can have many copies
   ------------------------------------------------------------ */
SELECT
    b.title,
    COUNT(bc.copy_id) AS NumberOfCopies
FROM 
    Books       AS b JOIN
    Book_Copies AS bc ON b.book_id = bc.book_id
GROUP BY
    b.title;


/* ------------------------------------------------------------
   4) Count how many loans each member has had

   LEFT JOIN ensures members with ZERO loans
   are still included in the result.
   ------------------------------------------------------------ */
SELECT
    m.full_name,
    COUNT(l.loan_id) AS TotalLoans
FROM 
    Members AS m LEFT JOIN
    Loans   AS l ON m.member_id = l.member_id
GROUP BY
    m.full_name
ORDER BY
    TotalLoans DESC;


/* ============================================================
   EXERCISES
   ============================================================ */

/* Exercise 1:
   Count how many publishers exist in the system.
*/


/* Exercise 2:
   Count how many book copies exist per status
   (AVAILABLE, ON_LOAN, DAMAGED, etc.).
*/


/* Exercise 3:
   Count how many books each author has written.
   Tables involved:
     - Authors
     - Books
*/


/* Exercise 4:
   Count how many loans exist per book title.
   Tables involved:
     - Loans
     - Book_Copies
     - Books
*/


/* Exercise 5 (thinking exercise):
   Why does query #4 use LEFT JOIN?
   What would change if INNER JOIN was used instead?
*/
