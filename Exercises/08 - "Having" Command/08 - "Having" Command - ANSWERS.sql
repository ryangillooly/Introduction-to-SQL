/* ============================================================
   08 - "Having" Command - ANSWERS.sql

   This file contains the answers and explanations for the exercises in:
     08 - "Having" Command.sql

   Always try the exercises yourself first before reading these answers.
   
============================================================ 

Exercise 1:
Find authors who have written more than 1 book.
------------------------------------------------------------ */
SELECT
    a.full_name,
    COUNT(b.book_id) AS NumberOfBooks
FROM 
    Authors AS a JOIN
    Books   AS b ON a.author_id = b.author_id
GROUP BY
    a.full_name
HAVING
    COUNT(b.book_id) > 1;

-- Expected rows (sample dataset): 20  
-- Each author has 2 books (NumberOfBooks = 2 for all)

/*
Explanation:
- Books are joined to Authors using author_id.
- GROUP BY creates one group per author.
- COUNT(b.book_id) counts how many books each author has.
- HAVING filters out authors with only 1 book.



------------------------------------------------------------
Exercise 2:
Find publishers that have exactly 1 book.
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
    COUNT(b.book_id) = 1;

-- Expected rows (sample dataset): 10

/*
Explanation:
- GROUP BY creates one group per publisher.
- HAVING filters groups based on the COUNT result.
- Only publishers with exactly one book are returned.



------------------------------------------------------------
Exercise 3:
Find books that have 3 or more copies.
------------------------------------------------------------ */
SELECT
    b.title,
    COUNT(bc.copy_id) AS NumberOfCopies
FROM 
    Books       AS b JOIN
    Book_Copies AS bc ON b.book_id = bc.book_id
GROUP BY
    b.title
HAVING
    COUNT(bc.copy_id) >= 3;

-- Expected rows (sample dataset): 0  
-- (No titles currently have 3+ copies)

/*
Explanation:
- Each book may have multiple physical copies.
- GROUP BY b.title groups all copies for the same book.
- HAVING keeps only books with 3 or more copies.



------------------------------------------------------------
Exercise 4:
Find members who have 2 or more ACTIVE loans.
------------------------------------------------------------ */
SELECT
    m.full_name,
    COUNT(l.loan_id) AS ActiveLoans
FROM 
    Members AS m JOIN
    Loans   AS l ON m.member_id = l.member_id
WHERE
    l.return_date IS NULL
GROUP BY
    m.full_name
HAVING
    COUNT(l.loan_id) >= 2;

-- Expected rows (sample dataset): 2

/*
Explanation:
- WHERE filters rows first to include only active loans.
- GROUP BY groups loans by member.
- COUNT(l.loan_id) counts active loans per member.
- HAVING filters to members with at least 2 active loans.


------------------------------------------------------------
Exercise 5 (thinking exercise):
Why can’t we write this?

  WHERE COUNT(b.book_id) > 2

Why must it be HAVING instead?
------------------------------------------------------------

Explanation:
- WHERE runs before GROUP BY and works on individual rows.
- COUNT(b.book_id) is calculated after rows are grouped.
- HAVING runs after GROUP BY and can filter using aggregate values.
- Because COUNT does not exist at the row level, it must be used in HAVING.
*/
