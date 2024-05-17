/*5 TALDEA*/

	drop database if exists db_spotify5;
	create database db_spotify5 collate utf8_spanish2_ci;
	use db_spotify5;


	create table musikaria(
	idMusikaria int auto_increment primary key,
	izenArtistikoa varchar(30) not null unique,
	irudia longblob,
	ezaugarria ENUM('Bakarlaria', 'Taldea') not null,
    deskribapena varchar(1000)
	);

	create table podcaster(
	idPodcaster int auto_increment primary key,
	izenArtistikoa varchar(30) not null unique,
	irudia longblob,
    deskribapena varchar(1000)
	);

	create table hizkuntza(
	idHizkuntza	ENUM('ES','EU','EN','FR','DE','CA','GA','AR') primary key,
	deskribapena varchar(30)
	);

	/*Audia BLOB bezala gordeko dut*/

	create table audioa(
	idAudio int primary key auto_increment,
	izena varchar(50) not null,
	iraupena float not null,
	irudia longblob,
	mota ENUM('Abestia', 'Podcast')
	);

	create table bezero(
	idBezero int auto_increment primary key,
	izena varchar(15) not null,
	abizena varchar(15) not null,
	hizkuntza ENUM('ES','EU','EN','FR','DE','CA','GA','AR'),
	erabiltzailea varchar(25) not null unique ,
	pasahitza varchar(15) not null,
	jaiotzeData date not null,
	erregistroData date not null,
	mota ENUM('Premium','Free'),
	foreign key (hizkuntza) references hizkuntza(idHizkuntza) on delete set null on update cascade
	);

	create table premium(
	idBezero int primary key,
	iraungitzeData date not null,
	foreign key (idBezero) references bezero(idBezero) ON DELETE CASCADE ON UPDATE CASCADE
	);

	create table podcast(
	idAudio int primary key,
	kolaboratzaileak varchar(50),
	idPodcaster int,
	foreign key (idAudio) references audioa(idAudio) ON DELETE CASCADE ON UPDATE CASCADE,
	foreign key (idPodcaster) references podcaster(idPodcaster) ON DELETE CASCADE ON UPDATE CASCADE
	);

	create table album(
	idAlbum int auto_increment primary key,
	izenburua varchar(50) not null,
	urtea int not null,
	generoa varchar(30) not null,
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
	idList int auto_increment primary key,
	sorreraData date not null,
	idBezero int,
    izena varchar(30),
	foreign key (idBezero) references bezero(idBezero) ON DELETE CASCADE ON UPDATE CASCADE
	);

	create table playlistAbestiak(
	idAudio int,
	idList int,
    primary key(idList, idAudio),
	foreign key (idList) references playlist(idList) ON DELETE CASCADE ON UPDATE CASCADE,
	foreign key (idAudio) references audioa(idAudio) ON DELETE CASCADE ON UPDATE CASCADE
	);

	create table gustokoak(
	idBezero int ,
	idAudio int,
    primary key(idBezero, idAudio),
	foreign key (idBezero) references bezero(idBezero)on delete  cascade on update cascade,
	foreign key (idAudio) references audioa(idAudio) ON DELETE CASCADE ON UPDATE CASCADE
	);

	create table erreprodukzioak(
	idBezero int,
	idAudioa int,
	errepData datetime,
	primary key(idBezero,idAudioa,errepData),
	foreign key (idBezero) references bezero(idBezero) on delete cascade on update cascade,
	foreign key (idAudioa) references audioa(idAudio) ON DELETE CASCADE ON UPDATE CASCADE
	);
    
    create table notifikatuGmailez(
    idBezero int,
    premiumMugaData date,
    primary key(idBezero, premiumMugaData),
    foreign key(idBezero) references bezero(idBezero) on Delete cascade on update cascade
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