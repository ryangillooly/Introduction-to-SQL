/* ============================================================
   01 - SELECT Basics - ANSWERS.sql

   This file contains the answers and explanations for the exercises in:
     01 - SELECT Basics.sql

   Always try the exercises yourself first before reading these answers.

   ============================================================ 

   Exercise 1:
   Select ALL columns from the Publishers table.
   ------------------------------------------------------------ */
SELECT *
FROM 
    Publishers;

-- Expected rows (sample dataset): 20

/*
Explanation:
- "*" means "all columns".
- This returns every column and every row from Publishers.
- Useful when exploring a table for the first time.

 ------------------------------------------------------------
   Exercise 2:
   Select ONLY the title column from the Books table.
   ------------------------------------------------------------ */
SELECT
    title
FROM 
    Books;

-- Expected rows (sample dataset): 40

/*
Explanation:
- Only the "title" column is selected.
- This makes the result easier to read than SELECT *.
- Use this when you only care about specific fields.

 ------------------------------------------------------------
   Exercise 3:
   Select ONLY copy_id and status from the Book_Copies table.
   ------------------------------------------------------------ */
SELECT
    copy_id,
    status
FROM 
    Book_Copies;

-- Expected rows (sample dataset): 30

/*
Explanation:
- Multiple columns are listed after SELECT.
- The order of columns in SELECT controls the output order.
- No WHERE clause means all rows are returned.

  ------------------------------------------------------------
   Exercise 4:
   Select member_id and full_name from Members.
   ------------------------------------------------------------ */
SELECT
    member_id,
    full_name
FROM 
    Members;

-- Expected rows (sample dataset): 15

/*
Explanation:
- This query selects two specific columns from Members.
- The table still contains other columns (like email),
  but they are not shown because they were not selected.
*/
