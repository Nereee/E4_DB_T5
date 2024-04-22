	/*JON OLANDA*/

	drop database if exists db_spotify5;
	create database db_spotify5 collate utf8_spanish2_ci;
	use db_spotify5;

	create table musikaria(
	idMusikaria varchar(5) primary key,
	izenArtiztikoa varchar(30) not null unique,
	irudia text,
	ezaugarria ENUM('Bakarlaria', 'Taldea') not null 
	);

	create table podcaster(
	idPodcaster varchar(5) primary key,
	izenArtiztikoa varchar(30) not null unique,
	irudia text
	);

	create table hizkuntza(
	idHizkuntza	ENUM('ES','EU','EN','FR','DE','CA','GA','AR') primary key,
	deskribapena varchar(30)
	);

	/*Audia BLOB bezala gordeko dut*/

	create table audioa(
	idAudio int primary key auto_increment,
	izena varchar(15) not null,
	iraupena float not null,
	irudia text,
	mota ENUM('Abestia', 'Podcast'),
	mp3 blob not null
	);

	create table bezero(
	idBezero varchar(5) primary key,
	izena varchar(15) not null,
	abizena varchar(15) not null,
	hizkuntza ENUM('ES','EU','EN','FR','DE','CA','GA','AR'),
	erabiltzailea varchar(25) not null,
	pasahitza varchar(15) not null,
	jaiotzeData date not null,
	erregistroData date not null,
	mota ENUM('Premium','Free'),
	foreign key (hizkuntza) references hizkuntza(idHizkuntza)
	);

	create table premium(
	idBezero varchar(5) primary key,
	iraungitzeData date not null,
	foreign key (idBezero) references bezero(idBezero) ON DELETE CASCADE ON UPDATE CASCADE
	);

	create table podcast(
	idAudio int primary key,
	kolaboratzaileak varchar(100),
	idPodcaster varchar(5),
	foreign key (idAudio) references audioa(idAudio) ON DELETE CASCADE ON UPDATE CASCADE,
	foreign key (idPodcaster) references podcaster(idPodcaster) ON DELETE CASCADE ON UPDATE CASCADE
	);

	create table album(
	idAlbum varchar(5) primary key,
	izenburua varchar(25) not null,
	urtea date not null,
	generoa varchar(15) not null,
	idMusikaria varchar(5) not null,
	foreign key(idMusikaria) references musikaria(idMusikaria) ON DELETE CASCADE ON UPDATE CASCADE
	);

	create table abestia(
	idAudio int primary key,
	idAlbum varchar(5) not null,
	foreign key (idAudio) references audioa(idAudio) ON DELETE CASCADE ON UPDATE CASCADE,
	foreign key (idAlbum) references album(idAlbum) ON DELETE CASCADE ON UPDATE CASCADE
	);

	create table playlist(
	idList varchar(5) primary key,
	izenburua varchar(15) not null,
	sorreraData date not null,
	idBezero varchar(5),
	foreign key (idBezero) references bezero(idBezero) ON DELETE CASCADE ON UPDATE CASCADE
	);

	create table playlistAbestiak(
	idAudio int,
	idList varchar(5),
	foreign key (idList) references playlist(idList) ON DELETE CASCADE ON UPDATE CASCADE,
	foreign key (idAudio) references audioa(idAudio) ON DELETE CASCADE ON UPDATE CASCADE,
	primary key(idList, idAudio)
	);

	create table gustokoak(
	idBezero varchar(5) ,
	idAudio int,
	foreign key (idBezero) references bezero(idBezero) ON DELETE CASCADE ON UPDATE CASCADE,
	foreign key (idAudio) references audioa(idAudio) ON DELETE CASCADE ON UPDATE CASCADE,
	primary key(idBezero, idAudio)
	);

	create table erreprodukzioak(
	idBezero varchar(5),
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
	insert into musikaria (idMusikaria, izenArtiztikoa, irudia, ezaugarria) values 
	('M001', 'Bilbo Baggins', 'bilbo.jpg', 'Taldea'),
	('M002', 'Gandalf', 'gandalf.jpg', 'Bakarlaria'),
	('M003', 'Legolas', 'legolas.jpg', 'Bakarlaria');

	-- Podcasteraren taularako datuak
	insert into podcaster (idPodcaster, izenArtiztikoa, irudia) values 
	('P001', 'Frodo Baggins', 'frodo.jpg'),
	('P002', 'Aragorn', 'aragorn.jpg');

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
	insert into bezero (idBezero, izena, abizena, hizkuntza, erabiltzailea, pasahitza, jaiotzeData, erregistroData, mota) values 
	('B001', 'Frodo', 'Baggins', 'EN', 'frodo123', 'frodopass', '1990-07-19', '2020-01-15', 'Premium'),
	('B002', 'Gollum', 'Smeagol', 'ES', 'gollum', 'myprecious', '1978-05-03', '2020-02-20', 'Free');

	-- Premiumaren taularako datuak
	insert into premium (idBezero, iraungitzeData) values 
	('B001', '2025-01-15');

	-- Podcastaren taularako datuak
	insert into podcast (idAudio, kolaboratzaileak, idPodcaster) values 
	(3, 'Gimli, Samwise', 'P001');

	-- Albumaren taularako datuak
	insert into album (idAlbum, izenburua, urtea, generoa, idMusikaria) values 
	('AL001', 'El Señor de los Anillos', '2001-12-19', 'Banda Sonora', 'M001'),
	('AL002', 'Las Dos Torres', '2002-12-18', 'Banda Sonora', 'M001');

	-- Abestiaren taularako datuak
	insert into abestia (idAudio, idAlbum) values 
	(1, 'AL001'),
	(2, 'AL002');

	-- Playlistaren taularako datuak
	insert into playlist (idList, izenburua, sorreraData, idBezero) values 
	('PL001', 'Nire Gogokoak', '2024-04-15', 'B001'),
	('PL002', 'Bidaia Lista', '2024-04-16', 'B002');

	-- PlaylistAbestiak taularako datuak
	insert into playlistAbestiak (idAudio, idList) values 
	(1, 'PL001'),
	(2, 'PL001'),
	(1, 'PL002');

	-- Gustokoak taularako datuak
	insert into gustokoak (idBezero, idAudio) values 
	('B001', 1),
	('B001', 2),
	('B002', 1);

	-- Erreprodukzioak taularako datuak
	insert into erreprodukzioak (idBezero, idAudioa, errepData) values 
	('B001', 1, '2024-04-15 10:30:00'),
	('B001', 2, '2024-04-15 11:45:00'),
	('B002', 1, '2024-04-16 09:00:00');
    
/*
delete from album where idAlbum = 'AL001';
update album 
set idAlbum = 'AA'
where idAlbum ='AL002';
*/
