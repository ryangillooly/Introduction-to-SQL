-- ===== LIBRARY DATABASE (Beginner-friendly / Generic SQL) =====

CREATE TABLE Publishers (
  publisher_id   INTEGER PRIMARY KEY,
  name           TEXT NOT NULL,
  country        TEXT
);

CREATE TABLE Authors (
  author_id      INTEGER PRIMARY KEY,
  full_name      TEXT NOT NULL
);

CREATE TABLE Books (
  book_id        INTEGER PRIMARY KEY,
  publisher_id   INTEGER NOT NULL,
  author_id      INTEGER NOT NULL,
  title          TEXT NOT NULL,
  isbn           TEXT,

  FOREIGN KEY (publisher_id) REFERENCES Publishers(publisher_id),
  FOREIGN KEY (author_id)    REFERENCES Authors(author_id)
);

CREATE TABLE Book_Copies (
  copy_id        INTEGER PRIMARY KEY,
  book_id        INTEGER NOT NULL,
  status         TEXT NOT NULL,
  shelf_location TEXT,

  FOREIGN KEY (book_id) REFERENCES Books(book_id)
);

CREATE TABLE Members (
  member_id      INTEGER PRIMARY KEY,
  full_name      TEXT NOT NULL,
  email          TEXT
);

CREATE TABLE Loans (
  loan_id        INTEGER PRIMARY KEY,
  member_id      INTEGER NOT NULL,
  copy_id        INTEGER NOT NULL,
  loan_date      TEXT NOT NULL,   -- store as 'YYYY-MM-DD'
  due_date       TEXT NOT NULL,   -- store as 'YYYY-MM-DD'
  return_date    TEXT,            -- NULL means not returned yet

  FOREIGN KEY (member_id) REFERENCES Members(member_id),
  FOREIGN KEY (copy_id)   REFERENCES Book_Copies(copy_id)
);

CREATE TABLE Reservations (
  reservation_id INTEGER PRIMARY KEY,
  member_id      INTEGER NOT NULL,
  book_id        INTEGER NOT NULL,
  reserved_date  TEXT NOT NULL,   -- store as 'YYYY-MM-DD'

  FOREIGN KEY (member_id) REFERENCES Members(member_id),
  FOREIGN KEY (book_id)   REFERENCES Books(book_id)
);

CREATE TABLE Fines (
  fine_id     INTEGER PRIMARY KEY,
  loan_id     INTEGER NOT NULL,
  amount      DECIMAL(6,2) NOT NULL,
  paid        INTEGER NOT NULL,  -- 0 = not paid, 1 = paid
  fine_date   TEXT NOT NULL,     -- 'YYYY-MM-DD'

  FOREIGN KEY (loan_id) REFERENCES Loans(loan_id)
);

