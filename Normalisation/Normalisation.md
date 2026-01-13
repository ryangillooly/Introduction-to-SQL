# Database Normalization Walkthrough (Library Example)

This document explains **database normalization** from the ground up, using a **simple library system** as an example.

It is written for **complete beginners** to SQL and databases. No prior knowledge is assumed.

---

## What is Database Normalization? (Plain English)

When we store data in a database, we want it to be:

- **Correct** – the data should not contradict itself  
- **Easy to update** – changing something should not require many edits  
- **Hard to accidentally break** – the database should protect itself  
- **Easy to understand later** – especially by other developers  

**Database normalization** is the process of **organising data into tables** so that:

- Each piece of information is stored **once**
- Data duplication is reduced or eliminated
- Relationships between data are clear and enforced

Instead of starting with a perfect design, databases often evolve through **stages**, called **Normal Forms**.

In this guide, we walk through the *same* library data as it improves through:

- Zero Normal Form (0NF)
- First Normal Form (1NF)
- Second Normal Form (2NF)
- Third Normal Form (3NF)

Each step fixes specific problems introduced earlier.

---

## Zero Normal Form (0NF)

![Zero Normal Form Diagram](../Images/0nf.png)

### What this represents

This is what a database might look like when **no real design has been done**.

All information about the library is stored in **one large table**, including:

- Members (people borrowing books)
- Books
- Authors
- Publishers
- Physical book copies
- Loans
- Reservations
- Fines

Everything is combined into a single row structure.

Some columns contain:
- Multiple values
- Comma-separated text
- Repeating data inside one cell

For example:
- One column may store *multiple loan dates*
- One column may store *multiple book copies*
- One row may describe *many real-world things at once*

---

### Why this is Zero Normal Form

A table is in **Zero Normal Form** when:

- Columns contain **non-atomic values**
- Repeating groups exist
- A single row represents multiple real-world concepts

In simple terms:

> The database behaves more like a spreadsheet than a structured system.

There are **no enforced rules** about how data relates to other data.

---

### Problems with this design

This design causes serious issues:

- **Data duplication**  
  The same author, publisher, or member appears many times.

- **Update problems**  
  Changing an author’s name requires updating many rows.

- **Insert problems**  
  You may not be able to add a book unless a member exists.

- **Delete problems**  
  Deleting a loan might remove book information.

- **No data safety**  
  Invalid or inconsistent data can be added freely.

---

### Why we normalize

The first goal of normalization is simple:

> **Each column should store exactly one value.**

That leads to **First Normal Form**.

---

## First Normal Form (1NF)

![First Normal Form Diagram](../Images/1nf.png)

### What changed

In First Normal Form:

- Each column contains **a single atomic value**
- There are **no lists or comma-separated values**
- Each row represents **one specific fact or event**

For example:
- One row = one loan
- One row = one reservation
- One row = one fine

If a book is loaned five times, there are **five rows**, not one row with five dates.

---

### Why this is First Normal Form

A table is in **First Normal Form** if:

- There are no repeating groups
- No column contains multiple values
- Each cell contains a single value

At this stage:
- SQL queries behave correctly
- Data can be filtered, grouped, and joined

However…

---

### Problems that remain

Even though values are now atomic:

- Author information is repeated for each book
- Publisher information is duplicated everywhere
- Member details appear in many rows

This leads to:
- Wasted space
- Inconsistent updates
- Difficult maintenance

---

### What’s next

Now we ask:

> **Does this data really belong in this table?**

That question leads to **Second Normal Form**.

---

## Second Normal Form (2NF)

![Second Normal Form Diagram](../Images/2nf.png)

### What changed

The data is split into **logical tables**, each representing one real-world concept:

- Members
- Books
- Book Copies
- Loans
- Reservations
- Fines

Each table now answers **one clear question**:

- Members → Who are the users?
- Books → What books exist?
- Copies → Which physical copies exist?
- Loans → Who borrowed what?
- Fines → What penalties exist?

---

### Why this is Second Normal Form

A table is in **Second Normal Form** when:

- It is already in 1NF
- Every non-key column depends on the **entire primary key**

In plain terms:

> A table should store information **only about the thing it represents**.

For example:
- Loan dates belong in Loans
- Copy status belongs in Book Copies
- Member email belongs in Members

---

### Problems that remain

There is still a subtle issue:

- Books still store author names
- Books still store publisher details

This means:
- Author name depends on `author_id`, not `book_id`
- Publisher country depends on `publisher_id`, not `book_id`

These are called **transitive dependencies**.

---

### What’s next

The final cleanup step is removing those indirect dependencies.

That leads to **Third Normal Form**.

---

## Third Normal Form (3NF)

![Third Normal Form Diagram](../Images/3nf.png)

### What changed

Author and Publisher data is moved into **their own tables**:

- Authors
- Publishers

The Books table now contains:
- Only book-specific data
- Foreign keys pointing to Authors and Publishers

---

### Why this is Third Normal Form

A table is in **Third Normal Form** when:

- It is already in Second Normal Form
- No non-key column depends on another non-key column

In simple terms:

> Every column depends **only on the primary key**.

This removes dependency chains such as:
- Book → Author ID → Author Name
- Book → Publisher ID → Publisher Country

---

### Benefits of this design

This structure provides:

- One source of truth per concept
- No duplicated descriptive data
- Strong data integrity
- Clear relationships
- Safe updates and deletes
- Excellent long-term maintainability

This is why **Third Normal Form is the standard target** for most SQL databases.

---

## Final Notes

- Designing databases around **entities and relationships** naturally leads to Third Normal Form
- Most transactional (OLTP) systems stop here
- Higher normal forms exist, but are rarely needed
- Performance optimisations may later intentionally break normalization (called *denormalization*)

Most importantly:

**Normalization is not about memorising rules.**  
It is about **making data accurate, maintainable, and safe as systems grow**.
