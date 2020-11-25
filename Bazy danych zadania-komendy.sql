#LAB 3
#Zadanie 4
#punkt 1
CREATE TABLE przetwory(id_przetworu INT AUTO_INCREMENT PRIMARY KEY ,rok_produkcji VARCHAR(6) DEFAULT '1654',id_wykonawcy INT , FOREIGN KEY(id_wykonawcy) REFERENCES postac(id_postaci),zawartosc VARCHAR(40),dodatek VARCHAR(40) DEFAULT 'papryczka chilli',id_konsumenta INT,FOREIGN KEY(id_konsumenta) REFERENCES postac(id_postaci)   )
#Zadanie 4
#punkt 1
INSERT INTO  przetwory values(NULL,2000,3,'bigos',DEFAULT,1);
#Zadanie 5 
#punkt 1
INSERT INTO postac values(NULL,'Orgrim','wiking','1100-02-03',20);
INSERT INTO postac values(NULL,'Mjorn','wiking','1104-01-15',22);
INSERT INTO postac values(NULL,'Korn','wiking','1103-05-23',23);
INSERT INTO postac values(NULL,'Born','wiking','1102-06-13',22);
INSERT INTO postac values(NULL,'Dorn','wiking','1101-07-22',21);
#Zadanie 5 
#punkt 2
CREATE TABLE statek(nazwa_statku VARCHAR(50) PRIMARY KEY,rodzaj_statku enum('drakkar','barka','galera'), data_wodowania  date,max_ladownosc INT UNSIGNED);
#Zadanie 5 
#punkt 3
INSERT INTO statek VALUES('Mlot','drakkar','1302-01-04',250);
INSERT INTO statek VALUES('Kowadlo','barka','1305-05-14',370);
#Zadanie 5 
#punkt 4 
ALTER TABLE postac ADD COLUMN funkcja VARCHAR(40);
#Zadanie 5 
#punkt 5
UPDATE postac SET funkcja='Kapitan' WHERE id_postaci=1;
#Zadanie 5 
#punkt 6
ALTER TABLE postac ADD COLUMN statek VARCHAR(50);
ALTER TABLE postac ADD FOREIGN KEY (statek) REFERENCES statek(nazwa_statku);
#Zadanie 5 
#punkt 7
UPDATE postac SET statek='Mlot' WHERE id_postaci=1;
UPDATE postac SET statek='Mlot' WHERE id_postaci=2;
UPDATE postac SET statek='Mlot' WHERE id_postaci=4;
UPDATE postac SET statek='Mlot' WHERE id_postaci=5;
UPDATE postac SET statek='Kowadlo' WHERE id_postaci=6;
UPDATE postac SET statek='Kowadlo' WHERE id_postaci=7;
UPDATE postac SET statek='Kowadlo' WHERE id_postaci=8;
#Zadanie 5 
#punkt 8
 izba WHERE nazwa_izby='spizania';
#Zadanie 5 
#punkt 9
DROP TABLE izba;
#LAB 4
#Zadanie 1 
#punkt a
SELECT * FROM postac WHERE rodzaj='wiking' ODER BY data_ur;
Delete FROM postac WHERE id_postaci='4';
Delete FROM postac WHERE id_postaci='8';
#Zadanie 1 
#punkt b
SHOW CREATE TABLE postac;
ALTER TABLE postac DROP CONSTRAINT postac_ibfk_1 ;
ALTER TABLE walizka DROP CONSTRAINT walizka_ibfk_1 ;
ALTER TABLE przetwory DROP CONSTRAINT przetwory_ibfk_1 ;
ALTER TABLE przetwory DROP CONSTRAINT przetwory_ibfk_2 ;
ALTER TABLE postac MODIFY id_postaci INT;
ALTER TABLE postac DROP PRIMARY KEY;
#Zadanie 2
#punkt a
ALTER TABLE postac ADD COLUMN pesel VARCHAR(11);
Update postac SET pesel=12345678910 WHERE id_postaci=1;               
Update postac SET pesel=12345678911 WHERE id_postaci=2;                     ************Update postac SET pesel='11111111111'+id_postaci;
Update postac SET pesel=12345678912 WHERE id_postaci=3;
ALTER TABLE postac ADD PRIMARY KEY(pesel);
#punkt b
ALTER TABLE postac MODIFY rodzaj ENUM('wiking','ptak','kobieta','syrena',);
#punkt c 
INSERT INTO postac values('8','Gertruda Nieszczera ','syrena','1052-02-03','26','','',"12345678911");
#Zadanie 3 
#punkt a
UPDATE postac SET statek='Mlot' WHERE nazwa LIKE  '%a%';
#punkt b 
Update statek SET max_ladownosc=max_ladownosc*0.7 WHERE data_wodowania >='1301-01-01' AND data_wodowania <='1400-12-31';
***WHERE data_wodowania BETWEEN '1901-01-01' AND '2000-12-31';
#punkt c
check() 
#Zadanie 4 
#punkt a
ALTER TABLE postac MODIFY rodzaj ENUM('wiking','ptak','kobieta','syrena','waz');
INSERT INTO postac VALUES('9',"waz_loko",'waz','1032-03-21','51','NULL','NULL','12345678912');
#punkt b 
CREATE TABLE marynarz SELECT * FROM postac WHERE statek='Mlot' or statek='Kowadlo'; 
 $$
 CREATE TABLE marynarz2 LIKE postac;
 INSERT INTO marynarz2 SELECT statek FROM postac WHERE statek='Mlot' or statek='Kowadlo';
 $$
 #punkt c 
 ALTER TABLE marynarz ADD PRIMARY KEY(pesel);
 Zadanie 5
#punkt a 
UPDATE postac SET statek='NULL' WHERE id_postaci BETWEEN '1' AND '10';
#punkt b 
Delete FROM postac WHERE id_postaci='5';
#punkt c 
Delete FROM postac WHERE statek="";
#punkt d 
DROP TABLE statek;
#punkt e 
CREATE TABLE zwierz(id INT PRIMARY KEY AUTO_INCREMENT,nazwa VARCHAR(40),wiek INT UNSIGNED);
#punkt f
INSERT INTO zwierz (nazwa) SELECT nazwa FROM postac WHERE nazwa='Drozd';
#LAB 5 
#Zadanie 1
#punkt 1 
CREATE TABLE kreatura SELECT * FROM wikingowie.kreatura;
CREATE TABLE zasob SELECT * FROM wikingowie.zasob;
CREATE TABLE ekwipunek SELECT * FROM wikingowie.ekwipunek;
#punkt 2
SELECT * FROM zasob;
#punkt 3
SELECT * FROM zasob WHERE rodzaj='jedzenie';
#punkt 4
SELECT idzasobu,ilosc FROM ekwipunek WHERE idzasobu='1' OR idzasobu='3' OR idzasobu='5';
$$SELECT idzasobu,ilosc FROM ekwipunek WHERE Idkreatury  IN (1,3,5)$$
#Zadanie 2
#punkt 1
SELECT * FROM kreatura WHERE not rodzaj='wiedzma' AND udzwig BETWEEN 50 AND 1200;
#punkt 2
SELECT * FROM zasob WHERE waga BETWEEN 2 AND 5;
#punkt 3
SELECT * FROM kreatura WHERE nazwa like "%or%" AND udzwig BETWEEN 30 AND 70;
#Zadanie 3
#punkt1 
SELECT * FROM zasob WHERE month(dataPozyskania)=7 or month(dataPozyskania)=8;
#punkt2
SELECT * FROM zasob WHERE rodzaj IS NOT NULL ORDER BY waga ASC;
#punkt3
SELECT * FROM kreatura ORDER BY dataUr LIMIT 5  ;
#Zadanie 4
#punkt 1
SELECT DISTINCT rodzaj FROM zasob ;
#punkt 2
SELECT CONCAT(nazwa," - ",rodzaj) AS nazwa_rodzaj from kreatura WHERE rodzaj LIKE "wi%";
#punkt 3
SELECT waga*ilosc FROM zasob WHERE year(dataPozyskania) BETWEEN 2000 AND 2007;  
#Zadanie 5
#punkt 1
SELECT nazwa, 0.3*waga AS odpad, 0.7*waga AS jedzenie FROM zasob WHERE rodzaj="jedzenie";
#punkt 2
SELECT rodzaj FROM zasob WHERE rodzaj IS NULL;
#punkt 3
SELECT DISTINCT(rodzaj),nazwa FROM zasob WHERE nazwa LIKE 'Ba%' OR nazwa LIKE '%os' ORDER BY nazwa ASC;
#LAB 6
#Zadanie 1 
#punkt 1
SELECT AVG(waga)  FROM kreatura where rodzaj='wiking';
#punkt 2 
SELECT AVG(waga),count(rodzaj),rodzaj FROM kreatura GROUP BY rodzaj;
#punkt 3
SELECT AVG(Year(dataUr)),rodzaj FROM kreatura GROUP BY rodzaj;
#Zadanie 2
#punkt 1 
SELECT SUM(waga),rodzaj FROM zasob GROUP by rodzaj;
#punkt 2
SELECT AVG(waga),rodzaj FROM zasob  GROUP BY rodzaj HAVING SUM(waga)>10 AND SUM(ilosc)>=4; 
#punkt 3 
SELECT COUNT(DISTINCT(nazwa)),rodzaj FROM zasob where ilosc>1 GROUP BY rodzaj;
#Zadanie 3
#punkt 1
SELECT (kreatura.nazwa),SUM(ekwipunek.ilosc) FROM kreatura,ekwipunek where kreatura.Idkreatury=ekwipunek.Idkreatury GROUP BY nazwa;
Lub
SELECT (kreatura.nazwa),SUM(ekwipunek.ilosc) FROM kreatura INNER JOIN ekwipunek ON kreatura.Idkreatury=ekwipunek.Idkreatury GROUP BY nazwa;
#punkt 2   
SELECT kreatura.nazwa,zasob.nazwa from kreatura,ekwipunek,zasob where kreatura.Idkreatury=ekwipunek.Idkreatury AND ekwipunek.idzasobu=zasob.idzasobu ORDER BY kreatura.nazwa;
Lub
SELECT kreatura.nazwa,zasob.nazwa from kreatura INNER JOIN ekwipunek ON kreatura.Idkreatury=ekwipunek.Idkreatury  INNER JOIN zasob ON ekwipunek.idzasobu=zasob.idzasobu ORDER BY kreatura.nazwa;
#punkt 3 
SELECT Idkreatury FROM kreatura WHERE Idkreatury NOT IN (SELECT DISTINCT Idkreatury FROM ekwipunek WHERE Idkreatury IS NOT NULL);
Lub
SELECT kreatura.nazwa,kreatura.Idkreatury,ekwipunek.Idkreatury FROM kreatura LEFT JOIN ekwipunek ON kreatura.Idkreatury=ekwipunek.Idkreatury where ekwipunek.Idkreatury IS NULL;
#Zadanie 4
#punkt 1
SELECT kreatura.nazwa,zasob.nazwa FROM kreatura NATURAL JOIN ekwipunek INNER JOIN zasob ON zasob.idzasobu = ekwipunek.idzasobu WHERE YEAR(kreatura.dataUr) BETWEEN 1670 AND 1679 AND kreatura.rodzaj='wiking'; 
#punkt 2
Select kreatura.nazwa,zasob.nazwa from kreatura NATURAL JOIN ekwipunek INNER JOIN zasob ON zasob.idzasobu = ekwipunek.idzasobu WHERE zasob.rodzaj='jedzenie' ORDER BY kreatura.dataUr DESC LIMIT 5;
#punkt 3 
SELECT CONCAT(T2.nazwa,"-",T1.nazwa) FROM kreatura T1 , kreatura T2 WHERE ABS(T1.Idkreatury-T2.Idkreatury=5) ;
#Zadanie 5 
#punkt 1
SELECT  AVG(ekwipunek.ilosc*zasob.waga),kreatura.rodzaj FROM kreatura,zasob,ekwipunek where kreatura.Idkreatury=ekwipunek.Idkreatury AND ekwipunek.idzasobu=zasob.idzasobu AND kreatura.rodzaj!='malpa' AND kreatura.rodzaj!='waz' GROUP BY kreatura.rodzaj HAVING SUM(ekwipunek.ilosc)<30;
#punkt 2
SELECT kreatura.rodzaj,kreatura.nazwa,kreatura.dataUr FROM kreatura,zasob,ekwipunek
#LAB 7 
#Zadanie 1
#punkt 1
CREATE TABLE kreatura2 SELECT * FROM wikingowie.kreatura;
CREATE TABLE uczestnicy2 SELECT * FROM wikingowie.uczestnicy;
CREATE TABLE etapy_wyprawy2 SELECT * FROM wikingowie.etapy_wyprawy;
CREATE TABLE sektor2 SELECT * FROM wikingowie.sektor;
CREATE TABLE wyprawa2 Select * form wikingowie.wyprawa
#punkt 2 
SELECT kreatura.nazwa ,uczestnicy.id_uczestnika FROM kreatura LEFT JOIN uczestnicy ON uczestnicy.id_uczestnika=kreatura.Idkreatury where uczestnicy.id_uczestnika IS NULL;
#punkt 3 
SELECT wyprawa.nazwa,SUM(ekwipunek.ilosc) FROM wyprawa  INNER JOIN uczestnicy ON uczestnicy.id_wyprawy=wyprawa.id_wyprawy INNER JOIN kreatura ON uczestnicy.id_uczestnika=kreatura.IdKreatury INNER JOIN ekwipunek ON ekwipunek.Idkreatury=kreatura.Idkreatury GROUP BY wyprawa.nazwa; 
Lub
SELECT wyprawa.nazwa,SUM(ekwipunek.ilosc) FROM wyprawa,uczestnicy,ekwipunek,kreatura WHERE wyprawa.id_wyprawy=uczestnicy.id_wyprawy AND uczestnicy.id_uczestnika=kreatura.Idkreatury AND ekwipunek.Idkreatury=kreatura.Idkreatury GROUP BY wyprawa.nazwa; 

WORKBENCH//Piątek
PHP_MY_ADMIN// Piątek 
