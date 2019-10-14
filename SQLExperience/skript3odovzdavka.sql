DROP TABLE zradloStanica;
DROP TABLE zradlo;
DROP TABLE zamestnanec;
DROP TABLE potrebyStanica;
DROP TABLE chovnaStanica;
DROP TABLE macka;
DROP TABLE vyrobcaPotrieb;
DROP TABLE vyrobca;
DROP TABLE chovatelskePotreby;

DROP SEQUENCE id_sequence; 
CREATE SEQUENCE id_sequence START WITH 1; 

CREATE TABLE macka(
ID_macka NUMBER(9),
meno varchar2(255),
druh varchar2(255),
datumNarodenia DATE,
PRIMARY KEY (ID_macka));

CREATE OR REPLACE TRIGGER id_plus
BEFORE INSERT ON macka 
FOR EACH ROW 

BEGIN 
SELECT id_sequence.NEXTVAL 
INTO :new.ID_macka 
FROM dual; 
END; 
/


INSERT INTO macka (meno, druh, datumNarodenia) VALUES ('Stewie','Canadian Cat',TO_DATE('2017.12.20','yyyy/mm/dd'));
INSERT INTO macka (meno, druh, datumNarodenia) VALUES ('Koly','Rassian Blue',TO_DATE('2017.12.20','yyyy/mm/dd'));
INSERT INTO macka (meno, druh, datumNarodenia) VALUES ('Moly','Scottish Fold',TO_DATE('2017.12.20','yyyy/mm/dd'));
INSERT INTO macka (meno, druh, datumNarodenia) VALUES ('Piter','Ocicat',TO_DATE('2017.12.20','yyyy/mm/dd'));
INSERT INTO macka (meno, druh, datumNarodenia) VALUES ('Lejla','Norwegian Forest Cat',TO_DATE('2017.12.20','yyyy/mm/dd'));

CREATE TABLE vyrobca(
ID_vyrobca NUMBER(9) NOT NULL,
nazov varchar2(255),
PRIMARY KEY (ID_vyrobca));

INSERT INTO vyrobca (ID_vyrobca, nazov) VALUES (1,'Whiskas');
INSERT INTO vyrobca (ID_vyrobca, nazov) VALUES (2,'Cats Cloths');
INSERT INTO vyrobca (ID_vyrobca, nazov) VALUES (3,'Game Cats');
INSERT INTO vyrobca (ID_vyrobca, nazov) VALUES (4,'Cats Things');
INSERT INTO vyrobca (ID_vyrobca, nazov) VALUES (5,'Water Cats');


CREATE TABLE chovnaStanica(
ID_stanica NUMBER(9) NOT NULL,
adresa varchar2(255),
email varchar2(255),
meno varchar2(255),
ID_macka NUMBER(9) NOT NULL,
PRIMARY KEY (ID_stanica),
FOREIGN KEY (ID_macka) REFERENCES macka(ID_macka));

INSERT INTO chovnaStanica (ID_stanica, adresa, email, meno, ID_macka) VALUES (1,'Shvejna, 14','ChovnaCanaCat@gmail.com','CanaCat',1);
INSERT INTO chovnaStanica (ID_stanica, adresa, email, meno, ID_macka) VALUES (2,'Rosvigovska, 27','ChovnaRaBl@gmail.com','RaBl',1);
INSERT INTO chovnaStanica (ID_stanica, adresa, email, meno, ID_macka) VALUES (3,'Pivnicna, 32','ChovnaScoFold@gmail.com','ScoFold',1);
INSERT INTO chovnaStanica (ID_stanica, adresa, email, meno, ID_macka) VALUES (4,'Visotska, 29','ChovnaExCat@gmail.com','ExCat',1);
INSERT INTO chovnaStanica (ID_stanica, adresa, email, meno, ID_macka) VALUES (5,'Krasnoarmejskaja, 10','ChovnaNFS@gmail.com','NFS',1);

CREATE TABLE chovatelskePotreby(
ID_potreby NUMBER(9) NOT NULL,
nazov varchar2(255),
cena NUMBER(9, 2),
pouzitie varchar2(255),
PRIMARY KEY (ID_potreby));

INSERT INTO chovatelskePotreby (ID_potreby, nazov, cena, pouzitie) VALUES (1,'Jedlo',1000,'Nakup jedla pre maciek.');
INSERT INTO chovatelskePotreby (ID_potreby, nazov, cena, pouzitie) VALUES (2,'Obliek',500,'Nakup oblieku na akekolvek pocasie pre maciek.');
INSERT INTO chovatelskePotreby (ID_potreby, nazov, cena, pouzitie) VALUES (3,'Hracky',550,'Nakup hraciek pre macok.');
INSERT INTO chovatelskePotreby (ID_potreby, nazov, cena, pouzitie) VALUES (4,'Zachody',900,'Nakup zachodov pre macok.');
INSERT INTO chovatelskePotreby (ID_potreby, nazov, cena, pouzitie) VALUES (5,'Sampune',200,'Nakup sampunov pre macok.');

CREATE TABLE vyrobcaPotrieb(
ID_potreby NUMBER(9) NOT NULL,
ID_vyrobca NUMBER(9) NOT NULL,
pocetKusov NUMBER(9) NOT NULL,
FOREIGN KEY (ID_potreby) REFERENCES chovatelskePotreby(ID_potreby),
FOREIGN KEY (ID_vyrobca) REFERENCES vyrobca(ID_vyrobca));

INSERT INTO vyrobcaPotrieb (ID_potreby, ID_vyrobca, pocetKusov) VALUES (1,1,20000);
INSERT INTO vyrobcaPotrieb (ID_potreby, ID_vyrobca, pocetKusov) VALUES (2,2,200);
INSERT INTO vyrobcaPotrieb (ID_potreby, ID_vyrobca, pocetKusov) VALUES (3,3,50);
INSERT INTO vyrobcaPotrieb (ID_potreby, ID_vyrobca, pocetKusov) VALUES (4,4,50);
INSERT INTO vyrobcaPotrieb (ID_potreby, ID_vyrobca, pocetKusov) VALUES (5,5,50);


CREATE TABLE potrebyStanica(
ID_stanica NUMBER(9) NOT NULL,
ID_potreby NUMBER(9) NOT NULL,
FOREIGN KEY (ID_stanica) REFERENCES chovnaStanica(ID_stanica),
FOREIGN KEY (ID_potreby) REFERENCES chovatelskePotreby(ID_potreby));

INSERT INTO potrebyStanica (ID_stanica, ID_potreby) VALUES (1,1);
INSERT INTO potrebyStanica (ID_stanica, ID_potreby) VALUES (1,2);
INSERT INTO potrebyStanica (ID_stanica, ID_potreby) VALUES (1,3);
INSERT INTO potrebyStanica (ID_stanica, ID_potreby) VALUES (1,4);
INSERT INTO potrebyStanica (ID_stanica, ID_potreby) VALUES (1,5);
INSERT INTO potrebyStanica (ID_stanica, ID_potreby) VALUES (2,1);
INSERT INTO potrebyStanica (ID_stanica, ID_potreby) VALUES (2,2);
INSERT INTO potrebyStanica (ID_stanica, ID_potreby) VALUES (2,3);
INSERT INTO potrebyStanica (ID_stanica, ID_potreby) VALUES (2,4);
INSERT INTO potrebyStanica (ID_stanica, ID_potreby) VALUES (2,5);
INSERT INTO potrebyStanica (ID_stanica, ID_potreby) VALUES (3,1);
INSERT INTO potrebyStanica (ID_stanica, ID_potreby) VALUES (3,2);
INSERT INTO potrebyStanica (ID_stanica, ID_potreby) VALUES (3,3);
INSERT INTO potrebyStanica (ID_stanica, ID_potreby) VALUES (3,4);
INSERT INTO potrebyStanica (ID_stanica, ID_potreby) VALUES (3,5);
INSERT INTO potrebyStanica (ID_stanica, ID_potreby) VALUES (4,1);
INSERT INTO potrebyStanica (ID_stanica, ID_potreby) VALUES (4,2);
INSERT INTO potrebyStanica (ID_stanica, ID_potreby) VALUES (4,3);
INSERT INTO potrebyStanica (ID_stanica, ID_potreby) VALUES (4,4);
INSERT INTO potrebyStanica (ID_stanica, ID_potreby) VALUES (4,5);
INSERT INTO potrebyStanica (ID_stanica, ID_potreby) VALUES (5,1);
INSERT INTO potrebyStanica (ID_stanica, ID_potreby) VALUES (5,2);
INSERT INTO potrebyStanica (ID_stanica, ID_potreby) VALUES (5,3);
INSERT INTO potrebyStanica (ID_stanica, ID_potreby) VALUES (5,4);
INSERT INTO potrebyStanica (ID_stanica, ID_potreby) VALUES (5,5);

CREATE TABLE zamestnanec(
ID_zamestnanec NUMBER(9) NOT NULL,
meno varchar2(255),
priezvisko varchar2(255),
cisloUctu NUMBER(20) NOT NULL,
rodneCislo NUMBER(5) NOT NULL,
bydlisko varchar2(255),
ID_stanica NUMBER(9) NOT NULL,
PRIMARY KEY (ID_zamestnanec),
FOREIGN KEY (ID_stanica) REFERENCES chovnaStanica(ID_stanica));

INSERT INTO zamestnanec (ID_zamestnanec, meno, priezvisko, cisloUctu, rodneCislo, bydlisko, ID_stanica) VALUES (1,'Yurii','Fedak',8968577526548794,51264,'KOSICE ZAPAD',1);
INSERT INTO zamestnanec (ID_zamestnanec, meno, priezvisko, cisloUctu, rodneCislo, bydlisko, ID_stanica) VALUES (2,'Mores','Moraes',6517899666662178,84790,'KOSICE JUH',1);
INSERT INTO zamestnanec (ID_zamestnanec, meno, priezvisko, cisloUctu, rodneCislo, bydlisko, ID_stanica) VALUES (3,'Kendrik','Lamar',7895584747232546,18574,'KOSICE JUH',1);
INSERT INTO zamestnanec (ID_zamestnanec, meno, priezvisko, cisloUctu, rodneCislo, bydlisko, ID_stanica) VALUES (4,'Lil','Peep',4859254758962448,48595,'KOSICE ZAPAD',1);
INSERT INTO zamestnanec (ID_zamestnanec, meno, priezvisko, cisloUctu, rodneCislo, bydlisko, ID_stanica) VALUES (5,'Post','Malone',7895524163595874,48513,'LUNIK VIII',1);
INSERT INTO zamestnanec (ID_zamestnanec, meno, priezvisko, cisloUctu, rodneCislo, bydlisko, ID_stanica) VALUES (6,'Kristian','Lutak',7485965822555236,65842,'LUNIK VIII',2);
INSERT INTO zamestnanec (ID_zamestnanec, meno, priezvisko, cisloUctu, rodneCislo, bydlisko, ID_stanica) VALUES (7,'Aleksei','Dolmatov',9744587458961236,54963,'KOSICE ZAPAD',2);
INSERT INTO zamestnanec (ID_zamestnanec, meno, priezvisko, cisloUctu, rodneCislo, bydlisko, ID_stanica) VALUES (8,'Alesha','Petrov',7854589632011452,16523,'LUNIK VIII',2);
INSERT INTO zamestnanec (ID_zamestnanec, meno, priezvisko, cisloUctu, rodneCislo, bydlisko, ID_stanica) VALUES (9,'Chloja','Morec',1542145223658754,56985,'KOSICE ZAPAD',2);
INSERT INTO zamestnanec (ID_zamestnanec, meno, priezvisko, cisloUctu, rodneCislo, bydlisko, ID_stanica) VALUES (10,'Denis','Latis',1542256547844566,78965,'KOSICE JUH',2);
INSERT INTO zamestnanec (ID_zamestnanec, meno, priezvisko, cisloUctu, rodneCislo, bydlisko, ID_stanica) VALUES (11,'Kolya','Kirlik',1584587449654589,48596,'LUNIK VIII',3);
INSERT INTO zamestnanec (ID_zamestnanec, meno, priezvisko, cisloUctu, rodneCislo, bydlisko, ID_stanica) VALUES (12,'Andrii','Pop',1541145215421452,85695,'KOSICE JUH',3);
INSERT INTO zamestnanec (ID_zamestnanec, meno, priezvisko, cisloUctu, rodneCislo, bydlisko, ID_stanica) VALUES (13,'Masha','Dobrova',1587478587454785,47856,'KOSICE ZAPAD',3);
INSERT INTO zamestnanec (ID_zamestnanec, meno, priezvisko, cisloUctu, rodneCislo, bydlisko, ID_stanica) VALUES (14,'Sasha','Bombila',1524256325897931,58964,'KOSICE ZAPAD',3);
INSERT INTO zamestnanec (ID_zamestnanec, meno, priezvisko, cisloUctu, rodneCislo, bydlisko, ID_stanica) VALUES (15,'Ales','Deak',1452254114526589,78965,'LUNIK VIII',3);
INSERT INTO zamestnanec (ID_zamestnanec, meno, priezvisko, cisloUctu, rodneCislo, bydlisko, ID_stanica) VALUES (16,'Savelii','Kroft',1452478598520021,85203,'KOSICE SEVER',4);
INSERT INTO zamestnanec (ID_zamestnanec, meno, priezvisko, cisloUctu, rodneCislo, bydlisko, ID_stanica) VALUES (17,'Frank','Benet',0001152065800258,75300,'KOSICE JUH',4);
INSERT INTO zamestnanec (ID_zamestnanec, meno, priezvisko, cisloUctu, rodneCislo, bydlisko, ID_stanica) VALUES (18,'Marta','Kolova',1559147814782569,58233,'KOSICE SEVER',4);
INSERT INTO zamestnanec (ID_zamestnanec, meno, priezvisko, cisloUctu, rodneCislo, bydlisko, ID_stanica) VALUES (19,'Harry','Potter',5896699666654444,85959,'LUNIK VIII',4);
INSERT INTO zamestnanec (ID_zamestnanec, meno, priezvisko, cisloUctu, rodneCislo, bydlisko, ID_stanica) VALUES (20,'Kristofer','Nolan',4785523025324569,78596,'LUNIK VIII',4);
INSERT INTO zamestnanec (ID_zamestnanec, meno, priezvisko, cisloUctu, rodneCislo, bydlisko, ID_stanica) VALUES (21,'Anor','Manul',5482548623231425,45896,'LUNIK VIII',5);
INSERT INTO zamestnanec (ID_zamestnanec, meno, priezvisko, cisloUctu, rodneCislo, bydlisko, ID_stanica) VALUES (22,'Marko','Pitonak',4885478569896999,48520,'KOSICE JUH',5);
INSERT INTO zamestnanec (ID_zamestnanec, meno, priezvisko, cisloUctu, rodneCislo, bydlisko, ID_stanica) VALUES (23,'Fedor','Matvejev',4785666655552321,78965,'KOSICE ZAPAD',5);
INSERT INTO zamestnanec (ID_zamestnanec, meno, priezvisko, cisloUctu, rodneCislo, bydlisko, ID_stanica) VALUES (24,'Katia','Smetana',5896587458921452,78451,'KOSICE SEVER',5);
INSERT INTO zamestnanec (ID_zamestnanec, meno, priezvisko, cisloUctu, rodneCislo, bydlisko, ID_stanica) VALUES (25,'Maros','Pados',5555269933254145,77748,'LUNIK VIII',5);

CREATE TABLE zradlo(
ID_zradlo NUMBER(9) NOT NULL,
nazov varchar2(255),
cena NUMBER(9, 2),
druh varchar2(255),
PRIMARY KEY (ID_zradlo));

INSERT INTO zradlo (ID_zradlo, nazov, cena, druh) VALUES (1,'Ryba',6,'Jazerna');
INSERT INTO zradlo (ID_zradlo, nazov, cena, druh) VALUES (2,'Voda',1,'Cerstva');
INSERT INTO zradlo (ID_zradlo, nazov, cena, druh) VALUES (3,'Korm',10,'Cerstvy');
INSERT INTO zradlo (ID_zradlo, nazov, cena, druh) VALUES (4,'Misy',3,'Cerstve');
INSERT INTO zradlo (ID_zradlo, nazov, cena, druh) VALUES (5,'Ine jedlo',7,'Co bude potrebovat');


CREATE TABLE zradloStanica(
ID_stanica NUMBER(9) NOT NULL,
ID_zradlo NUMBER(9) NOT NULL,
pocetKusov NUMBER(9) NOT NULL,
FOREIGN KEY (ID_stanica) REFERENCES chovnaStanica(ID_stanica),
FOREIGN KEY (ID_zradlo) REFERENCES zradlo(ID_zradlo));

INSERT INTO zradloStanica (ID_stanica, ID_zradlo, pocetKusov) VALUES (1,1,50);
INSERT INTO zradloStanica (ID_stanica, ID_zradlo, pocetKusov) VALUES (1,2,100);
INSERT INTO zradloStanica (ID_stanica, ID_zradlo, pocetKusov) VALUES (1,3,60);
INSERT INTO zradloStanica (ID_stanica, ID_zradlo, pocetKusov) VALUES (1,4,30);
INSERT INTO zradloStanica (ID_stanica, ID_zradlo, pocetKusov) VALUES (1,5,50);
INSERT INTO zradloStanica (ID_stanica, ID_zradlo, pocetKusov) VALUES (2,1,50);
INSERT INTO zradloStanica (ID_stanica, ID_zradlo, pocetKusov) VALUES (2,2,100);
INSERT INTO zradloStanica (ID_stanica, ID_zradlo, pocetKusov) VALUES (2,3,60);
INSERT INTO zradloStanica (ID_stanica, ID_zradlo, pocetKusov) VALUES (2,4,30);
INSERT INTO zradloStanica (ID_stanica, ID_zradlo, pocetKusov) VALUES (2,5,50);
INSERT INTO zradloStanica (ID_stanica, ID_zradlo, pocetKusov) VALUES (3,1,50);
INSERT INTO zradloStanica (ID_stanica, ID_zradlo, pocetKusov) VALUES (3,2,100);
INSERT INTO zradloStanica (ID_stanica, ID_zradlo, pocetKusov) VALUES (3,3,60);
INSERT INTO zradloStanica (ID_stanica, ID_zradlo, pocetKusov) VALUES (3,4,30);
INSERT INTO zradloStanica (ID_stanica, ID_zradlo, pocetKusov) VALUES (3,5,50);
INSERT INTO zradloStanica (ID_stanica, ID_zradlo, pocetKusov) VALUES (4,1,50);
INSERT INTO zradloStanica (ID_stanica, ID_zradlo, pocetKusov) VALUES (4,2,100);
INSERT INTO zradloStanica (ID_stanica, ID_zradlo, pocetKusov) VALUES (4,3,60);
INSERT INTO zradloStanica (ID_stanica, ID_zradlo, pocetKusov) VALUES (4,4,30);
INSERT INTO zradloStanica (ID_stanica, ID_zradlo, pocetKusov) VALUES (4,5,50);
INSERT INTO zradloStanica (ID_stanica, ID_zradlo, pocetKusov) VALUES (5,1,50);
INSERT INTO zradloStanica (ID_stanica, ID_zradlo, pocetKusov) VALUES (5,2,100);
INSERT INTO zradloStanica (ID_stanica, ID_zradlo, pocetKusov) VALUES (5,3,60);
INSERT INTO zradloStanica (ID_stanica, ID_zradlo, pocetKusov) VALUES (5,4,30);
INSERT INTO zradloStanica (ID_stanica, ID_zradlo, pocetKusov) VALUES (5,5,50);


DROP VIEW CenaJedlaViacAko5;
--Vipis mi zradlo cena ktoreho je viac ako 5 eur.
CREATE VIEW CenaJedlaViacAko5 AS
SELECT * FROM zradlo WHERE cena > 5;

DROP VIEW CenaJedlaMenejAko5;
--Vipis mi zradlo cena ktoreho je menej ako 5 eur.
CREATE VIEW CenaJedlaMenejAko5 AS
SELECT * FROM zradlo WHERE cena < 5;

DROP VIEW ScoFoldZamKosiceZapad;
--Vipis mi zamestnancov z chovnej stanici ScoFold ktorich bydlisko je KOSICE ZAPAD.
CREATE VIEW ScoFoldZamKosiceZapad AS
SELECT z.ID_zamestnanec, z.meno, z.priezvisko, z.bydlisko, z.ID_stanica, s.meno AS menoStanici FROM zamestnanec z INNER JOIN chovnaStanica s 
ON z.ID_stanica = s.ID_stanica WHERE s.meno = 'ScoFold' AND z.bydlisko = 'KOSICE ZAPAD';

DROP VIEW MackiStanica;
--Vipis mi ktore druhi macek chovaju na kazdej stanice.
CREATE VIEW MackiStanica AS
SELECT s.druh, z.meno FROM macka s INNER JOIN chovnaStanica z ON s.ID_macka = z.ID_stanica;

DROP VIEW VyrobcaPotrebaPocKus;
--Vypis mi nazov vyrobcov potrieb a pocet objednanich kusov 
CREATE VIEW VyrobcaPotrebaPocKus AS
SELECT z.nazov, s.nazov AS nazovPotreby, k.pocetKusov FROM ((chovatelskePotreby s INNER JOIN vyrobcaPotrieb k ON s.ID_potreby = k.ID_vyrobca) 
INNER JOIN vyrobca z ON z.ID_vyrobca = s.ID_potreby);

DROP VIEW StrednaCena;
--Vipis strednu cenu chovatelskych Potreb
CREATE VIEW StrednaCena AS
SELECT AVG(cena) AS cenaPotreby FROM chovatelskePotreby;

DROP VIEW ZamestZLunikVII;
--Vipis mne vsetkicj zamestnanciv ktorych bydlicsko je Lunik VIII
CREATE VIEW ZamestZLunikVII AS
SELECT COUNT(ID_zamestnanec) AS zamID FROM zamestnanec WHERE bydlisko = 'LUNIK VIII';

DROP VIEW MackaStanica;
--Vipis mne na ktorich stanicach chovaju kazdy druh macek.
CREATE VIEW MackaStanica AS
SELECT s.druh, z.meno AS chovSt FROM macka s FULL OUTER JOIN chovnaStanica z ON s.ID_macka = z.ID_stanica;

--3 ODOVZDAVKA



DROP VIEW najmensaCena;
--Vypis chovatelsku potrebu z najmensej cenou;
CREATE VIEW najmensaCena AS 
SELECT nazov, cena FROM chovatelskePotreby WHERE cena = (SELECT MIN(cena) AS najmensaCena FROM chovatelskePotreby);


DROP VIEW KompaniaCoVyrabaSampun;
--Vypis lompaniu ktora vyraba Sampune
CREATE VIEW KompaniaCoVyrabaSampun
AS  SELECT nazov FROM vyrobca WHERE ID_VYROBCA IN(SELECT ID_potreby FROM chovatelskePotreby WHERE nazov = 'Sampune');


DROP VIEW VypisDruhMacki;
--Vypis to co potrbuje macka;
CREATE VIEW VypisDruhMacki
AS SELECT nazov FROM chovatelskePotreby UNION SELECT nazov FROM zradlo;











