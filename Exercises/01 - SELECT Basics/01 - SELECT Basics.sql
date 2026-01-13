/* ============================================================
   01 - SELECT Basics.sql
   Goal: Learn how to read data from a table using the SELECT command.

   Key ideas:
     - A table is like a spreadsheet: rows + columns.
     - "SELECT" chooses which columns you want to see.
     - "FROM"   chooses which table you want to read from.
     - Semicolon ";" ends a SQL statement.

  Reference Documentation:
     - https://www.w3schools.com/sql/sql_select.asp

  Tip:
    Run ONE query at a time to see what it does.
 ============================================================

 1) Select all columns (*) from the Books table

 "*" means "all columns".
 This is useful when you're exploring what data exists.
 ------------------------------------------------------------ */
SELECT *
FROM Books;

 /* ------------------------------------------------------------
 2) Select only specific columns from the Members table

 This is better than SELECT * when you only need a few fields.
 It makes results easier to read and is more efficient.
 ------------------------------------------------------------ */
SELECT
    full_name,
    email
FROM 
    Members;

/* ------------------------------------------------------------
   3) Select DISTINCT values from a column

   DISTINCT removes duplicate values from the results.

   Useful when you want to know:
     - what different values exist
     - what categories are present in the data
   ------------------------------------------------------------ */
SELECT DISTINCT
    status
FROM 
    Book_Copies;


/* ------------------------------------------------------------
   4) DISTINCT with multiple columns

   DISTINCT applies to the COMBINATION of columns,
   not each column individually.
   ------------------------------------------------------------ */
SELECT DISTINCT
    shelf_location,
    status
FROM 
    Book_Copies;

 /*
============================================================
 EXERCISES (try these at the bottom)
 ===========================================================

 Exercise 1:
 Select ALL columns from the Publishers table.
 Hint: SELECT * FROM Publishers;
 Write your query below:
 */


/*
 Exercise 2:
 Select ONLY the title column from the Books table.
 Write your query below:
 */


/*
 Exercise 3:
 Select ONLY copy_id and status from the Book_Copies table.
 Write your query below:
*/


/*
 Exercise 4:
 Select member_id and full_name from Members.
 Write your query below:
*/