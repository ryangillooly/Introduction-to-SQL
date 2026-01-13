/* ============================================================
   05 - Ordering & Limiting.sql
   Goal: Learn how to sort results and limit the number of rows.

   Key ideas:
     - "ORDER BY" controls the order of rows.
     - "LIMIT" controls how many rows are returned.
     - Sorting happens BEFORE limiting.
     - By default, "ORDER BY" is ascending (A → Z, small → large).

   Think of this as:
     "How do I tidy up and control the output?"

    Reference Documentation:
      - https://www.w3schools.com/sql/sql_orderby.asp

   ============================================================ 

   1) Ordering results alphabetically (A → Z)

   This is the default behaviour when ORDER BY is used.
   ------------------------------------------------------------ */
SELECT title
FROM Books
ORDER BY title;

/* ------------------------------------------------------------
   2) Ordering results in descending order (Z → A)

   DESC means "descending".
   ASC means "ascending" (the default).
   ------------------------------------------------------------ */
SELECT title
FROM Books
ORDER BY title DESC;

/* ------------------------------------------------------------
   3) Limiting the number of returned rows

   LIMIT is often used when:
     - exploring data
     - previewing results
     - working with large datasets
   ------------------------------------------------------------ */
SELECT *
FROM Books
LIMIT 5;

/* ------------------------------------------------------------
   4) Ordering AND limiting results

   Important:
     - ORDER BY happens first
     - LIMIT is applied after sorting

   This returns the 5 most recent loans.
   ------------------------------------------------------------ */
SELECT *
FROM Loans
ORDER BY loan_date DESC
LIMIT 5;

/* ============================================================
   EXERCISES
   ============================================================ */

/* Exercise 1:
   Select all books and order them by title in descending order.
*/


/* Exercise 2:
   Select all members and order them alphabetically by full_name.
*/


/* Exercise 3:
   Select all loans and order them by due_date (earliest first).
*/


/* Exercise 4:
   Select the first 3 rows from the Publishers table.
*/


/* Exercise 5:
   Select the 5 oldest loans.
   (Hint: think about ORDER BY direction + LIMIT.)
*/
