create database if not exists negoziomanga;

use negoziomanga;

create table if not exists utenti
(	Id_Utente int AUTO_INCREMENT,
	nome varchar(500),
	cognome varchar(500),
	email varchar(500) unique,
	password varchar(150),
	ruolo varchar(5) default 'user' check (ruolo in ('user','admin')),
	PRIMARY KEY (Id_Utente)
);

create table if not exists serie
(	Id_Serie int AUTO_INCREMENT,
	nome varchar(1000),
	volumitotali int,
	stato varchar(10) check (stato in ('completa','incorso')), 
	PRIMARY KEY (Id_Serie)
);

create table if not exists prodotti
(	Id_Prodotto int AUTO_INCREMENT,
	Id_Serie int,
	nome varchar(1000),
	nvol int,
	stato varchar(20) check (stato in ('disponibile','nondisponibile')),
	quantità int,
	datapubblicazione DATE,
	descrizione varchar(5000),
	src_image varchar(1000),
	prezzo DOUBLE,
	PRIMARY KEY (Id_Prodotto),
	FOREIGN KEY (Id_Serie) REFERENCES serie(Id_Serie)
);

create table if not exists recapiti
(	Id_Recapito int AUTO_INCREMENT,
	Id_Utente int,
	ncivico varchar(10),
	via varchar(1000),
	città varchar(1000),
	provincia varchar(1000),
	cap int,
	telefono varchar(20),
	note varchar(5000),
	stato varchar(20) default 'attivato' check (stato in ('attivato','disattivato')),
	PRIMARY KEY (Id_Recapito),
	FOREIGN KEY (Id_Utente) REFERENCES utenti(Id_Utente)
);

create table if not exists carrello
(	Id_Utente int,
	Id_Prodotto int, 
	quantità int,
	PRIMARY KEY (Id_Utente, Id_Prodotto),
	FOREIGN KEY (Id_Utente) REFERENCES utenti(Id_Utente),
	FOREIGN KEY (Id_Prodotto) REFERENCES prodotti(Id_Prodotto)
);

create table if not exists acquisti
(	Id_Acquisto int,
	Id_Utente int,
	Id_Prodotto int, 
	quantità int,
	dataacquisto date,
	prezzo DOUBLE,
	PRIMARY KEY (Id_Acquisto, Id_Prodotto),
	FOREIGN KEY (Id_Utente) REFERENCES utenti(Id_Utente),
	FOREIGN KEY (Id_Prodotto) REFERENCES prodotti(Id_Prodotto)
);
