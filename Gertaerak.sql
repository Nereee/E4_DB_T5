-- Gertaerak 1. > Premium denbora amaitzen(aste bat pasatzean) bada premium taulatik erabiltzailea kentzea
Drop event if exists PremiumAmaitu;
delimiter $$
Create event if not exists PremiumAmaitu 
on schedule every 1 day starts '2024-05-04  00:00:00'
DO 
begin 

declare amaiera boolean default 0;
declare VidBezero int;
declare c cursor for
	select idBezero from bezeroDatuak where mota="Premium" and iraungitzeData<DATE_ADD(now(), INTERVAL 7 DAY);
declare continue handler for not found set amaiera=1;

open c; 

fetch c into VidBezero;
while amaiera=0 do
delete from premium where idBezero = VidBezero;
fetch c into VidBezero;
end while;
close c;

END; 
$$

-- Gertaerak 2- > --> Premium denbora amaitzean beste taula batean jartzea(Notifikatu gmailez)

Drop event if exists GNotifikatuGmail;
delimiter $$
Create event if not exists GNotifikatuGmail
on schedule every 1 day starts '2024-05-14  07:00:00'
do
begin 


declare amaiera boolean default false;
declare VidBezero int;
declare ViraungitzeData date;
declare c cursor for
	select idBezero, iraungitzeData from bezeroDatuak where iraungitzeData="2025-01-15";
declare continue handler for not found set amaiera=true;

open c;

fetch c into VidBezero,ViraungitzeData;
while amaiera = false do
	insert into notifikatuGmailez (idBezero,premiumMugaData) values (VidBezero, ViraungitzeData);
fetch c into VidBezero,ViraungitzeData;
end while;
close c;

end;
$$

-- Gertaerak 3- > --> Premium denbora amaitzean playList 3 baino gehiago baldin baditu playList berrienak ezabatzea 3-rekin geratu arte

Drop event if exists GEzabatuSoberanPlaylist;
delimiter $$
create event if not exists GEzabatuSoberanPlaylist
on schedule every 1 day starts '2024-05-14  08:00:00'
do
begin

declare amaiera boolean default false;
declare VidList int;
declare c cursor for
	select idList from playlist 
		join bezeroDatuak using(idBezero) where mota="Premium" and iraungitzeData<DATE_ADD(now(), INTERVAL 7 DAY);











end;
$$



