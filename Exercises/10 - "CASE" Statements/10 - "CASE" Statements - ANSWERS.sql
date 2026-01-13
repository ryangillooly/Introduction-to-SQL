/* ============================================================
   10 - CASE WHEN - ANSWERS.sql

   This file contains the answers and explanations for the exercises in:
     10 - CASE WHEN.sql

   Always try the exercises yourself first before reading these answers.

============================================================ 
   Exercise 1:
   Label each book copy as:
     - 'Healthy' if status = 'AVAILABLE'
     - 'Issue'   for all other statuses
------------------------------------------------------------ */
SELECT
    copy_id,
    status,
    CASE
        WHEN status = 'AVAILABLE' THEN 'Healthy'
        ELSE 'Issue'
    END AS CopyHealth
FROM 
    Book_Copies;

-- Expected rows (sample dataset): 30

/*
Explanation:
- CASE evaluates the status column for each row.
- If the status is exactly 'AVAILABLE', the row is labelled 'Healthy'.
- All other statuses fall into the ELSE branch and are labelled 'Issue'.
- This does not change any data in the table — it only affects the output.


------------------------------------------------------------
   Exercise 2:
   Label loans as:
     - 'Returned Early' if return_date < due_date
     - 'Returned Late'  if return_date > due_date
     - 'Not Returned'   if return_date IS NULL
------------------------------------------------------------ */
SELECT
    loan_id,
    loan_date,
    due_date,
    return_date,
    CASE
        WHEN return_date IS NULL THEN 'Not Returned'
        WHEN return_date < due_date THEN 'Returned Early'
        WHEN return_date > due_date THEN 'Returned Late'
    END AS LoanOutcome
FROM 
    Loans;

-- Expected rows (sample dataset): 20

/*
Explanation:
- CASE conditions are checked from top to bottom.
- The NULL check must come first to avoid comparing NULL dates.
- Once a WHEN condition matches, CASE stops evaluating further conditions.


------------------------------------------------------------
   Exercise 3:
   Show:
     - Member name
     - Book title
     - LoanState with values:
         'Active', 'Overdue', 'Returned'
------------------------------------------------------------ */
SELECT
    m.full_name,
    b.title,
    CASE
        WHEN l.return_date IS NULL AND
             l.due_date < DATE('now')
        THEN 'Overdue'
        WHEN l.return_date IS NULL
        THEN 'Active'
        ELSE 'Returned'
    END AS LoanState
FROM 
    Loans       AS l                               JOIN
    Members     AS m  ON l.member_id = m.member_id JOIN
    Book_Copies AS bc ON l.copy_id   = bc.copy_id  JOIN
    Books       AS b  ON bc.book_id  = b.book_id;

-- Expected rows (sample dataset): 20  
-- Note: 'now' is evaluated at runtime; status depends on current date.

/*
Explanation:
- Overdue is a special case of an active loan.
- The overdue condition must be checked FIRST.
- If return_date IS NULL but the loan is not overdue, it is 'Active'.
- All remaining cases are treated as 'Returned'.



------------------------------------------------------------
Exercise 4 (thinking exercise):
What happens if you remove the ELSE clause?
What value appears in the results?
------------------------------------------------------------

Explanation:
- If no WHEN condition matches and there is no ELSE,
  the result of the CASE expression is NULL.
- This can be useful in some situations, but often an ELSE
  makes results clearer and easier to interpret.
*/
