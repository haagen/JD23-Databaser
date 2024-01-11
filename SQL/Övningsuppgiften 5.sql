SHOW DATABASES; 

USE jd23_pokemon;
SHOW TABLES;

SELECT * FROM Pokemons;
SELECT * FROM Users;
SELECT * FROM UserPokemons;


-- Uppgift 1

SELECT name FROM Users WHERE id = 1;
SELECT UNIQUE usersId FROM UserPokemons;

SELECT name FROM Users WHERE id IN (SELECT UNIQUE usersId FROM UserPokemons);

-- Uppgift 2

SELECT name FROM Pokemons WHERE id = 1;
SELECT UNIQUE pokemonsId FROM UserPokemons;

SELECT name FROM Pokemons WHERE id IN (SELECT UNIQUE pokemonsId FROM UserPokemons);


-- Uppgift 3

SELECT UNIQUE (SELECT name FROM Users WHERE id = usersId) FROM UserPokemons WHERE usersId IN (SELECT usersId FROM UserPokemons GROUP BY usersId HAVING COUNT(pokemonsId) > 2);

SELECT id, name FROM Users WHERE id IN (SELECT usersId FROM UserPokemons GROUP BY usersId HAVING COUNT(pokemonsId) > 2);

-- Uppgift 4

INSERT INTO Users (name, email) VALUES ('Andreas', 'email@email.dk');
SELECT name FROM Users WHERE id NOT IN (SELECT UNIQUE usersId FROM UserPokemons);

-- Uppgift 5

SELECT id FROM Users WHERE createdDate > DATE_ADD(CURRENT_DATE, INTERVAL -7 DAY);
SELECT pokemonsId FROM UserPokemons WHERE usersId = 2;
SELECT name FROM Pokemons WHERE id = 3;

SELECT name FROM Pokemons WHERE id IN (SELECT pokemonsId FROM UserPokemons WHERE usersId IN (SELECT id FROM Users WHERE createdDate > DATE_ADD(CURRENT_DATE, INTERVAL -7 DAY)));

SELECT UNIQUE p.name FROM Pokemons p JOIN UserPokemons up ON p.id = up.pokemonsId JOIN Users u ON up.usersId = u.id WHERE createdDate > DATE_ADD(CURRENT_DATE, INTERVAL -7 DAY);


