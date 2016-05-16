---------------------------------------------------------------------------------------------
----------------------DROPPING EXISTING TABLES AND SEQUENCES---------------------------------
---------------------------------------------------------------------------------------------
drop table PERSOON cascade constraints;
drop table STATUSACCOUNT cascade constraints;
drop table ACCOUNT cascade constraints;
drop table LIJN cascade constraints;
drop table STATUSSPOOR cascade constraints;
drop table STATUSTRAM cascade constraints;
drop table TRAMTYPE cascade constraints;
drop table SPOOR cascade constraints;
drop table TRAM cascade constraints;
drop table DIENST cascade constraints;
drop table DIENSTREGELING cascade constraints;
drop table SCHOONMAAK cascade constraints;
drop table ONDERHOUD cascade constraints;

---------------------------------------------------------------------------------------------
-------------------------------CREATING TABLES-----------------------------------------------
---------------------------------------------------------------------------------------------
CREATE TABLE PERSOON
(PersoonID number(10) primary key,
Voornaam varchar2(50) not null,
Achternaam varchar2(50) not null,
Adres varchar2(50) not null,
Geboortedatum date not null
);

CREATE TABLE STATUSACCOUNT
(StatusAccountNr number primary key,
Beschrijving varchar2(255) not null,

CONSTRAINT CHK_STATUSACCOUNT_Beschrijving CHECK ((Beschrijving) IN ('Beheerder','Technicus','WagenparkBeheerder','Schoonmaker','Bestuurder'))
);

CREATE TABLE ACCOUNT
(PersoonID number(10) primary key,
Gebruikersnaam varchar2(50) not null,
Wachtwoord varchar2(50) not null,
StatusAccountNr number(10) not null,

CONSTRAINT fk_PersoonIdAcc foreign key(PersoonID) REFERENCES PERSOON(PersoonID) on delete cascade,
CONSTRAINT fk_StatusAccountNrAcc foreign key(StatusAccountNr) REFERENCES STATUSACCOUNT(StatusAccountNr) on delete cascade
);

CREATE TABLE LIJN
(LijnNr varchar2(10) primary key
);

CREATE TABLE STATUSSPOOR
(StatusSpoorNr number(10) primary key,
Beschrijving varchar2(255) not null,

CONSTRAINT CHK_STATUSSPOOR_Beschrijving CHECK ((Beschrijving) IN ('Bezet','Geblokkeerd','Vrij'))
);

CREATE TABLE STATUSTRAM
(StatusTramNr number(10) primary key,
Beschrijving varchar2(255) not null,

CONSTRAINT CHK_STATUSTRAM_Beschrijving CHECK ((Beschrijving) IN ('Schoonmaak','Defect','Dienst','Remise'))
);

CREATE TABLE TRAMTYPE
(TramTypeNr number(10) primary key,
Beschrijving varchar2(255) not null,

CONSTRAINT CHK_TRAMTYPE_Beschrijving CHECK ((Beschrijving) IN ('Combino','Dubbel Kop Combino','11G','12G','Opleidingstram'))
);

CREATE TABLE SPOOR
(SpoorNr number(10) primary key,
StatusSpoorNr number(10) not null,
LijnNr varchar2(10) not null,
Sector varchar2(50) not null,

CONSTRAINT fk_StatusSpoorNrSpoor foreign key(StatusSpoorNr) REFERENCES STATUSSPOOR(StatusSpoorNr),
CONSTRAINT fk_LijnNrSpoor foreign key(LijnNr) REFERENCES LIJN(LijnNr)
);

CREATE TABLE TRAM
(TramNr number(10) primary key,
Bijzonderheden varchar2(255) ,
TramTypeNr number(10) not null,
StatusTramNr number(10) not null,
SpoorNr number(10) null,

CONSTRAINT fk_TramTypeNrTram foreign key(TramTypeNr) REFERENCES TRAMTYPE(TramTypeNr),
CONSTRAINT fk_StatusTramTram foreign key(StatusTramNr) REFERENCES STATUSTRAM(StatusTramNr),
CONSTRAINT fk_SpoorNrTram foreign key (SpoorNr) REFERENCES SPOOR(SpoorNr)
);

CREATE TABLE DIENST
(DienstNr number(10) primary key,
Uitrijtijd varchar2(50) not null,
Inrijtijd varchar2(50) not null,
LijnNr varchar2(10) not null,
Bijzonderheden varchar2(255) ,

CONSTRAINT fk_LijnNrDienst foreign key(LijnNr) REFERENCES LIJN(LijnNr)
);

CREATE TABLE DIENSTREGELING
(DienstregelingNr number(10) primary key,
PersoonID number(10) not null,
DienstNr number(10) not null,
TramNr number(10) not null,

CONSTRAINT fk_PersoonIdDienstreg foreign key(PersoonID) REFERENCES PERSOON(PersoonID),
CONSTRAINT fk_DienstNrDienstreg foreign key(DienstNr) REFERENCES DIENST(DienstNr),
CONSTRAINT fk_TramNrDienstreg foreign key(TramNr) REFERENCES TRAM(TramNr)
);

CREATE TABLE SCHOONMAAK
(SchoonmaakNr number(10) primary key,
TramNr number(10) not null,
PersoonID number(10) not null,
BeginTijd varchar2(50) not null,
EindTijd varchar2(50) not null,

CONSTRAINT fk_TramNrSchoonmaak foreign key(TramNr) REFERENCES TRAM(TramNr),
CONSTRAINT fk_PersoonIdSchoonmaak foreign key (PersoonID) REFERENCES PERSOON(PersoonID)
);

CREATE TABLE ONDERHOUD
(OnderhoudsNr number(10) primary key,
TramNr number(10) not null,
PersoonID number(10) not null,
TijdsIndicatie varchar2(50) not null,

CONSTRAINT fk_TramNrOnderhoud foreign key(TramNr) REFERENCES TRAM(TramNr),
CONSTRAINT fk_PersoonIdOnderhoud foreign key (PersoonID) REFERENCES PERSOON(PersoonID)
);


---------------------------------------------------------------------------------------------
--------------------------------------TEST DATA----------------------------------------------
---------------------------------------------------------------------------------------------
--PERSOON
insert into PERSOON (PersoonID, Voornaam, Achternaam, Adres, Geboortedatum)
values (0001,'Kenneth','Reijnders' ,'Kennedyplein 29',TO_DATE('1992-08-22', 'YYYY-MM-DD'));
insert into PERSOON (PersoonID, Voornaam, Achternaam, Adres, Geboortedatum)
values (0002,'Chiel','Sprangers' ,'Eikenboomlaan 42',TO_DATE('1993-06-02', 'YYYY-MM-DD'));
insert into PERSOON (PersoonID, Voornaam, Achternaam, Adres, Geboortedatum)
values (0003,'Ruud','Hagers' ,'Het hofje 3a',TO_DATE('1994-12-09', 'YYYY-MM-DD'));
insert into PERSOON (PersoonID, Voornaam, Achternaam, Adres, Geboortedatum)
values (0004,'Mick','Vranken' ,'Raiffeisenstraat 7',TO_DATE('1993-07-21', 'YYYY-MM-DD'));


--STATUSACCOUNT
insert into STATUSACCOUNT (StatusAccountNr, Beschrijving)
values (0001,'Beheerder');
insert into STATUSACCOUNT (StatusAccountNr, Beschrijving)
values (0002,'WagenparkBeheerder');
insert into STATUSACCOUNT (StatusAccountNr, Beschrijving)
values (0003,'Schoonmaker');
insert into STATUSACCOUNT (StatusAccountNr, Beschrijving)
values (0004,'Technicus');
insert into STATUSACCOUNT (StatusAccountNr, Beschrijving)
values (0005,'Bestuurder');


--ACCOUNT
insert into ACCOUNT (PersoonID, Gebruikersnaam, Wachtwoord, StatusAccountNr)
values (0001,'Kennethje','Kennethje123',0001);
insert into ACCOUNT (PersoonID, Gebruikersnaam, Wachtwoord, StatusAccountNr)
values (0002,'Chieltje','Chieltje123',0002);
insert into ACCOUNT (PersoonID, Gebruikersnaam, Wachtwoord, StatusAccountNr)
values (0003,'Ruudje','Ruudje123',0003);
insert into ACCOUNT (PersoonID, Gebruikersnaam, Wachtwoord, StatusAccountNr)
values (0004,'Mickel','Mickel123',0004);


--LIJN
insert into LIJN (LijnNr)
values ('1');
insert into LIJN (LijnNr)
values ('2');
insert into LIJN (LijnNr)
values ('5');
insert into LIJN (LijnNr)
values ('10');
insert into LIJN (LijnNr)
values ('13');
insert into LIJN (LijnNr)
values ('16/24');
insert into LIJN (LijnNr)
values ('17');
insert into LIJN (LijnNr)
values ('55');
insert into LIJN (LijnNr)
values ('RES');
insert into LIJN (LijnNr)
values ('OCVT');

--STATUSSPOOR
insert into STATUSSPOOR (StatusSpoorNr, Beschrijving)
values (0001,'Bezet');
insert into STATUSSPOOR (StatusSpoorNr, Beschrijving)
values (0002,'Geblokkeerd');
insert into STATUSSPOOR (StatusSpoorNr, Beschrijving)
values (0003,'Vrij');


--STATUSTRAM
insert into STATUSTRAM (StatusTramNr, Beschrijving)
values (0001,'Schoonmaak');
insert into STATUSTRAM (StatusTramNr, Beschrijving)
values (0002,'Defect');
insert into STATUSTRAM (StatusTramNr, Beschrijving)
values (0003,'Dienst');
insert into STATUSTRAM (StatusTramNr, Beschrijving)
values (0004,'Remise');


--TRAMTYPE
insert into TRAMTYPE (TramTypeNr, Beschrijving)
values (0001,'Combino');
insert into TRAMTYPE (TramTypeNr, Beschrijving)
values (0002,'Dubbel Kop Combino');
insert into TRAMTYPE (TramTypeNr, Beschrijving)
values (0003,'11G');
insert into TRAMTYPE (TramTypeNr, Beschrijving)
values (0004,'12G');
insert into TRAMTYPE (TramTypeNr, Beschrijving)
values (0005,'Opleidingstram');

--SPOOR
insert into SPOOR (SpoorNr, StatusSpoorNr, LijnNr, Sector)
values (12,0001,'13',3);
insert into SPOOR (SpoorNr, StatusSpoorNr, LijnNr, Sector)
values (13,0003,'16/24',1);
insert into SPOOR (SpoorNr, StatusSpoorNr, LijnNr, Sector)
values (14,0001,'5',1);
insert into SPOOR (SpoorNr, StatusSpoorNr, LijnNr, Sector)
values (15,0002,'13',2);
insert into SPOOR (SpoorNr, StatusSpoorNr, LijnNr, Sector)
values (16,0002,'1',1);
insert into SPOOR (SpoorNr, StatusSpoorNr, LijnNr, Sector)
values (17,0003,'1',1);
insert into SPOOR (SpoorNr, StatusSpoorNr, LijnNr, Sector)
values (18,0001,'17',3);
insert into SPOOR (SpoorNr, StatusSpoorNr, LijnNr, Sector)
values (19,0003,'2',1);
insert into SPOOR (SpoorNr, StatusSpoorNr, LijnNr, Sector)
values (20,0001,'16/24',2);
insert into SPOOR (SpoorNr, StatusSpoorNr, LijnNr, Sector)
values (21,0002,'13',1);
insert into SPOOR (SpoorNr, StatusSpoorNr, LijnNr, Sector)
values (30,0002,'1',1);
insert into SPOOR (SpoorNr, StatusSpoorNr, LijnNr, Sector)
values (31,0001,'1',1);
insert into SPOOR (SpoorNr, StatusSpoorNr, LijnNr, Sector)
values (32,0001,'17',1);
insert into SPOOR (SpoorNr, StatusSpoorNr, LijnNr, Sector)
values (33,0001,'10',3);
insert into SPOOR (SpoorNr, StatusSpoorNr, LijnNr, Sector)
values (34,0003,'2',2);
insert into SPOOR (SpoorNr, StatusSpoorNr, LijnNr, Sector)
values (35,0003,'5',2);
insert into SPOOR (SpoorNr, StatusSpoorNr, LijnNr, Sector)
values (36,0001,'55',6);
insert into SPOOR (SpoorNr, StatusSpoorNr, LijnNr, Sector)
values (37,0001,'17',2);
insert into SPOOR (SpoorNr, StatusSpoorNr, LijnNr, Sector)
values (38,0001,'2',3);
insert into SPOOR (SpoorNr, StatusSpoorNr, LijnNr, Sector)
values (40,0002,'1',1);
insert into SPOOR (SpoorNr, StatusSpoorNr, LijnNr, Sector)
values (41,0002,'5',3);
insert into SPOOR (SpoorNr, StatusSpoorNr, LijnNr, Sector)
values (42,0001,'10',2);
insert into SPOOR (SpoorNr, StatusSpoorNr, LijnNr, Sector)
values (43,0001,'1',1);
insert into SPOOR (SpoorNr, StatusSpoorNr, LijnNr, Sector)
values (44,0002,'55',1);
insert into SPOOR (SpoorNr, StatusSpoorNr, LijnNr, Sector)
values (45,0003,'55',5);
insert into SPOOR (SpoorNr, StatusSpoorNr, LijnNr, Sector)
values (51,0001,'10',1);
insert into SPOOR (SpoorNr, StatusSpoorNr, LijnNr, Sector)
values (52,0001,'2',5);
insert into SPOOR (SpoorNr, StatusSpoorNr, LijnNr, Sector)
values (53,0002,'1',1);
insert into SPOOR (SpoorNr, StatusSpoorNr, LijnNr, Sector)
values (54,0002,'17',4);
insert into SPOOR (SpoorNr, StatusSpoorNr, LijnNr, Sector)
values (55,0001,'55',2);
insert into SPOOR (SpoorNr, StatusSpoorNr, LijnNr, Sector)
values (56,0001,'1',1);
insert into SPOOR (SpoorNr, StatusSpoorNr, LijnNr, Sector)
values (57,0003,'13',3);
insert into SPOOR (SpoorNr, StatusSpoorNr, LijnNr, Sector)
values (58,0001,'55',3);
insert into SPOOR (SpoorNr, StatusSpoorNr, LijnNr, Sector)
values (61,0002,'OCVT',2);
insert into SPOOR (SpoorNr, StatusSpoorNr, LijnNr, Sector)
values (62,0001,'1',1);
insert into SPOOR (SpoorNr, StatusSpoorNr, LijnNr, Sector)
values (63,0001,'55',4);
insert into SPOOR (SpoorNr, StatusSpoorNr, LijnNr, Sector)
values (64,0002,'2',4);
insert into SPOOR (SpoorNr, StatusSpoorNr, LijnNr, Sector)
values (74,0001,'RES',1);
insert into SPOOR (SpoorNr, StatusSpoorNr, LijnNr, Sector)
values (75,0001,'13',2);
insert into SPOOR (SpoorNr, StatusSpoorNr, LijnNr, Sector)
values (76,0003,'RES',2);
insert into SPOOR (SpoorNr, StatusSpoorNr, LijnNr, Sector)
values (77,0003,'OCVT',1);


--TRAM
insert into TRAM (TramNr, Bijzonderheden, TramTypeNr, StatusTramNr, SpoorNr)
values (807,'-',0004,0002,77);
insert into TRAM (TramNr, Bijzonderheden, TramTypeNr, StatusTramNr, SpoorNr)
values (802,'-',0001,0003,76);
insert into TRAM (TramNr, Bijzonderheden, TramTypeNr, StatusTramNr, SpoorNr)
values (790,'-',0004,0001,75);
insert into TRAM (TramNr, Bijzonderheden, TramTypeNr, StatusTramNr, SpoorNr)
values (795,'-',0002,0001,74);
insert into TRAM (TramNr, Bijzonderheden, TramTypeNr, StatusTramNr, SpoorNr)
values (809,'-',0005,0001,64);
insert into TRAM (TramNr, Bijzonderheden, TramTypeNr, StatusTramNr, SpoorNr)
values (791,'-',0003,0004,63);
insert into TRAM (TramNr, Bijzonderheden, TramTypeNr, StatusTramNr, SpoorNr)
values (788,'-',0001,0001,62);
insert into TRAM (TramNr, Bijzonderheden, TramTypeNr, StatusTramNr, SpoorNr)
values (789,'-',0001,0002,61);
insert into TRAM (TramNr, Bijzonderheden, TramTypeNr, StatusTramNr, SpoorNr)
values (815,'-',0001,0002,58);
insert into TRAM (TramNr, Bijzonderheden, TramTypeNr, StatusTramNr, SpoorNr)
values (793,'-',0001,0001,57);
insert into TRAM (TramNr, Bijzonderheden, TramTypeNr, StatusTramNr, SpoorNr)
values (783,'-',0003,0002,56);
insert into TRAM (TramNr, Bijzonderheden, TramTypeNr, StatusTramNr, SpoorNr)
values (800,'-',0002,0004,55);
insert into TRAM (TramNr, Bijzonderheden, TramTypeNr, StatusTramNr, SpoorNr)
values (799,'-',0005,0001,54);
insert into TRAM (TramNr, Bijzonderheden, TramTypeNr, StatusTramNr, SpoorNr)
values (828,'-',0001,0003,53);
insert into TRAM (TramNr, Bijzonderheden, TramTypeNr, StatusTramNr, SpoorNr)
values (2025,'-',0003,0004,52);
insert into TRAM (TramNr, Bijzonderheden, TramTypeNr, StatusTramNr, SpoorNr)
values (89,'-',0001,0001,51);
insert into TRAM (TramNr, Bijzonderheden, TramTypeNr, StatusTramNr, SpoorNr)
values (12,'-',0001,0002,45);
insert into TRAM (TramNr, Bijzonderheden, TramTypeNr, StatusTramNr, SpoorNr)
values (6,'-',0001,0004,44);
insert into TRAM (TramNr, Bijzonderheden, TramTypeNr, StatusTramNr, SpoorNr)
values (1,'-',0005,0004,43);
insert into TRAM (TramNr, Bijzonderheden, TramTypeNr, StatusTramNr, SpoorNr)
values (3,'-',0002,0003,42);
insert into TRAM (TramNr, Bijzonderheden, TramTypeNr, StatusTramNr, SpoorNr)
values (4,'-',0001,0004,41);
insert into TRAM (TramNr, Bijzonderheden, TramTypeNr, StatusTramNr, SpoorNr)
values (5,'-',0001,0002,40);
insert into TRAM (TramNr, Bijzonderheden, TramTypeNr, StatusTramNr, SpoorNr)
values (903,'-',0001,0002,38);
insert into TRAM (TramNr, Bijzonderheden, TramTypeNr, StatusTramNr, SpoorNr)
values (2056,'-',0001,0003,37);
insert into TRAM (TramNr, Bijzonderheden, TramTypeNr, StatusTramNr, SpoorNr)
values (2,'-',0001,0001,36);
insert into TRAM (TramNr, Bijzonderheden, TramTypeNr, StatusTramNr, SpoorNr)
values (10,'-',0001,0003,35);
insert into TRAM (TramNr, Bijzonderheden, TramTypeNr, StatusTramNr, SpoorNr)
values (11,'-',0005,0002,34);
insert into TRAM (TramNr, Bijzonderheden, TramTypeNr, StatusTramNr, SpoorNr)
values (23,'-',0004,0004,33);
insert into TRAM (TramNr, Bijzonderheden, TramTypeNr, StatusTramNr, SpoorNr)
values (2070,'-',0002,0002,32);
insert into TRAM (TramNr, Bijzonderheden, TramTypeNr, StatusTramNr, SpoorNr)
values (2202,'-',0005,0001,31);
insert into TRAM (TramNr, Bijzonderheden, TramTypeNr, StatusTramNr, SpoorNr)
values (2072,'-',0001,0004,30);
insert into TRAM (TramNr, Bijzonderheden, TramTypeNr, StatusTramNr, SpoorNr)
values (2029,'-',0001,0001,21);
insert into TRAM (TramNr, Bijzonderheden, TramTypeNr, StatusTramNr, SpoorNr)
values (2028,'-',0004,0001,20);
insert into TRAM (TramNr, Bijzonderheden, TramTypeNr, StatusTramNr, SpoorNr)
values (2024,'-',0003,0002,19);
insert into TRAM (TramNr, Bijzonderheden, TramTypeNr, StatusTramNr, SpoorNr)
values (2066,'-',0001,0004,18);
insert into TRAM (TramNr, Bijzonderheden, TramTypeNr, StatusTramNr, SpoorNr)
values (2012,'-',0001,0004,17);
insert into TRAM (TramNr, Bijzonderheden, TramTypeNr, StatusTramNr, SpoorNr)
values (2044,'-',0001,0004,16);
insert into TRAM (TramNr, Bijzonderheden, TramTypeNr, StatusTramNr, SpoorNr)
values (798,'-',0005,0002,15);
insert into TRAM (TramNr, Bijzonderheden, TramTypeNr, StatusTramNr, SpoorNr)
values (803,'-',0002,0002,14);
insert into TRAM (TramNr, Bijzonderheden, TramTypeNr, StatusTramNr, SpoorNr)
values (808,'-',0001,0003,13);
insert into TRAM (TramNr, Bijzonderheden, TramTypeNr, StatusTramNr, SpoorNr)
values (13,'-',0001,0001,12);
insert into TRAM (TramNr, Bijzonderheden, TramTypeNr, StatusTramNr, SpoorNr)
values (2035,'-',0005,0001,55);
insert into TRAM (TramNr, Bijzonderheden, TramTypeNr, StatusTramNr, SpoorNr)
values (2063,'-',0002,0004,64);
insert into TRAM (TramNr, Bijzonderheden, TramTypeNr, StatusTramNr, SpoorNr)
values (2045,'-',0001,0004,42);
insert into TRAM (TramNr, Bijzonderheden, TramTypeNr, StatusTramNr, SpoorNr)
values (2054,'-',0002,0003,58);
insert into TRAM (TramNr, Bijzonderheden, TramTypeNr, StatusTramNr, SpoorNr)
values (2003,'-',0001,0004,55);
insert into TRAM (TramNr, Bijzonderheden, TramTypeNr, StatusTramNr, SpoorNr)
values (816,'-',0002,0001,62);
insert into TRAM (TramNr, Bijzonderheden, TramTypeNr, StatusTramNr, SpoorNr)
values (835,'-',0001,0001,64);
insert into TRAM (TramNr, Bijzonderheden, TramTypeNr, StatusTramNr, SpoorNr)
values (2065,'-',0002,0002,58);
insert into TRAM (TramNr, Bijzonderheden, TramTypeNr, StatusTramNr, SpoorNr)
values (824,'-',0003,0004,55);
insert into TRAM (TramNr, Bijzonderheden, TramTypeNr, StatusTramNr, SpoorNr)
values (2021,'-',0001,0001,62);
insert into TRAM (TramNr, Bijzonderheden, TramTypeNr, StatusTramNr, SpoorNr)
values (2011,'-',0001,0003,42);
insert into TRAM (TramNr, Bijzonderheden, TramTypeNr, StatusTramNr, SpoorNr)
values (904,'-',0003,0003,51);
insert into TRAM (TramNr, Bijzonderheden, TramTypeNr, StatusTramNr, SpoorNr)
values (841,'-',0004,0001,58);
insert into TRAM (TramNr, Bijzonderheden, TramTypeNr, StatusTramNr, SpoorNr)
values (917,'-',0001,0004,55);
insert into TRAM (TramNr, Bijzonderheden, TramTypeNr, StatusTramNr, SpoorNr)
values (2057,'-',0001,0002,64);
insert into TRAM (TramNr, Bijzonderheden, TramTypeNr, StatusTramNr, SpoorNr)
values (918,'-',0005,0001,35);
insert into TRAM (TramNr, Bijzonderheden, TramTypeNr, StatusTramNr, SpoorNr)
values (909,'-',0003,0002,51);
insert into TRAM (TramNr, Bijzonderheden, TramTypeNr, StatusTramNr, SpoorNr)
values (911,'-',0002,0003,55);
insert into TRAM (TramNr, Bijzonderheden, TramTypeNr, StatusTramNr, SpoorNr)
values (833,'-',0002,0002,35);
insert into TRAM (TramNr, Bijzonderheden, TramTypeNr, StatusTramNr, SpoorNr)
values (2091,'-',0004,0003,58);


--DIENST
insert into DIENST (DienstNr, Uitrijtijd, Inrijtijd, LijnNr, Bijzonderheden)
values (0001,'06:41','07:45','1','-');
insert into DIENST (DienstNr, Uitrijtijd, Inrijtijd, LijnNr, Bijzonderheden)
values (0002,'08:39','10:22','2','-');
insert into DIENST (DienstNr, Uitrijtijd, Inrijtijd, LijnNr, Bijzonderheden)
values (0003,'09:23','11:01','5','-');
insert into DIENST (DienstNr, Uitrijtijd, Inrijtijd, LijnNr, Bijzonderheden)
values (0004,'10:10','12:56','10','-');
insert into DIENST (DienstNr, Uitrijtijd, Inrijtijd, LijnNr, Bijzonderheden)
values (0005,'13:21','16:15','13','-');
insert into DIENST (DienstNr, Uitrijtijd, Inrijtijd, LijnNr, Bijzonderheden)
values (0006,'12:53','14:37','16/24','-');
insert into DIENST (DienstNr, Uitrijtijd, Inrijtijd, LijnNr, Bijzonderheden)
values (0007,'14:32','15:25','17','-');
insert into DIENST (DienstNr, Uitrijtijd, Inrijtijd, LijnNr, Bijzonderheden)
values (0008,'21:15','23:59','55','-');
insert into DIENST (DienstNr, Uitrijtijd, Inrijtijd, LijnNr, Bijzonderheden)
values (0009,'16:24','18:00','RES','-');
insert into DIENST (DienstNr, Uitrijtijd, Inrijtijd, LijnNr, Bijzonderheden)
values (0010,'19:44','20:04','OCVT','-');

--DIENSTREGELING
insert into DIENSTREGELING (DienstregelingNr, PersoonID, DienstNr, TramNr)
values (0001,0001,0001,807);
insert into DIENSTREGELING (DienstregelingNr, PersoonID, DienstNr, TramNr)
values (0002,0002,0002,802);
insert into DIENSTREGELING (DienstregelingNr, PersoonID, DienstNr, TramNr)
values (0003,0003,0003,790);
insert into DIENSTREGELING (DienstregelingNr, PersoonID, DienstNr, TramNr)
values (0004,0004,0004,795);
insert into DIENSTREGELING (DienstregelingNr, PersoonID, DienstNr, TramNr)
values (0005,0001,0005,809);


--SCHOONMAAK
insert into SCHOONMAAK (SchoonmaakNr, TramNr, PersoonID, BeginTijd, EindTijd)
values (0001,807,0001,'08:30','09:30');
insert into SCHOONMAAK (SchoonmaakNr, TramNr, PersoonID, BeginTijd, EindTijd)
values (0002,790,0003,'09:30','10:30');
insert into SCHOONMAAK (SchoonmaakNr, TramNr, PersoonID, BeginTijd, EindTijd)
values (0003,791,0004,'10:30','11:30');
insert into SCHOONMAAK (SchoonmaakNr, TramNr, PersoonID, BeginTijd, EindTijd)
values (0004,802,0002,'11:30','12:30');
insert into SCHOONMAAK (SchoonmaakNr, TramNr, PersoonID, BeginTijd, EindTijd)
values (0005,815,0002,'12:30','14:30');
insert into SCHOONMAAK (SchoonmaakNr, TramNr, PersoonID, BeginTijd, EindTijd)
values (0006,783,0004,'14:30','16:30');


--ONDERHOUD
insert into ONDERHOUD (OnderhoudsNr, TramNr, PersoonID, TijdsIndicatie)
values (0001,807,0001,'120 minuten');
insert into ONDERHOUD (OnderhoudsNr, TramNr, PersoonID, TijdsIndicatie)
values (0002,799,0003,'90 minuten');
insert into ONDERHOUD (OnderhoudsNr, TramNr, PersoonID, TijdsIndicatie)
values (0003,2044,0003,'160 minuten');
insert into ONDERHOUD (OnderhoudsNr, TramNr, PersoonID, TijdsIndicatie)
values (0004,808,0002,'140 minuten');
insert into ONDERHOUD (OnderhoudsNr, TramNr, PersoonID, TijdsIndicatie)
values (0005,2045,0004,'60 minuten');

savepoint sp_Clean;
---------------------------------------------------------------------------------------------
--------------------------------------TESTING------------------------------------------------
---------------------------------------------------------------------------------------------
-- Hier check ik of de check constraints van statusspoor het goed doet, 
--als het goed is kun je alleen 'Bezet','Geblokkeerd' of 'Vrij' invullen bij beschrijving.
insert into STATUSSPOOR (StatusSpoorNr, Beschrijving)
values (0001,'Test');
/*Error starting at line : 506 in command -
insert into STATUSSPOOR (StatusSpoorNr, Beschrijving)
values (0001,'Test')
Error report -
SQL Error: ORA-02290: check constraint (MICKY.CHK_STATUSSPOOR_BESCHRIJVING) violated
02290. 00000 -  "check constraint (%s.%s) violated"
*Cause:    The values being inserted do not satisfy the named check
           
*Action:   do not insert values that violate the constraint.
*/


-- Hier check ik of de check constraints van statusspoor het goed doet, 
--als het goed is kun je alleen 'Beheerder','Technicus','WagenparkBeheerder', 'Bestuurder' of 'Vrij' invullen bij beschrijving.
insert into STATUSACCOUNT (StatusAccountNr, Beschrijving)
values (0001,'Test');
/*Error starting at line : 522 in command -
insert into STATUSACCOUNT (StatusAccountNr, Beschrijving)
values (0001,'Test')
Error report -
SQL Error: ORA-02290: check constraint (MICKY.CHK_STATUSACCOUNT_BESCHRIJVING) violated
02290. 00000 -  "check constraint (%s.%s) violated"
*Cause:    The values being inserted do not satisfy the named check
           
*Action:   do not insert values that violate the constraint.*/


-- Hier check ik of de check constraints van statusspoor het goed doet, 
--als het goed is kun je alleen 'Schoonmaak','Defect','Dienst' of 'Remise' invullen bij beschrijving.
insert into STATUSTRAM (StatusTramNr, Beschrijving)
values (0001,'Schoonmaak');
/*Error starting at line : 537 in command -
insert into STATUSTRAM (StatusTramNr, Beschrijving)
values (0001,'Schoonmaak')
Error report -
SQL Error: ORA-00001: unique constraint (MICKY.SYS_C008292) violated
00001. 00000 -  "unique constraint (%s.%s) violated"
*Cause:    An UPDATE or INSERT statement attempted to insert a duplicate key.
           For Trusted Oracle configured in DBMS MAC mode, you may see
           this message if a duplicate entry exists at a different level.
*Action:   Either remove the unique restriction or do not insert the key.*/

-- Hier check ik of de check constraints van statusspoor het goed doet, 
--als het goed is kun je alleen 'Combino','Dubbel Kop Combino','11G','12G' of 'Opleidingstram' invullen bij beschrijving.
insert into TRAMTYPE (TramTypeNr, Beschrijving)
values (0001,'Test');
/*Error starting at line : 552 in command -
insert into TRAMTYPE (TramTypeNr, Beschrijving)
values (0001,'Test')
Error report -
SQL Error: ORA-02290: check constraint (MICKY.CHK_TRAMTYPE_BESCHRIJVING) violated
02290. 00000 -  "check constraint (%s.%s) violated"
*Cause:    The values being inserted do not satisfy the named check
           
*Action:   do not insert values that violate the constraint.
*/
-- Hier ga ik terug naar de database voordat ik het ging testen.
rollback to sp_Clean;