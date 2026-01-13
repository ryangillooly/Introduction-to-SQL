
/* ============================================================
   02 - Aliasing.sql
   Goal: Learn how to rename columns and tables in query results.

   Key ideas:
     - Aliases do NOT change the database.
     - Aliases only affect how query results are displayed.
     - Aliases make queries easier to read and understand.

   Syntax reminders:
     column_name AS AliasName
     table_name  AS t

   Reference Documentation:
      - https://www.w3schools.com/sql/sql_alias.asp

   Note:
     The keyword "AS" is optional, but recommended for beginners.
  ============================================================

   1) Column Aliasing

   This changes the column names ONLY in the output.
   The Members table itself is NOT modified.

   Useful when:
     - Creating reports
     - Making column names more readable
   ------------------------------------------------------------ */
SELECT
    full_name AS FullName,
    email     AS EmailAddress
FROM 
   Members;

/* ------------------------------------------------------------
   2) Table + Column Aliasing

   Here we:
     - Give the Members table a short alias: "m"
     - Use that alias when selecting columns

   This becomes VERY important when joining multiple tables.
   ------------------------------------------------------------ */
SELECT
    m.full_name AS FullName,
    m.email     AS EmailAddress
FROM 
   Members AS m;

/* ============================================================
   EXERCISES
   ============================================================ */

/* Exercise 1:
   Select the title column from Books and rename it to BookTitle.
   Write your query below:
*/


/* Exercise 2:
   Select full_name from Members and rename it to MemberName.
   Write your query below:
*/


/* Exercise 3:
   Use a table alias for Books (b) and select:
     - b.title as Title
     - b.isbn  as ISBN
   Write your query below:
*/


/* Exercise 4:
   Try removing the AS keyword from an alias.
   Does the query still work?
   Why might AS be clearer anyway?
   (No SQL needed — just think about it.)
*/
