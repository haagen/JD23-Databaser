-- Skapa databasen
CREATE DATABASE jd23_pokemon;

-- "Välj" databasen
USE jd23_pokemon;

-- Skapa "Pokemon"-tabellen
CREATE TABLE IF NOT EXISTS
	Pokemons
(
	id INT AUTO_INCREMENT NOT NULL,
	name VARCHAR(200) UNIQUE NOT NULL,
	weight DECIMAL(5,2) NOT NULL,
	height DECIMAL(5,2) NOT NULL,
	abillities VARCHAR(50) NOT NULL,
	PRIMARY KEY(id)
);

CREATE TABLE IF NOT EXISTS 
	Users
(
	id INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
	email VARCHAR(255) NOT NULL UNIQUE,
	name VARCHAR(255) NOT NULL, 
	password VARCHAR(255) NULL, 
	lastLogin DATETIME NULL,
	createdDate DATE NOT NULL DEFAULT CURRENT_DATE,
	newsletter ENUM("Yes", "No") DEFAULT "No"
);

CREATE TABLE IF NOT EXISTS
	UserPokemons
(
	id INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
	usersId INT NOT NULL,
	pokemonsId INT NOT NULL
);


-- FÖR GRIT UPPGIFTEN

DROP TABLE UserPokemons;

CREATE TABLE IF NOT EXISTS
	UserPokemons
(
	id INT AUTO_INCREMENT NOT NULL,
	usersId INT NOT NULL,
	pokemonsId INT NOT NULL,
	PRIMARY KEY(id),
	FOREIGN KEY(usersId) REFERENCES Users(id),
	FOREIGN KEY(pokemonsId) REFERENCES Pokemons(id)
);

-- För GRIT UPPGIFTEN (Slut)

SHOW TABLES;
DESCRIBE UserPokemons;

INSERT INTO Users (email, name) VALUES 
	("martin.haagen@gritacademy.se", "Martin"), 
	("emma.nilsson@gritacademy.se", "Emma"),
	("stina@email.se", "Stina"),
	("bettan@email.nu", "Bettan"),
	("lotta@email.dk", "Lotta");

INSERT INTO Pokemons 
	(name, weight, height, abillities)
VALUES
	("Bulbasaur", 6.9, 0.7, "Overgrow"),
	("Ivysaur", 13.0, 1.9, "Overgrow"),
	("Venusaur", 100.0, 2.0, "Overgrow"),
	("Charmander", 8.5, 0.6, "Blaze"),
	("Charmeleon", 19.0, 1.1, "Blaze"),
	("Charizard", 90.5, 1.7, "Blaze"),
	("Squirtle", 9.0, 0.5, "Torrent"),
	("Wartortle", 22.5, 1.0, "Torrent"),
	("Blastoise", 85.5, 1.6, "Torrent"),
	("Caterpie", 2.9, 0.3, "Shield Dust"),
	("Metapod", 9.9, 0.7, "Shed Skin"),
	("Butterfree", 32.0, 1.1, "Compound Eyes");

INSERT INTO UserPokemons
	(usersId, pokemonsId)
VALUES
	(1, 1),
	(1, 3),
	(2, 1),
	(2, 2),
	(2, 3),
	(3, 8),
	(3, 2),
	(4, 10),
	(4, 1),
	(4, 3),
	(5, 11),
	(5, 12);

-- SELECT name, weight/height AS BMI FROM Pokemons;

SELECT * FROM Pokemons;


