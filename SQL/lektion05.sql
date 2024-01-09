--

USE java23;

SHOW TABLES;

-- 

CREATE TABLE Persons (
	id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
	name VARCHAR(255),
	phone VARCHAR(255)
);

INSERT INTO Persons (name, phone) VALUES
	('Oliver', '+46121212'),
	('Aleksander', NULL), 
	('Joel', '+4677788123'),
	('Nikolina', '+47123232');


-- en-till-en "relation"
ALTER TABLE Persons ADD COLUMN street VARCHAR(255) after phone;

-- en-till-många relation

CREATE TABLE Companys (
	id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
	name VARCHAR(255),
	orgNo VARCHAR(25),
	turnover BIGINT -- SEK
);

INSERT INTO Companys (name, orgNo, turnover) VALUES	
	('H&M', '553312-1244', 230000000),
	('Ikea', '532390-9823', 1300000000),
	('Pelles Svets AB', '572299-1212', 4500000);

SELECT * FROM Companys;

CREATE TABLE Employees (
	id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
	name VARCHAR(255) NOT NULL,
	birthday DATE NULL,
	companyId INT NOT NULL,
	FOREIGN KEY (companyId) REFERENCES Companys(id)
);

INSERT INTO Employees (name, birthday, companyId) VALUES
	('Lotta Nilsson', NULL, 1),
	('Hasse Bronten', '1979-04-01', 2),
	('Pelle Svensson', '2001-01-05', 3),
	('Anna Jönsson', NULL, 2);

-- många-till-många


-- Vi använder "Persons" igen

CREATE TABLE Models (
	id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
	name VARCHAR(255)
);

INSERT INTO Models (name) VALUES ('XC90'), ('Fulbil'), ('SJ413'), ('500');

SELECT * FROM Persons;
SELECT * FROM Models;

CREATE TABLE PersonModels (
	id INT NOT NULL PRIMARY KEY AUTO_INCREMENT, 
	personsId INT NOT NULL, 
	modelsId INT NOT NULL,
	FOREIGN KEY (personsId) REFERENCES Persons(id),
	FOREIGN KEY (modelsId) REFERENCES Models(id)
);

INSERT INTO PersonModels (personsId, modelsId) VALUES 
	(2, 2), (3, 4), (3, 4), (3, 2), (4, 1);

-- 

SELECT Id FROM Companys WHERE name = 'H&M';
SELECT * FROM Employees WHERE companyId = 1;

SELECT 
	* 
FROM 
	Employees 
WHERE 
	companyId IN (
		SELECT 
			Id 
		FROM 
			Companys 
		WHERE 
			name = 'Ikea'
	);

SELECT companyId FROM Employees WHERE name LIKE '%Svensson';
SELECT name FROM Companys WHERE id = 3;

SELECT name FROM Companys WHERE id IN (SELECT companyId FROM Employees WHERE name LIKE '%Svensson');

SELECT * FROM Employees;

UPDATE Employees SET birthday = '2001-01-04' WHERE id IN (SELECT id FROM Employees WHERE name = 'Pelle Svensson');

SELECT id FROM Persons WHERE name = 'Joel';
SELECT modelsId FROM PersonModels WHERE personsId = 3;
SELECT * FROM Models WHERE id = 4;

SELECT * FROM Models WHERE id IN (
	SELECT modelsId FROM PersonModels WHERE personsId IN (
		SELECT id FROM Persons WHERE name = 'Joel'
	)
);

	SELECT (SELECT name FROM Models WHERE id = modelsId) AS Model_Namn, COUNT(modelsId) AS Antal FROM PersonModels WHERE personsId IN (
		SELECT id FROM Persons WHERE name = 'Joel'
	) GROUP BY modelsId; 


