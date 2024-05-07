-- Bista 1 --> Bezeroen datuak ateratzen ditu, noizarte daukaten Premium-a kontratatua edukiz

drop view if exists bezeroDatuak;

create view bezeroDatuak as
select bezero.idBezero, bezero.izena, bezero.abizena, bezero.hizkuntza, bezero.erabiltzailea, bezero.jaiotzeData, bezero.erregistroData, bezero.mota, premium.iraungitzeData
from bezero left join premium on bezero.idBezero = premium.idBezero;
-- Left join --> Premium ez diren bezeroak ere agertzeko beztela, bi taulak komunean dituzten erabiltzaileak agertuko dira, hau da, premium diren erabiltzaileak 

SELECT * FROM bezeroDatuak;

-- Bista 2 --> Abestien erreprodukzioak ateratzen ditu

drop view if exists abestiErrepHandienak;
create view abestiErrepHandienak as
select audioa.idAudio, audioa.izena, count(erreprodukzioak.idAudioa) as erreprodukzioKopurua
from audioa
left join erreprodukzioak on audioa.idAudio = erreprodukzioak.idAudioa
group by audioa.idAudio, audioa.izena, audioa.mota
order by erreprodukzioKopurua desc;

select * from abestiErrepHandienak;

-- Bista 3 Bezeroen datuak eta bere playList kopurua lortzen duen 

drop view if exists playListErabiltzaile; 

create view playListErabiltzaile as
select bezero.idBezero, bezero.izena, bezero.abizena, COUNT(playlist.idList) as playlistKopurua
from bezero
join playlist on bezero.idBezero = playlist.idBezero
group by bezero.idBezero, bezero.izena, bezero.abizena
order by playlistKopurua desc;

select * from playListErabiltzaile;
