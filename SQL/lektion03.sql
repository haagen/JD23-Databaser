SHOW DATABASES;

USE java23;

SHOW TABLES;

DESCRIBE Contacts;

SHOW COLUMNS FROM Contacts;

-- SELECT används för att läsa data från databasen

SELECT * FROM Contacts;

SELECT * FROM Contacts WHERE id = 1;
SELECT * FROM Contacts WHERE name = "martin";
SELECT id, name, email FROM Contacts;
SELECT id, email FROM Contacts WHERE name = "Emma";

SELECT id, name, email FROM Contacts WHERE email LIKE "%@gritacademy.se";

SELECT id, email FROM Contacts WHERE name = "Martin" AND phone IS NOT NULL AND email LIKE "%@gritacademy.se";


SELECT id, name FROM Contacts ORDER BY name;
SELECT * FROM Contacts WHERE name = "martin" ORDER BY id DESC;


-- SELECT DAYOFWEEK(DATE_ADD(CURDATE(), INTERVAL 1 YEAR));

SELECT COUNT(id) FROM Contacts;
SELECT COUNT(id) FROM Contacts WHERE name = "Martin";
SELECT AVG(id) FROM Contacts;

SELECT 
	MAX(LENGTH(name)) AS MaxName, 
	MIN(LENGTH(name)) AS MinName, 
	AVG(LENGTH(name)) AS AvgName
FROM 
	Contacts;

SELECT id, name, LENGTH(name) AS NameLength FROM Contacts ORDER BY NameLength DESC LIMIT 1;

SELECT 
	COUNT(id) AS cnt, 
	name 
FROM 
	Contacts 
GROUP BY 
	name 
HAVING 
	cnt > 1 
ORDER BY 
	cnt 
DESC LIMIT 10;



