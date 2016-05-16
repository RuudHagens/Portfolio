-- -------------------------------------------------------------------------------------------
-- --------------------DROPPING EXISTING TABLES AND SEQUENCES---------------------------------
-- -------------------------------------------------------------------------------------------

drop table PERSOON cascade constraints;
drop table STATUSACCOUNT cascade constraints;
drop table ACCOUNT cascade constraints;
drop table LIJN cascade constraints;
drop table STATUSSECTOR cascade constraints;
drop table STATUSTRAM cascade constraints;
drop table TRAMTYPE cascade constraints;
drop table SPOOR cascade constraints;
drop table SECTOR cascade constraints;
drop table TRAM cascade constraints;
drop table DIENST cascade constraints;
drop table DIENSTREGELING cascade constraints;
drop table SCHOONMAAK cascade constraints;
drop table ONDERHOUD cascade constraints;


-- -------------------------------------------------------------------------------------------
-- -----------------------------CREATING TABLES-----------------------------------------------
-- -------------------------------------------------------------------------------------------

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


CREATE TABLE STATUSSECTOR
(StatusSectorNr number(10) primary key,
Beschrijving varchar2(255) not null,

CONSTRAINT CHK_STATUSSECTOR_Beschrijving CHECK ((Beschrijving) IN ('Bezet','Geblokkeerd','Vrij'))
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
LijnNr varchar2(10),

CONSTRAINT fk_LijnNrSpoor foreign key(LijnNr) REFERENCES LIJN(LijnNr)
);


CREATE TABLE SECTOR
 (SectorID number(10) primary key,
SectorNr number(10),
SpoorNr number(10),
StatusSectorNr number(10) not null,
  
  CONSTRAINT fk_StatusSectorNrSector foreign key(StatusSectorNr) REFERENCES STATUSSECTOR(StatusSectorNr),
  CONSTRAINT fk_spoorNrSector foreign key(SpoorNr) REFERENCES SPOOR(SpoorNr)
 );


CREATE TABLE TRAM
(TramNr number(10) primary key,
Bijzonderheden varchar2(255) ,
TramTypeNr number(10) not null,
StatusTramNr number(10) not null,
SectorID number(10) null,

CONSTRAINT fk_TramTypeNrTram foreign key(TramTypeNr) REFERENCES TRAMTYPE(TramTypeNr),
CONSTRAINT fk_StatusTramTram foreign key(StatusTramNr) REFERENCES STATUSTRAM(StatusTramNr),
CONSTRAINT fk_SectorIDTram foreign key (SectorID) REFERENCES SECTOR(SectorID)
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
PersoonID number(10) null,
BeginDatum date not null,
EindDatumTijd date null,
Soortbeurt varchar2(10) not null CHECK (Soortbeurt IN('Groot', 'Klein')),

CONSTRAINT fk_TramNrSchoonmaak foreign key(TramNr) REFERENCES TRAM(TramNr),
CONSTRAINT fk_PersoonIdSchoonmaak foreign key (PersoonID) REFERENCES PERSOON(PersoonID)
);


CREATE TABLE ONDERHOUD
(OnderhoudsNr number(10) primary key,
TramNr number(10) not null,
PersoonID number(10) null,
DatumTijdsIndicatie date not null,
BeginDatumTijd date not null,
EindDatumTijd date null,
Soortbeurt varchar2(10) not null CHECK (Soortbeurt IN('Groot', 'Klein')),
CONSTRAINT fk_TramNrOnderhoud foreign key(TramNr) REFERENCES TRAM(TramNr),
CONSTRAINT fk_PersoonIdOnderhoud foreign key (PersoonID) REFERENCES PERSOON(PersoonID)
);


-- -------------------------------------------------------------------------------------------
-- ------------------------------------TESTDATA----------------------------------------------
-- -------------------------------------------------------------------------------------------

-- PERSOON
insert into PERSOON (PersoonID, Voornaam, Achternaam, Adres, Geboortedatum)
values (1,'Kenneth','Reijnders' ,'Kennedyplein 29',TO_DATE('1992-08-22', 'YYYY-MM-DD'));
insert into PERSOON (PersoonID, Voornaam, Achternaam, Adres, Geboortedatum)
values (2,'Chiel','Sprangers' ,'Eikenboomlaan 42',TO_DATE('1993-06-02', 'YYYY-MM-DD'));
insert into PERSOON (PersoonID, Voornaam, Achternaam, Adres, Geboortedatum)
values (3,'Ruud','Hagens' ,'Het hofje 3a',TO_DATE('1994-12-09', 'YYYY-MM-DD'));
insert into PERSOON (PersoonID, Voornaam, Achternaam, Adres, Geboortedatum)
values (4,'Mick','Vranken' ,'Raiffeisenstraat 7',TO_DATE('1993-07-21', 'YYYY-MM-DD'));
insert into PERSOON (PersoonID, Voornaam, Achternaam, Adres, Geboortedatum)
values (5,'Admin','Admin' ,'Adminstraat 7',TO_DATE('1990-11-11', 'YYYY-MM-DD'));



-- STATUSACCOUNT
insert into STATUSACCOUNT (StatusAccountNr, Beschrijving)
values (1,'Beheerder');
insert into STATUSACCOUNT (StatusAccountNr, Beschrijving)
values (2,'WagenparkBeheerder');
insert into STATUSACCOUNT (StatusAccountNr, Beschrijving)
values (3,'Schoonmaker');
insert into STATUSACCOUNT (StatusAccountNr, Beschrijving)
values (4,'Technicus');
insert into STATUSACCOUNT (StatusAccountNr, Beschrijving)
values (5,'Bestuurder');


-- ACCOUNT
insert into ACCOUNT (PersoonID, Gebruikersnaam, Wachtwoord, StatusAccountNr)
values (1,'Kennethje','Kennethje123',1);
insert into ACCOUNT (PersoonID, Gebruikersnaam, Wachtwoord, StatusAccountNr)
values (2,'Chieltje','Chieltje123',2);
insert into ACCOUNT (PersoonID, Gebruikersnaam, Wachtwoord, StatusAccountNr)
values (3,'Ruudje','Ruudje123',3);
insert into ACCOUNT (PersoonID, Gebruikersnaam, Wachtwoord, StatusAccountNr)
values (4,'Mickel','Mickel123',4);
insert into ACCOUNT (PersoonID, Gebruikersnaam, Wachtwoord, StatusAccountNr)
values (5,'admin','admin',1);


-- LIJN
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


-- STATUSSECTOR
insert into STATUSSECTOR (StatusSectorNr, Beschrijving)
values (1,'Bezet');
insert into STATUSSECTOR (StatusSectorNr, Beschrijving)
values (2,'Geblokkeerd');
insert into STATUSSECTOR (StatusSectorNr, Beschrijving)
values (3,'Vrij');


-- STATUSTRAM
insert into STATUSTRAM (StatusTramNr, Beschrijving)
values (1,'Schoonmaak');
insert into STATUSTRAM (StatusTramNr, Beschrijving)
values (2,'Defect');
insert into STATUSTRAM (StatusTramNr, Beschrijving)
values (3,'Dienst');
insert into STATUSTRAM (StatusTramNr, Beschrijving)
values (4,'Remise');


-- TRAMTYPE
insert into TRAMTYPE (TramTypeNr, Beschrijving)
values (1,'Combino');
insert into TRAMTYPE (TramTypeNr, Beschrijving)
values (2,'Dubbel Kop Combino');
insert into TRAMTYPE (TramTypeNr, Beschrijving)
values (3,'11G');
insert into TRAMTYPE (TramTypeNr, Beschrijving)
values (4,'12G');
insert into TRAMTYPE (TramTypeNr, Beschrijving)
values (5,'Opleidingstram');


-- SPOOR
insert into SPOOR (SpoorNr, LijnNr)
values (12,'');
insert into SPOOR (SpoorNr,  LijnNr)
values (13,'');
insert into SPOOR (SpoorNr,  LijnNr)
values (14,'');
insert into SPOOR (SpoorNr,  LijnNr)
values (15,'');
insert into SPOOR (SpoorNr,  LijnNr)
values (16,'');
insert into SPOOR (SpoorNr,  LijnNr)
values (17,'');
insert into SPOOR (SpoorNr,  LijnNr)
values (18,'');
insert into SPOOR (SpoorNr,  LijnNr)
values (19,'');
insert into SPOOR (SpoorNr,  LijnNr)
values (20,'');
insert into SPOOR (SpoorNr,  LijnNr)
values (21,'');
insert into SPOOR (SpoorNr,  LijnNr)
values (30,'16/24');
insert into SPOOR (SpoorNr,  LijnNr)
values (31,'');
insert into SPOOR (SpoorNr,  LijnNr)
values (32,'10');
insert into SPOOR (SpoorNr,  LijnNr)
values (33,'16/24');
insert into SPOOR (SpoorNr,  LijnNr)
values (34,'2');
insert into SPOOR (SpoorNr,  LijnNr)
values (35,'16/24');
insert into SPOOR (SpoorNr,  LijnNr)
values (36,'1');
insert into SPOOR (SpoorNr,  LijnNr)
values (37,'5');
insert into SPOOR (SpoorNr,  LijnNr)
values (38,'2');
insert into SPOOR (SpoorNr,  LijnNr)
values (40,'');
insert into SPOOR (SpoorNr,  LijnNr)
values (41,'10');
insert into SPOOR (SpoorNr,  LijnNr)
values (42,'55');
insert into SPOOR (SpoorNr,  LijnNr)
values (43,'1');
insert into SPOOR (SpoorNr,  LijnNr)
values (44,'13');
insert into SPOOR (SpoorNr,  LijnNr)
values (45,'17');
insert into SPOOR (SpoorNr,  LijnNr)
values (51,'');
insert into SPOOR (SpoorNr,  LijnNr)
values (52,'17');
insert into SPOOR (SpoorNr,  LijnNr)
values (53,'13');
insert into SPOOR (SpoorNr,  LijnNr)
values (54,'5');
insert into SPOOR (SpoorNr,  LijnNr)
values (55,'2');
insert into SPOOR (SpoorNr,  LijnNr)
values (56,'5');
insert into SPOOR (SpoorNr,  LijnNr)
values (57,'16/24');
insert into SPOOR (SpoorNr,  LijnNr)
values (58,'');
insert into SPOOR (SpoorNr,  LijnNr)
values (61,'');
insert into SPOOR (SpoorNr,  LijnNr)
values (62,'');
insert into SPOOR (SpoorNr,  LijnNr)
values (63,'2');
insert into SPOOR (SpoorNr,  LijnNr)
values (64,'');
insert into SPOOR (SpoorNr,  LijnNr)
values (74,'');
insert into SPOOR (SpoorNr,  LijnNr)
values (75,'');
insert into SPOOR (SpoorNr,  LijnNr)
values (76,'');
insert into SPOOR (SpoorNr,  LijnNr)
values (77,'');


-- TRAM
-- combino's
insert into TRAM (TramNr, TramTypeNr, StatusTramNr)
values (2001, 1, 3);
insert into TRAM (TramNr, TramTypeNr, StatusTramNr)
values (2002, 1, 3);
insert into TRAM (TramNr, TramTypeNr, StatusTramNr)
values (2003, 1, 3);
insert into TRAM (TramNr, TramTypeNr, StatusTramNr)
values (2004, 1, 3);
insert into TRAM (TramNr, TramTypeNr, StatusTramNr)
values (2005, 1, 3);
insert into TRAM (TramNr, TramTypeNr, StatusTramNr)
values (2006, 1, 3);
insert into TRAM (TramNr, TramTypeNr, StatusTramNr)
values (2007, 1, 3);
insert into TRAM (TramNr, TramTypeNr, StatusTramNr)
values (2008, 1, 3);
insert into TRAM (TramNr, TramTypeNr, StatusTramNr)
values (2009, 1, 3);
insert into TRAM (TramNr, TramTypeNr, StatusTramNr)
values (2010, 1, 3);
insert into TRAM (TramNr, TramTypeNr, StatusTramNr)
values (2011, 1, 3);
insert into TRAM (TramNr, TramTypeNr, StatusTramNr)
values (2012, 1, 3);
insert into TRAM (TramNr, TramTypeNr, StatusTramNr)
values (2013, 1, 3);
insert into TRAM (TramNr, TramTypeNr, StatusTramNr)
values (2014, 1, 3);
insert into TRAM (TramNr, TramTypeNr, StatusTramNr)
values (2015, 1, 3);
insert into TRAM (TramNr, TramTypeNr, StatusTramNr)
values (2016, 1, 3);
insert into TRAM (TramNr, TramTypeNr, StatusTramNr)
values (2017, 1, 3);
insert into TRAM (TramNr, TramTypeNr, StatusTramNr)
values (2018, 1, 3);
insert into TRAM (TramNr, TramTypeNr, StatusTramNr)
values (2019, 1, 3);
insert into TRAM (TramNr, TramTypeNr, StatusTramNr)
values (2020, 1, 3);
insert into TRAM (TramNr, TramTypeNr, StatusTramNr)
values (2021, 1, 3);
insert into TRAM (TramNr, TramTypeNr, StatusTramNr)
values (2022, 1, 3);
insert into TRAM (TramNr, TramTypeNr, StatusTramNr)
values (2023, 1, 3);
insert into TRAM (TramNr, TramTypeNr, StatusTramNr)
values (2024, 1, 3);
insert into TRAM (TramNr, TramTypeNr, StatusTramNr)
values (2025, 1, 3);
insert into TRAM (TramNr, TramTypeNr, StatusTramNr)
values (2026, 1, 3);
insert into TRAM (TramNr, TramTypeNr, StatusTramNr)
values (2027, 1, 3);
insert into TRAM (TramNr, TramTypeNr, StatusTramNr)
values (2028, 1, 3);
insert into TRAM (TramNr, TramTypeNr, StatusTramNr)
values (2029, 1, 3);
insert into TRAM (TramNr, TramTypeNr, StatusTramNr)
values (2030, 1, 3);
insert into TRAM (TramNr, TramTypeNr, StatusTramNr)
values (2031, 1, 3);
insert into TRAM (TramNr, TramTypeNr, StatusTramNr)
values (2032, 1, 3);
insert into TRAM (TramNr, TramTypeNr, StatusTramNr)
values (2033, 1, 3);
insert into TRAM (TramNr, TramTypeNr, StatusTramNr)
values (2034, 1, 3);
insert into TRAM (TramNr, TramTypeNr, StatusTramNr)
values (2035, 1, 3);
insert into TRAM (TramNr, TramTypeNr, StatusTramNr)
values (2036, 1, 3);
insert into TRAM (TramNr, TramTypeNr, StatusTramNr)
values (2037, 1, 3);
insert into TRAM (TramNr, TramTypeNr, StatusTramNr)
values (2038, 1, 3);
insert into TRAM (TramNr, TramTypeNr, StatusTramNr)
values (2039, 1, 3);
insert into TRAM (TramNr, TramTypeNr, StatusTramNr)
values (2040, 1, 3);
insert into TRAM (TramNr, TramTypeNr, StatusTramNr)
values (2041, 1, 3);
insert into TRAM (TramNr, TramTypeNr, StatusTramNr)
values (2042, 1, 3);
insert into TRAM (TramNr, TramTypeNr, StatusTramNr)
values (2043, 1, 3);
insert into TRAM (TramNr, TramTypeNr, StatusTramNr)
values (2044, 1, 3);
insert into TRAM (TramNr, TramTypeNr, StatusTramNr)
values (2045, 1, 3);
insert into TRAM (TramNr, TramTypeNr, StatusTramNr)
values (2046, 1, 3);
insert into TRAM (TramNr, TramTypeNr, StatusTramNr)
values (2047, 1, 3);
insert into TRAM (TramNr, TramTypeNr, StatusTramNr)
values (2048, 1, 3);
insert into TRAM (TramNr, TramTypeNr, StatusTramNr)
values (2049, 1, 3);
insert into TRAM (TramNr, TramTypeNr, StatusTramNr)
values (2050, 1, 3);
insert into TRAM (TramNr, TramTypeNr, StatusTramNr)
values (2051, 1, 3);
insert into TRAM (TramNr, TramTypeNr, StatusTramNr)
values (2052, 1, 3);
insert into TRAM (TramNr, TramTypeNr, StatusTramNr)
values (2053, 1, 3);
insert into TRAM (TramNr, TramTypeNr, StatusTramNr)
values (2054, 1, 3);
insert into TRAM (TramNr, TramTypeNr, StatusTramNr)
values (2055, 1, 3);
insert into TRAM (TramNr, TramTypeNr, StatusTramNr)
values (2056, 1, 3);
insert into TRAM (TramNr, TramTypeNr, StatusTramNr)
values (2057, 1, 3);
insert into TRAM (TramNr, TramTypeNr, StatusTramNr)
values (2058, 1, 3);
insert into TRAM (TramNr, TramTypeNr, StatusTramNr)
values (2059, 1, 3);
insert into TRAM (TramNr, TramTypeNr, StatusTramNr)
values (2060, 1, 3);
insert into TRAM (TramNr, TramTypeNr, StatusTramNr)
values (2061, 1, 3);
insert into TRAM (TramNr, TramTypeNr, StatusTramNr)
values (2062, 1, 3);
insert into TRAM (TramNr, TramTypeNr, StatusTramNr)
values (2063, 1, 3);
insert into TRAM (TramNr, TramTypeNr, StatusTramNr)
values (2064, 1, 3);
insert into TRAM (TramNr, TramTypeNr, StatusTramNr)
values (2065, 1, 3);
insert into TRAM (TramNr, TramTypeNr, StatusTramNr)
values (2066, 1, 3);
insert into TRAM (TramNr, TramTypeNr, StatusTramNr)
values (2067, 1, 3);
insert into TRAM (TramNr, TramTypeNr, StatusTramNr)
values (2068, 1, 3);
insert into TRAM (TramNr, TramTypeNr, StatusTramNr)
values (2069, 1, 3);
insert into TRAM (TramNr, TramTypeNr, StatusTramNr)
values (2070, 1, 3);
insert into TRAM (TramNr, TramTypeNr, StatusTramNr)
values (2071, 1, 3);
insert into TRAM (TramNr, TramTypeNr, StatusTramNr)
values (2072, 1, 3);

-- 11G
insert into TRAM (TramNr, TramTypeNr, StatusTramNr)
values (901, 3, 3);
insert into TRAM (TramNr, TramTypeNr, StatusTramNr)
values (902, 3, 3);
insert into TRAM (TramNr, TramTypeNr, StatusTramNr)
values (903, 3, 3);
insert into TRAM (TramNr, TramTypeNr, StatusTramNr)
values (904, 3, 3);
insert into TRAM (TramNr, TramTypeNr, StatusTramNr)
values (905, 3, 3);
insert into TRAM (TramNr, TramTypeNr, StatusTramNr)
values (906, 3, 3);
insert into TRAM (TramNr, TramTypeNr, StatusTramNr)
values (907, 3, 3);
insert into TRAM (TramNr, TramTypeNr, StatusTramNr)
values (908, 3, 3);
insert into TRAM (TramNr, TramTypeNr, StatusTramNr)
values (909, 3, 3);
insert into TRAM (TramNr, TramTypeNr, StatusTramNr)
values (910, 3, 3);
insert into TRAM (TramNr, TramTypeNr, StatusTramNr)
values (911, 3, 3);
insert into TRAM (TramNr, TramTypeNr, StatusTramNr)
values (912, 3, 3);
insert into TRAM (TramNr, TramTypeNr, StatusTramNr)
values (913, 3, 3);
insert into TRAM (TramNr, TramTypeNr, StatusTramNr)
values (914, 3, 3);
insert into TRAM (TramNr, TramTypeNr, StatusTramNr)
values (915, 3, 3);
insert into TRAM (TramNr, TramTypeNr, StatusTramNr)
values (916, 3, 3);
insert into TRAM (TramNr, TramTypeNr, StatusTramNr)
values (917, 3, 3);
insert into TRAM (TramNr, TramTypeNr, StatusTramNr)
values (918, 3, 3);
insert into TRAM (TramNr, TramTypeNr, StatusTramNr)
values (919, 3, 3);
insert into TRAM (TramNr, TramTypeNr, StatusTramNr)
values (920, 3, 3);

-- Dubbel kop combino
insert into TRAM (TramNr, TramTypeNr, StatusTramNr)
values (2201, 2, 3);
insert into TRAM (TramNr, TramTypeNr, StatusTramNr)
values (2202, 2, 3);
insert into TRAM (TramNr, TramTypeNr, StatusTramNr)
values (2203, 2, 3);
insert into TRAM (TramNr, TramTypeNr, StatusTramNr)
values (2204, 2, 3);

-- 12G
insert into TRAM (TramNr, TramTypeNr, StatusTramNr)
values (817, 4, 3);
insert into TRAM (TramNr, TramTypeNr, StatusTramNr)
values (818, 4, 3);
insert into TRAM (TramNr, TramTypeNr, StatusTramNr)
values (819, 4, 3);
insert into TRAM (TramNr, TramTypeNr, StatusTramNr)
values (820, 4, 3);
insert into TRAM (TramNr, TramTypeNr, StatusTramNr)
values (821, 4, 3);
insert into TRAM (TramNr, TramTypeNr, StatusTramNr)
values (822, 4, 3);
insert into TRAM (TramNr, TramTypeNr, StatusTramNr)
values (823, 4, 3);
insert into TRAM (TramNr, TramTypeNr, StatusTramNr)
values (824, 4, 3);
insert into TRAM (TramNr, TramTypeNr, StatusTramNr)
values (825, 4, 3);
insert into TRAM (TramNr, TramTypeNr, StatusTramNr)
values (826, 4, 3);
insert into TRAM (TramNr, TramTypeNr, StatusTramNr)
values (827, 4, 3);
insert into TRAM (TramNr, TramTypeNr, StatusTramNr)
values (828, 4, 3);
insert into TRAM (TramNr, TramTypeNr, StatusTramNr)
values (829, 4, 3);
insert into TRAM (TramNr, TramTypeNr, StatusTramNr)
values (830, 4, 3);
insert into TRAM (TramNr, TramTypeNr, StatusTramNr)
values (831, 4, 3);
insert into TRAM (TramNr, TramTypeNr, StatusTramNr)
values (832, 4, 3);
insert into TRAM (TramNr, TramTypeNr, StatusTramNr)
values (833, 4, 3);
insert into TRAM (TramNr, TramTypeNr, StatusTramNr)
values (834, 4, 3);
insert into TRAM (TramNr, TramTypeNr, StatusTramNr)
values (835, 4, 3);
insert into TRAM (TramNr, TramTypeNr, StatusTramNr)
values (836, 4, 3);
insert into TRAM (TramNr, TramTypeNr, StatusTramNr)
values (837, 4, 3);
insert into TRAM (TramNr, TramTypeNr, StatusTramNr)
values (838, 4, 3);
insert into TRAM (TramNr, TramTypeNr, StatusTramNr)
values (839, 4, 3);
insert into TRAM (TramNr, TramTypeNr, StatusTramNr)
values (840, 4, 3);
insert into TRAM (TramNr, TramTypeNr, StatusTramNr)
values (841, 4, 3);

-- Opleidingstrams
insert into TRAM (TramNr, TramTypeNr, StatusTramNr)
values (809, 5, 3);
insert into TRAM (TramNr, TramTypeNr, StatusTramNr)
values (816, 5, 3);


-- DIENST
insert into DIENST (DienstNr, Uitrijtijd, Inrijtijd, LijnNr, Bijzonderheden)
values (1,'06:41','07:45','1','-');
insert into DIENST (DienstNr, Uitrijtijd, Inrijtijd, LijnNr, Bijzonderheden)
values (2,'08:39','10:22','2','-');
insert into DIENST (DienstNr, Uitrijtijd, Inrijtijd, LijnNr, Bijzonderheden)
values (3,'09:23','11:1','5','-');
insert into DIENST (DienstNr, Uitrijtijd, Inrijtijd, LijnNr, Bijzonderheden)
values (4,'10:10','12:56','10','-');
insert into DIENST (DienstNr, Uitrijtijd, Inrijtijd, LijnNr, Bijzonderheden)
values (5,'13:21','16:15','13','-');
insert into DIENST (DienstNr, Uitrijtijd, Inrijtijd, LijnNr, Bijzonderheden)
values (06,'12:53','14:37','16/24','-');
insert into DIENST (DienstNr, Uitrijtijd, Inrijtijd, LijnNr, Bijzonderheden)
values (07,'14:32','15:25','17','-');
insert into DIENST (DienstNr, Uitrijtijd, Inrijtijd, LijnNr, Bijzonderheden)
values (08,'21:15','23:59','55','-');
insert into DIENST (DienstNr, Uitrijtijd, Inrijtijd, LijnNr, Bijzonderheden)
values (09,'16:24','18:00','RES','-');
insert into DIENST (DienstNr, Uitrijtijd, Inrijtijd, LijnNr, Bijzonderheden)
values (10,'19:44','20:04','OCVT','-');


-- DIENSTREGELING
insert into DIENSTREGELING (DienstregelingNr, PersoonID, DienstNr, TramNr)
values (1,1,1,817);
insert into DIENSTREGELING (DienstregelingNr, PersoonID, DienstNr, TramNr)
values (2,2,2,818);
insert into DIENSTREGELING (DienstregelingNr, PersoonID, DienstNr, TramNr)
values (3,3,3,820);
insert into DIENSTREGELING (DienstregelingNr, PersoonID, DienstNr, TramNr)
values (4,4,4,821);
insert into DIENSTREGELING (DienstregelingNr, PersoonID, DienstNr, TramNr)
values (5,1,5,822);


--SCHOONMAAK
insert into SCHOONMAAK (SchoonmaakNr, TramNr, PersoonID, BeginDatum, EindDatumTijd, Soortbeurt)
values (1,2001,NULL,TO_DATE('15-04-2015','DD-MM-YYYY'), TO_DATE('01-01-0001 00:00','DD-MM-YYYY HH24:MI'), 'Groot');
insert into SCHOONMAAK (SchoonmaakNr, TramNr, PersoonID, BeginDatum, EindDatumTijd, Soortbeurt)
values (2,2002,NULL,TO_DATE('15-04-2015','DD-MM-YYYY'), TO_DATE('01-01-0001 00:00','DD-MM-YYYY HH24:MI'), 'Klein');
insert into SCHOONMAAK (SchoonmaakNr, TramNr, PersoonID, BeginDatum, EindDatumTijd, Soortbeurt)
values (3,2003,4,TO_DATE('15-04-2015','DD-MM-YYYY'), TO_DATE('16-04-2015 13:00','DD-MM-YYYY HH24:MI'), 'Groot');
insert into SCHOONMAAK (SchoonmaakNr, TramNr, PersoonID, BeginDatum, EindDatumTijd, Soortbeurt)
values (4,2004,2,TO_DATE('04-04-2015','DD-MM-YYYY'), TO_DATE('05-04-2015 13:00','DD-MM-YYYY HH24:MI'), 'Klein');
insert into SCHOONMAAK (SchoonmaakNr, TramNr, PersoonID, BeginDatum, EindDatumTijd, Soortbeurt)
values (5,2005,2,TO_DATE('15-04-2015','DD-MM-YYYY'), TO_DATE('16-04-2015 13:00','DD-MM-YYYY HH24:MI'), 'Klein');
insert into SCHOONMAAK (SchoonmaakNr, TramNr, PersoonID, BeginDatum, EindDatumTijd, Soortbeurt)
values (6,2006,4,TO_DATE('15-04-2015','DD-MM-YYYY'), TO_DATE('16-04-2015 13:00','DD-MM-YYYY HH24:MI'), 'Klein');


-- ONDERHOUD
insert into ONDERHOUD (OnderhoudsNr, TramNr, PersoonID, DatumTijdsIndicatie, BeginDatumTijd, EindDatumTijd, Soortbeurt)
values (1,2007,Null,TO_DATE('01-01-0001 00:00','DD-MM-YYYY HH24:MI'), TO_DATE('15-04-2015','DD-MM-YYYY'), TO_DATE('01-01-0001 00:00','DD-MM-YYYY HH24:MI'), 'Groot');
insert into ONDERHOUD (OnderhoudsNr, TramNr, PersoonID, DatumTijdsIndicatie, BeginDatumTijd, EindDatumTijd, Soortbeurt)
values (2,2008,Null,TO_DATE('01-01-0001 00:00','DD-MM-YYYY HH24:MI'), TO_DATE('15-04-2015','DD-MM-YYYY'), TO_DATE('01-01-0001 00:00','DD-MM-YYYY HH24:MI'), 'Klein');
insert into ONDERHOUD (OnderhoudsNr, TramNr, PersoonID, DatumTijdsIndicatie, BeginDatumTijd, EindDatumTijd, Soortbeurt)
values (3,2009,4,TO_DATE('15-04-2015 17:00','DD-MM-YYYY HH24:MI'), TO_DATE('15-04-2015','DD-MM-YYYY'), TO_DATE('16-04-2015 17:00','DD-MM-YYYY HH24:MI'), 'Groot');
insert into ONDERHOUD (OnderhoudsNr, TramNr, PersoonID, DatumTijdsIndicatie, BeginDatumTijd, EindDatumTijd, Soortbeurt)
values (4,2010,2,TO_DATE('15-04-2015 17:00','DD-MM-YYYY HH24:MI'), TO_DATE('14-04-2015','DD-MM-YYYY'), TO_DATE('16-04-2015 17:00','DD-MM-YYYY HH24:MI'), 'Klein');
insert into ONDERHOUD (OnderhoudsNr, TramNr, PersoonID, DatumTijdsIndicatie, BeginDatumTijd, EindDatumTijd, Soortbeurt)
values (5,2011,2,TO_DATE('15-04-2015 17:00','DD-MM-YYYY HH24:MI'), TO_DATE('14-04-2015','DD-MM-YYYY'), TO_DATE('16-04-2015 17:00','DD-MM-YYYY HH24:MI'), 'Klein');
insert into ONDERHOUD (OnderhoudsNr, TramNr, PersoonID, DatumTijdsIndicatie, BeginDatumTijd, EindDatumTijd, Soortbeurt)
values (6,2012,3,TO_DATE('15-04-2015 17:00','DD-MM-YYYY HH24:MI'), TO_DATE('14-04-2015','DD-MM-YYYY'), TO_DATE('16-04-2015 17:00','DD-MM-YYYY HH24:MI'), 'Klein');


--SECTOR 12-21(1)
insert into SECTOR (SectorID, SectorNr, SpoorNr, StatusSectorNr)
values (1,1,12,3);
insert into SECTOR (SectorID, SectorNr, SpoorNr, StatusSectorNr)
values (2,1,13,3);
insert into SECTOR (SectorID, SectorNr, SpoorNr, StatusSectorNr)
values (3,1,14,3);
insert into SECTOR (SectorID, SectorNr, SpoorNr, StatusSectorNr)
values (4,1,15,3);
insert into SECTOR (SectorID, SectorNr, SpoorNr, StatusSectorNr)
values (5,1,16,3);
insert into SECTOR (SectorID, SectorNr, SpoorNr, StatusSectorNr)
values (6,1,17,3);
insert into SECTOR (SectorID, SectorNr, SpoorNr, StatusSectorNr)
values (7,1,18,3);
insert into SECTOR (SectorID, SectorNr, SpoorNr, StatusSectorNr)
values (8,1,19,3);
insert into SECTOR (SectorID, SectorNr, SpoorNr, StatusSectorNr)
values (9,1,20,3);
insert into SECTOR (SectorID, SectorNr, SpoorNr, StatusSectorNr)
values (10,1,21,3);

-- SECTOR 38(4)
insert into SECTOR (SectorID, SectorNr, SpoorNr, StatusSectorNr)
values (11,1,38,3);
insert into SECTOR (SectorID, SectorNr, SpoorNr, StatusSectorNr)
values (12,2,38,3);
insert into SECTOR (SectorID, SectorNr, SpoorNr, StatusSectorNr)
values (13,3,38,3);
insert into SECTOR (SectorID, SectorNr, SpoorNr, StatusSectorNr)
values (14,4,38,3);

-- SECTOR 37(4)
insert into SECTOR (SectorID, SectorNr, SpoorNr, StatusSectorNr)
values (15,1,37,3);
insert into SECTOR (SectorID, SectorNr, SpoorNr, StatusSectorNr)
values (16,2,37,3);
insert into SECTOR (SectorID, SectorNr, SpoorNr, StatusSectorNr)
values (17,3,37,3);
insert into SECTOR (SectorID, SectorNr, SpoorNr, StatusSectorNr)
values (18,4,37,3);

-- SECTOR 36(4)
insert into SECTOR (SectorID, SectorNr, SpoorNr, StatusSectorNr)
values (19,1,36,3);
insert into SECTOR (SectorID, SectorNr, SpoorNr, StatusSectorNr)
values (20,2,36,3);
insert into SECTOR (SectorID, SectorNr, SpoorNr, StatusSectorNr)
values (21,3,36,3);
insert into SECTOR (SectorID, SectorNr, SpoorNr, StatusSectorNr)
values (22,4,36,3);

-- SECTOR 35(4)
insert into SECTOR (SectorID, SectorNr, SpoorNr, StatusSectorNr)
values (166,1,35,3);
insert into SECTOR (SectorID, SectorNr, SpoorNr, StatusSectorNr)
values (23,2,35,3);
insert into SECTOR (SectorID, SectorNr, SpoorNr, StatusSectorNr)
values (24,3,35,3);
insert into SECTOR (SectorID, SectorNr, SpoorNr, StatusSectorNr)
values (25,1,35,3);

-- SECTOR 34(4)
insert into SECTOR (SectorID, SectorNr, SpoorNr, StatusSectorNr)
values (26,1,34,3);
insert into SECTOR (SectorID, SectorNr, SpoorNr, StatusSectorNr)
values (27,2,34,3);
insert into SECTOR (SectorID, SectorNr, SpoorNr, StatusSectorNr)
values (28,3,34,3);
insert into SECTOR (SectorID, SectorNr, SpoorNr, StatusSectorNr)
values (29,4,34,3);

-- SECTOR 33(4)
insert into SECTOR (SectorID, SectorNr, SpoorNr, StatusSectorNr)
values (30,1,33,3);
insert into SECTOR (SectorID, SectorNr, SpoorNr, StatusSectorNr)
values (31,2,33,3);
insert into SECTOR (SectorID, SectorNr, SpoorNr, StatusSectorNr)
values (32,3,33,3);
insert into SECTOR (SectorID, SectorNr, SpoorNr, StatusSectorNr)
values (33,4,33,3);

-- SECTOR 32(4)
insert into SECTOR (SectorID, SectorNr, SpoorNr, StatusSectorNr)
values (34,1,32,3);
insert into SECTOR (SectorID, SectorNr, SpoorNr, StatusSectorNr)
values (35,2,32,3);
insert into SECTOR (SectorID, SectorNr, SpoorNr, StatusSectorNr)
values (36,3,32,3);
insert into SECTOR (SectorID, SectorNr, SpoorNr, StatusSectorNr)
values (37,4,32,3);

-- SECTOR 31(3)
insert into SECTOR (SectorID, SectorNr, SpoorNr, StatusSectorNr)
values (38,1,31,3);
insert into SECTOR (SectorID, SectorNr, SpoorNr, StatusSectorNr)
values (39,2,31,3);
insert into SECTOR (SectorID, SectorNr, SpoorNr, StatusSectorNr)
values (40,3,31,3);

-- SECTOR 30(3)
insert into SECTOR (SectorID, SectorNr, SpoorNr, StatusSectorNr)
values (41,1,30,3);
insert into SECTOR (SectorID, SectorNr, SpoorNr, StatusSectorNr)
values (42,2,30,3);
insert into SECTOR (SectorID, SectorNr, SpoorNr, StatusSectorNr)
values (43,3,30,3);

-- SECTOR 40(8)
insert into SECTOR (SectorID, SectorNr, SpoorNr, StatusSectorNr)
values (44,1,40,3);
insert into SECTOR (SectorID, SectorNr, SpoorNr, StatusSectorNr)
values (45,2,40,3);
insert into SECTOR (SectorID, SectorNr, SpoorNr, StatusSectorNr)
values (46,3,40,3);
insert into SECTOR (SectorID, SectorNr, SpoorNr, StatusSectorNr)
values (47,4,40,3);
insert into SECTOR (SectorID, SectorNr, SpoorNr, StatusSectorNr)
values (48,5,40,3);
insert into SECTOR (SectorID, SectorNr, SpoorNr, StatusSectorNr)
values (49,6,40,3);
insert into SECTOR (SectorID, SectorNr, SpoorNr, StatusSectorNr)
values (50,7,40,3);
insert into SECTOR (SectorID, SectorNr, SpoorNr, StatusSectorNr)
values (51,8,40,3);

-- SECTOR 41(4)
insert into SECTOR (SectorID, SectorNr, SpoorNr, StatusSectorNr)
values (52,1,41,3);
insert into SECTOR (SectorID, SectorNr, SpoorNr, StatusSectorNr)
values (53,2,41,3);
insert into SECTOR (SectorID, SectorNr, SpoorNr, StatusSectorNr)
values (54,3,41,3);
insert into SECTOR (SectorID, SectorNr, SpoorNr, StatusSectorNr)
values (55,4,41,3);

-- SECTOR 42(4)
insert into SECTOR (SectorID, SectorNr, SpoorNr, StatusSectorNr)
values (56,1,42,3);
insert into SECTOR (SectorID, SectorNr, SpoorNr, StatusSectorNr)
values (57,2,42,3);
insert into SECTOR (SectorID, SectorNr, SpoorNr, StatusSectorNr)
values (58,3,42,3);
insert into SECTOR (SectorID, SectorNr, SpoorNr, StatusSectorNr)
values (59,4,42,3);

-- SECTOR 43(4)
insert into SECTOR (SectorID, SectorNr, SpoorNr, StatusSectorNr)
values (60,1,43,3);
insert into SECTOR (SectorID, SectorNr, SpoorNr, StatusSectorNr)
values (61,2,43,3);
insert into SECTOR (SectorID, SectorNr, SpoorNr, StatusSectorNr)
values (62,3,43,3);
insert into SECTOR (SectorID, SectorNr, SpoorNr, StatusSectorNr)
values (63,4,43,3);

-- SECTOR 44(4)
insert into SECTOR (SectorID, SectorNr, SpoorNr, StatusSectorNr)
values (64,1,44,3);
insert into SECTOR (SectorID, SectorNr, SpoorNr, StatusSectorNr)
values (65,2,44,3);
insert into SECTOR (SectorID, SectorNr, SpoorNr, StatusSectorNr)
values (66,3,44,3);
insert into SECTOR (SectorID, SectorNr, SpoorNr, StatusSectorNr)
values (67,4,44,3);

-- SECTOR 45(9)
insert into SECTOR (SectorID, SectorNr, SpoorNr, StatusSectorNr)
values (68,1,45,3);
insert into SECTOR (SectorID, SectorNr, SpoorNr, StatusSectorNr)
values (69,2,45,3);
insert into SECTOR (SectorID, SectorNr, SpoorNr, StatusSectorNr)
values (70,3,45,3);
insert into SECTOR (SectorID, SectorNr, SpoorNr, StatusSectorNr)
values (71,4,45,3);
insert into SECTOR (SectorID, SectorNr, SpoorNr, StatusSectorNr)
values (72,1,45,3);
insert into SECTOR (SectorID, SectorNr, SpoorNr, StatusSectorNr)
values (73,2,45,3);
insert into SECTOR (SectorID, SectorNr, SpoorNr, StatusSectorNr)
values (74,3,45,3);
insert into SECTOR (SectorID, SectorNr, SpoorNr, StatusSectorNr)
values (75,4,45,3);
insert into SECTOR (SectorID, SectorNr, SpoorNr, StatusSectorNr)
values (76,4,45,3);


-- SECTOR 51(6)
insert into SECTOR (SectorID, SectorNr, SpoorNr, StatusSectorNr)
values (77,1,51,3);
insert into SECTOR (SectorID, SectorNr, SpoorNr, StatusSectorNr)
values (78,2,51,3);
insert into SECTOR (SectorID, SectorNr, SpoorNr, StatusSectorNr)
values (79,3,51,3);
insert into SECTOR (SectorID, SectorNr, SpoorNr, StatusSectorNr)
values (80,4,51,3);
insert into SECTOR (SectorID, SectorNr, SpoorNr, StatusSectorNr)
values (81,1,51,3);
insert into SECTOR (SectorID, SectorNr, SpoorNr, StatusSectorNr)
values (82,2,51,3);

-- SECTOR 52(7)
insert into SECTOR (SectorID, SectorNr, SpoorNr, StatusSectorNr)
values (83,1,52,3);
insert into SECTOR (SectorID, SectorNr, SpoorNr, StatusSectorNr)
values (84,2,52,3);
insert into SECTOR (SectorID, SectorNr, SpoorNr, StatusSectorNr)
values (85,3,52,3);
insert into SECTOR (SectorID, SectorNr, SpoorNr, StatusSectorNr)
values (86,4,52,3);
insert into SECTOR (SectorID, SectorNr, SpoorNr, StatusSectorNr)
values (87,5,52,3);
insert into SECTOR (SectorID, SectorNr, SpoorNr, StatusSectorNr)
values (88,6,52,3);


-- SECTOR 53(7)
insert into SECTOR (SectorID, SectorNr, SpoorNr, StatusSectorNr)
values (89,1,53,3);
insert into SECTOR (SectorID, SectorNr, SpoorNr, StatusSectorNr)
values (90,2,53,3);
insert into SECTOR (SectorID, SectorNr, SpoorNr, StatusSectorNr)
values (91,3,53,3);
insert into SECTOR (SectorID, SectorNr, SpoorNr, StatusSectorNr)
values (92,4,53,3);
insert into SECTOR (SectorID, SectorNr, SpoorNr, StatusSectorNr)
values (93,5,53,3);
insert into SECTOR (SectorID, SectorNr, SpoorNr, StatusSectorNr)
values (94,6,53,3);


-- SECTOR 54(7)
insert into SECTOR (SectorID, SectorNr, SpoorNr, StatusSectorNr)
values (95,1,54,3);
insert into SECTOR (SectorID, SectorNr, SpoorNr, StatusSectorNr)
values (96,2,54,3);
insert into SECTOR (SectorID, SectorNr, SpoorNr, StatusSectorNr)
values (97,3,54,3);
insert into SECTOR (SectorID, SectorNr, SpoorNr, StatusSectorNr)
values (98,4,54,3);
insert into SECTOR (SectorID, SectorNr, SpoorNr, StatusSectorNr)
values (99,5,54,3);
insert into SECTOR (SectorID, SectorNr, SpoorNr, StatusSectorNr)
values (100,6,54,3);
insert into SECTOR (SectorID, SectorNr, SpoorNr, StatusSectorNr)
values (101,7,54,3);


-- SECTOR 55(8)
insert into SECTOR (SectorID, SectorNr, SpoorNr, StatusSectorNr)
values (102,1,55,3);
insert into SECTOR (SectorID, SectorNr, SpoorNr, StatusSectorNr)
values (103,2,55,3);
insert into SECTOR (SectorID, SectorNr, SpoorNr, StatusSectorNr)
values (104,3,55,3);
insert into SECTOR (SectorID, SectorNr, SpoorNr, StatusSectorNr)
values (105,4,55,3);
insert into SECTOR (SectorID, SectorNr, SpoorNr, StatusSectorNr)
values (106,5,55,3);
insert into SECTOR (SectorID, SectorNr, SpoorNr, StatusSectorNr)
values (107,6,55,3);
insert into SECTOR (SectorID, SectorNr, SpoorNr, StatusSectorNr)
values (108,7,55,3);
insert into SECTOR (SectorID, SectorNr, SpoorNr, StatusSectorNr)
values (109,8,55,3);


-- SECTOR 56(8)
insert into SECTOR (SectorID, SectorNr, SpoorNr, StatusSectorNr)
values (110,1,56,3);
insert into SECTOR (SectorID, SectorNr, SpoorNr, StatusSectorNr)
values (111,2,56,3);
insert into SECTOR (SectorID, SectorNr, SpoorNr, StatusSectorNr)
values (112,3,56,3);
insert into SECTOR (SectorID, SectorNr, SpoorNr, StatusSectorNr)
values (113,4,56,3);
insert into SECTOR (SectorID, SectorNr, SpoorNr, StatusSectorNr)
values (114,5,56,3);
insert into SECTOR (SectorID, SectorNr, SpoorNr, StatusSectorNr)
values (115,6,56,3);
insert into SECTOR (SectorID, SectorNr, SpoorNr, StatusSectorNr)
values (116,7,56,3);
insert into SECTOR (SectorID, SectorNr, SpoorNr, StatusSectorNr)
values (117,8,56,3);


-- SECTOR 57(8)
insert into SECTOR (SectorID, SectorNr, SpoorNr, StatusSectorNr)
values (118,1,56,3);
insert into SECTOR (SectorID, SectorNr, SpoorNr, StatusSectorNr)
values (119,2,56,3);
insert into SECTOR (SectorID, SectorNr, SpoorNr, StatusSectorNr)
values (120,3,56,3);
insert into SECTOR (SectorID, SectorNr, SpoorNr, StatusSectorNr)
values (121,4,56,3);
insert into SECTOR (SectorID, SectorNr, SpoorNr, StatusSectorNr)
values (122,5,56,3);
insert into SECTOR (SectorID, SectorNr, SpoorNr, StatusSectorNr)
values (123,6,56,3);
insert into SECTOR (SectorID, SectorNr, SpoorNr, StatusSectorNr)
values (124,7,56,3);
insert into SECTOR (SectorID, SectorNr, SpoorNr, StatusSectorNr)
values (125,8,56,3);


-- SECTOR 58(6)
insert into SECTOR (SectorID, SectorNr, SpoorNr, StatusSectorNr)
values (126,1,58,3);
insert into SECTOR (SectorID, SectorNr, SpoorNr, StatusSectorNr)
values (127,2,58,3);
insert into SECTOR (SectorID, SectorNr, SpoorNr, StatusSectorNr)
values (128,3,58,3);
insert into SECTOR (SectorID, SectorNr, SpoorNr, StatusSectorNr)
values (129,4,58,3);
insert into SECTOR (SectorID, SectorNr, SpoorNr, StatusSectorNr)
values (130,5,58,3);
insert into SECTOR (SectorID, SectorNr, SpoorNr, StatusSectorNr)
values (131,6,58,3);


-- SECTOR 61(3)
insert into SECTOR (SectorID, SectorNr, SpoorNr, StatusSectorNr)
values (132,1,61,3);
insert into SECTOR (SectorID, SectorNr, SpoorNr, StatusSectorNr)
values (133,2,61,3);
insert into SECTOR (SectorID, SectorNr, SpoorNr, StatusSectorNr)
values (134,3,61,3);


-- SECTOR 62(3)
insert into SECTOR (SectorID, SectorNr, SpoorNr, StatusSectorNr)
values (135,1,62,3);
insert into SECTOR (SectorID, SectorNr, SpoorNr, StatusSectorNr)
values (136,2,62,3);
insert into SECTOR (SectorID, SectorNr, SpoorNr, StatusSectorNr)
values (137,3,62,3);


-- SECTOR 63(4)
insert into SECTOR (SectorID, SectorNr, SpoorNr, StatusSectorNr)
values (138,1,63,3);
insert into SECTOR (SectorID, SectorNr, SpoorNr, StatusSectorNr)
values (139,2,63,3);
insert into SECTOR (SectorID, SectorNr, SpoorNr, StatusSectorNr)
values (140,3,63,3);
insert into SECTOR (SectorID, SectorNr, SpoorNr, StatusSectorNr)
values (141,4,63,3);


-- SECTOR 64(5)
insert into SECTOR (SectorID, SectorNr, SpoorNr, StatusSectorNr)
values (142,1,64,3);
insert into SECTOR (SectorID, SectorNr, SpoorNr, StatusSectorNr)
values (143,2,64,3);
insert into SECTOR (SectorID, SectorNr, SpoorNr, StatusSectorNr)
values (144,3,64,3);
insert into SECTOR (SectorID, SectorNr, SpoorNr, StatusSectorNr)
values (145,4,64,3);
insert into SECTOR (SectorID, SectorNr, SpoorNr, StatusSectorNr)
values (146,5,64,3);


-- SECTOR 74(5)
insert into SECTOR (SectorID, SectorNr, SpoorNr, StatusSectorNr)
values (147,1,74,3);
insert into SECTOR (SectorID, SectorNr, SpoorNr, StatusSectorNr)
values (148,2,74,3);
insert into SECTOR (SectorID, SectorNr, SpoorNr, StatusSectorNr)
values (149,3,74,3);
insert into SECTOR (SectorID, SectorNr, SpoorNr, StatusSectorNr)
values (150,4,74,3);
insert into SECTOR (SectorID, SectorNr, SpoorNr, StatusSectorNr)
values (151,5,74,3);

-- SECTOR 75(4)
insert into SECTOR (SectorID, SectorNr, SpoorNr, StatusSectorNr)
values (152,1,75,3);
insert into SECTOR (SectorID, SectorNr, SpoorNr, StatusSectorNr)
values (153,2,75,3);
insert into SECTOR (SectorID, SectorNr, SpoorNr, StatusSectorNr)
values (154,3,75,3);
insert into SECTOR (SectorID, SectorNr, SpoorNr, StatusSectorNr)
values (155,4,75,3);


-- SECTOR 76(5)
insert into SECTOR (SectorID, SectorNr, SpoorNr, StatusSectorNr)
values (156,1,76,3);
insert into SECTOR (SectorID, SectorNr, SpoorNr, StatusSectorNr)
values (157,2,76,3);
insert into SECTOR (SectorID, SectorNr, SpoorNr, StatusSectorNr)
values (158,3,76,3);
insert into SECTOR (SectorID, SectorNr, SpoorNr, StatusSectorNr)
values (159,4,76,3);
insert into SECTOR (SectorID, SectorNr, SpoorNr, StatusSectorNr)
values (160,5,76,3);


-- SECTOR 77(5)
insert into SECTOR (SectorID, SectorNr, SpoorNr, StatusSectorNr)
values (161,1,77,3);
insert into SECTOR (SectorID, SectorNr, SpoorNr, StatusSectorNr)
values (162,2,77,3);
insert into SECTOR (SectorID, SectorNr, SpoorNr, StatusSectorNr)
values (163,3,77,3);
insert into SECTOR (SectorID, SectorNr, SpoorNr, StatusSectorNr)
values (164,4,77,3);
insert into SECTOR (SectorID, SectorNr, SpoorNr, StatusSectorNr)
values (165,5,77,3);

---------------------------------------------------------------------------------------------
--------------------------------------TESTING------------------------------------------------
---------------------------------------------------------------------------------------------

savepoint sp_Clean;

-- Hier check wordt gechecked of de constraints van statusspoor het goed doen, 
-- als het goed is kun je alleen 'Bezet','Geblokkeerd' of 'Vrij' invullen bij beschrijving.
insert into STATUSSECTOR ( StatusSectorNr, Beschrijving)
values (1,'Test');
/*Error starting at line : 506 in command -
insert into STATUSSPOOR ( Beschrijving)
values (1,'Test')
Error report -
SQL Error: ORA-02290: check constraint (MICKY.CHK_STATUSSPOOR_BESCHRIJVING) violated
02290. 00000 -  "check constraint (%s.%s) violated"
*Cause:    The values being inserted do not satisfy the named check
           
*Action:   do not insert values that violate the constraint.
*/


-- Hier check wordt gechecked of de constraints van statusspoor het goed doen, 
-- als het goed is kun je alleen 'Beheerder','Technicus','WagenparkBeheerder', 'Bestuurder' of 'Vrij' invullen bij beschrijving.
insert into STATUSACCOUNT (StatusAccountNr, Beschrijving)
values (1,'Test');
/*Error starting at line : 522 in command -
insert into STATUSACCOUNT (StatusAccountNr, Beschrijving)
values (1,'Test')
Error report -
SQL Error: ORA-02290: check constraint (MICKY.CHK_STATUSACCOUNT_BESCHRIJVING) violated
02290. 00000 -  "check constraint (%s.%s) violated"
*Cause:    The values being inserted do not satisfy the named check
           
*Action:   do not insert values that violate the constraint.*/


-- Hier check wordt gechecked of de constraints van statusspoor het goed doen, 
-- als het goed is kun je alleen 'Schoonmaak','Defect','Dienst' of 'Remise' invullen bij beschrijving.
insert into STATUSTRAM (StatusTramNr, Beschrijving)
values (1,'Test');
/*Error starting at line : 1.117 in command -
insert into STATUSTRAM (StatusTramNr, Beschrijving)
values (1,'Test')
Error report -
SQL Error: ORA-02290: check constraint (MICKY.CHK_STATUSTRAM_BESCHRIJVING) violated
02290. 00000 -  "check constraint (%s.%s) violated"
*Cause:    The values being inserted do not satisfy the named check
           
*Action:   do not insert values that violate the constraint.*/

-- Hier check wordt gechecked of de constraints van statusspoor het goed doen, 
-- als het goed is kun je alleen 'Combino','Dubbel Kop Combino','11G','12G' of 'Opleidingstram' invullen bij beschrijving.
insert into TRAMTYPE (TramTypeNr, Beschrijving)
values (1,'Test');
/*Error starting at line : 552 in command -
insert into TRAMTYPE (TramTypeNr, Beschrijving)
values (1,'Test')
Error report -
SQL Error: ORA-02290: check constraint (MICKY.CHK_TRAMTYPE_BESCHRIJVING) violated
02290. 00000 -  "check constraint (%s.%s) violated"
*Cause:    The values being inserted do not satisfy the named check
           
*Action:   do not insert values that violate the constraint.
*/

rollback to sp_Clean;

--SQL queries
SELECT (maxgevuld.hoogstgevuld +1) AS LegeSector
FROM (SELECT COUNT(SECTORNR) AS Grootste FROM SECTOR WHERE SpoorNr = :spoorNr) totaal, 
     (SELECT MAX(SECTORNR)as hoogstgevuld FROM SECTOR WHERE SpoorNr = :spoorNr AND (StatusSectorNr = 1 OR StatusSectorNr = 2)) maxgevuld
WHERE totaal.Grootste > maxgevuld.hoogstgevuld;

SELECT LijnNr FROM SPOOR WHERE SpoorNr = :spoorNr;

--UPDATE Onderhoud SET DatumTijdsIndicatie = TO_DATE('14-04-2015 18:27','DD-MM-YYYY HH24:MI') 
--WHERE OnderhoudsNr = 1;