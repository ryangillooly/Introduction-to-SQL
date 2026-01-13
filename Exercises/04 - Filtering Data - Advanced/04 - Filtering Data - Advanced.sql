/* ============================================================
   04 - Filtering Data - Advanced.sql
   Goal: Learn advanced filtering using LIKE, AND, OR, (), and IN.

   Key ideas:
     - LIKE is used for pattern matching with text.
     - AND means ALL conditions must be true.
     - OR means ANY condition can be true.
     - Parentheses () control how conditions are grouped.
     - IN is used to match against a LIST of values.

   Think of this file as:
     "How do I express more complex questions in SQL?"

   Reference Documentation:
     - https://www.w3schools.com/sql/sql_and.asp
     - https://www.w3schools.com/sql/sql_or.asp
     - https://www.w3schools.com/sql/sql_not.asp 
     - https://www.w3schools.com/sql/sql_like.asp
     - https://www.w3schools.com/sql/sql_wildcards.asp
     - https://www.w3schools.com/sql/sql_in.asp
   ============================================================ 

   1) Filtering using LIKE (text patterns)

   Wildcards:
     %  = any number of characters
     _  = exactly one character
   ------------------------------------------------------------ */

-- Get all publishers where the country BEGINS with "United"
SELECT *
FROM Publishers
WHERE country LIKE 'United%';

-- Get all publishers where the country ENDS with "S"
SELECT *
FROM Publishers
WHERE country LIKE '%S';

-- Get all publishers where the country CONTAINS "ed" anywhere
SELECT *
FROM Publishers
WHERE country LIKE '%ed%';


/* ------------------------------------------------------------
   2) LIKE with the single-character wildcard "_"

   "_" (underscore) matches EXACTLY ONE character.

   Compare:
     %  = any number of characters (% is flexible)
     _  = exactly one character    (_ is strict)

   This is useful when you know the pattern length.
   ------------------------------------------------------------ */

-- Find publishers where the country has exactly ONE character before "reland"
SELECT *
FROM Publishers
WHERE country LIKE '_reland';

-- Find publishers where the country has exactly TWO characters before "ited Kingdom"
SELECT *
FROM Publishers
WHERE country LIKE '__ited Kingdom';


/* ------------------------------------------------------------
   3) Filtering with multiple conditions (AND)

   AND means:
     - condition 1 must be true
     - condition 2 must be true
   ------------------------------------------------------------ */
SELECT *
FROM Publishers
WHERE 
    publisher_id > 10 AND
    country = 'United Kingdom';


/* ------------------------------------------------------------
   4) Filtering with multiple conditions (OR)

   OR means:
     - either condition can be true
   ------------------------------------------------------------ */
SELECT *
FROM Book_Copies
WHERE 
    status = 'DAMAGED' OR
    status = 'LOST';


/* ------------------------------------------------------------
   5) Combining AND and OR with parentheses

   Parentheses are IMPORTANT.
   They control which conditions are evaluated together.
   ------------------------------------------------------------ */
SELECT *
FROM Book_Copies
WHERE 
    shelf_location = 'A1' AND
    (
        status = 'AVAILABLE' OR
        status = 'ON_LOAN'
    );


/* ------------------------------------------------------------
   6) Filtering using IN (matching against a list)

   IN is used when you want to match a column against
   multiple possible values.

   This:
     status IN ('DAMAGED', 'LOST')

   Is equivalent to:
     status = 'DAMAGED' OR status = 'LOST'

   IN is usually:
     - easier to read
     - easier to maintain
   ------------------------------------------------------------ */

-- Find book copies that are either DAMAGED or LOST
SELECT *
FROM Book_Copies
WHERE status IN ('DAMAGED', 'LOST');


-- Find publishers located in a specific set of countries
SELECT *
FROM Publishers
WHERE country IN ('United Kingdom', 'Ireland', 'Canada');


/* ------------------------------------------------------------
   7) NOT IN (excluding a list of values)

   NOT IN does the opposite of IN.
   It excludes rows that match the list.
   ------------------------------------------------------------ */

-- Find all book copies that are NOT available or on loan
SELECT *
FROM Book_Copies
WHERE status NOT IN ('AVAILABLE', 'ON_LOAN');


/* ============================================================
   EXERCISES
   ============================================================ */

/* Exercise 1:
   Select all publishers where the country
   CONTAINS the word "King".
*/


/* Exercise 2:
   Select all Book_Copies where:
     - status is 'AVAILABLE'
     - AND shelf_location is 'C2'
*/


/* Exercise 3:
   Select all Book_Copies where:
     - status is 'LOST'
     - OR status is 'DAMAGED'
     - AND shelf_location is 'B2'
   Hint: Think carefully about parentheses.
*/


/* Exercise 4:
   Select all publishers where:
     - publisher_id is greater than 5
     - AND the country starts with 'United'
*/


/* Exercise 5:
   Rewrite this query using IN instead of OR:

     status = 'DAMAGED' OR status = 'LOST'
*/


/* Exercise 6:
   Select all Book_Copies where status is
   one of the following:
     - AVAILABLE
     - ON_LOAN
*/


/* Exercise 7:
   Select all publishers where the country is NOT
   one of the following:
     - United States
     - Canada
*/


/* Exercise 8 (thinking exercise):
   Why is IN often preferred over many OR conditions?
   When might OR still be useful?
*/
