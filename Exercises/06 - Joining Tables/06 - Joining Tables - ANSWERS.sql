/* ============================================================
   06 - Joining Tables - ANSWERS.sql

   This file contains the answers and explanations for the exercises in:
     06 - Joining Tables.sql

   Always try the exercises yourself first before reading these answers.
   
   ============================================================ 

   Exercise 1:
   Join Books and Authors and return:
     - Book title
     - Author name
   Order the results by Book title.
   ------------------------------------------------------------ */
SELECT
    b.title     AS BookTitle,
    a.full_name AS AuthorName
FROM 
    Books   AS b JOIN
    Authors AS a ON b.author_id = a.author_id
ORDER BY
    b.title;

-- Expected rows (sample dataset): 40

/*
Explanation:
- JOIN combines Books and Authors using the shared author_id.
- ORDER BY b.title sorts the results alphabetically by book title.
- This is an INNER JOIN, so only books with a matching author appear.



   ------------------------------------------------------------
   Exercise 2:
   Join Books and Publishers and return:
     - Book title
     - Publisher name
   Only include books published in the United Kingdom.
   ------------------------------------------------------------ */
SELECT
    b.title AS BookTitle,
    p.name  AS PublisherName
FROM 
    Books      AS b JOIN
    Publishers AS p ON b.publisher_id = p.publisher_id
WHERE
    p.country = 'United Kingdom';

-- Expected rows (sample dataset): 7

/*
Explanation:
- Books are linked to Publishers using publisher_id.
- WHERE filters after the join has been created.
- Only rows where the publisher country is 'United Kingdom' remain.



   ------------------------------------------------------------
   Exercise 3:
   Join Books and Book_Copies and return:
     - Book title
     - Copy ID
     - Status
   Only show copies with status = 'AVAILABLE'.
   ------------------------------------------------------------ */
SELECT
    b.title  AS BookTitle,
    bc.copy_id,
    bc.status
FROM 
    Books       AS b JOIN
    Book_Copies AS bc ON b.book_id = bc.book_id
WHERE
    bc.status = 'AVAILABLE';

-- Expected rows (sample dataset): 13

/*
Explanation:
- One book can have many copies, so a single title may appear multiple times.
- WHERE bc.status = 'AVAILABLE' filters to available copies only.



   ------------------------------------------------------------
   Exercise 4:
   Join Loans and Members and return:
     - Member name
     - Loan date
     - Due date
   Only include loans from after '2026-01-01'.
   ------------------------------------------------------------ */
SELECT
    m.full_name AS MemberName,
    l.loan_date,
    l.due_date
FROM 
    Loans   AS l JOIN
    Members AS m ON l.member_id = m.member_id
WHERE
    l.loan_date > '2026-01-01';

-- Expected rows (sample dataset): 12

/*
Explanation:
- Loans are linked to Members using member_id.
- The date filter keeps only loans after '2026-01-01'.
- Because dates are stored as 'YYYY-MM-DD', string comparisons work correctly.


------------------------------------------------------------
 Exercise 5 (thinking exercise):
  What happens if a book has no copies?
  Would it appear in query #3 above?
  Why or why not?
------------------------------------------------------------

Explanation:
- Query #3 uses an INNER JOIN between Books and Book_Copies.
- INNER JOIN only returns rows where a match exists in both tables.
- If a book has no rows in Book_Copies, it has no match, so it will not appear.
- To include books with zero copies, you would need a LEFT JOIN (covered later).
*/
