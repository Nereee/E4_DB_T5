	/*5 TALDEA*/

	drop database if exists db_spotify5;
	create database db_spotify5 collate utf8_spanish2_ci;
	use db_spotify5;


	create table musikaria(
	idMusikaria int auto_increment primary key,
	izenArtiztikoa varchar(30) not null unique,
	irudia text,
	ezaugarria ENUM('Bakarlaria', 'Taldea') not null 
	);

	create table podcaster(
	idPodcaster int auto_increment primary key,
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
	idBezero int auto_increment primary key,
	izena varchar(15) not null,
	abizena varchar(15) not null,
	hizkuntza ENUM('ES','EU','EN','FR','DE','CA','GA','AR'),
	erabiltzailea varchar(25) not null,
	pasahitza varchar(15) not null,
	jaiotzeData date not null,
	erregistroData date not null,
	mota ENUM('Premium','Free'),
	foreign key (hizkuntza) references hizkuntza(idHizkuntza) ON DELETE CASCADE ON UPDATE CASCADE
	);

	create table premium(
	idBezero int auto_increment primary key,
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
	idAlbum int auto_increment primary key,
	izenburua varchar(25) not null,
	urtea date not null,
	generoa varchar(15) not null,
	idMusikaria int auto_increment not null,
	foreign key(idMusikaria) references musikaria(idMusikaria) ON DELETE CASCADE ON UPDATE CASCADE
	);

	create table abestia(
	idAudio int auto_increment primary key,
	idAlbum int auto_increment not null,
	foreign key (idAudio) references audioa(idAudio) ON DELETE CASCADE ON UPDATE CASCADE,
	foreign key (idAlbum) references album(idAlbum) ON DELETE CASCADE ON UPDATE CASCADE
	);

	create table playlist(
	idList int auto_increment primary key,
	izenburua varchar(15) not null,
	sorreraData date not null,
	idBezero int auto_increment,
	foreign key (idBezero) references bezero(idBezero) ON DELETE CASCADE ON UPDATE CASCADE
	);

	create table playlistAbestiak(
	idAudio int auto_increment,
	idList int auto_increment,
	foreign key (idList) references playlist(idList) ON DELETE CASCADE ON UPDATE CASCADE,
	foreign key (idAudio) references audioa(idAudio) ON DELETE CASCADE ON UPDATE CASCADE,
	primary key(idList, idAudio)
	);

	create table gustokoak(
	idBezero int auto_increment ,
	idAudio int auto_increment,
	foreign key (idBezero) references bezero(idBezero),
	foreign key (idAudio) references audioa(idAudio) ON DELETE CASCADE ON UPDATE CASCADE,
	primary key(idBezero, idAudio)
	);

	create table erreprodukzioak(
	idBezero int auto_increment,
	idAudioa int auto_increment,
	errepData datetime,
	foreign key (idBezero) references bezero(idBezero),
	foreign key (idAudioa) references audioa(idAudio) ON DELETE CASCADE ON UPDATE CASCADE,
	primary key(idBezero,idAudioa,errepData)
	);

	create table estatistikak(
	idAudio int auto_increment primary key,
	/*BETETZEKO*/
	#1.
	#2.
	#3.
	#4.
	foreign key (idAudio) references audioa(idAudio)
	);