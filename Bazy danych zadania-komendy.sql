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
SELECT kreatura.nazwa,zasob.nazwa from kreatura NATURAL JOIN ekwipunek INNER JOIN zasob ON zasob.idzasobu = ekwipunek.idzasobu WHERE zasob.rodzaj='jedzenie' ORDER BY kreatura.dataUr DESC LIMIT 5;
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
CREATE TABLE wyprawa2 SELECT * FROM wikingowie.wyprawa;
CREATE TABLE ekwipunek2 SELECT * FROM wikingowie.ekwipunek;
CREATE TABLE zasob2 SELECT * FROM wikingowie.zasob;
#punkt 2 
SELECT kreatura.nazwa ,uczestnicy.id_uczestnika FROM kreatura LEFT JOIN uczestnicy ON uczestnicy.id_uczestnika=kreatura.Idkreatury where uczestnicy.id_uczestnika IS NULL;
#punkt 3 
SELECT wyprawa.nazwa,SUM(ekwipunek.ilosc) FROM wyprawa  INNER JOIN uczestnicy ON uczestnicy.id_wyprawy=wyprawa.id_wyprawy INNER JOIN kreatura ON uczestnicy.id_uczestnika=kreatura.IdKreatury INNER JOIN ekwipunek ON ekwipunek.Idkreatury=kreatura.Idkreatury GROUP BY wyprawa.nazwa; 
Lub
SELECT wyprawa.nazwa,SUM(ekwipunek.ilosc) FROM wyprawa,uczestnicy,ekwipunek,kreatura WHERE wyprawa.id_wyprawy=uczestnicy.id_wyprawy AND uczestnicy.id_uczestnika=kreatura.Idkreatury AND ekwipunek.Idkreatury=kreatura.Idkreatury GROUP BY wyprawa.nazwa; 
#Zadanie 2
#punkt 1
SELECT wyprawa.nazwa,COUNT(uczestnicy.id_uczestnika),GROUP_CONCAT(kreatura.nazwa) FROM kreatura,wyprawa,uczestnicy WHERE kreatura.Idkreatury=uczestnicy.id_uczestnika AND wyprawa.id_wyprawy=uczestnicy.id_wyprawy GROUP BY wyprawa.nazwa;
#punkt 2 
SELECT etapy_wyprawy.sektor,wyprawa.nazwa,sektor.nazwa,wyprawa.kierownik,kreatura.nazwa, wyprawa.data_rozpoczecia FROM etapy_wyprawy,sektor,kreatura,wyprawa,uczestnicy where etapy_wyprawy.sektor=sektor.id_sektora AND etapy_wyprawy.idWyprawy=wyprawa.id_wyprawy AND uczestnicy.id_wyprawy=wyprawa.id_wyprawy AND kreatura.IdKreatury = uczestnicy.id_uczestnika AND id_uczestnika=wyprawa.kierownik ORDER BY wyprawa.data_rozpoczecia, etapy_wyprawy.kolejnosc;
#Zadanie 3
#punkt 1
SELECT sektor.nazwa,COUNT(etapy_wyprawy.sektor) AS ilosc_odwiedzin FROM sektor LEFT JOIN etapy_wyprawy ON sektor.id_sektora=etapy_wyprawy.sektor GROUP BY sektor.nazwa ;
#punkt 2 
SELECT DISTINCT(kreatura.nazwa),IF(uczestnicy.id_wyprawy IS NULL,"Nie bral udzialu w wyprawie","bral udzialu w wyprawie") FROM kreatura LEFT JOIN uczestnicy ON kreatura.Idkreatury=uczestnicy.id_uczestnika   ORDER BY kreatura.nazwa;
#Zadanie 4 
#punkt 1
SELECT wyprawa.nazwa,SUM(LENGTH(etapy_wyprawy.dziennik)) FROM wyprawa,etapy_wyprawy WHERE etapy_wyprawy.idWyprawy=wyprawa.id_wyprawy GROUP BY wyprawa.nazwa HAVING SUM(LENGTH(etapy_wyprawy.dziennik))<400; 
#punkt 2 
SELECT wyprawa.nazwa,COUNT(DISTINCT(uczestnicy.id_uczestnika)),SUM(ekwipunek.ilosc*zasob.waga)/COUNT(DISTINCT(uczestnicy.id_uczestnika)) FROM wyprawa LEFT JOIN uczestnicy ON wyprawa.id_wyprawy = uczestnicy.id_wyprawy LEFT JOIN kreatura  ON uczestnicy.id_uczestnika = kreatura.idKreatury LEFT JOIN ekwipunek ON kreatura.idKreatury= ekwipunek.idKreatury LEFT JOIN zasob ON ekwipunek.idZasobu = zasob.idZasobu GROUP BY wyprawa.nazwa;
#Zadanie 5 
SELECT kreatura.nazwa,sektor.nazwa,datediff(wyprawa.data_rozpoczecia,kreatura.dataUR) from wyprawa,sektor,etapy_wyprawy,kreatura,uczestnicy where wyprawa.id_wyprawy=etapy_wyprawy.idWyprawy AND etapy_wyprawy.sektor=sektor.id_sektora AND wyprawa.id_wyprawy=uczestnicy.id_wyprawy AND uczestnicy.id_uczestnika=kreatura.Idkreatury AND sektor.nazwa = "Chatka dziadka";
## LAB 6
#Zadanie 1
#punkt 1 
DELIMITER //
CREATE TRIGGER kreatura_waga
BEFORE INSERT ON kreatura2
FOR EACH ROW
BEGIN
  IF NEW.waga < 0
  THEN
    SET NEW.waga = 0;
  END IF;
END
//
DELIMITER ;
#Zadanie 2
#punkt 1
DELIMITER $$
CREATE TRIGGER archiwum_wypraw
BEFORE DELETE ON wyprawa2
FOR EACH ROW
BEGIN
INSERT INTO archiwum_wypraw SELECT wyprawa2.id_wyprawy,wyprawa2.nazwa,wyprawa2.data_rozpoczecia,wyprawa2.data_zakonczenia,kreatura2.nazwa FROM wyprawa2 
JOIN kreatura2 ON kreatura2.idKreatury=wyprawa2.kierownik where id_wyprawy=old.id_wyprawy; 
END
$$
DELIMITER ;
INSERT INTO wyprawa2 VALUES("5","TEST","2000-01-01","2000-02-02","1");
DELETE FROM wyprawa2 where id_wyprawy='5';
                                                                     //DROP TRIGGER archiwum_wypraw;
                                                                     //SET SQL_SAFE_UPDATES = 0;
#Zadanie 3 
#punkt 1
DELIMITER \\
CREATE PROCEDURE eliksir_sily(IN id int)
BEGIN
UPDATE kreatura SET udzwig = 1.2 * udzwig WHERE idKreatury = id;
END
\\
#punkt 2
DELIMITER $$
CREATE FUNCTION wielka(tekst varchar(100))
    RETURNS varchar(100)
BEGIN
    DECLARE duze varchar(100)
    SELECT UPPER(tekst) into @duze;
    RETURN @duze;
END 
$$
DELIMITER ;
 //DROP FUNCTION wielka;
#Zadanie 4
#punkt 1 
CREATE TABLE  system_alarmowy(id_alarmu INT AUTO_INCREMENT,wiadomosc varchar(150) );
#punkt 2 
DELIMITER $$
CREATE TRIGGER tesciowa_alert
AFTER INSERT ON wyprawa
FOR EACH ROW 
BEGIN
DECLARE t int ;
SELECT count(kreatura.idKreatury) INTO t FROM kreatura INNER JOIN wyprawa ON kreatura.IdKreatury=wyprawa.kierownik INNER JOIN etapy_wyprawy ON wyprawa.id_wyprawy=etapy_wyprawy.idWyprawy INNER JOIN sektor ON sektor.id_sektora=etapy_wyprawy.sektor where sektor =7 
AND kreatura.nazwa='tesciowa'
AND wyprawa.id_wyprawy=NEW.id_wyprawy;
IF t > 0
THEN 
INSERT into system_alarmowy values(DEFAULT,'Tesciowa nadchodzi !');
END IF;
END
$$
DELIMITER;
#Zadanie 5
#punkt 1 
DELIMITER $$
CREATE PROCEDURE udzwig(OUT srednia float , OUT suma float , OUT maks float)
BEGIN
SELECT AVG(udzwig),SUM(udzwig),MAX(udzwig) INTO srednia,suma,maks from kreatura;
END
$$
DELIMITER ;
#LAB REPO
#Zadania - część 2
#punkt 1
SELECT pracownik.imie,pracownik.nazwisko,dzial.nazwa FROM pracownik INNER JOIN dzial ON pracownik.dzial=dzial.id_dzialu;
#punkt 2 
SELECT towar.nazwa_towaru,kategoria.nazwa_kategori,stan_magazynowy.ilosc FROM towar INNER JOIN kategoria ON towar.kategoria=kategoria.id_kategori INNER JOIN stan_magazynowy ON towar.id_towaru=stan_magazynowy.towar ORDER BY stan_magazynowy.ilosc DESC;
#punkt 3 
SELECT status_zamowienia.nazwa_statusu_zamowienia,zamowienie.id_zamowienia from zamowienie INNER JOIN status_zamowienia ON status_zamowienia.id_statusu_zamowienia=zamowienie.status_zamowienia WHERE id_statusu_zamowienia=6;
#punkt 4 
SELECT klient.id_klienta,adres_klienta.miejscowosc from klient INNER JOIN  adres_klienta on klient.id_klienta=adres_klienta.klient JOIN typ_adresu  ON adres_klienta.typ_adresu=typ_adresu.id_typu where adres_klienta.miejscowosc="Olsztyn" and typ_adresu.nazwa="podstawowy";
#punkt 5 
SELECT jednostka_miary.nazwa,stan_magazynowy.towar from jednostka_miary LEFT JOIN stan_magazynowy ON stan_magazynowy.jm=jednostka_miary.id_jednostki WHERE stan_magazynowy.towar IS NULL;
#punkt 6 
SELECT zamowienie.numer_zamowienia,pozycja_zamowienia.cena,kategoria.nazwa_kategori,pozycja_zamowienia.ilosc FROM zamowienie INNER JOIN pozycja_zamowienia ON pozycja_zamowienia.zamowienie=zamowienie.id_zamowienia INNER JOIN towar ON towar.id_towaru=pozycja_zamowienia.towar INNER JOIN kategoria ON towar.kategoria=kategoria.id_kategori  where  year(zamowienie.data_zamowienia)=2018; 
#punkt 8 
SELECT pozycja_zamowienia.*,zamowienie.data_zamowienia FROM zamowienie INNER JOIN pozycja_zamowienia ON zamowienie.id_zamowienia=pozycja_zamowienia.zamowienie ORDER BY data_zamowienia Limit 5;
#punkt 9 
SELECT status_zamowienia.nazwa_statusu_zamowienia,zamowienie.id_zamowienia from zamowienie INNER JOIN status_zamowienia ON status_zamowienia.id_statusu_zamowienia=zamowienie.status_zamowienia WHERE status_zamowienia.id_statusu_zamowienia!=5;
#punkt 10 
SELECT * FROM adres_klienta where kod NOT LIKE "__-___"; 
SELECT * FROM adres_klienta where kod NOT REGEXP '[0-9]{2}-[0-9]{3}';
#LAB3 REPO
#Zadania
#punkt 1
SELECT imie,nazwisko,year(data_urodzenia) FROM pracownik;
#punkt 2
SELECT imie,nazwisko,2020-year(data_urodzenia) FROM pracownik;
#punkt 3 
SELECT dzial.nazwa,COUNT(pracownik.Id_pracownika) FROM pracownik INNER JOIN dzial ON pracownik.dzial=dzial.id_dzialu GROUP BY dzial.id_dzialu;
#punkt 4
SELECT kategoria.nazwa_kategori,COUNT(DISTINCT(towar.nazwa_towaru)) FROM kategoria INNER JOIN towar ON towar.kategoria=kategoria.id_kategori  where towar.kategoria=id_kategori Group by id_kategori ;
#punkt 5
  SELECT GROUP_CONCAT(kategoria.nazwa_kategori,'-',towar.nazwa_towaru) FROM kategoria INNER JOIN towar ON towar.kategoria=kategoria.id_kategori  where towar.kategoria=id_kategori  ;
#punkt 6
 SELECT Round(SUM(pensja)/count(pensja),2) FROM pracownik;
punkt 7
SELECT  AVG(pensja) FROM pracownik WHERE TIMESTAMPDIFF(YEAR, data_zatrudnienia, CURDATE()) > 5;
#punkt 8
SELECT towar.nazwa_towaru,COUNT(pozycja_zamowienia.towar) FROM pozycja_zamowienia inner JOIN towar on pozycja_zamowienia.towar=towar.id_towaru GROUP BY towar.id_towaru ORDER BY COUNT(pozycja_zamowienia.towar) DESC LIMIT 10;
#punkt 9
SELECT zamowienie.data_zamowienia,zamowienie.numer_zamowienia,SUM(pozycja_zamowienia.ilosc*pozycja_zamowienia.cena) FROM  pozycja_zamowienia  INNER JOIN zamowienie ON zamowienie.status_zamowienia=zamowienie where YEAR(zamowienie.data_zamowienia)=2017 AND QUARTER(data_zamowienia)=1 GROUP BY zamowienie.id_zamowienia;
#punkt 10
SELECT pracownik.imie,pracownik.nazwisko,SUM(pozycja_zamowienia.ilosc*pozycja_zamowienia.cena) FROM pracownik INNER JOIN zamowienie ON zamowienie.pracownik_Id_pracownika=pracownik.Id_pracownika INNER JOIN pozycja_zamowienia ON pozycja_zamowienia.zamowienie=zamowienie.status_zamowienia GROUP BY pracownik.Id_pracownika order by SUM(pozycja_zamowienia.ilosc*pozycja_zamowienia.cena)  desc ;
#LAB3 REPO
#Zadania cześć 2 
#punkt 1
SELECT dzial.nazwa,min(pracownik.pensja),AVG(pracownik.pensja),MAX(pracownik.pensja) FROM dzial INNER JOIN pracownik ON pracownik.dzial=dzial.id_dzialu Group by pracownik.dzial;
#punkt 2 
SELECT klient.pelna_nazwa,SUM(pozycja_zamowienia.ilosc*pozycja_zamowienia.cena) AS wartosc FROM klient INNER JOIN zamowienie ON zamowienie.klient=klient.id_klienta INNER JOIN pozycja_zamowienia ON pozycja_zamowienia.zamowienie=zamowienie.id_zamowienia GROUP BY zamowienie.id_zamowienia ORDER BY wartosc DESC LIMIT 10 ; 
#punkt 3
SELECT SUM(pozycja_zamowienia.ilosc*pozycja_zamowienia.cena) as wartosc,YEAR(zamowienie.data_zamowienia) AS rok FROM zamowienie INNER JOIN pozycja_zamowienia ON pozycja_zamowienia.zamowienie=zamowienie.id_zamowienia GROUP BY rok ORDER BY wartosc DESC ;
#punkt 4
SELECT SUM(pozycja_zamowienia.ilosc*pozycja_zamowienia.cena) as wartosc,status_zamowienia.nazwa_statusu_zamowienia FROM zamowienie INNER JOIN pozycja_zamowienia ON pozycja_zamowienia.zamowienie=zamowienie.id_zamowienia INNER JOIN status_zamowienia  ON status_zamowienia.id_statusu_zamowienia=zamowienie.status_zamowienia WHERE nazwa_statusu_zamowienia="anulowane";
#punkt 5
SELECT adres_klienta.miejscowosc,sum(pozycja_zamowienia.ilosc*pozycja_zamowienia.cena) as wartosc,count(distinct(zamowienie.id_zamowienia)) FROM klient INNER JOIN zamowienie ON zamowienie.klient=klient.id_klienta INNER JOIN pozycja_zamowienia ON pozycja_zamowienia.zamowienie=zamowienie.id_zamowienia INNER JOIN adres_klienta ON klient.id_klienta=adres_klienta.klient INNER JOIN typ_adresu ON typ_adresu.id_typu=adres_klienta.typ_adresu WHERE adres_klienta.typ_adresu='1' group by adres_klienta.miejscowosc with rollup;
#punkt 6
SELECT SUM(pozycja_zamowienia.ilosc*pozycja_zamowienia.cena) as przychod,SUM(towar.cena_zakupu*pozycja_zamowienia.ilosc) as wydatki,SUM(pozycja_zamowienia.ilosc*pozycja_zamowienia.cena)-SUM(towar.cena_zakupu*pozycja_zamowienia.ilosc) as dochod,status_zamowienia.nazwa_statusu_zamowienia FROM zamowienie INNER JOIN pozycja_zamowienia ON pozycja_zamowienia.zamowienie=zamowienie.id_zamowienia INNER JOIN towar ON towar.id_towaru=pozycja_zamowienia.towar  INNER JOIN status_zamowienia  ON status_zamowienia.id_statusu_zamowienia=zamowienie.status_zamowienia WHERE nazwa_statusu_zamowienia="zrealizowane";
#punkt 7
SELECT SUM(pozycja_zamowienia.ilosc*pozycja_zamowienia.cena) as przychod,SUM(towar.cena_zakupu*pozycja_zamowienia.ilosc) as wydatki,SUM(pozycja_zamowienia.ilosc*pozycja_zamowienia.cena)-SUM(towar.cena_zakupu*pozycja_zamowienia.ilosc) as dochod  ,YEAR(zamowienie.data_zamowienia) AS rok FROM zamowienie INNER JOIN pozycja_zamowienia ON pozycja_zamowienia.zamowienie=zamowienie.id_zamowienia INNER JOIN towar ON towar.id_towaru=pozycja_zamowienia.towar GROUP BY rok;
#punkt 8 
SELECT SUM(towar.cena_zakupu*stan_magazynowy.ilosc) as wartosc,kategoria.nazwa_kategori FROM towar INNER JOIN pozycja_zamowienia ON pozycja_zamowienia.towar=towar.id_towaru INNER JOIN stan_magazynowy ON stan_magazynowy.towar=towar.id_towaru INNER JOIN kategoria ON kategoria.id_kategori=towar.kategoria GROUP BY kategoria.id_kategori;
#punkt 9
SELECT MONTHNAME(data_urodzenia) as miesiac,COUNT(MONTH(data_urodzenia)) as ilosc FROM pracownik  GROUP BY miesiac,Month(data_urodzenia) ORDER BY Month(data_urodzenia);
#punkt 10 
Select pracownik.imie,pracownik.nazwisko,TIMESTAMPDIFF(MONTH,pracownik.data_zatrudnienia,CURDATE())*pracownik.pensja FROM pracownik;
Biblioteka //
__projekt // Wymagania  
ENUM("romans", "kryminal", "fantastyka", "science fiction", "horror", "literatura piekna", "dramat", "thriller", "powiesc przygodowa", "komiks", "literatura popularnonaukowa", "biografia", "powiesc historyczna", "literatura faktu", "literatura podroznicza","literatura naukowa")