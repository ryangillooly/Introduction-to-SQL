/* ============================================================
   06 - Joining Tables.sql
   Goal: Learn how to combine data from multiple tables using JOIN.

   Key ideas:
     - "JOIN" lets you combine rows from different tables.
     - Tables are linked using primary keys and foreign keys.
     - An INNER JOIN only returns rows where matches exist in BOTH tables.

   Think of JOIN as:
     "Stitch these tables together using a shared column."

    Reference Documentation: 
        - https://www.acuitytraining.co.uk/news-tips/introduction-sql-joins/
        - https://www.w3schools.com/sql/sql_join.asp

============================================================ 

1) Join Books with Authors

Relationship:
   - Each book has one author
   - author_id links Books → Authors
------------------------------------------------------------ */
SELECT
    b.title     AS BookTitle,
    a.full_name AS AuthorName
FROM 
    Books   AS b JOIN 
    Authors AS a ON b.author_id = a.author_id;


/* ------------------------------------------------------------
   2) Join Books with Publishers

   Relationship:
     - Each book has one publisher
     - publisher_id links Books → Publishers
   ------------------------------------------------------------ */
SELECT
    b.title AS BookTitle,
    p.name  AS Publisher
FROM 
    Books      AS b JOIN
    Publishers AS p ON b.publisher_id = p.publisher_id;


/* ------------------------------------------------------------
   3) Join Books with Book Copies

   Relationship:
     - One book can have many physical copies
     - book_id links Books → Book_Copies
   ------------------------------------------------------------ */
SELECT
    b.title,
    bc.copy_id,
    bc.status
FROM 
    Books       AS b JOIN
    Book_Copies AS bc ON b.book_id = bc.book_id;

/* ------------------------------------------------------------
   4) Join Loans with Members

   Relationship:
     - A member can have many loans
     - member_id links Loans → Members
   ------------------------------------------------------------ */
SELECT
    m.full_name,
    l.loan_date,
    l.due_date
FROM 
    Loans   AS l JOIN
    Members AS m ON l.member_id = m.member_id;

/* ============================================================
   EXERCISES
   ============================================================ */

/* Exercise 1:
   Join Books and Authors and return:
     - Book title
     - Author name
   Order the results by Book title.
*/


/* Exercise 2:
   Join Books and Publishers and return:
     - Book title
     - Publisher name
   Only include books published in the United Kingdom.
*/


/* Exercise 3:
   Join Books and Book_Copies and return:
     - Book title
     - Copy ID
     - Status
   Only show copies with status = 'AVAILABLE'.
*/


/* Exercise 4:
   Join Loans and Members and return:
     - Member name
     - Loan date
     - Due date
   Only include loans from after '2026-01-01'.
*/


/* Exercise 5 (thinking exercise):
   What happens if a book has no copies?
   Would it appear in query #3 above?
   Why or why not?
*/
