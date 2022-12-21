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
	PRIMARY KEY	(filiaalnr)
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
	auteurId	INTEGER,
	uitgeverId	INTEGER,
	PRIMARY KEY	(ISBN)
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
	winkelFilnr	INTEGER,
	boekISBN	INTEGER,
	PRIMARY KEY	(id)
);

CREATE TABLE Cart (
	bestelnr	INTEGER 		NOT NULL UNIQUE,
	accountEmail VARCHAR(255),
	PRIMARY KEY	(bestelnr)
);

CREATE TABLE Item (
	id 			INTEGER			NOT NULL UNIQUE,
	aantal      INTEGER			NOT NULL,
	boekISBN	INTEGER,
	cartBestelnr INTEGER,
	PRIMARY KEY	(id)
);


ALTER TABLE Boek 		ADD CONSTRAINT FK_AuteurId 		FOREIGN KEY (auteurId) 		REFERENCES Auteur(id);
ALTER TABLE Boek 		ADD CONSTRAINT FK_UitgeverId 	FOREIGN KEY (uitgeverId) 	REFERENCES Uitgever(id);

ALTER TABLE Voorraad	ADD CONSTRAINT FK_WinkelFilnr	FOREIGN KEY (winkelFilnr)	REFERENCES Winkel(filiaalnr);
ALTER TABLE Voorraad	ADD CONSTRAINT FK_BoekISBN		FOREIGN KEY (boekISBN)		REFERENCES Boek(ISBN);

ALTER TABLE Cart		ADD CONSTRAINT FK_AccountEmail	FOREIGN KEY (accountEmail)	REFERENCES Account(email);

ALTER TABLE Item		ADD CONSTRAINT FK_BoekISBN_Item FOREIGN KEY	(boekISBN)		REFERENCES Boek(ISBN);
ALTER TABLE Item		ADD CONSTRAINT FK_CartBestelnr	FOREIGN KEY (cartBestelnr)	REFERENCES Cart(bestelnr);


INSERT INTO Winkel		VALUES	(1, 'Rokin 9',			'Amsterdam',	0205231481	);
INSERT INTO Winkel		VALUES	(2, 'Oudegracht 112-b',	'Utrecht',		0302335200	);
INSERT INTO Winkel		VALUES	(3, 'Coolsingel 129',	'Den Haag',		0104132070	);
INSERT INTO Winkel		VALUES	(4, 'Kerkstraat 27',	'Den Bosch',	0733020100	);

INSERT INTO Account		VALUES	('a_devries@adelaarsnest.nl',	'Arend de Vries',	'Adelaarsnest 12',	'Haarlem',	0612345678	);
INSERT INTO Account		VALUES	('bboer@boeren.nl,',			'Bert Boer',		'Mesthoop 1',		'Dorp',		0623456789	);
INSERT INTO Account		VALUES	('c_kordaat@gmail.com',			'Cornelis Kordaat',	'Kerkstraat 11', 	'Utrecht', 	0634567890 	);

INSERT INTO Auteur		VALUES	(10,	'Auteur 1',	'auteur1.wikipedia.com');
INSERT INTO Auteur		VALUES	(20,	'Auteur 2',	'auteur2.wikipedia.com');
INSERT INTO Auteur		VALUES	(30,	'Auteur 3',	'auteur3.wikipedia.com');
INSERT INTO Auteur		VALUES	(40,	'Auteur 4',	'auteur4.wikipedia.com');
INSERT INTO Auteur		VALUES	(50,	'Auteur 5',	'auteur5.wikipedia.com');
INSERT INTO Auteur		VALUES	(60,	'Auteur 6',	'auteur6.wikipedia.com');

INSERT INTO Uitgever	VALUES	(200,	'Uitgever 1',	'straatweg 1',	'Vlissingen',	0118886886,	'uitgeverij1.wikipedia.nl');
INSERT INTO Uitgever	VALUES	(220,	'Uitgever 2',	'straatweg 2',	'Vlissingen',	0118886887,	'uitgeverij2.wikipedia.nl');
INSERT INTO Uitgever	VALUES	(240,	'Uitgever 3',	'straatweg 3',	'Vlissingen',	0118886888,	'uitgeverij3.wikipedia.nl');
INSERT INTO Uitgever	VALUES	(260,	'Uitgever 4',	'straatweg 4',	'Vlissingen',	0118886889,	'uitgeverij4.wikipedia.nl');
INSERT INTO Uitgever	VALUES	(280,	'Uitgever 5',	'straatweg 5',	'Vlissingen',	0118886880,	'uitgeverij5.wikipedia.nl');

INSERT INTO Boek		VALUES	(0001,	'Titel 1',	2000, 	12,	10,		220);
INSERT INTO Boek		VALUES	(0002,	'Titel 2',	2010, 	10,	20,		220);
INSERT INTO Boek		VALUES	(0003,	'Titel 3',	2013, 	15,	30,		240);
INSERT INTO Boek		VALUES	(0004,	'Titel 4',	2001, 	20,	40,		240);
INSERT INTO Boek		VALUES	(0005,	'Titel 5',	1967, 	63,	50,		260);
INSERT INTO Boek		VALUES	(0006,	'Titel 6',	2017, 	6,	60,		260);
INSERT INTO Boek		VALUES	(0007,	'Titel 7',	1958, 	19,	10,		280);
INSERT INTO Boek		VALUES	(0008,	'Titel 8',	2003, 	36,	20,		280);
INSERT INTO Boek		VALUES	(0009,	'Titel 9',	1949, 	9,	30,		200);
INSERT INTO Boek		VALUES	(0010,	'Titel 10',	2020, 	44,	50,		200);

INSERT INTO Voorraad	VALUES	(10001,	20,	1, 0001);
INSERT INTO Voorraad	VALUES	(20001,	20,	2, 0001);
INSERT INTO Voorraad	VALUES	(30001,	20,	3, 0001);
INSERT INTO Voorraad	VALUES	(40001,	20,	4, 0001);

INSERT INTO Voorraad	VALUES	(10002,	25,	1, 0002);
INSERT INTO Voorraad	VALUES	(20002,	25,	2, 0002);
INSERT INTO Voorraad	VALUES	(30002,	25,	3, 0002);
INSERT INTO Voorraad	VALUES	(40002,	25,	4, 0002);

INSERT INTO Voorraad	VALUES	(10003,	30,	1, 0003);
INSERT INTO Voorraad	VALUES	(20003,	30,	2, 0003);
INSERT INTO Voorraad	VALUES	(30003,	30,	3, 0003);
INSERT INTO Voorraad	VALUES	(40003,	30,	4, 0003);

INSERT INTO Voorraad	VALUES	(10004,	35,	1, 0004);
INSERT INTO Voorraad	VALUES	(20004,	35,	2, 0004);
INSERT INTO Voorraad	VALUES	(30004,	35,	3, 0004);
INSERT INTO Voorraad	VALUES	(40004,	35,	4, 0004);

INSERT INTO Voorraad	VALUES	(10005,	40,	1, 0005);
INSERT INTO Voorraad	VALUES	(20005,	40,	2, 0005);
INSERT INTO Voorraad	VALUES	(30005,	40,	3, 0005);
INSERT INTO Voorraad	VALUES	(40005,	40,	4, 0005);

INSERT INTO Voorraad	VALUES	(10006,	45,	1, 0006);
INSERT INTO Voorraad	VALUES	(20006,	45,	2, 0006);
INSERT INTO Voorraad	VALUES	(30006,	45,	3, 0006);
INSERT INTO Voorraad	VALUES	(40006,	45,	4, 0006);

INSERT INTO Voorraad	VALUES	(10007,	50,	1, 0007);
INSERT INTO Voorraad	VALUES	(20007,	50,	2, 0007);
INSERT INTO Voorraad	VALUES	(30007,	50,	3, 0007);
INSERT INTO Voorraad	VALUES	(40007,	50,	4, 0007);

INSERT INTO Voorraad	VALUES	(10008,	55,	1, 0008);
INSERT INTO Voorraad	VALUES	(20008,	55,	2, 0008);
INSERT INTO Voorraad	VALUES	(30008,	55,	3, 0008);
INSERT INTO Voorraad	VALUES	(40008,	55,	4, 0008);

INSERT INTO Voorraad	VALUES	(10009,	60,	1, 0009);
INSERT INTO Voorraad	VALUES	(20009,	60,	2, 0009);
INSERT INTO Voorraad	VALUES	(30009,	60,	3, 0009);
INSERT INTO Voorraad	VALUES	(40009,	60,	4, 0009);

INSERT INTO Voorraad	VALUES	(10010,	65,	1, 0010);
INSERT INTO Voorraad	VALUES	(20010,	65,	2, 0010);
INSERT INTO Voorraad	VALUES	(30010,	65,	3, 0010);
INSERT INTO Voorraad	VALUES	(40010,	65,	4, 0010);

	id  		INTEGER 		NOT NULL UNIQUE,
	aantal		INTEGER 		NOT NULL,
	winkelFilnr	INTEGER,
	boekISBN	INTEGER,