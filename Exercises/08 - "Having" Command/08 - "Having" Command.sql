/* ============================================================
   08 - "Having" Command.sql
   Goal: Learn how to filter GROUPED results using HAVING.

   Key ideas:
     - "WHERE" filters individual ROWS (before grouping).
     - "GROUP BY" groups rows together.
     - "HAVING" filters GROUPS (after grouping).
     - "HAVING" is often used with aggregate functions like COUNT.

   Think of it like this:
     WHERE  -> "Which rows should we include?"
     GROUP  -> "How do we group the included rows?"
     HAVING -> "Which groups should we keep?"

   Reference Documentation:
     - https://www.w3schools.com/sql/sql_having.asp
   
   ============================================================ 

   1) Publishers with more than 2 books

   Steps:
     1) Join Publishers to Books
     2) Group by publisher name
     3) Count books per publisher
     4) Keep only groups where the count is > 2
   ------------------------------------------------------------ */
SELECT
    p.name,
    COUNT(b.book_id) AS NumberOfBooks
FROM 
    Publishers AS p JOIN
    Books      AS b ON p.publisher_id = b.publisher_id
GROUP BY
    p.name
HAVING
    COUNT(b.book_id) > 2;

/* ------------------------------------------------------------
   2) Members with more than 1 loan

   Note:
     - This uses an INNER JOIN, so members with 0 loans
       will not appear at all.
   ------------------------------------------------------------ */
SELECT
    m.full_name,
    COUNT(l.loan_id) AS LoanCount
FROM 
    Members AS m JOIN
    Loans   AS l ON m.member_id = l.member_id
GROUP BY
    m.full_name
HAVING
    COUNT(l.loan_id) > 1;

/* ------------------------------------------------------------
   3) Books with more than 1 copy

   Useful for questions like:
     - Which books have multiple physical copies?
   ------------------------------------------------------------ */
SELECT
    b.title,
    COUNT(bc.copy_id) AS Copies
FROM 
    Books       AS b JOIN
    Book_Copies AS bc ON b.book_id = bc.book_id
GROUP BY
    b.title
HAVING
    COUNT(bc.copy_id) > 1;

/* ============================================================
   EXERCISES
   ============================================================ */

/* Exercise 1:
   Find authors who have written more than 1 book.

   Tables involved:
     - Authors
     - Books

   Hint:
     - Join Authors to Books
     - Group by author name
     - Use HAVING COUNT(...) > 1
*/


/* Exercise 2:
   Find publishers that have exactly 1 book.

   Hint:
     HAVING COUNT(b.book_id) = 1
*/


/* Exercise 3:
   Find books that have 3 or more copies.
*/


/* Exercise 4:
   Find members who have 2 or more ACTIVE loans.
   (A loan is active when return_date IS NULL.)

   Hint:
     - Use WHERE return_date IS NULL (filters rows first)
     - Then GROUP BY member
     - Then HAVING COUNT(...) >= 2
*/


/* Exercise 5 (thinking exercise):
   Why can’t we write this?

     WHERE COUNT(b.book_id) > 2

   Why must it be HAVING instead?
*/
