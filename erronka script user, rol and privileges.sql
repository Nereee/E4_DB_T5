#5 TALDEA --Ibai, Jon Ander M., Jon O.

-- Departamentu burua --> estadistikak, bezero eta premium taulan modifikazioak egin dezake

	drop role if exists burua;
    create role burua;
    grant select, insert, update, delete on db_spotify5.estatistikak to burua;
	grant select, insert, update, delete on db_spotify5.bezero to burua;
	grant select, insert, update, delete on db_spotify5.premium to burua;
    
    drop user if exists departamentu_burua;
	CREATE USER departamentu_burua identified by 'depPass';
    
	grant burua to departamentu_burua;
    show grants for departamentu_burua;

-- Analista --> Taula guztietako datuak ikusi dezake playlistabestiak eta hizkuntzak tauletan ez kontatuz

	drop role if exists analista;
    create role analista;
    grant select on db_spotify5.abestia to analista;
    grant select on db_spotify5.album to analista;
    grant select on db_spotify5.audioa to analista;
    grant select on db_spotify5.bezero to analista;
    grant select on db_spotify5.erreprodukzioak to analista;
    grant select on db_spotify5.estatistikak to analista;
    grant select on db_spotify5.gustokoak to analista;
    grant select on db_spotify5.musikaria to analista;
    grant select on db_spotify5.podcast to analista;
    grant select on db_spotify5.podcaster to analista;
	grant select on db_spotify5.premium to analista;
    



	drop user if exists analista1;
    create user analista1 identified by 'anaPass';
    
    grant analista to analista1;
    show grants for analista1;
    
-- Analista 2 --> Taula guztietako datuak ikusi dezake playlistabestiak eta hizkuntzak tauletan ez kontatuz
    
    drop user if exists analista2;
    Create user analista2 identified by 'anaPass';

    grant analista to analista2;
	show grants for analista2;

-- Langilea --> Taula guztiak ikusi dezake gustokoak eta playlistabestiak izan ezik eta gainera hizkuntza taulako datuak aldatu ditzake
	
    drop role if exists langileaR;
    Create role langileaR;
	
	grant select on db_spotify5.abestia to langileaR;
	grant select on db_spotify5.album to langileaR;
	grant select on db_spotify5.audioa to langileaR;
	grant select on db_spotify5.bezero to langileaR;
	grant select on db_spotify5.erreprodukzioak to langileaR;
	grant select on db_spotify5.estatistikak to langileaR;
	grant select, insert, delete on db_spotify5.hizkuntza to langileaR;
	grant select on db_spotify5.musikaria to langileaR;
	grant select on db_spotify5.podcast to langileaR;
	grant select on db_spotify5.podcaster to langileaR;
	grant select on db_spotify5.premium to langileaR;
	
    drop user if exists langilea;
    Create user langilea identified by 'lanPass';
    
    show grants for langileaR;
	grant langileaR to langilea;
    show grants for langilea;
    
-- Bezero --> Taula guztietan ,estatistikak izan ezin, ikusteko eta erreprodukzioak, gustokoak, premium, playlist eta playlistabestiak tauletan aldaketak egiteko ahalmena dauka

	drop role if exists bezeroR;
    create role bezeroR;
    
	grant select on db_spotify5.abestia to bezeroR;
	grant select on db_spotify5.album to bezeroR;
	grant select on db_spotify5.audioa to bezeroR;
	grant select on db_spotify5.bezero to bezeroR;
	grant select, insert on db_spotify5.erreprodukzioak to bezeroR;
	grant select on db_spotify5.hizkuntza to bezeroR;
	grant select on db_spotify5.musikaria to bezeroR;
	grant select on db_spotify5.podcast to bezeroR;
	grant select on db_spotify5.podcaster to bezeroR;
	grant select, insert on db_spotify5.premium to bezeroR;
    grant select, insert, delete on db_spotify5.gustokoak to bezeroR;
    grant select, insert, delete on db_spotify5.playlist to bezeroR;
    grant select, insert, delete on db_spotify5.playlistabestiak to bezeroR;
    
    drop user if exists bezero;
    create user bezero identified by 'bezPass';
    
    grant bezeroR to bezero;
    show grants for bezeroR;
    
CREATE USER 'b'@'%' IDENTIFIED BY 'b';
GRANT ALL PRIVILEGES ON db_spotify5.* TO 'b'@'%';
FLUSH PRIVILEGES;

show grants for b;
DROP USER 'a'@'%';

