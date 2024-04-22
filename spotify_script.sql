	/*JON OLANDA*/

	drop database if exists db_spotify5;
	create database db_spotify5 collate utf8_spanish2_ci;
	use db_spotify5;

	create table musikaria(
	idMusikaria int primary key auto_increment,
	izenArtiztikoa varchar(30) not null unique,
	irudia text,
	ezaugarria ENUM('Bakarlaria', 'Taldea') not null, 
    deskribapena varchar(100) not null
	);

	create table podcaster(
	idPodcaster  int primary key auto_increment,
	izenArtiztikoa varchar(30) not null unique,
	irudia text, 
    deskribapena varchar(100) not null
	);

	create table hizkuntza(
	idHizkuntza	ENUM('ES','EU','EN','FR','DE','CA','GA','AR') primary key,
	deskribapena varchar(30) not null
	);

	/*Audia BLOB bezala gordeko dut*/

	create table audioa(
	idAudio int primary key auto_increment,
	izena varchar(15) not null,
	iraupena time not null,
	irudia text,
	mota ENUM('Abestia', 'Podcast'),
	mp3 blob not null
	);

	create table bezero(
	idBezero int primary key auto_increment,
	izena varchar(15) not null,
	abizena varchar(15) not null,
	hizkuntza ENUM('ES','EU','EN','FR','DE','CA','GA','AR'),
	erabiltzailea varchar(25) not null unique,
	pasahitza varchar(15) not null,
	jaiotzeData date not null,
	erregistroData date not null,
	mota ENUM('Premium','Free'),
	foreign key (hizkuntza) references hizkuntza(idHizkuntza)
	);

	create table premium(
	idBezero int primary key,
	iraungitzeData date not null,
	foreign key (idBezero) references bezero(idBezero) ON DELETE CASCADE ON UPDATE CASCADE
	);

	create table podcast(
	idAudio int primary key,
	kolaboratzaileak varchar(100),
	idPodcaster int,
	foreign key (idAudio) references audioa(idAudio) ON DELETE CASCADE ON UPDATE CASCADE,
	foreign key (idPodcaster) references podcaster(idPodcaster) ON DELETE CASCADE ON UPDATE CASCADE
	);

	create table album(
	idAlbum int primary key auto_increment,
	izenburua varchar(25) not null,
	urtea date not null,
	generoa varchar(15) not null,
	idMusikaria int not null,
	foreign key(idMusikaria) references musikaria(idMusikaria) ON DELETE CASCADE ON UPDATE CASCADE
	);

	create table abestia(
	idAudio int primary key,
	idAlbum int not null,
	foreign key (idAudio) references audioa(idAudio) ON DELETE CASCADE ON UPDATE CASCADE,
	foreign key (idAlbum) references album(idAlbum) ON DELETE CASCADE ON UPDATE CASCADE
	);

	create table playlist(
	idList int primary key auto_increment,
	izenburua varchar(15) not null,
	sorreraData date not null,
	idBezero int,
	foreign key (idBezero) references bezero(idBezero) ON DELETE CASCADE ON UPDATE CASCADE
	);
	
	create table playlistAbestiak(
	idAudio int,
	idList int,
	foreign key (idList) references playlist(idList) ON DELETE CASCADE ON UPDATE CASCADE,
	foreign key (idAudio) references audioa(idAudio) ON DELETE CASCADE ON UPDATE CASCADE,
	primary key(idList, idAudio)
	);

	create table gustokoak(
	idBezero int ,
	idAudio int,
	foreign key (idBezero) references bezero(idBezero) ON DELETE CASCADE ON UPDATE CASCADE,
	foreign key (idAudio) references audioa(idAudio) ON DELETE CASCADE ON UPDATE CASCADE,
	primary key(idBezero, idAudio)
	);

	create table erreprodukzioak(
	idBezero int,
	idAudioa int,
	errepData datetime,
	foreign key (idBezero) references bezero(idBezero) ON DELETE CASCADE ON UPDATE CASCADE,
	foreign key (idAudioa) references audioa(idAudio) ON DELETE CASCADE ON UPDATE CASCADE,
	primary key(idBezero,idAudioa,errepData)
	);

	create table estatistikak(
	idAudio int primary key,
	/*BETETZEKO*/
	#1.
	#2.
	#3.
	#4.
	foreign key (idAudio) references audioa(idAudio)
	);

	

	-- Musikariaren taularako datuak
	insert into musikaria ( izenArtiztikoa, irudia, ezaugarria,deskribapena) values 
	( 'Bilbo Baggins', 'bilbo.jpg', 'Taldea','Oso onak'),
	( 'Gandalf', 'gandalf.jpg', 'Bakarlaria','Modernoak'),
	( 'Legolas', 'legolas.jpg', 'Bakarlaria','Bizia jarraitzen');

	-- Podcasteraren taularako datuak
	insert into podcaster ( izenArtiztikoa, irudia,deskribapena) values 
	( 'Frodo Baggins', 'frodo.jpg','Podcast interesgarria'),
	( 'Aragorn', 'aragorn.jpg','Interesgarria');

	-- Hizkuntzaren taularako datuak
	insert into hizkuntza (idHizkuntza, deskribapena) values 
	('ES', 'Espainiera'),
	('EU', 'Euskara'),
	('EN', 'Ingelesa'),
	('FR', 'Frantsesa');

	-- Audioaren taularako datuak
	insert into audioa (izena, iraupena, irudia, mota, mp3) values 
	('Abestia1', 4.2, 'abesti1.jpg', 'Abestia', 'MP3 datuak hemen'),
	('Abestia2', 3.8, 'abesti2.jpg', 'Abestia', 'MP3 datuak hemen'),
	('Podcasta1', 25.5, 'podcast1.jpg', 'Podcast', 'MP3 datuak hemen');

	-- Bezeroaren taularako datuak
	insert into bezero ( izena, abizena, hizkuntza, erabiltzailea, pasahitza, jaiotzeData, erregistroData, mota) values 
	('Frodo', 'Baggins', 'EN', 'frodo123', 'frodopass', '1990-07-19', '2020-01-15', 'Premium'),
	('Gollum', 'Smeagol', 'ES', 'gollum', 'myprecious', '1978-05-03', '2020-02-20', 'Free');

	-- Premiumaren taularako datuak
	insert into premium (idBezero, iraungitzeData) values 
	(1, '2025-01-15');

	-- Podcastaren taularako datuak
	insert into podcast (idAudio, kolaboratzaileak, idPodcaster) values 
	(3, 'Gimli, Samwise', 1);

	-- Albumaren taularako datuak
	insert into album ( izenburua, urtea, generoa, idMusikaria) values 
	('El Señor de los Anillos', '2001-12-19', 'Banda Sonora', 1),
	('Las Dos Torres', '2002-12-18', 'Banda Sonora', 1);

	-- Abestiaren taularako datuak
	insert into abestia (idAudio, idAlbum) values 
	(1, 1),
	(2, 1);

	-- Playlistaren taularako datuak
	insert into playlist (izenburua, sorreraData, idBezero) values 
	( 'Nire Gogokoak', '2024-04-15', 1),
	( 'Bidaia Lista', '2024-04-16', 2);

	-- PlaylistAbestiak taularako datuak
	insert into playlistAbestiak (idAudio, idList) values 
	(1, 1),
	(2, 1),
	(1, 2);

	-- Gustokoak taularako datuak
	insert into gustokoak (idBezero, idAudio) values 
	(1, 1),
	(1, 2),
	(2, 1);

	-- Erreprodukzioak taularako datuak
	insert into erreprodukzioak (idBezero, idAudioa, errepData) values 
	(1, 1, '2024-04-15 10:30:00'),
	(1, 2, '2024-04-15 11:45:00'),
	(2, 1, '2024-04-16 09:00:00');
    
    /*
    -- USER erabiltzailea
    create user erabiltzailea@10.5.6.132 identified by '4321';
    
    grant Insert,delete on playlist to erabiltzailea;
    grant Insert,delete on playlistAbestiak to erabiltzailea;
    grant Insert,delete on gustokoak to erabiltzailea;
    grant Insert,delete on premium to erabiltzailea;
    
    drop user erabiltzailea;*/
    select count(izena) from bezero where izena = "frodo" and pasahitza = "frodopass";
    
/*
delete from album where idAlbum = 'AL001';
update album 
set idAlbum = 'AA'
where idAlbum ='AL002';
*/
