<h3>#LAB 3</h3>

#Zadanie 4
#punkt 1
```sql
CREATE TABLE przetwory(id_przetworu INT AUTO_INCREMENT PRIMARY KEY ,rok_produkcji VARCHAR(6) DEFAULT '1654',id_wykonawcy INT , FOREIGN KEY(id_wykonawcy) REFERENCES postac(id_postaci),zawartosc VARCHAR(40),dodatek VARCHAR(40) DEFAULT 'papryczka chilli',id_konsumenta INT,FOREIGN KEY(id_konsumenta) REFERENCES postac(id_postaci)   )
```
#Zadanie 4
#punkt 1
INSERT INTO  przetwory values(NULL,2000,3,'bigos',DEFAULT,1);
#Zadanie 5 
#punkt 1
```sql
INSERT INTO postac values(NULL,'Orgrim','wiking','1100-02-03',20);
INSERT INTO postac values(NULL,'Mjorn','wiking','1104-01-15',22);
INSERT INTO postac values(NULL,'Korn','wiking','1103-05-23',23);
INSERT INTO postac values(NULL,'Born','wiking','1102-06-13',22);
INSERT INTO postac values(NULL,'Dorn','wiking','1101-07-22',21);
```
#Zadanie 5 
#punkt 2
```sql
CREATE TABLE statek(nazwa_statku VARCHAR(50) PRIMARY KEY,rodzaj_statku enum('drakkar','barka','galera'), data_wodowania  date,max_ladownosc INT UNSIGNED);
```
#Zadanie 5 
#punkt 3
```sql
INSERT INTO statek VALUES('Mlot','drakkar','1302-01-04',250);
INSERT INTO statek VALUES('Kowadlo','barka','1305-05-14',370);
```
#Zadanie 5 
#punkt 4 
```sql
ALTER TABLE postac ADD COLUMN funkcja VARCHAR(40);
```
#Zadanie 5 
#punkt 5
```sql
UPDATE postac SET funkcja='Kapitan' WHERE id_postaci=1;
```
#Zadanie 5 
#punkt 6
```sql
ALTER TABLE postac ADD COLUMN statek VARCHAR(50);
ALTER TABLE postac ADD FOREIGN KEY (statek) REFERENCES statek(nazwa_statku);
```
#Zadanie 5 
#punkt 7
```sql
UPDATE postac SET statek='Mlot' WHERE id_postaci=1;
UPDATE postac SET statek='Mlot' WHERE id_postaci=2;
UPDATE postac SET statek='Mlot' WHERE id_postaci=4;
UPDATE postac SET statek='Mlot' WHERE id_postaci=5;
UPDATE postac SET statek='Kowadlo' WHERE id_postaci=6;
UPDATE postac SET statek='Kowadlo' WHERE id_postaci=7;
UPDATE postac SET statek='Kowadlo' WHERE id_postaci=8;
```
#Zadanie 5 
#punkt 8
```sql
 izba WHERE nazwa_izby='spizania';
```
#Zadanie 5 
#punkt 9
```sql
DROP TABLE izba;
```
<h3>#LAB 4</h3>

#Zadanie 1 
#punkt a
```sql
SELECT * FROM postac WHERE rodzaj='wiking' ODER BY data_ur;
Delete FROM postac WHERE id_postaci='4';
Delete FROM postac WHERE id_postaci='8';
```
#Zadanie 1 
#punkt b
```sql
SHOW CREATE TABLE postac;
ALTER TABLE postac DROP CONSTRAINT postac_ibfk_1 ;
ALTER TABLE walizka DROP CONSTRAINT walizka_ibfk_1 ;
ALTER TABLE przetwory DROP CONSTRAINT przetwory_ibfk_1 ;
ALTER TABLE przetwory DROP CONSTRAINT przetwory_ibfk_2 ;
ALTER TABLE postac MODIFY id_postaci INT;
ALTER TABLE postac DROP PRIMARY KEY;
```
#Zadanie 2
#punkt a
```sql
ALTER TABLE postac ADD COLUMN pesel VARCHAR(11);
Update postac SET pesel=12345678910 WHERE id_postaci=1;               
Update postac SET pesel=12345678911 WHERE id_postaci=2;                     ************Update postac SET pesel='11111111111'+id_postaci;
Update postac SET pesel=12345678912 WHERE id_postaci=3;
ALTER TABLE postac ADD PRIMARY KEY(pesel);
```
#punkt b
```sql
ALTER TABLE postac MODIFY rodzaj ENUM('wiking','ptak','kobieta','syrena',);
```
#punkt c 
```sql
INSERT INTO postac values('8','Gertruda Nieszczera ','syrena','1052-02-03','26','','',"12345678911");
```
#Zadanie 3 
#punkt a
```sql
UPDATE postac SET statek='Mlot' WHERE nazwa LIKE  '%a%';
```
#punkt b 
```sql
Update statek SET max_ladownosc=max_ladownosc*0.7 WHERE data_wodowania >='1301-01-01' AND data_wodowania <='1400-12-31';
***WHERE data_wodowania BETWEEN '1901-01-01' AND '2000-12-31';
```
#punkt c
```sql
check() 
```
#Zadanie 4 
#punkt a
```sql
ALTER TABLE postac MODIFY rodzaj ENUM('wiking','ptak','kobieta','syrena','waz');
INSERT INTO postac VALUES('9',"waz_loko",'waz','1032-03-21','51','NULL','NULL','12345678912');
```
#punkt b 
```sql
CREATE TABLE marynarz SELECT * FROM postac WHERE statek='Mlot' or statek='Kowadlo'; 
 $$
 CREATE TABLE marynarz2 LIKE postac;
 INSERT INTO marynarz2 SELECT statek FROM postac WHERE statek='Mlot' or statek='Kowadlo';
 $$
```
 #punkt c 
```sql
 ALTER TABLE marynarz ADD PRIMARY KEY(pesel);
 ```
 Zadanie 5
#punkt a 
```sql
UPDATE postac SET statek='NULL' WHERE id_postaci BETWEEN '1' AND '10';
```
#punkt b 
```sql
Delete FROM postac WHERE id_postaci='5';
```
#punkt c 
```sql
Delete FROM postac WHERE statek="";
```
#punkt d 
```sql
DROP TABLE statek;
```
#punkt e 
```sql
CREATE TABLE zwierz(id INT PRIMARY KEY AUTO_INCREMENT,nazwa VARCHAR(40),wiek INT UNSIGNED);
```
#punkt f
```sql
INSERT INTO zwierz (nazwa) SELECT nazwa FROM postac WHERE nazwa='Drozd';
```
<h3>#LAB 5 </h3>

#Zadanie 1
#punkt 1 
```sql
CREATE TABLE kreatura SELECT * FROM wikingowie.kreatura;
CREATE TABLE zasob SELECT * FROM wikingowie.zasob;
CREATE TABLE ekwipunek SELECT * FROM wikingowie.ekwipunek;
```
#punkt 2
```sql
SELECT * FROM zasob;
```
#punkt 3
```sql
SELECT * FROM zasob WHERE rodzaj='jedzenie';
```
#punkt 4
```sql
SELECT idzasobu,ilosc FROM ekwipunek WHERE idzasobu='1' OR idzasobu='3' OR idzasobu='5';
$$SELECT idzasobu,ilosc FROM ekwipunek WHERE Idkreatury  IN (1,3,5)$$
```
#Zadanie 2
#punkt 1
```sql
SELECT * FROM kreatura WHERE not rodzaj='wiedzma' AND udzwig BETWEEN 50 AND 1200;
```
#punkt 2
```sql
SELECT * FROM zasob WHERE waga BETWEEN 2 AND 5;
```
#punkt 3
```sql
SELECT * FROM kreatura WHERE nazwa like "%or%" AND udzwig BETWEEN 30 AND 70;
```
#Zadanie 3
#punkt1 
```sql
SELECT * FROM zasob WHERE month(dataPozyskania)=7 or month(dataPozyskania)=8;
```
#punkt2
```sql
SELECT * FROM zasob WHERE rodzaj IS NOT NULL ORDER BY waga ASC;
```
#punkt3
```sql
SELECT * FROM kreatura ORDER BY dataUr LIMIT 5  ;
```
#Zadanie 4
#punkt 1
```sql
SELECT DISTINCT rodzaj FROM zasob ;
```
#punkt 2
```sql
SELECT CONCAT(nazwa," - ",rodzaj) AS nazwa_rodzaj from kreatura WHERE rodzaj LIKE "wi%";
```
#punkt 3
```sql
SELECT waga*ilosc FROM zasob WHERE year(dataPozyskania) BETWEEN 2000 AND 2007;  
```
#Zadanie 5
#punkt 1
```sql
SELECT nazwa, 0.3*waga AS odpad, 0.7*waga AS jedzenie FROM zasob WHERE rodzaj="jedzenie";
```
#punkt 2
```sql
SELECT rodzaj FROM zasob WHERE rodzaj IS NULL;
```
#punkt 3
```sql
SELECT DISTINCT(rodzaj),nazwa FROM zasob WHERE nazwa LIKE 'Ba%' OR nazwa LIKE '%os' ORDER BY nazwa ASC;
```