

SELECT id, name, email, phone FROM Contacts WHERE id = 1;


SELECT * FROM Contacts;

INSERT INTO Contacts (name, email, phone) VALUES ('Karl', 'email4', '5656');
INSERT INTO Contacts SET name = 'Oskar', email = 'email5', phone = '6767';
UPDATE Contacts SET name = 'Test 1', email = 'Test 2', phone = 'Test 3' WHERE id = 8;


DELETE FROM Contacts WHERE id > 5;

