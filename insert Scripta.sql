-- Musikariaren taularako datuak
	insert into musikaria (idMusikaria, izenArtiztikoa, irudia, ezaugarria) values 
	('M001', 'Beyoncé', 'beyonce.jpg', 'Bakarlaria'),
	('M002', 'Ed Sheeran', 'ed_sheeran.jpg', 'Bakarlaria'),
	('M003', 'Rosalía', 'rosalia.jpg', 'Bakarlaria'),
	('M004', 'Alejandro Sanz', 'alejandro_sanz.jpg', 'Bakarlaria'),
	('M005', 'Pablo Alborán', 'pablo_alboran.jpg', 'Bakarlaria'),
	('M006', 'Drake', 'drake.jpg', 'Bakarlaria'),
	('M007', 'David Bisbal', 'david_bisbal.jpg', 'Bakarlaria'),
	('M008', 'Eminem', 'eminem.jpg', 'Bakarlaria'),
	('M009', 'Coldplay', 'coldplay.jpg', 'taldea'),
	('M010', 'Estopa', 'estopa.jpg', 'taldea');

	-- Podcasteraren taularako datuak
	insert into podcaster (idPodcaster, izenArtiztikoa, irudia) values 
	('P001', 'Latin Musika Podcasta', 'musika_latina.jpg'),
	('P002', '10 Minutuko Zientzia', 'zientzia_10_minutu.jpg'),
	('P003', 'Misterio Historiak', 'misterio_historiak.jpg'),
	('P004', 'Sukaldean Erraz eta Ondo', 'sukaldea_erraza.jpg'),
	('P005', 'Filosofia Elkarrizketak', 'filosofia_elkarrizketak.jpg'),
	('P006', 'Espazioan Abenturak', 'espazioa_abenturak.jpg'),
	('P007', 'Finantza Pertsonalak', 'finantza_pertsonalak.jpg'),
	('P008', 'Zinemaren Podcasta', 'podcast_zinema.jpg'),
	('P009', 'Idazleen Elkarrizketak', 'idazle_elkarrizketak.jpg'),
	('P010', 'Meditazioaren Podcasta', 'yoga_meditazioa.jpg');
    
	-- Hizkuntzaren taularako datuak
	insert into hizkuntza (idHizkuntza, deskribapena) values 
	('ES', 'Espainiera'),
	('EU', 'Euskara'),
	('EN', 'Ingelesa'),
	('FR', 'Frantsesa');

	-- Audioaren taularako datuak
	insert into audioa (izena, iraupena, irudia, mota, mp3) values 
  ;
    
	-- Bezeroaren taularako datuak
	insert into bezero (idBezero, izena, abizena, hizkuntza, erabiltzailea, pasahitza, jaiotzeData, erregistroData, mota) values 
	('B001', 'Frodo', 'Baggins', 'EN', 'frodo123', 'frodopass', '1990-07-19', '2020-01-15', 'Premium'),
	('B002', 'Gollum', 'Smeagol', 'ES', 'gollum', 'myprecious', '1978-05-03', '2020-02-20', 'Free'),
    ('B003', 'Juan', 'Martínez', 'ES', 'juanmar', 'Juanma123', '1980-08-12', '2020-06-25', 'Premium'),
	('B004', 'María', 'García', 'ES', 'mariag', '123456', '1975-03-17', '2020-07-30', 'Free'),
	('B005', 'Pablo', 'López', 'ES', 'pablol', '654321', '1988-11-28', '2020-08-05', 'Free');
    

	-- Premiumaren taularako datuak
	insert into premium (idBezero, iraungitzeData) values 
	('B001', '2025-01-15'),
    ("B003", "2026-06-25");
    

	-- Podcastaren taularako datuak
	insert into podcast (idAudio, kolaboratzaileak, idPodcaster) values 
;

	-- Albumaren taularako datuak
	insert into album (idAlbum, izenburua, urtea, generoa, idMusikaria) values 
	("Ab001","Lemonade",2016-01-01,"R&B​​​/pop","M001"),
    ("Ab002","÷",2017-01-01,"pop","M002"),
    ("Ab003","Motomami",2022-01-01,"pop/reguetón","M003"),
    ("Ab004","Más",1997-01-01,"pop","M004"),
    ("Ab005","Tanto	",2012-01-01,"pop","M005"),
    ("Ab006","For All the Dogs",2023-01-01,"hip-hop/rap","M006"),
    ("Ab007","Buleria",2004-01-01,"pop","M007"),
	("Ab008","Encore",2004-01-01,"hip-hop/rap","M008"),
    ("Ab009","X&Y",2005-01-01,"rock","M009"),
    ("Ab010","Fuego",2019-01-01,"pop","M010");
   

	-- Abestiaren taularako datuak
	insert into abestia (idAudio, idAlbum) values 


	-- Playlistaren taularako datuak
	insert into playlist (idList, izenburua, sorreraData, idBezero) values 
	

	-- PlaylistAbestiak taularako datuak
	insert into playlistAbestiak (idAudio, idList) values 

	-- Gustokoak taularako datuak
	insert into gustokoak (idBezero, idAudio) values 

	-- Erreprodukzioak taularako datuak
	insert into erreprodukzioak (idBezero, idAudioa, errepData) values 
    
/*
delete from album where idAlbum = 'AL001';
update album 
set idAlbum = 'AA'
where idAlbum ='AL002';
*/