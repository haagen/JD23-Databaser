
SHOW DATABASES;

USE java23;

SHOW TABLES;

DESCRIBE Companys;

DESCRIBE Employees;

SELECT p.id, p.name FROM Pokemons p;


SELECT 
	c.id, c.name, e.name 
FROM 
	Companys c
INNER JOIN 
	Employees e
ON
	c.id = e.companyId;


DESCRIBE Persons;
DESCRIBE Models;
DESCRIBE PersonModels;

SELECT 
	*
FROM
	Persons p

INNER JOIN PersonModels pm ON p.id = pm.personsId
INNER JOIN Models m ON pm.modelsId = m.id;


SELECT 
	p.name, p.phone, m.name 
FROM
	Persons p
INNER JOIN PersonModels pm ON p.id = pm.personsId
INNER JOIN Models m ON pm.modelsId = m.id
WHERE
	p.name = "Joel";


SELECT 
	p.name, COUNT(p.name) AS AntalBilar
FROM
	Persons p
INNER JOIN PersonModels pm ON p.id = pm.personsId
INNER JOIN Models m ON pm.modelsId = m.id
GROUP BY p.name ORDER BY AntalBilar DESC;



INSERT INTO Companys (name, orgNo, turnover) VALUES ('Volvo Cars', '676712-1212', 900000000);

SELECT * FROM Companys;

SELECT * FROM Companys c
LEFT JOIN Employees e ON c.id = e.companyId
WHERE e.companyId IS NULL;

SELECT * FROM Companys c
RIGHT JOIN Employees e ON c.id = e.companyId;

SELECT * FROM Companys c
INNER JOIN Employees e ON c.id = e.companyId;

SELECT * FROM Companys c
LEFT JOIN Employees e ON c.id = e.companyId
WHERE e.companyId IS NOT NULL;

SELECT * FROM Companys c
LEFT OUTER JOIN Employees e ON c.id = e.companyId;


-- 
-- UNION
--

SELECT id, name FROM Companys WHERE id > 0 
UNION
SELECT id, name FROM Employees WHERE id < 2 ORDER BY id ;


