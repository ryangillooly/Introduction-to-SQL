/* ============================================================
   02 - Aliasing - ANSWERS.sql

   This file contains the answers and explanations for the exercises in:
     02 - Aliasing.sql

   Always try the exercises yourself first before reading these answers.
   
   ============================================================ 

   Exercise 1:
   Select the title column from Books and rename it to BookTitle.
   ------------------------------------------------------------ */
SELECT
    title AS BookTitle
FROM 
    Books;

-- Expected rows (sample dataset): 40

/*
Explanation:
- "AS BookTitle" renames the column ONLY in the result set.
- The column name in the Books table is still called "title".
- This is useful when creating readable reports or exports.


------------------------------------------------------------
Exercise 2:
Select full_name from Members and rename it to MemberName.
------------------------------------------------------------ */
SELECT
    full_name AS MemberName
FROM 
    Members;

-- Expected rows (sample dataset): 15

/*
Explanation:
- Column aliasing makes the meaning of the data clearer.
- This is especially helpful when column names are generic
  or when results are shown to non-technical users.


------------------------------------------------------------
Exercise 3:
Use a table alias for Books (b) and select:
    - b.title as Title
    - b.isbn  as ISBN
------------------------------------------------------------ */
SELECT
    b.title AS Title,
    b.isbn  AS ISBN
FROM 
    Books AS b;

-- Expected rows (sample dataset): 40

/*
Explanation:
- "Books AS b" gives the table a short alias.
- The alias is used when referencing columns (b.title, b.isbn).
- Table aliases become essential when multiple tables
  have columns with the same name.


------------------------------------------------------------
Exercise 4:
Try removing the AS keyword from an alias.
Does the query still work?
------------------------------------------------------------ */

SELECT
    title BookTitle
FROM 
    Books;

-- Expected rows (sample dataset): 40

/*
Explanation:
- Yes, this query still works because "AS" is optional in SQL.
- However, using "AS" makes queries clearer and more readable,
  especially for beginners.
- Many teams prefer always using AS for consistency.
*/
