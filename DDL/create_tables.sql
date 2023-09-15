DROP TABLE IF EXISTS readers, books, book_issuance, authors,
writing_books, publishing_houses, book_editions;

CREATE TABLE IF NOT EXISTS readers (
id_reader BIGINT PRIMARY KEY,
first_name VARCHAR(255),
second_name VARCHAR(255),
adress VARCHAR(255),
phone_number TEXT
);

CREATE TABLE IF NOT EXISTS books (
id_book BIGINT PRIMARY KEY,
book_name VARCHAR(255),
number_pages INTEGER,
price DOUBLE PRECISION,
number_instances INTEGER
);

CREATE TABLE IF NOT EXISTS book_issuance (
id_book BIGINT,
id_reader BIGINT,
date_issue DATE,
date_return DATE,
FOREIGN KEY (id_book) references books (id_book) on delete cascade,
FOREIGN KEY (id_reader) references readers (id_reader) on delete cascade,
PRIMARY KEY (id_book, id_reader)
);

CREATE TABLE IF NOT EXISTS authors (
id_author BIGINT PRIMARY KEY,
first_name VARCHAR(255),
second_name VARCHAR(255)
);

CREATE TABLE IF NOT EXISTS writing_books (
id_book BIGINT,
id_author BIGINT,
date_writing DATE,
FOREIGN KEY (id_book) references books (id_book) on delete cascade,
FOREIGN KEY (id_author) references authors (id_author) on delete cascade,
PRIMARY KEY (id_book, id_author)
);

CREATE TABLE IF NOT EXISTS publishing_houses (
id_publishing_house SERIAL PRIMARY KEY,
name_publishing_house VARCHAR(255),
city VARCHAR(255)
);

CREATE TABLE IF NOT EXISTS book_editions (
id_book BIGINT,
id_publishing_house BIGINT,
date_editions DATE,
FOREIGN KEY (id_book) references books (id_book) on delete cascade,
FOREIGN KEY (id_publishing_house) references publishing_houses (id_publishing_house) on delete cascade,
PRIMARY KEY (id_book, id_publishing_house)
);

