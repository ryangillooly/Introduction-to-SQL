/* ============================================================
   07 - Grouping Data - ANSWERS.sql

   This file contains the answers and explanations for the exercises in:
     07 - Grouping Data.sql

   Always try the exercises yourself first before reading these answers.
   
   ============================================================ 

   Exercise 1:
   Count how many publishers exist in the system.
   ------------------------------------------------------------ */
SELECT
    COUNT(*) AS TotalPublishers
FROM 
    Publishers;

-- Expected rows (sample dataset): 1  
-- Value: TotalPublishers = 20

/*
Explanation:
- COUNT(*) counts how many rows exist in the table.
- Each row in Publishers represents one publisher.



  ------------------------------------------------------------
   Exercise 2:
   Count how many book copies exist per status
   (AVAILABLE, ON_LOAN, DAMAGED, etc.).
   ------------------------------------------------------------ */
SELECT
    status,
    COUNT(*) AS NumberOfCopies
FROM 
    Book_Copies
GROUP BY
    status
ORDER BY
    NumberOfCopies DESC;

-- Expected rows (sample dataset): 4  
-- Values: AVAILABLE=14, ON_LOAN=10, DAMAGED=1, LOST=1

/*
Explanation:
- GROUP BY status creates one group per status value.
- COUNT(*) counts how many rows are in each status group.
- ORDER BY is optional, but helps you see the most common statuses first.



   ------------------------------------------------------------
   Exercise 3:
   Count how many books each author has written.
   Tables involved:
     - Authors
     - Books
   ------------------------------------------------------------ */
SELECT
    a.full_name,
    COUNT(b.book_id) AS NumberOfBooks
FROM 
    Authors AS a JOIN
    Books   AS b ON a.author_id = b.author_id
GROUP BY
    a.full_name
ORDER BY
    NumberOfBooks DESC;

-- Expected rows (sample dataset): 20  
-- Values: each author has 2 books

/*
Explanation:
- Books contains author_id, which links each book to an author.
- JOIN connects each book to its author.
- GROUP BY a.full_name creates one group per author.
- COUNT(b.book_id) counts how many books each author has.



   ------------------------------------------------------------
   Exercise 4:
   Count how many loans exist per book title.
   Tables involved:
     - Loans
     - Book_Copies
     - Books
   ------------------------------------------------------------ */
SELECT
    b.title,
    COUNT(l.loan_id) AS NumberOfLoans
FROM 
    Loans       AS l                              JOIN
    Book_Copies AS bc ON l.copy_id   = bc.copy_id JOIN
    Books       AS b  ON bc.book_id  = b.book_id
GROUP BY
    b.title
ORDER BY
    NumberOfLoans DESC;

-- Expected rows (sample dataset): 16  
-- Note: titles without loans are excluded

/*
Explanation:
- Loans links to Book_Copies using copy_id.
- Book_Copies links to Books using book_id.
- Once joined, each loan can be associated with a book title.
- GROUP BY b.title groups all loan rows per title.
- COUNT(l.loan_id) counts how many loans each title has.
*/


/*
------------------------------------------------------------
Exercise 5 (thinking exercise):
Why does query #4 use LEFT JOIN?
What would change if INNER JOIN was used instead?
------------------------------------------------------------

Explanation:
- In your lesson file, query #4 (loans per member) uses LEFT JOIN so that
  members with ZERO loans still appear (with a count of 0).
- If you used an INNER JOIN instead:
    - members with no matching rows in Loans would not appear at all.
- LEFT JOIN is useful when you want to keep "everything from the left table"
  even if there is no match on the right.
*/
