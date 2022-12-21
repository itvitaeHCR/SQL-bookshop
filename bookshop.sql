DROP TABLE IF EXISTS Winkel;
DROP TABLE IF EXISTS Auteur;
DROP TABLE IF EXISTS Uitgever;
DROP TABLE IF EXISTS Boek;
DROP TABLE IF EXISTS Account;
DROP TABLE IF EXISTS Voorraad;
DROP TABLE IF EXISTS Cart;
DROP TABLE IF EXISTS Item;


CREATE TABLE Winkel (
	filiaalnr	INTEGER 		NOT NULL UNIQUE,
	adres   	VARCHAR(255) 	NOT NULL,
	plaats  	VARCHAR(255) 	NOT NULL,
	telnr		INTEGER 		NOT NULL,
	Primary Key	(filiaalnr)
);

CREATE TABLE Auteur (
	id 			INTEGER 		NOT NULL UNIQUE,
	naam		VARCHAR(255) 	NOT NULL,
	url			VARCHAR(255) 	NOT NULL,
	PRIMARY KEY	(id)
);

CREATE TABLE Uitgever (
	id 			INTEGER 		NOT NULL UNIQUE,
	naam		VARCHAR(255) 	NOT NULL,
	adres   	VARCHAR(255) 	NOT NULL,
	plaats  	VARCHAR(255) 	NOT NULL,
	telnr		INTEGER 		NOT NULL,
	url			VARCHAR(255) 	NOT NULL,
	PRIMARY KEY	(id)
);

CREATE TABLE Boek (
	ISBN		INTEGER			NOT NULL,
	titel		VARCHAR(255)	NOT NULL,
	uitgavejaar	INTEGER 		NOT NULL,
	prijs		INTEGER 		NOT NULL,
	PRIMARY KEY	(ISBN),
	FOREIGN KEY	(AuteurId) 		REFERENCES Auteur(id),
	FOREIGN KEY	(UitgeverId) 	REFERENCES Uitgever(id)
);

CREATE TABLE Account (
	email		VARCHAR(255) 	NOT NULL UNIQUE,
	naam		VARCHAR(255) 	NOT NULL,
	adres   	VARCHAR(255) 	NOT NULL,
	plaats  	VARCHAR(255) 	NOT NULL,
	telnr		INTEGER,
	PRIMARY KEY	(email)
);

CREATE TABLE Voorraad (
	id  		INTEGER 		NOT NULL UNIQUE,
	aantal		INTEGER 		NOT NULL,
	PRIMARY KEY	(id),
	FOREIGN KEY	(WinkelFilnr)	REFERENCES	Winkel(filiaalnr),
	FOREIGN KEY	(BoekISBN)		REFERENCES	Boek(ISBN)
);

CREATE TABLE Cart (
	bestelnr	INTEGER 		NOT NULL UNIQUE,
	PRIMARY KEY	(bestelnr),
	FOREIGN KEY	(AccountEmail) 	REFERENCES Account(email)
);

CREATE TABLE Item (
	id 			INTEGER			NOT NULL UNIQUE,
	aantal      INTEGER			NOT NULL,
	PRIMARY KEY	(id),
	FOREIGN KEY	(BoekISBN)		REFERENCES	Boek(ISBN),
	FOREIGN KEY	(CartBestelnr)	REFERENCES Cart(bestelnr)
);

INSERT INTO Winkel		VALUES	(1, 'Rokin 9',			'Amsterdam',	0205231481	);
INSERT INTO Winkel		VALUES	(2, 'Oudegracht 112-b',	'Utrecht',		0302335200	);
INSERT INTO Winkel		VALUES	(3, 'Coolsingel 129',	'Den Haag',		0104132070	);
INSERT INTO Winkel		VALUES	(4, 'Kerkstraat 27',	'Den Bosch',	0733020100	);

INSERT INTO Accout		VALUES	('a_devries@adelaarsnest.nl',	'Arend de Vries',	'Adelaarsnest 12',	'Haarlem',	0612345678	);
INSERT INTO Accout		VALUES	('bboer@boeren.nl,',			'Bert Boer',		'Mesthoop 1',		'Dorp',		0623456789	);
INSERT INTO Accout		VALUES	(email,naam,adres,plaats,telnr);