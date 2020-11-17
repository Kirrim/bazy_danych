#lekcja 3
#Zadanie 4
#punkt 1
CREATE TABLE przetwory(id_przetworu INT AUTO_INCREMENT PRIMARY KEY ,rok_produkcji varchar(6) DEFAULT '1654',id_wykonawcy int , FOREIGN KEY(id_wykonawcy) REFERENCES postac(id_postaci),zawartosc varchar(40),dodatek varchar(40) DEFAULT 'papryczka chilli',id_konsumenta int,FOREIGN KEY(id_konsumenta) REFERENCES postac(id_postaci)   )
#Zadanie 4
#punkt 1
INSERT INTO  przetwory values(Null,2000,3,'bigos',DEFAULT,1);
#Zadanie 5 
#punkt 1
INSERT INTO postac values(Null,'Orgrim','wiking','1100-02-03',20);
INSERT INTO postac values(Null,'Mjorn','wiking','1104-01-15',22);
INSERT INTO postac values(Null,'Korn','wiking','1103-05-23',23);
INSERT INTO postac values(Null,'Born','wiking','1102-06-13',22);
INSERT INTO postac values(Null,'Dorn','wiking','1101-07-22',21);
#Zadanie 5 
#punkt 2
CREATE TABLE statek(nazwa_statku varchar(50) PRIMARY KEY,rodzaj_statku enum('drakkar','barka','galera'), data_wodowania  date,max_ladownosc int UNSIGNED);
#Zadanie 5 
#punkt 3
INSERT INTO statek VALUES('Mlot','drakkar','1302-01-04',250);
INSERT INTO statek VALUES('Kowadlo','barka','1305-05-14',370);
#Zadanie 5 
#punkt 4 
ALTER TABLE postac ADD COLUMN funkcja varchar(40);
#Zadanie 5 
#punkt 5
UPDATE postac set funkcja='Kapitan' where id_postaci=1;
#Zadanie 5 
#punkt 6
ALTER TABLE postac ADD COLUMN statek varchar(50);
ALTER TABLE postac ADD FOREIGN KEY (statek) REFERENCES statek(nazwa_statku);
#Zadanie 5 
#punkt 7
UPDATE postac set statek='Mlot' where id_postaci=1;
UPDATE postac set statek='Mlot' where id_postaci=2;
UPDATE postac set statek='Mlot' where id_postaci=4;
UPDATE postac set statek='Mlot' where id_postaci=5;
UPDATE postac set statek='Kowadlo' where id_postaci=6;
UPDATE postac set statek='Kowadlo' where id_postaci=7;
UPDATE postac set statek='Kowadlo' where id_postaci=8;
#Zadanie 5 
#punkt 8
 izba where nazwa_izby='spizania';
#Zadanie 5 
#punkt 9
DROP TABLE izba;
#LAB 4
#Zadanie 1 
#punkt a
Select * from postac where rodzaj='wiking' order by data_ur;
Delete from postac where id_postaci='4';
Delete from postac where id_postaci='8';
#Zadanie 1 
#punkt b
SHOW CREATE TABLE postac;
ALTER TABLE postac DROP CONSTRAINT postac_ibfk_1 ;
ALTER TABLE walizka DROP CONSTRAINT walizka_ibfk_1 ;
ALTER TABLE przetwory DROP CONSTRAINT przetwory_ibfk_1 ;
ALTER TABLE przetwory DROP CONSTRAINT przetwory_ibfk_2 ;
ALTER TABLE postac MODIFY id_postaci int;
ALTER TABLE postac DROP PRIMARY KEY;
#Zadanie 2
#punkt a
ALTER TABLE postac ADD COLUMN pesel varchar(11);
Update postac SET pesel=12345678910 where id_postaci=1;               
Update postac SET pesel=12345678911 where id_postaci=2;                     ************Update postac SET pesel='11111111111'+id_postaci;
Update postac SET pesel=12345678912 where id_postaci=3;
ALTER TABLE postac ADD PRIMARY KEY(pesel);
#punkt b
ALTER TABLE postac MODIFY rodzaj ENUM('wiking','ptak','kobieta','syrena',);
#punkt c 
INSERT INTO postac values('8','Gertruda Nieszczera ','syrena','1052-02-03','26','','',"12345678911");
#Zadanie 3 
#punkt a
UPDATE postac SET statek='Mlot' where nazwa LIKE  '%a%';
#punkt b 
Update statek SET max_ladownosc=max_ladownosc*0.7 where data_wodowania >='1301-01-01' and data_wodowania <='1400-12-31';
***Where data_wodowania between '1901-01-01' and '2000-12-31';
#punkt c
check() 
#Zadanie 4 
#punkt a
ALTER TABLE postac MODIFY rodzaj ENUM('wiking','ptak','kobieta','syrena','waz');
INSERT INTO postac VALUES('9',"waz_loko",'waz','1032-03-21','51','null','null','12345678912');
#punkt b 
CREATE TABLE marynarz SELECT * FROM postac where statek='Mlot' or statek='Kowadlo'; 
 $$
 CREATE TABLE marynarz2 LIKE postac;
 INSERT INTO marynarz2 SELECT statek FROM postac WHERE statek='Mlot' or statek='Kowadlo';
 $$
 #punkt c 
 ALTER TABLE marynarz ADD PRIMARY KEY(pesel);
 Zadanie 5
#punkt a 
UPDATE postac SET statek='NULL' where id_postaci between '1' and '10';
#punkt b 
Delete from postac where id_postaci='5';
#punkt c 
Delete FROM postac WHERE statek="";
#punkt d 
DROP TABLE statek;
#punkt e 
CREATE TABLE zwierz(id int PRIMARY KEY AUTO_INCREMENT,nazwa varchar(40),wiek int UNSIGNED);
#punkt f
INSERT INTO zwierz id_postaci,nazwa SELECT nazwa FROM postac WHERE nazwa='drozd';