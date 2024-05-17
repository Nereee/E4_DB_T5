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

-- Gertaerak 2- > --> Premium denbora amaitzean beste taula batean jartzea(Notificar con gmail

Drop event if exists GNotifikatuGmail;
delimiter $$
Create event if not exists GNotifikatuGmail
on schedule every 1 day starts '2024-05-04  00:00:00'











