
-- Detta är en kommentar

-- Visa vilka databaser som finns
SHOW DATABASES;

-- Skapa java23 databasen
CREATE DATABASE java23;

-- Använd java23 databasen
USE java23;

-- Tabort Contacts tabellen (all data i Contacts kommer att försvinna)
DROP TABLE Contacts;
-- Skapa kontakts tabellen
CREATE TABLE IF NOT EXISTS
	Contacts
(
	id BIGINT PRIMARY KEY AUTO_INCREMENT NOT NULL,
	name VARCHAR(50) NOT NULL, 
	email VARCHAR(50) NOT NULL UNIQUE, 
	-- birthdate DATE NULL,
	phone VARCHAR(50)
);

-- Lägg till ett nytt fält i Contacts tabellen
-- Fältet heter birthdate är en DATE och skall hamna 
-- efter email fältet
ALTER TABLE 
	Contacts
ADD COLUMN birthdate DATE NULL
AFTER email;

-- Visa vilka tabeller som finns i databasen
SHOW TABLES;

-- Visa hur tabellen Contacts ser ut
SHOW COLUMNS FROM Contacts;

-- Visa hur tabellen Contacts ser ut
DESCRIBE Contacts;

-- Stoppa in data i Contacts-tabellen
INSERT INTO 
	Contacts
(
	name, 
	email
)
VALUES
(
	"Martin",
	"martin.haagen2@gritacademy.se"
);

-- Här stoppar vi in data utan att definiera
-- vilka kolumner datan tillhör.
INSERT INTO 
	Contacts 
VALUES 
	(5, 'Emma', 'emma.nilsson@gritacademy.se', '+464444444'), 
	(7, 'Caroline', 'caroline@gritacademy,se', NULL);


