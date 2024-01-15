SHOW DATABASES;
USE java23;

SHOW TABLES;

DESCRIBE Contacts;
DESCRIBE Companys;
DESCRIBE Employees;

SELECT * FROM Contacts;
DELETE FROM Contacts WHERE id = 30;


SELECT name FROM Contacts UNION SHOW TABLES;


SELECT SHA2('X', 256);


CREATE TABLE Users (
	id INT PRIMARY KEY AUTO_INCREMENT, 
	username VARCHAR(255),
	password VARCHAR(255),
	salt VARCHAR(255)
);


SELECT ROUND(RAND()*10000000000);

INSERT INTO Users (username, password, salt) VALUE ('user1', SHA2(CONCAT('Martin','3316955523'), 256), '3316955523');

SELECT * FROM Users;

SELECT id, username FROM Users WHERE username = 'user1' AND password = SHA2(CONCAT('Martin', salt), 256);

