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
( SectorID number(10) primary key,
SectorNr number(10),
SpoorNr number(10),
StatusSectorNr number(10) not null,

CONSTRAINT fk_StatusSectorNrSector foreign key(StatusSectorNr) REFERENCES STATUSSECTOR(StatusSectorNr),
CONSTRAINT fk_spoorNrSector foreign key(SpoorNr) REFERENCES SPOOR(SpoorNr)
);


CREATE TABLE TRAM
(TramNr number(10) primary key,
TramTypeNr number(10) not null,
StatusTramNr number(10) not null,
SectorID number(10) null,
RfidNr nvarchar2(20) null,

CONSTRAINT fk_TramTypeNrTram foreign key(TramTypeNr) REFERENCES TRAMTYPE(TramTypeNr),
CONSTRAINT fk_StatusTramNrTram foreign key(StatusTramNr) REFERENCES STATUSTRAM(StatusTramNr),
CONSTRAINT fk_SectorIDTram foreign key(SectorID) REFERENCES SECTOR(SectorID)
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
values (1,'Kenneth','Kenneth',1);
insert into ACCOUNT (PersoonID, Gebruikersnaam, Wachtwoord, StatusAccountNr)
values (2,'Chiel','Chiel',2);
insert into ACCOUNT (PersoonID, Gebruikersnaam, Wachtwoord, StatusAccountNr)
values (3,'Ruud','Ruud',3);
insert into ACCOUNT (PersoonID, Gebruikersnaam, Wachtwoord, StatusAccountNr)
values (4,'Mick','Mick',4);
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
insert into TRAM (TramNr, TramTypeNr, StatusTramNr, SectorID)
values (2001, 1, 3, null);
insert into TRAM (TramNr, TramTypeNr, StatusTramNr, SectorID)
values (2002, 1, 3, null);
insert into TRAM (TramNr, TramTypeNr, StatusTramNr, SectorID)
values (2003, 1, 3, null);
insert into TRAM (TramNr, TramTypeNr, StatusTramNr, SectorID)
values (2004, 1, 3, null);
insert into TRAM (TramNr, TramTypeNr, StatusTramNr, SectorID)
values (2005, 1, 3, null);
insert into TRAM (TramNr, TramTypeNr, StatusTramNr, SectorID)
values (2006, 1, 3, null);
insert into TRAM (TramNr, TramTypeNr, StatusTramNr, SectorID)
values (2007, 1, 3, null);
insert into TRAM (TramNr, TramTypeNr, StatusTramNr, SectorID)
values (2008, 1, 3, null);
insert into TRAM (TramNr, TramTypeNr, StatusTramNr, SectorID)
values (2009, 1, 3, null);
insert into TRAM (TramNr, TramTypeNr, StatusTramNr, SectorID)
values (2010, 1, 3, null);
insert into TRAM (TramNr, TramTypeNr, StatusTramNr, SectorID)
values (2011, 1, 3, null);
insert into TRAM (TramNr, TramTypeNr, StatusTramNr, SectorID)
values (2012, 1, 3, null);
insert into TRAM (TramNr, TramTypeNr, StatusTramNr, SectorID)
values (2013, 1, 3, null);
insert into TRAM (TramNr, TramTypeNr, StatusTramNr, SectorID)
values (2014, 1, 3, null);
insert into TRAM (TramNr, TramTypeNr, StatusTramNr, SectorID)
values (2015, 1, 3, null);
insert into TRAM (TramNr, TramTypeNr, StatusTramNr, SectorID)
values (2016, 1, 3, null);
insert into TRAM (TramNr, TramTypeNr, StatusTramNr, SectorID)
values (2017, 1, 3, null);
insert into TRAM (TramNr, TramTypeNr, StatusTramNr, SectorID)
values (2018, 1, 3, null);
insert into TRAM (TramNr, TramTypeNr, StatusTramNr, SectorID)
values (2019, 1, 3, null);
insert into TRAM (TramNr, TramTypeNr, StatusTramNr, SectorID)
values (2020, 1, 3, null);
insert into TRAM (TramNr, TramTypeNr, StatusTramNr, SectorID)
values (2021, 1, 3, null);
insert into TRAM (TramNr, TramTypeNr, StatusTramNr, SectorID)
values (2022, 1, 3, null);
insert into TRAM (TramNr, TramTypeNr, StatusTramNr, SectorID)
values (2023, 1, 3, null);
insert into TRAM (TramNr, TramTypeNr, StatusTramNr, SectorID)
values (2024, 1, 3, null);
insert into TRAM (TramNr, TramTypeNr, StatusTramNr, SectorID)
values (2025, 1, 3, null);
insert into TRAM (TramNr, TramTypeNr, StatusTramNr, SectorID)
values (2026, 1, 3, null);
insert into TRAM (TramNr, TramTypeNr, StatusTramNr, SectorID)
values (2027, 1, 3, null);
insert into TRAM (TramNr, TramTypeNr, StatusTramNr, SectorID)
values (2028, 1, 3, null);
insert into TRAM (TramNr, TramTypeNr, StatusTramNr, SectorID)
values (2029, 1, 3, null);
insert into TRAM (TramNr, TramTypeNr, StatusTramNr, SectorID)
values (2030, 1, 3, null);
insert into TRAM (TramNr, TramTypeNr, StatusTramNr, SectorID)
values (2031, 1, 3, null);
insert into TRAM (TramNr, TramTypeNr, StatusTramNr, SectorID)
values (2032, 1, 3, null);
insert into TRAM (TramNr, TramTypeNr, StatusTramNr, SectorID)
values (2033, 1, 3, null);
insert into TRAM (TramNr, TramTypeNr, StatusTramNr, SectorID)
values (2034, 1, 3, null);
insert into TRAM (TramNr, TramTypeNr, StatusTramNr, SectorID)
values (2035, 1, 3, null);
insert into TRAM (TramNr, TramTypeNr, StatusTramNr, SectorID)
values (2036, 1, 3, null);
insert into TRAM (TramNr, TramTypeNr, StatusTramNr, SectorID)
values (2037, 1, 3, null);
insert into TRAM (TramNr, TramTypeNr, StatusTramNr, SectorID)
values (2038, 1, 3, null);
insert into TRAM (TramNr, TramTypeNr, StatusTramNr, SectorID)
values (2039, 1, 3, null);
insert into TRAM (TramNr, TramTypeNr, StatusTramNr, SectorID)
values (2040, 1, 3, null);
insert into TRAM (TramNr, TramTypeNr, StatusTramNr, SectorID)
values (2041, 1, 3, null);
insert into TRAM (TramNr, TramTypeNr, StatusTramNr, SectorID)
values (2042, 1, 3, null);
insert into TRAM (TramNr, TramTypeNr, StatusTramNr, SectorID)
values (2043, 1, 3, null);
insert into TRAM (TramNr, TramTypeNr, StatusTramNr, SectorID)
values (2044, 1, 3, null);
insert into TRAM (TramNr, TramTypeNr, StatusTramNr, SectorID)
values (2045, 1, 3, null);
insert into TRAM (TramNr, TramTypeNr, StatusTramNr, SectorID)
values (2046, 1, 3, null);
insert into TRAM (TramNr, TramTypeNr, StatusTramNr, SectorID)
values (2047, 1, 3, null);
insert into TRAM (TramNr, TramTypeNr, StatusTramNr, SectorID)
values (2048, 1, 3, null);
insert into TRAM (TramNr, TramTypeNr, StatusTramNr, SectorID)
values (2049, 1, 3, null);
insert into TRAM (TramNr, TramTypeNr, StatusTramNr, SectorID)
values (2050, 1, 3, null);
insert into TRAM (TramNr, TramTypeNr, StatusTramNr, SectorID)
values (2051, 1, 3, null);
insert into TRAM (TramNr, TramTypeNr, StatusTramNr, SectorID)
values (2052, 1, 3, null);
insert into TRAM (TramNr, TramTypeNr, StatusTramNr, SectorID)
values (2053, 1, 3, null);
insert into TRAM (TramNr, TramTypeNr, StatusTramNr, SectorID)
values (2054, 1, 3, null);
insert into TRAM (TramNr, TramTypeNr, StatusTramNr, SectorID)
values (2055, 1, 3, null);
insert into TRAM (TramNr, TramTypeNr, StatusTramNr, SectorID)
values (2056, 1, 3, null);
insert into TRAM (TramNr, TramTypeNr, StatusTramNr, SectorID)
values (2057, 1, 3, null);
insert into TRAM (TramNr, TramTypeNr, StatusTramNr, SectorID)
values (2058, 1, 3, null);
insert into TRAM (TramNr, TramTypeNr, StatusTramNr, SectorID)
values (2059, 1, 3, null);
insert into TRAM (TramNr, TramTypeNr, StatusTramNr, SectorID)
values (2060, 1, 3, null);
insert into TRAM (TramNr, TramTypeNr, StatusTramNr, SectorID)
values (2061, 1, 3, null);
insert into TRAM (TramNr, TramTypeNr, StatusTramNr, SectorID)
values (2062, 1, 3, null);
insert into TRAM (TramNr, TramTypeNr, StatusTramNr, SectorID)
values (2063, 1, 3, null);
insert into TRAM (TramNr, TramTypeNr, StatusTramNr, SectorID)
values (2064, 1, 3, null);
insert into TRAM (TramNr, TramTypeNr, StatusTramNr, SectorID)
values (2065, 1, 3, null);
insert into TRAM (TramNr, TramTypeNr, StatusTramNr, SectorID)
values (2066, 1, 3, null);
insert into TRAM (TramNr, TramTypeNr, StatusTramNr, SectorID)
values (2067, 1, 3, null);
insert into TRAM (TramNr, TramTypeNr, StatusTramNr, SectorID)
values (2068, 1, 3, null);
insert into TRAM (TramNr, TramTypeNr, StatusTramNr, SectorID)
values (2069, 1, 3, null);
insert into TRAM (TramNr, TramTypeNr, StatusTramNr, SectorID)
values (2070, 1, 3, null);
insert into TRAM (TramNr, TramTypeNr, StatusTramNr, SectorID)
values (2071, 1, 3, null);
insert into TRAM (TramNr, TramTypeNr, StatusTramNr, SectorID)
values (2072, 1, 3, null);

-- 11G
insert into TRAM (TramNr, TramTypeNr, StatusTramNr, SectorID)
values (901, 3, 3, null);
insert into TRAM (TramNr, TramTypeNr, StatusTramNr, SectorID)
values (902, 3, 3, null);
insert into TRAM (TramNr, TramTypeNr, StatusTramNr, SectorID)
values (903, 3, 3, null);
insert into TRAM (TramNr, TramTypeNr, StatusTramNr, SectorID)
values (904, 3, 3, null);
insert into TRAM (TramNr, TramTypeNr, StatusTramNr, SectorID)
values (905, 3, 3, null);
insert into TRAM (TramNr, TramTypeNr, StatusTramNr, SectorID)
values (906, 3, 3, null);
insert into TRAM (TramNr, TramTypeNr, StatusTramNr, SectorID)
values (907, 3, 3, null);
insert into TRAM (TramNr, TramTypeNr, StatusTramNr, SectorID)
values (908, 3, 3, null);
insert into TRAM (TramNr, TramTypeNr, StatusTramNr, SectorID)
values (909, 3, 3, null);
insert into TRAM (TramNr, TramTypeNr, StatusTramNr, SectorID)
values (910, 3, 3, null);
insert into TRAM (TramNr, TramTypeNr, StatusTramNr, SectorID)
values (911, 3, 3, null);
insert into TRAM (TramNr, TramTypeNr, StatusTramNr, SectorID)
values (912, 3, 3, null);
insert into TRAM (TramNr, TramTypeNr, StatusTramNr, SectorID)
values (913, 3, 3, null);
insert into TRAM (TramNr, TramTypeNr, StatusTramNr, SectorID)
values (914, 3, 3, null);
insert into TRAM (TramNr, TramTypeNr, StatusTramNr, SectorID)
values (915, 3, 3, null);
insert into TRAM (TramNr, TramTypeNr, StatusTramNr, SectorID)
values (916, 3, 3, null);
insert into TRAM (TramNr, TramTypeNr, StatusTramNr, SectorID)
values (917, 3, 3, null);
insert into TRAM (TramNr, TramTypeNr, StatusTramNr, SectorID)
values (918, 3, 3, null);
insert into TRAM (TramNr, TramTypeNr, StatusTramNr, SectorID)
values (919, 3, 3, null);
insert into TRAM (TramNr, TramTypeNr, StatusTramNr, SectorID)
values (920, 3, 3, null);

-- Dubbel kop combino
insert into TRAM (TramNr, TramTypeNr, StatusTramNr, SectorID)
values (2201, 2, 3, null);
insert into TRAM (TramNr, TramTypeNr, StatusTramNr, SectorID)
values (2202, 2, 3, null);
insert into TRAM (TramNr, TramTypeNr, StatusTramNr, SectorID)
values (2203, 2, 3, null);
insert into TRAM (TramNr, TramTypeNr, StatusTramNr, SectorID)
values (2204, 2, 3, null);

-- 12G
insert into TRAM (TramNr, TramTypeNr, StatusTramNr, SectorID)
values (817, 4, 3, null);
insert into TRAM (TramNr, TramTypeNr, StatusTramNr, SectorID)
values (818, 4, 3, null);
insert into TRAM (TramNr, TramTypeNr, StatusTramNr, SectorID)
values (819, 4, 3, null);
insert into TRAM (TramNr, TramTypeNr, StatusTramNr, SectorID)
values (820, 4, 3, null);
insert into TRAM (TramNr, TramTypeNr, StatusTramNr, SectorID)
values (821, 4, 3, null);
insert into TRAM (TramNr, TramTypeNr, StatusTramNr, SectorID)
values (822, 4, 3, null);
insert into TRAM (TramNr, TramTypeNr, StatusTramNr, SectorID)
values (823, 4, 3, null);
insert into TRAM (TramNr, TramTypeNr, StatusTramNr, SectorID)
values (824, 4, 3, null);
insert into TRAM (TramNr, TramTypeNr, StatusTramNr, SectorID)
values (825, 4, 3, null);
insert into TRAM (TramNr, TramTypeNr, StatusTramNr, SectorID)
values (826, 4, 3, null);
insert into TRAM (TramNr, TramTypeNr, StatusTramNr, SectorID)
values (827, 4, 3, null);
insert into TRAM (TramNr, TramTypeNr, StatusTramNr, SectorID)
values (828, 4, 3, null);
insert into TRAM (TramNr, TramTypeNr, StatusTramNr, SectorID)
values (829, 4, 3, null);
insert into TRAM (TramNr, TramTypeNr, StatusTramNr, SectorID)
values (830, 4, 3, null);
insert into TRAM (TramNr, TramTypeNr, StatusTramNr, SectorID)
values (831, 4, 3, null);
insert into TRAM (TramNr, TramTypeNr, StatusTramNr, SectorID)
values (832, 4, 3, null);
insert into TRAM (TramNr, TramTypeNr, StatusTramNr, SectorID)
values (833, 4, 3, null);
insert into TRAM (TramNr, TramTypeNr, StatusTramNr, SectorID)
values (834, 4, 3, null);
insert into TRAM (TramNr, TramTypeNr, StatusTramNr, SectorID)
values (835, 4, 3, null);
insert into TRAM (TramNr, TramTypeNr, StatusTramNr, SectorID)
values (836, 4, 3, null);
insert into TRAM (TramNr, TramTypeNr, StatusTramNr, SectorID)
values (837, 4, 3, null);
insert into TRAM (TramNr, TramTypeNr, StatusTramNr, SectorID)
values (838, 4, 3, null);
insert into TRAM (TramNr, TramTypeNr, StatusTramNr, SectorID)
values (839, 4, 3, null);
insert into TRAM (TramNr, TramTypeNr, StatusTramNr, SectorID)
values (840, 4, 3, null);
insert into TRAM (TramNr, TramTypeNr, StatusTramNr, SectorID)
values (841, 4, 3, null);

-- Opleidingstrams
insert into TRAM (TramNr, TramTypeNr, StatusTramNr, SectorID)
values (809, 5, 3, null);
insert into TRAM (TramNr, TramTypeNr, StatusTramNr, SectorID)
values (816, 5, 3, null);


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
values (1,2001,NULL,TO_DATE('20-04-2015','DD-MM-YYYY'), TO_DATE('01-01-0001 00:00','DD-MM-YYYY HH24:MI'), 'Groot');
insert into SCHOONMAAK (SchoonmaakNr, TramNr, PersoonID, BeginDatum, EindDatumTijd, Soortbeurt)
values (2,2002,NULL,TO_DATE('20-04-2015','DD-MM-YYYY'), TO_DATE('01-01-0001 00:00','DD-MM-YYYY HH24:MI'), 'Klein');
insert into SCHOONMAAK (SchoonmaakNr, TramNr, PersoonID, BeginDatum, EindDatumTijd, Soortbeurt)
values (3,2003,4,TO_DATE('20-04-2015','DD-MM-YYYY'), TO_DATE('16-04-2015 13:00','DD-MM-YYYY HH24:MI'), 'Groot');
insert into SCHOONMAAK (SchoonmaakNr, TramNr, PersoonID, BeginDatum, EindDatumTijd, Soortbeurt)
values (4,2004,2,TO_DATE('20-04-2015','DD-MM-YYYY'), TO_DATE('05-04-2015 13:00','DD-MM-YYYY HH24:MI'), 'Klein');
insert into SCHOONMAAK (SchoonmaakNr, TramNr, PersoonID, BeginDatum, EindDatumTijd, Soortbeurt)
values (5,2005,2,TO_DATE('20-04-2015','DD-MM-YYYY'), TO_DATE('16-04-2015 13:00','DD-MM-YYYY HH24:MI'), 'Klein');
insert into SCHOONMAAK (SchoonmaakNr, TramNr, PersoonID, BeginDatum, EindDatumTijd, Soortbeurt)
values (6,2006,4,TO_DATE('15-04-2015','DD-MM-YYYY'), TO_DATE('16-04-2015 13:00','DD-MM-YYYY HH24:MI'), 'Klein');


-- ONDERHOUD
insert into ONDERHOUD (OnderhoudsNr, TramNr, PersoonID, DatumTijdsIndicatie, BeginDatumTijd, EindDatumTijd, Soortbeurt)
values (1,2007,Null,TO_DATE('01-01-0001 00:00','DD-MM-YYYY HH24:MI'), TO_DATE('20-04-2015','DD-MM-YYYY'), TO_DATE('01-01-0001 00:00','DD-MM-YYYY HH24:MI'), 'Groot');
insert into ONDERHOUD (OnderhoudsNr, TramNr, PersoonID, DatumTijdsIndicatie, BeginDatumTijd, EindDatumTijd, Soortbeurt)
values (2,2008,Null,TO_DATE('01-01-0001 00:00','DD-MM-YYYY HH24:MI'), TO_DATE('20-04-2015','DD-MM-YYYY'), TO_DATE('01-01-0001 00:00','DD-MM-YYYY HH24:MI'), 'Klein');
insert into ONDERHOUD (OnderhoudsNr, TramNr, PersoonID, DatumTijdsIndicatie, BeginDatumTijd, EindDatumTijd, Soortbeurt)
values (3,2009,4,TO_DATE('15-04-2015 17:00','DD-MM-YYYY HH24:MI'), TO_DATE('15-04-2015','DD-MM-YYYY'), TO_DATE('16-04-2015 17:00','DD-MM-YYYY HH24:MI'), 'Groot');
insert into ONDERHOUD (OnderhoudsNr, TramNr, PersoonID, DatumTijdsIndicatie, BeginDatumTijd, EindDatumTijd, Soortbeurt)
values (4,2010,2,TO_DATE('15-04-2015 17:00','DD-MM-YYYY HH24:MI'), TO_DATE('20-04-2015','DD-MM-YYYY'), TO_DATE('16-04-2015 17:00','DD-MM-YYYY HH24:MI'), 'Klein');
insert into ONDERHOUD (OnderhoudsNr, TramNr, PersoonID, DatumTijdsIndicatie, BeginDatumTijd, EindDatumTijd, Soortbeurt)
values (5,2011,2,TO_DATE('15-04-2015 17:00','DD-MM-YYYY HH24:MI'), TO_DATE('20-04-2015','DD-MM-YYYY'), TO_DATE('16-04-2015 17:00','DD-MM-YYYY HH24:MI'), 'Klein');
insert into ONDERHOUD (OnderhoudsNr, TramNr, PersoonID, DatumTijdsIndicatie, BeginDatumTijd, EindDatumTijd, Soortbeurt)
values (6,2012,3,TO_DATE('15-04-2015 17:00','DD-MM-YYYY HH24:MI'), TO_DATE('20-04-2015','DD-MM-YYYY'), TO_DATE('16-04-2015 17:00','DD-MM-YYYY HH24:MI'), 'Klein');


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
values (23,1,35,3);
insert into SECTOR (SectorID, SectorNr, SpoorNr, StatusSectorNr)
values (24,2,35,3);
insert into SECTOR (SectorID, SectorNr, SpoorNr, StatusSectorNr)
values (25,3,35,3);
insert into SECTOR (SectorID, SectorNr, SpoorNr, StatusSectorNr)
values (26,4,35,3);

-- SECTOR 34(4)
insert into SECTOR (SectorID, SectorNr, SpoorNr, StatusSectorNr)
values (27,1,34,3);
insert into SECTOR (SectorID, SectorNr, SpoorNr, StatusSectorNr)
values (28,2,34,3);
insert into SECTOR (SectorID, SectorNr, SpoorNr, StatusSectorNr)
values (29,3,34,3);
insert into SECTOR (SectorID, SectorNr, SpoorNr, StatusSectorNr)
values (30,4,34,3);

-- SECTOR 33(4)
insert into SECTOR (SectorID, SectorNr, SpoorNr, StatusSectorNr)
values (31,1,33,3);
insert into SECTOR (SectorID, SectorNr, SpoorNr, StatusSectorNr)
values (32,2,33,3);
insert into SECTOR (SectorID, SectorNr, SpoorNr, StatusSectorNr)
values (33,3,33,3);
insert into SECTOR (SectorID, SectorNr, SpoorNr, StatusSectorNr)
values (34,4,33,3);

-- SECTOR 32(4)
insert into SECTOR (SectorID, SectorNr, SpoorNr, StatusSectorNr)
values (35,1,32,3);
insert into SECTOR (SectorID, SectorNr, SpoorNr, StatusSectorNr)
values (36,2,32,3);
insert into SECTOR (SectorID, SectorNr, SpoorNr, StatusSectorNr)
values (37,3,32,3);
insert into SECTOR (SectorID, SectorNr, SpoorNr, StatusSectorNr)
values (38,4,32,3);

-- SECTOR 31(3)
insert into SECTOR (SectorID, SectorNr, SpoorNr, StatusSectorNr)
values (39,1,31,3);
insert into SECTOR (SectorID, SectorNr, SpoorNr, StatusSectorNr)
values (40,2,31,3);
insert into SECTOR (SectorID, SectorNr, SpoorNr, StatusSectorNr)
values (41,3,31,3);

-- SECTOR 30(3)
insert into SECTOR (SectorID, SectorNr, SpoorNr, StatusSectorNr)
values (42,1,30,3);
insert into SECTOR (SectorID, SectorNr, SpoorNr, StatusSectorNr)
values (43,2,30,3);
insert into SECTOR (SectorID, SectorNr, SpoorNr, StatusSectorNr)
values (44,3,30,3);

-- SECTOR 40(8)
insert into SECTOR (SectorID, SectorNr, SpoorNr, StatusSectorNr)
values (45,1,40,2);
insert into SECTOR (SectorID, SectorNr, SpoorNr, StatusSectorNr)
values (46,2,40,2);
insert into SECTOR (SectorID, SectorNr, SpoorNr, StatusSectorNr)
values (47,3,40,2);
insert into SECTOR (SectorID, SectorNr, SpoorNr, StatusSectorNr)
values (48,4,40,2);
insert into SECTOR (SectorID, SectorNr, SpoorNr, StatusSectorNr)
values (49,5,40,2);
insert into SECTOR (SectorID, SectorNr, SpoorNr, StatusSectorNr)
values (50,6,40,2);
insert into SECTOR (SectorID, SectorNr, SpoorNr, StatusSectorNr)
values (51,7,40,2);
insert into SECTOR (SectorID, SectorNr, SpoorNr, StatusSectorNr)
values (52,8,40,2);

-- SECTOR 41(4)
insert into SECTOR (SectorID, SectorNr, SpoorNr, StatusSectorNr)
values (53,1,41,3);
insert into SECTOR (SectorID, SectorNr, SpoorNr, StatusSectorNr)
values (54,2,41,3);
insert into SECTOR (SectorID, SectorNr, SpoorNr, StatusSectorNr)
values (55,3,41,3);
insert into SECTOR (SectorID, SectorNr, SpoorNr, StatusSectorNr)
values (56,4,41,3);

-- SECTOR 42(4)
insert into SECTOR (SectorID, SectorNr, SpoorNr, StatusSectorNr)
values (57,1,42,3);
insert into SECTOR (SectorID, SectorNr, SpoorNr, StatusSectorNr)
values (58,2,42,3);
insert into SECTOR (SectorID, SectorNr, SpoorNr, StatusSectorNr)
values (59,3,42,3);
insert into SECTOR (SectorID, SectorNr, SpoorNr, StatusSectorNr)
values (60,4,42,3);

-- SECTOR 43(4)
insert into SECTOR (SectorID, SectorNr, SpoorNr, StatusSectorNr)
values (61,1,43,3);
insert into SECTOR (SectorID, SectorNr, SpoorNr, StatusSectorNr)
values (62,2,43,3);
insert into SECTOR (SectorID, SectorNr, SpoorNr, StatusSectorNr)
values (63,3,43,3);
insert into SECTOR (SectorID, SectorNr, SpoorNr, StatusSectorNr)
values (64,4,43,3);

-- SECTOR 44(4)
insert into SECTOR (SectorID, SectorNr, SpoorNr, StatusSectorNr)
values (65,1,44,3);
insert into SECTOR (SectorID, SectorNr, SpoorNr, StatusSectorNr)
values (66,2,44,3);
insert into SECTOR (SectorID, SectorNr, SpoorNr, StatusSectorNr)
values (67,3,44,3);
insert into SECTOR (SectorID, SectorNr, SpoorNr, StatusSectorNr)
values (68,4,44,3);

-- SECTOR 45(9)
insert into SECTOR (SectorID, SectorNr, SpoorNr, StatusSectorNr)
values (69,1,45,3);
insert into SECTOR (SectorID, SectorNr, SpoorNr, StatusSectorNr)
values (70,2,45,3);
insert into SECTOR (SectorID, SectorNr, SpoorNr, StatusSectorNr)
values (71,3,45,3);
insert into SECTOR (SectorID, SectorNr, SpoorNr, StatusSectorNr)
values (72,4,45,3);
insert into SECTOR (SectorID, SectorNr, SpoorNr, StatusSectorNr)
values (73,5,45,3);
insert into SECTOR (SectorID, SectorNr, SpoorNr, StatusSectorNr)
values (74,6,45,3);
insert into SECTOR (SectorID, SectorNr, SpoorNr, StatusSectorNr)
values (75,7,45,3);
insert into SECTOR (SectorID, SectorNr, SpoorNr, StatusSectorNr)
values (76,8,45,3);
insert into SECTOR (SectorID, SectorNr, SpoorNr, StatusSectorNr)
values (77,9,45,3);


-- SECTOR 51(6)
insert into SECTOR (SectorID, SectorNr, SpoorNr, StatusSectorNr)
values (78,1,51,3);
insert into SECTOR (SectorID, SectorNr, SpoorNr, StatusSectorNr)
values (79,2,51,3);
insert into SECTOR (SectorID, SectorNr, SpoorNr, StatusSectorNr)
values (80,3,51,3);
insert into SECTOR (SectorID, SectorNr, SpoorNr, StatusSectorNr)
values (81,4,51,3);
insert into SECTOR (SectorID, SectorNr, SpoorNr, StatusSectorNr)
values (82,5,51,3);

-- SECTOR 52(7)
insert into SECTOR (SectorID, SectorNr, SpoorNr, StatusSectorNr)
values (84,1,52,3);
insert into SECTOR (SectorID, SectorNr, SpoorNr, StatusSectorNr)
values (85,2,52,3);
insert into SECTOR (SectorID, SectorNr, SpoorNr, StatusSectorNr)
values (86,3,52,3);
insert into SECTOR (SectorID, SectorNr, SpoorNr, StatusSectorNr)
values (87,4,52,3);
insert into SECTOR (SectorID, SectorNr, SpoorNr, StatusSectorNr)
values (88,5,52,3);
insert into SECTOR (SectorID, SectorNr, SpoorNr, StatusSectorNr)
values (89,6,52,3);


-- SECTOR 53(7)
insert into SECTOR (SectorID, SectorNr, SpoorNr, StatusSectorNr)
values (91,1,53,3);
insert into SECTOR (SectorID, SectorNr, SpoorNr, StatusSectorNr)
values (92,2,53,3);
insert into SECTOR (SectorID, SectorNr, SpoorNr, StatusSectorNr)
values (93,3,53,3);
insert into SECTOR (SectorID, SectorNr, SpoorNr, StatusSectorNr)
values (94,4,53,3);
insert into SECTOR (SectorID, SectorNr, SpoorNr, StatusSectorNr)
values (95,5,53,3);
insert into SECTOR (SectorID, SectorNr, SpoorNr, StatusSectorNr)
values (96,6,53,3);


-- SECTOR 54(7)
insert into SECTOR (SectorID, SectorNr, SpoorNr, StatusSectorNr)
values (98,1,54,3);
insert into SECTOR (SectorID, SectorNr, SpoorNr, StatusSectorNr)
values (99,2,54,3);
insert into SECTOR (SectorID, SectorNr, SpoorNr, StatusSectorNr)
values (100,3,54,3);
insert into SECTOR (SectorID, SectorNr, SpoorNr, StatusSectorNr)
values (101,4,54,3);
insert into SECTOR (SectorID, SectorNr, SpoorNr, StatusSectorNr)
values (102,5,54,3);
insert into SECTOR (SectorID, SectorNr, SpoorNr, StatusSectorNr)
values (103,6,54,3);
insert into SECTOR (SectorID, SectorNr, SpoorNr, StatusSectorNr)
values (104,7,54,3);


-- SECTOR 55(8)
insert into SECTOR (SectorID, SectorNr, SpoorNr, StatusSectorNr)
values (105,1,55,3);
insert into SECTOR (SectorID, SectorNr, SpoorNr, StatusSectorNr)
values (106,2,55,3);
insert into SECTOR (SectorID, SectorNr, SpoorNr, StatusSectorNr)
values (107,3,55,3);
insert into SECTOR (SectorID, SectorNr, SpoorNr, StatusSectorNr)
values (108,4,55,3);
insert into SECTOR (SectorID, SectorNr, SpoorNr, StatusSectorNr)
values (109,5,55,3);
insert into SECTOR (SectorID, SectorNr, SpoorNr, StatusSectorNr)
values (110,6,55,3);
insert into SECTOR (SectorID, SectorNr, SpoorNr, StatusSectorNr)
values (111,7,55,3);


-- SECTOR 56(8)
insert into SECTOR (SectorID, SectorNr, SpoorNr, StatusSectorNr)
values (113,1,56,3);
insert into SECTOR (SectorID, SectorNr, SpoorNr, StatusSectorNr)
values (114,2,56,3);
insert into SECTOR (SectorID, SectorNr, SpoorNr, StatusSectorNr)
values (115,3,56,3);
insert into SECTOR (SectorID, SectorNr, SpoorNr, StatusSectorNr)
values (116,4,56,3);
insert into SECTOR (SectorID, SectorNr, SpoorNr, StatusSectorNr)
values (117,5,56,3);
insert into SECTOR (SectorID, SectorNr, SpoorNr, StatusSectorNr)
values (118,6,56,3);
insert into SECTOR (SectorID, SectorNr, SpoorNr, StatusSectorNr)
values (119,7,56,3);

-- SECTOR 57(8)
insert into SECTOR (SectorID, SectorNr, SpoorNr, StatusSectorNr)
values (121,1,57,3);
insert into SECTOR (SectorID, SectorNr, SpoorNr, StatusSectorNr)
values (122,2,57,3);
insert into SECTOR (SectorID, SectorNr, SpoorNr, StatusSectorNr)
values (123,3,57,3);
insert into SECTOR (SectorID, SectorNr, SpoorNr, StatusSectorNr)
values (124,4,57,3);
insert into SECTOR (SectorID, SectorNr, SpoorNr, StatusSectorNr)
values (125,5,57,3);
insert into SECTOR (SectorID, SectorNr, SpoorNr, StatusSectorNr)
values (126,6,57,3);
insert into SECTOR (SectorID, SectorNr, SpoorNr, StatusSectorNr)
values (127,7,57,3);
insert into SECTOR (SectorID, SectorNr, SpoorNr, StatusSectorNr)
values (128,8,57,3);


-- SECTOR 58(6)
insert into SECTOR (SectorID, SectorNr, SpoorNr, StatusSectorNr)
values (129,1,58,2);
insert into SECTOR (SectorID, SectorNr, SpoorNr, StatusSectorNr)
values (130,2,58,2);
insert into SECTOR (SectorID, SectorNr, SpoorNr, StatusSectorNr)
values (131,3,58,2);
insert into SECTOR (SectorID, SectorNr, SpoorNr, StatusSectorNr)
values (132,4,58,2);
insert into SECTOR (SectorID, SectorNr, SpoorNr, StatusSectorNr)
values (133,5,58,2);
insert into SECTOR (SectorID, SectorNr, SpoorNr, StatusSectorNr)
values (134,6,58,2);


-- SECTOR 61(3)
insert into SECTOR (SectorID, SectorNr, SpoorNr, StatusSectorNr)
values (135,1,61,3);
insert into SECTOR (SectorID, SectorNr, SpoorNr, StatusSectorNr)
values (136,2,61,3);
insert into SECTOR (SectorID, SectorNr, SpoorNr, StatusSectorNr)
values (137,3,61,3);


-- SECTOR 62(3)
insert into SECTOR (SectorID, SectorNr, SpoorNr, StatusSectorNr)
values (138,1,62,3);
insert into SECTOR (SectorID, SectorNr, SpoorNr, StatusSectorNr)
values (139,2,62,3);
insert into SECTOR (SectorID, SectorNr, SpoorNr, StatusSectorNr)
values (140,3,62,3);


-- SECTOR 63(4)
insert into SECTOR (SectorID, SectorNr, SpoorNr, StatusSectorNr)
values (141,1,63,3);
insert into SECTOR (SectorID, SectorNr, SpoorNr, StatusSectorNr)
values (142,2,63,3);
insert into SECTOR (SectorID, SectorNr, SpoorNr, StatusSectorNr)
values (143,3,63,3);
insert into SECTOR (SectorID, SectorNr, SpoorNr, StatusSectorNr)
values (144,4,63,3);


-- SECTOR 64(5)
insert into SECTOR (SectorID, SectorNr, SpoorNr, StatusSectorNr)
values (145,1,64,3);
insert into SECTOR (SectorID, SectorNr, SpoorNr, StatusSectorNr)
values (146,2,64,3);
insert into SECTOR (SectorID, SectorNr, SpoorNr, StatusSectorNr)
values (147,3,64,3);
insert into SECTOR (SectorID, SectorNr, SpoorNr, StatusSectorNr)
values (148,4,64,3);
insert into SECTOR (SectorID, SectorNr, SpoorNr, StatusSectorNr)
values (149,5,64,3);


-- SECTOR 74(5)
insert into SECTOR (SectorID, SectorNr, SpoorNr, StatusSectorNr)
values (150,1,74,3);
insert into SECTOR (SectorID, SectorNr, SpoorNr, StatusSectorNr)
values (151,2,74,3);
insert into SECTOR (SectorID, SectorNr, SpoorNr, StatusSectorNr)
values (152,3,74,3);
insert into SECTOR (SectorID, SectorNr, SpoorNr, StatusSectorNr)
values (153,4,74,3);
insert into SECTOR (SectorID, SectorNr, SpoorNr, StatusSectorNr)
values (154,5,74,3);

-- SECTOR 75(4)
insert into SECTOR (SectorID, SectorNr, SpoorNr, StatusSectorNr)
values (155,1,75,3);
insert into SECTOR (SectorID, SectorNr, SpoorNr, StatusSectorNr)
values (156,2,75,3);
insert into SECTOR (SectorID, SectorNr, SpoorNr, StatusSectorNr)
values (157,3,75,3);
insert into SECTOR (SectorID, SectorNr, SpoorNr, StatusSectorNr)
values (158,4,75,3);


-- SECTOR 76(5)
insert into SECTOR (SectorID, SectorNr, SpoorNr, StatusSectorNr)
values (159,1,76,3);
insert into SECTOR (SectorID, SectorNr, SpoorNr, StatusSectorNr)
values (160,2,76,3);
insert into SECTOR (SectorID, SectorNr, SpoorNr, StatusSectorNr)
values (161,3,76,3);
insert into SECTOR (SectorID, SectorNr, SpoorNr, StatusSectorNr)
values (162,4,76,3);
insert into SECTOR (SectorID, SectorNr, SpoorNr, StatusSectorNr)
values (163,5,76,3);


-- SECTOR 77(5)
insert into SECTOR (SectorID, SectorNr, SpoorNr, StatusSectorNr)
values (164,1,77,3);
insert into SECTOR (SectorID, SectorNr, SpoorNr, StatusSectorNr)
values (165,2,77,3);
insert into SECTOR (SectorID, SectorNr, SpoorNr, StatusSectorNr)
values (166,3,77,3);
insert into SECTOR (SectorID, SectorNr, SpoorNr, StatusSectorNr)
values (167,4,77,3);
insert into SECTOR (SectorID, SectorNr, SpoorNr, StatusSectorNr)
values (168,5,77,3);

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
SELECT (maxgevuld.hoogstgevuld +1) AS LegeSector FROM (SELECT COUNT(SECTORNR) AS Grootste FROM SECTOR WHERE SpoorNr = :spoorNr) totaal, (SELECT MAX(SECTORNR)as hoogstgevuld FROM SECTOR WHERE SpoorNr = :spoorNr AND (StatusSectorNr = 1 OR StatusSectorNr = 2)) maxgevuld WHERE totaal.Grootste > maxgevuld.hoogstgevuld;

SELECT LijnNr FROM SPOOR WHERE SpoorNr = :spoorNr;

SELECT STATUSTRAMNR FROM STATUSTRAM WHERE BESCHRIJVING =:tramStatus;

SELECT SECTORID FROM SECTOR WHERE SECTORNR =:sectornr AND SPOORNR =:spoornr;

UPDATE SECTOR SET STATUSSECTORNR = 1 WHERE SECTORID = :sectorID;

UPDATE TRAM SET StatusTramNr = :tramStatus, SectorID = :sectorID WHERE TramNr = :tramnr;

SELECT SpoorNr FROM SECTOR WHERE SECTORID = (SELECT SECTORID FROM TRAM WHERE TRAMNR = :tramNr);

SELECT TramNr FROM TRAM WHERE STATUSTRAMNR = 4;

SELECT TRAMNR FROM TRAM WHERE STATUSTRAMNR = 4;

SELECT SECTORID FROM SECTOR WHERE SPOORNR =:spoornr AND SECTORNR =:sectornr;

SELECT STATUSTRAMNR FROM TRAM WHERE TRAMNR = :tramnr;

SELECT COUNT(SECTORID) FROM SECTOR WHERE STATUSSECTORNR = 3;

SELECT SectorNr FROM SECTOR WHERE SECTORID = (SELECT SECTORID FROM TRAM WHERE TRAMNR = :tramNr); 

SELECT DISTINCT SpoorNr
FROM Spoor;

SELECT SECTORNR FROM (SELECT SECTORNR FROM SECTOR WHERE SPOORNR = :spoorNr AND STATUSSECTORNR = 1 ORDER BY SECTORNR DESC)WHERE ROWNUM = 1;

UPDATE SECTOR SET STATUSSECTORNR = 2 WHERE SECTORNR < :sectorNr AND SPOORNR = :spoorNr AND STATUSSECTORNR = 3;

UPDATE SECTOR SET STATUSSECTORNR = 2 WHERE SPOORNR = :spoornr AND SECTORNR =:sectornr;

SELECT SECTORNR,SPOORNR FROM SECTOR WHERE STATUSSECTORNR = 2;