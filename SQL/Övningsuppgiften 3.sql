

SELECT * FROM Pokemons WHERE height > 1.0;


USE jd23_pokemon;

DESCRIBE Users;

SELECT name, createdDate FROM Users ORDER BY createdDate DESC;

SELECT * FROM Users;

UPDATE Users SET lastLogin = '2019-02-12 13:14:15' WHERE id = 3;
UPDATE Users SET lastLogin = NOW() WHERE id = 4;

SELECT * FROM Users ORDER BY lastLogin DESC LIMIT 1;

SELECT * FROM UserPokemons WHERE usersId = 4;

SELECT * FROM Pokemons WHERE Id = 10 OR Id = 1 OR Id = 3;

SELECT * FROM Pokemons WHERE Id IN (10, 1, 3);


SELECT usersId, COUNT(id) AS cnt FROM UserPokemons GROUP BY usersId ORDER BY cnt DESC;

SELECT id, name FROM Users;
