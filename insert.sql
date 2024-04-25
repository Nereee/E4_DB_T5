-- Musikariaren taularako datuak
	insert into musikaria (izenArtistikoa, irudia, ezaugarria) values 
	('Beyoncé', 'beyonce.jpg', 'Bakarlaria'),
	('Ed Sheeran', 'ed_sheeran.jpg', 'Bakarlaria'),
	('Rosalía', 'rosalia.jpg', 'Bakarlaria'),
	('Alejandro Sanz', 'alejandro_sanz.jpg', 'Bakarlaria'),
	('Pablo Alborán', 'pablo_alboran.jpg', 'Bakarlaria'),
	('Drake', 'drake.jpg', 'Bakarlaria'),
	('David Bisbal', 'david_bisbal.jpg', 'Bakarlaria'),
	('Eminem', 'eminem.jpg', 'Bakarlaria'),
	('Coldplay', 'coldplay.jpg', 'taldea'),
	('Estopa', 'estopa.jpg', 'taldea');

	-- Podcasteraren taularako datuak
	insert into podcaster (izenArtistikoa, irudia) values 
	('Latin Musika Podcasta', 'musika_latina.jpg'),
	('10 Minutuko Zientzia', 'zientzia_10_minutu.jpg'),
	('Misterio Historiak', 'misterio_historiak.jpg'),
	('Sukaldean Erraz eta Ondo', 'sukaldea_erraza.jpg'),
	('Filosofia Elkarrizketak', 'filosofia_elkarrizketak.jpg'),
	('Espazioan Abenturak', 'espazioa_abenturak.jpg'),
	('Finantza Pertsonalak', 'finantza_pertsonalak.jpg'),
	('Zinemaren Podcasta', 'podcast_zinema.jpg'),
	('Idazleen Elkarrizketak', 'idazle_elkarrizketak.jpg'),
	('Meditazioaren Podcasta', 'yoga_meditazioa.jpg');
    
	-- Hizkuntzaren taularako datuak
	insert into hizkuntza (idHizkuntza, deskribapena) values 
	('ES', 'Espainiera'),
	('EU', 'Euskara'),
	('EN', 'Ingelesa'),
	('FR', 'Frantsesa');

	-- Audioaren taularako datuak Exce-etik inportatu

    
	-- Bezeroaren taularako datuak
	insert into bezero (izena, abizena, hizkuntza, erabiltzailea, pasahitza, jaiotzeData, erregistroData, mota) values 
	('Frodo', 'Baggins', 'EN', 'frodo123', 'frodopass', '1990-07-19', '2020-01-15', 'Premium'),
	('Gollum', 'Smeagol', 'ES', 'gollum', 'myprecious', '1978-05-03', '2020-02-20', 'Free'),
    ('Juan', 'Martínez', 'ES', 'juanmar', 'Juanma123', '1980-08-12', '2020-06-25', 'Premium'),
	('María', 'García', 'ES', 'mariag', '123456', '1975-03-17', '2020-07-30', 'Free'),
	('Pablo', 'López', 'ES', '1', '1', '1988-11-28', '2020-08-05', 'Free');
    

	-- Premiumaren taularako datuak
	insert into premium (idBezero, iraungitzeData) values 
	(1, "2025-01-15"),
    (3, "2026-06-25");
    

	-- Podcastaren taularako datuak
	/*insert into podcast (idAudio, kolaboratzaileak, idPodcaster) values */


	-- Albumaren taularako datuak
	insert into album (izenburua, urtea, generoa, idMusikaria) values 
	("Lemonade","2016-01-01","R&B​​​/pop",1),
    ("÷","2017-01-01","pop",2),
    ("Motomami","2022-01-01","pop/reguetón",3),
    ("Más","1997-01-01","pop",4),
    ("Tanto	","2012-01-01","pop",5),
    ("For All the Dogs","2023-01-01","hip-hop/rap",6),
    ("Buleria","2004-01-01","pop",7),
	("Encore","2004-01-01","hip-hop/rap",8),
    ("X&Y","2005-01-01","rock",9),
    ("Fuego","2019-01-01","pop",10);
                   
   
select izenburua, year(urtea), count(idAudio)
from album al join abestia ab  
where al.idAlbum = ab.idAlbum
group by izenburua, urtea;

	-- Abestiaren taularako datuak
	insert into abestia (idAudio, idAlbum) values
    (4,1),
    (5,1),
    (6,1),
    (7,1),
    (8,1);

	-- Playlistaren taularako datuak
	insert into playlist (izenburua, sorreraData, idBezero) values ;
	
	-- PlaylistAbestiak taularako datuak
	#insert into playlistAbestiak (idAudio, idList) values 

	-- Gustokoak taularako datuak
	#insert into gustokoak (idBezero, idAudio) values 

	-- Erreprodukzioak taularako datuak
	#insert into erreprodukzioak (idBezero, idAudioa, errepData) values 
    
insert into abestia(idAudio,idAlbum) values
(1,1),
(2,1),
(3,1),
(4,2);

insert into playlist (sorreraData, idBezero) values 
("2020-02-02",1);

select izenburua,year(urtea),count(idAudio)
 from album join abestia using(idAlbum)
 join audioa using(idAudio)
 where idMusikaria = 1
 group by izenburua, urtea;
 
INSERT INTO erreprodukzioak (idBezero, idAudioa, errepData)
VALUES (1, 11, '2023-11-11 00:02:00' );

INSERT INTO erreprodukzioak (idBezero, idAudioa, errepData)
VALUES (2, 12, '2023-12-12 00:02:00');

INSERT INTO erreprodukzioak (idBezero, idAudioa, errepData)
VALUES (3, 13, '2024-01-13 00:02:00');

INSERT INTO erreprodukzioak (idBezero, idAudioa, errepData)
VALUES (4, 14, '2024-02-14 00:02:00');

INSERT INTO erreprodukzioak (idBezero, idAudioa, errepData)
VALUES (5, 15, '2024-03-15 00:02:00');

INSERT INTO erreprodukzioak (idBezero, idAudioa, errepData)
VALUES (1, 16, '2024-04-16 00:02:00');

INSERT INTO erreprodukzioak (idBezero, idAudioa, errepData)
VALUES (2, 17, '2024-05-17 00:02:00');

INSERT INTO erreprodukzioak (idBezero, idAudioa, errepData)
VALUES (3, 18, '2024-06-18 00:02:00');

INSERT INTO erreprodukzioak (idBezero, idAudioa, errepData)
VALUES (4, 19, '2024-07-19 00:02:00');

INSERT INTO erreprodukzioak (idBezero, idAudioa, errepData)
VALUES (5, 20, '2024-08-20 00:02:00');

INSERT INTO erreprodukzioak (idBezero, idAudioa, errepData)
VALUES (1, 21, '2024-09-21 00:02:00');

INSERT INTO erreprodukzioak (idBezero, idAudioa, errepData)
VALUES (2, 22, '2024-10-22 00:02:00');

INSERT INTO erreprodukzioak (idBezero, idAudioa, errepData)
VALUES (3, 23, '2024-11-23 00:02:00');

INSERT INTO erreprodukzioak (idBezero, idAudioa, errepData)
VALUES (4, 24, '2024-12-24 00:02:00');

INSERT INTO erreprodukzioak (idBezero, idAudioa, errepData)
VALUES (5, 25, '2025-01-25 00:02:00');

INSERT INTO erreprodukzioak (idBezero, idAudioa, errepData)
VALUES (1, 26, '2025-02-26 00:02:00');

INSERT INTO erreprodukzioak (idBezero, idAudioa, errepData)
VALUES (2, 27, '2025-03-27 00:02:00');

INSERT INTO erreprodukzioak (idBezero, idAudioa, errepData)
VALUES (2, 27, '2025-03-27 00:02:00');

INSERT INTO erreprodukzioak (idBezero, idAudioa, errepData)
VALUES (3, 28, '2025-04-28 00:02:00');

INSERT INTO erreprodukzioak (idBezero, idAudioa, errepData)
VALUES (4, 29, '2025-05-29 00:02:00');

INSERT INTO erreprodukzioak (idBezero, idAudioa, errepData)
VALUES (5, 30, '2025-06-30 00:02:00');



