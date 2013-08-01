CREATE TABLE IF NOT EXISTS sessions (
    id           CHAR(72) PRIMARY KEY,
    session_data TEXT
);
CREATE TABLE IF NOT EXISTS book (
    id    INTEGER PRIMARY KEY,
    title TEXT
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
