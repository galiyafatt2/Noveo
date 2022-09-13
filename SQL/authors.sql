CREATE TABLE authors (
	id SERIAL PRIMARY KEY,
	first_name VARCHAR(100) NOT NULL,
	last_name VARCHAR(100) NOT NULL,
	age INTEGER NOT NULL
);

CREATE TABLE books (
	id SERIAL PRIMARY KEY,
	title VARCHAR(100) NOT NULL,
	author_id INTEGER,
	copies_sold INTEGER NOT NULL,
	CONSTRAINT authors
		FOREIGN KEY (author_id) 
			REFERENCES authors(id)
);

INSERT INTO authors(first_name, last_name, age)
VALUES
	('Volkiso', 'Volkov', 52),
	('Lisa', 'Lisovna', 44),
	('Risanet', 'Risovna', 21),
	('Chel', 'Chelov', 66),
	('Mat', 'Matov', 21);

INSERT INTO books(title, copies_sold, author_id)
VALUES
	('volks', 50, 1),
	('lisas', 40, 2),
	('risas', 30, 3),
	('chels', 20, 4),
	('mats', 10, 5);

SELECT first_name FROM authors WHERE length(first_name) > 6;

SELECT age, COUNT(DISTINCT id)
from authors
group by age;

SELECT * FROM books
order by copies_sold desc
LIMIT 3;

SELECT authors.first_name, authors.last_name, authors.age, COUNT(books.id) 
FROM authors
INNER JOIN books ON
authors.id = books.author_id
GROUP BY authors.first_name, authors.last_name, authors.age;

drop table authors CASCADE;
drop table books CASCADE;





