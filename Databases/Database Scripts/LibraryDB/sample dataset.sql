PRAGMA foreign_keys = ON;

-- ===============================
-- PUBLISHERS (20)
-- ===============================

INSERT INTO Publishers VALUES
(1, 'Northstar Publishing', 'United Kingdom'),
(2, 'Red Maple Books', 'Canada'),
(3, 'Silver Line Press', 'United States'),
(4, 'Aurora House', 'Norway'),
(5, 'Emerald Quill', 'Ireland'),
(6, 'Golden Page', 'Australia'),
(7, 'Blue Horizon', 'United States'),
(8, 'Iron Oak Publishing', 'Germany'),
(9, 'Sunrise Editions', 'United Kingdom'),
(10, 'Moonlight Press', 'France'),
(11, 'Atlas Books', 'United States'),
(12, 'Crimson Ink', 'Spain'),
(13, 'Riverbend Publishing', 'Canada'),
(14, 'Pinecone Press', 'Sweden'),
(15, 'Harbor House', 'United Kingdom'),
(16, 'FableWorks', 'United States'),
(17, 'Ink & Stone', 'Ireland'),
(18, 'Open Road Press', 'United States'),
(19, 'Copper Lantern', 'Netherlands'),
(20, 'Quiet Forest Books', 'Finland');

-- ===============================
-- AUTHORS (20)
-- ===============================

INSERT INTO Authors VALUES
(1, 'Eleanor Brooks'),
(2, 'Thomas Reed'),
(3, 'Amelia Wright'),
(4, 'Lucas Bennett'),
(5, 'Hannah Collins'),
(6, 'Daniel Foster'),
(7, 'Priya Malhotra'),
(8, 'Noah Stein'),
(9, 'Isabelle Laurent'),
(10, 'Marcus O’Neill'),
(11, 'Sofia Alvarez'),
(12, 'Jonah Kim'),
(13, 'Emily Harper'),
(14, 'Oliver Shaw'),
(15, 'Nina Petrova'),
(16, 'Caleb Morgan'),
(17, 'Fatima Hassan'),
(18, 'Leo Nakamura'),
(19, 'Rachel Evans'),
(20, 'Victor Lund');

-- ===============================
-- BOOKS (40)
-- ===============================

INSERT INTO Books VALUES
(1, 1, 1, 'The Long Winter Road', '9780000000001'),
(2, 1, 2, 'Beneath the Old Bridge', '9780000000002'),
(3, 2, 3, 'Maple Skies', '9780000000003'),
(4, 2, 4, 'Northern Lights Rising', '9780000000004'),
(5, 3, 5, 'The Quiet Room', '9780000000005'),
(6, 3, 6, 'Signals in the Static', '9780000000006'),
(7, 4, 7, 'Snowfall Over Oslo', '9780000000007'),
(8, 4, 8, 'The Last Crossing', '9780000000008'),
(9, 5, 9, 'Letters Never Sent', '9780000000009'),
(10, 5, 10, 'Echoes of the Coast', '9780000000010'),
(11, 6, 11, 'Red Earth', '9780000000011'),
(12, 6, 12, 'Midnight Market', '9780000000012'),
(13, 7, 13, 'The Third Horizon', '9780000000013'),
(14, 7, 14, 'Glass Cities', '9780000000014'),
(15, 8, 15, 'Ash and Iron', '9780000000015'),
(16, 8, 16, 'The Silent Forge', '9780000000016'),
(17, 9, 17, 'Daughters of the Wind', '9780000000017'),
(18, 9, 18, 'Paper Cranes', '9780000000018'),
(19, 10, 19, 'A Narrow Path', '9780000000019'),
(20, 10, 20, 'The Frozen Orchard', '9780000000020'),
-- second copies of authors/publishers
(21, 11, 1, 'Still Water', '9780000000021'),
(22, 12, 2, 'The Broken Compass', '9780000000022'),
(23, 13, 3, 'Riverlight', '9780000000023'),
(24, 14, 4, 'Pine and Snow', '9780000000024'),
(25, 15, 5, 'Quiet Harbour', '9780000000025'),
(26, 16, 6, 'Neon Evenings', '9780000000026'),
(27, 17, 7, 'Threads of Silk', '9780000000027'),
(28, 18, 8, 'Open Skies', '9780000000028'),
(29, 19, 9, 'Lantern Glow', '9780000000029'),
(30, 20, 10, 'Forest Without Sound', '9780000000030'),
(31, 1, 11, 'Dust and Salt', '9780000000031'),
(32, 2, 12, 'After the Bell', '9780000000032'),
(33, 3, 13, 'The Far Shore', '9780000000033'),
(34, 4, 14, 'Winter Signals', '9780000000034'),
(35, 5, 15, 'Cold Ember', '9780000000035'),
(36, 6, 16, 'Burning Hours', '9780000000036'),
(37, 7, 17, 'Paths We Keep', '9780000000037'),
(38, 8, 18, 'Ink Snow', '9780000000038'),
(39, 9, 19, 'Low Tide', '9780000000039'),
(40, 10, 20, 'North of Silence', '9780000000040');

-- ===============================
-- BOOK COPIES (≈80)
-- ===============================

INSERT INTO Book_Copies VALUES
(1, 1, 'AVAILABLE', 'A1'),
(2, 1, 'ON_LOAN', 'A1'),
(3, 2, 'AVAILABLE', 'A2'),
(4, 2, 'AVAILABLE', 'A2'),
(5, 3, 'ON_LOAN', 'B1'),
(6, 3, 'AVAILABLE', 'B1'),
(7, 4, 'AVAILABLE', 'B2'),
(8, 4, 'DAMAGED', 'B2'),
(9, 5, 'AVAILABLE', 'C1'),
(10, 5, 'ON_LOAN', 'C1'),
(11, 6, 'AVAILABLE', 'C2'),
(12, 6, 'AVAILABLE', 'C2'),
(13, 7, 'ON_LOAN', 'D1'),
(14, 7, 'AVAILABLE', 'D1'),
(15, 8, 'AVAILABLE', 'D2'),
(16, 8, 'LOST', 'D2'),
(17, 9, 'AVAILABLE', 'E1'),
(18, 9, 'AVAILABLE', 'E1'),
(19, 10, 'ON_LOAN', 'E2'),
(20, 10, 'AVAILABLE', 'E2'),
(21, 11, 'AVAILABLE', 'F1'),
(22, 12, 'AVAILABLE', 'F2'),
(23, 13, 'ON_LOAN', 'G1'),
(24, 14, 'AVAILABLE', 'G2'),
(25, 15, 'AVAILABLE', 'H1'),
(26, 16, 'ON_LOAN', 'H2'),
(27, 17, 'AVAILABLE', 'I1'),
(28, 18, 'AVAILABLE', 'I2'),
(29, 19, 'ON_LOAN', 'J1'),
(30, 20, 'AVAILABLE', 'J2');

-- ===============================
-- MEMBERS (15)
-- ===============================

INSERT INTO Members VALUES
(1, 'Oliver Grant', 'oliver.grant@example.com'),
(2, 'Emily Carter', 'emily.carter@example.com'),
(3, 'Noah Williams', 'noah.williams@example.com'),
(4, 'Priya Shah', 'priya.shah@example.com'),
(5, 'Liam OConnor', 'liam.oconnor@example.com'),
(6, 'Ava Patel', 'ava.patel@example.com'),
(7, 'Ethan Brown', 'ethan.brown@example.com'),
(8, 'Maya Singh', 'maya.singh@example.com'),
(9, 'Jack Thompson', 'jack.thompson@example.com'),
(10, 'Sophie Müller', 'sophie.mueller@example.com'),
(11, 'Carlos Rivera', 'carlos.rivera@example.com'),
(12, 'Yuki Tanaka', 'yuki.tanaka@example.com'),
(13, 'Fatima Noor', 'fatima.noor@example.com'),
(14, 'Ben Wallace', 'ben.wallace@example.com'),
(15, 'Chloe Martin', 'chloe.martin@example.com');

-- ===============================
-- LOANS (20)
-- ===============================

INSERT INTO Loans VALUES
(1, 1, 2, '2026-01-02', '2026-01-16', NULL),
(2, 2, 5, '2025-12-20', '2026-01-03', NULL),
(3, 3, 10, '2025-12-10', '2025-12-24', '2025-12-22'),
(4, 4, 13, '2026-01-01', '2026-01-15', NULL),
(5, 5, 19, '2026-01-03', '2026-01-17', NULL),
(6, 6, 23, '2025-12-18', '2026-01-01', NULL),
(7, 7, 26, '2026-01-05', '2026-01-19', NULL),
(8, 8, 29, '2026-01-06', '2026-01-20', NULL),
(9, 9, 16, '2025-11-20', '2025-12-04', '2025-12-01'),
(10, 10, 8, '2025-12-01', '2025-12-15', '2025-12-10'),
(11, 11, 3, '2026-01-07', '2026-01-21', NULL),
(12, 12, 6, '2026-01-08', '2026-01-22', NULL),
(13, 13, 14, '2026-01-09', '2026-01-23', NULL),
(14, 14, 17, '2026-01-10', '2026-01-24', NULL),
(15, 15, 20, '2026-01-11', '2026-01-25', NULL),
(16, 1, 11, '2025-12-05', '2025-12-19', '2025-12-18'),
(17, 2, 12, '2025-12-06', '2025-12-20', '2025-12-19'),
(18, 3, 21, '2026-01-12', '2026-01-26', NULL),
(19, 4, 22, '2026-01-13', '2026-01-27', NULL),
(20, 5, 24, '2026-01-14', '2026-01-28', NULL);

-- ===============================
-- RESERVATIONS (10)
-- ===============================

INSERT INTO Reservations VALUES
(1, 6, 1, '2026-01-02'),
(2, 7, 3, '2026-01-03'),
(3, 8, 5, '2026-01-04'),
(4, 9, 7, '2026-01-05'),
(5, 10, 9, '2026-01-06'),
(6, 11, 11, '2026-01-07'),
(7, 12, 13, '2026-01-08'),
(8, 13, 15, '2026-01-09'),
(9, 14, 17, '2026-01-10'),
(10, 15, 19, '2026-01-11');

/* ===============================
   FINES (10)
   - Links to Loans via loan_id
   - amount is numeric (great for SUM/AVG)
   - paid: 0 = not paid, 1 = paid
   =============================== */

INSERT INTO Fines VALUES
(1,  2,  4.50, 0, '2026-01-04'),  -- Loan 2 is overdue + not returned
(2,  6,  6.00, 0, '2026-01-02'),  -- Loan 6 is overdue + not returned
(3,  1,  2.00, 0, '2026-01-17'),  -- Loan 1 due 2026-01-16, still not returned
(4,  4,  1.50, 0, '2026-01-16'),  -- Loan 4 due 2026-01-15, still not returned
(5,  5,  3.00, 0, '2026-01-18'),  -- Loan 5 due 2026-01-17, still not returned
(6,  9,  1.00, 1, '2025-12-02'),  -- Loan 9 returned, fine paid
(7,  10, 2.50, 1, '2025-12-11'),  -- Loan 10 returned, fine paid
(8,  3,  0.75, 1, '2025-12-23'),  -- Loan 3 returned, small fine paid
(9,  16, 1.25, 1, '2025-12-19'),  -- Loan 16 returned, fine paid
(10, 17, 1.25, 1, '2025-12-20');  -- Loan 17 returned, fine paid


-- Fix Data Inconsistencies with Loans
-- 1. Mark all copies with active loans as ON_LOAN
UPDATE Book_Copies
SET status = 'ON_LOAN'
WHERE copy_id IN (
  SELECT copy_id
  FROM Loans
  WHERE return_date IS NULL
);

-- 2. Mark copies with no active loans as AVAILABLE
UPDATE Book_Copies
SET status = 'AVAILABLE'
WHERE copy_id NOT IN (
  SELECT copy_id
  FROM Loans
  WHERE return_date IS NULL
)
AND status NOT IN ('DAMAGED', 'LOST');

