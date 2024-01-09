SHOW DATABASES;

USE jd23_pokemon;
SHOW TABLES;

SELECT * FROM Pokemons;
SELECT * FROM Users;
SELECT * FROM UserPokemons;

UPDATE Users SET lastLogin = CURRENT_TIMESTAMP WHERE email = "lotta@email.dk";


SELECT id FROM Users WHERE email = 'lotta@email.dk';

DELETE FROM UserPokemons WHERE usersId = X?

DELETE FROM Users WHERE id = X;


CREATE TABLE Log(
	id INT PRIMARY KEY AUTO_INCREMENT,
	activityDate DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
	usersId INT NULL, 
	message TEXT
);

SELECT * FROM Log;