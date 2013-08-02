CREATE TABLE IF NOT EXISTS sessions (
    id           CHAR(72) PRIMARY KEY,
    session_data TEXT
);
CREATE TABLE IF NOT EXISTS book (
    id     INTEGER PRIMARY KEY,
    title  TEXT,
    rating INTEGER
);
CREATE TABLE IF NOT EXISTS author (
    id         INTEGER PRIMARY KEY,
    first_name TEXT,
    last_name  TEXT
);
CREATE TABLE IF NOT EXISTS book_author (
    book_id   INTEGER REFERENCES book(id) ON DELETE CASCADE ON UPDATE CASCADE,
    author_id INTEGER REFERENCES author(id) ON DELETE CASCADE ON UPDATE CASCADE,
    PRIMARY KEY (book_id, author_id)
);
INSERT OR REPLACE INTO book VALUES (1, 'CCSP SNRS Exam Certification Guide', 5);
INSERT OR REPLACE INTO book VALUES (2, 'TCP/IP Illustrated, Volume 1', 5);
INSERT OR REPLACE INTO book VALUES (3, 'Internetworking with TCP/IP Vol.1', 4);
INSERT OR REPLACE INTO book VALUES (4, 'Perl Cookbook', 5);
INSERT OR REPLACE INTO book VALUES (5, 'Designing with Web Standards', 5);
INSERT OR REPLACE INTO author VALUES (1, 'Greg', 'Bastien');
INSERT OR REPLACE INTO author VALUES (2, 'Sara', 'Nasseh');
INSERT OR REPLACE INTO author VALUES (3, 'Christian', 'Degu');
INSERT OR REPLACE INTO author VALUES (4, 'Richard', 'Stevens');
INSERT OR REPLACE INTO author VALUES (5, 'Douglas', 'Comer');
INSERT OR REPLACE INTO author VALUES (6, 'Tom', 'Christiansen');
INSERT OR REPLACE INTO author VALUES (7, 'Nathan', 'Torkington');
INSERT OR REPLACE INTO author VALUES (8, 'Jeffrey', 'Zeldman');
INSERT OR REPLACE INTO book_author VALUES (1, 1);
INSERT OR REPLACE INTO book_author VALUES (1, 2);
INSERT OR REPLACE INTO book_author VALUES (1, 3);
INSERT OR REPLACE INTO book_author VALUES (2, 4);
INSERT OR REPLACE INTO book_author VALUES (3, 5);
INSERT OR REPLACE INTO book_author VALUES (4, 6);
INSERT OR REPLACE INTO book_author VALUES (4, 7);
INSERT OR REPLACE INTO book_author VALUES (5, 8);
