/* ============================================================
   11 - Real Analytics Queries - ANSWERS.sql

   This file contains the answers and explanations for the exercises in:
     11 - Real Analytics Queries.sql

   Always try the exercises yourself first before reading these answers.

============================================================ 
   Exercise 1:
   Find:
     - Member name
     - Number of ACTIVE loans

   Only include members who currently have at least 1 book on loan.
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
    COUNT(l.loan_id) >= 1
ORDER BY
    ActiveLoans DESC;

-- Expected rows (sample dataset): 13

/*
Explanation:
- WHERE filters rows first to keep only active loans (return_date IS NULL).
- GROUP BY groups those active-loan rows by member.
- COUNT counts how many active loans each member has.
- HAVING ensures only members with at least 1 active loan appear.


------------------------------------------------------------
   Exercise 2:
   Find:
     - Book title
     - Total number of copies
     - Total number of times borrowed
------------------------------------------------------------ */
SELECT
    b.title,
    COUNT(DISTINCT bc.copy_id) AS TotalCopies,
    COUNT(l.loan_id)           AS TimesBorrowed
FROM 
    Books       AS b                              JOIN
    Book_Copies AS bc ON b.book_id  = bc.book_id  LEFT JOIN
    Loans       AS l  ON bc.copy_id = l.copy_id
GROUP BY
    b.title
ORDER BY
    TimesBorrowed DESC;

-- Expected rows (sample dataset): 20

/*
Explanation:
- Books join to Book_Copies (one book can have many copies).
- Loans join to Book_Copies (loans are for a specific copy).
- LEFT JOIN keeps books/copies even if they have zero loans.
- COUNT(DISTINCT bc.copy_id) avoids counting the same copy multiple times
  when a copy has been loaned more than once.
- COUNT(l.loan_id) counts total loans (times borrowed).


------------------------------------------------------------
   Exercise 3:
   List:
     - Publisher name
     - Number of books published
     - Total number of loans across all their books
------------------------------------------------------------ */
SELECT
    p.name,
    COUNT(DISTINCT b.book_id) AS NumberOfBooks,
    COUNT(l.loan_id)          AS TotalLoans
FROM 
    Publishers  AS p                                      JOIN
    Books       AS b  ON p.publisher_id = b.publisher_id  JOIN
    Book_Copies AS bc ON b.book_id      = bc.book_id      LEFT JOIN
    Loans       AS l  ON bc.copy_id     = l.copy_id
GROUP BY
    p.name
ORDER BY
    TotalLoans DESC;

-- Expected rows (sample dataset): 10

/*
Explanation:
- Publishers → Books is a one-to-many relationship.
- Books → Book_Copies is one-to-many.
- Loans connect to copies (copy_id).
- LEFT JOIN Loans keeps publishers/books even if they have zero loans.
- COUNT(DISTINCT b.book_id) avoids double-counting books when there are
  multiple copies or many loans.


------------------------------------------------------------
   Exercise 4:
   Find the TOP 3 most borrowed books
------------------------------------------------------------ */
SELECT
    b.title,
    COUNT(l.loan_id) AS TimesBorrowed
FROM 
    Loans       AS l                              JOIN
    Book_Copies AS bc ON l.copy_id  = bc.copy_id  JOIN
    Books       AS b  ON bc.book_id = b.book_id
GROUP BY
    b.title
ORDER BY
    TimesBorrowed DESC
LIMIT
    3;

-- Expected rows (sample dataset): 3 returned (LIMIT)  
-- Note: 5 members have unpaid fines in total; LIMIT keeps the top 3.

/*
Explanation:
- COUNT(l.loan_id) counts how many loan rows exist per book title.
- ORDER BY DESC puts most borrowed at the top.
- LIMIT 3 returns only the top 3 rows.


------------------------------------------------------------
   Exercise 5:
   Find:
     - Member name
     - Total fines (paid + unpaid)
     - Total unpaid fines only
------------------------------------------------------------ */
SELECT
    m.full_name,
    SUM(f.amount) AS TotalFines,
    SUM(
        CASE
            WHEN f.paid = 0 THEN f.amount
            ELSE 0
        END
    ) AS TotalUnpaidFines
FROM 
    Members AS m                              JOIN
    Loans   AS l ON m.member_id = l.member_id JOIN
    Fines   AS f ON l.loan_id   = f.loan_id
GROUP BY
    m.full_name
ORDER BY
    TotalUnpaidFines DESC;

-- Expected rows (sample dataset): 8  
-- Note: only members with fines appear

/*
Explanation:
- SUM(f.amount) totals all fines for the member.
- The CASE expression converts “only unpaid fines” into a numeric column:
    - unpaid → amount
    - paid   → 0
  Then SUM adds them up.
- This keeps everything in one query without needing separate queries.


 ------------------------------------------------------------
   Exercise 6:
   Find the top 3 members with the highest outstanding (unpaid) fines.
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
    TotalOutstandingFines DESC
LIMIT
    3;

-- Expected rows (sample dataset): 3 (LIMIT)

/*
Explanation:
- WHERE f.paid = 0 filters rows to unpaid fines only.
- SUM(f.amount) totals unpaid fines per member.
- ORDER BY DESC ranks from highest outstanding fines to lowest.
- LIMIT 3 returns only the top 3 members.
*/
