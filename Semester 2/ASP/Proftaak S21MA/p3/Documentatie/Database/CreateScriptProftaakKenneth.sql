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
values (1,'Kenneth','Reijnders' ,'Kennedyplein 29',TO_DATE('1992-08-22', 'YYYY-MM-DD'));
insert into PERSOON (PersoonID, Voornaam, Achternaam, Adres, Geboortedatum)
values (2,'Chiel','Sprangers' ,'Eikenboomlaan 42',TO_DATE('1993-06-02', 'YYYY-MM-DD'));
insert into PERSOON (PersoonID, Voornaam, Achternaam, Adres, Geboortedatum)
values (3,'Ruud','Hagers' ,'Het hofje 3a',TO_DATE('1994-12-09', 'YYYY-MM-DD'));
insert into PERSOON (PersoonID, Voornaam, Achternaam, Adres, Geboortedatum)
values (4,'Mick','Vranken' ,'Raiffeisenstraat 7',TO_DATE('1993-07-21', 'YYYY-MM-DD'));


--STATUSACCOUNT
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


--ACCOUNT
insert into ACCOUNT (PersoonID, Gebruikersnaam, Wachtwoord, StatusAccountNr)
values (1,'Kennethje','Kennethje123',1);
insert into ACCOUNT (PersoonID, Gebruikersnaam, Wachtwoord, StatusAccountNr)
values (2,'Chieltje','Chieltje123',2);
insert into ACCOUNT (PersoonID, Gebruikersnaam, Wachtwoord, StatusAccountNr)
values (3,'Ruudje','Ruudje123',3);
insert into ACCOUNT (PersoonID, Gebruikersnaam, Wachtwoord, StatusAccountNr)
values (4,'Mickel','Mickel123',4);


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
values ('16');
insert into LIJN (LijnNr)
values ('17');
insert into LIJN (LijnNr)
values ('24');
insert into LIJN (LijnNr)
values ('55');
insert into LIJN (LijnNr)
values ('RES');
insert into LIJN (LijnNr)
values ('OCVT');

--STATUSSPOOR
insert into STATUSSPOOR (StatusSpoorNr, Beschrijving)
values (1,'Bezet');
insert into STATUSSPOOR (StatusSpoorNr, Beschrijving)
values (2,'Geblokkeerd');
insert into STATUSSPOOR (StatusSpoorNr, Beschrijving)
values (3,'Vrij');


--STATUSTRAM
insert into STATUSTRAM (StatusTramNr, Beschrijving)
values (1,'Schoonmaak');
insert into STATUSTRAM (StatusTramNr, Beschrijving)
values (2,'Defect');
insert into STATUSTRAM (StatusTramNr, Beschrijving)
values (3,'Dienst');
insert into STATUSTRAM (StatusTramNr, Beschrijving)
values (4,'Remise');


--TRAMTYPE
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

--SPOOR
insert into SPOOR (SpoorNr, StatusSpoorNr, LijnNr, Sector)
values (12,1,'13',3);
insert into SPOOR (SpoorNr, StatusSpoorNr, LijnNr, Sector)
values (13,3,'16/24',1);
insert into SPOOR (SpoorNr, StatusSpoorNr, LijnNr, Sector)
values (14,1,'5',1);
insert into SPOOR (SpoorNr, StatusSpoorNr, LijnNr, Sector)
values (15,2,'13',2);
insert into SPOOR (SpoorNr, StatusSpoorNr, LijnNr, Sector)
values (16,2,'1',1);
insert into SPOOR (SpoorNr, StatusSpoorNr, LijnNr, Sector)
values (17,3,'1',1);
insert into SPOOR (SpoorNr, StatusSpoorNr, LijnNr, Sector)
values (18,1,'17',3);
insert into SPOOR (SpoorNr, StatusSpoorNr, LijnNr, Sector)
values (19,3,'2',1);
insert into SPOOR (SpoorNr, StatusSpoorNr, LijnNr, Sector)
values (20,1,'16/24',2);
insert into SPOOR (SpoorNr, StatusSpoorNr, LijnNr, Sector)
values (21,2,'13',1);
insert into SPOOR (SpoorNr, StatusSpoorNr, LijnNr, Sector)
values (30,2,'1',1);
insert into SPOOR (SpoorNr, StatusSpoorNr, LijnNr, Sector)
values (31,1,'1',1);
insert into SPOOR (SpoorNr, StatusSpoorNr, LijnNr, Sector)
values (32,1,'17',1);
insert into SPOOR (SpoorNr, StatusSpoorNr, LijnNr, Sector)
values (33,1,'10',3);
insert into SPOOR (SpoorNr, StatusSpoorNr, LijnNr, Sector)
values (34,3,'2',2);
insert into SPOOR (SpoorNr, StatusSpoorNr, LijnNr, Sector)
values (35,3,'5',2);
insert into SPOOR (SpoorNr, StatusSpoorNr, LijnNr, Sector)
values (36,1,'55',6);
insert into SPOOR (SpoorNr, StatusSpoorNr, LijnNr, Sector)
values (37,1,'17',2);
insert into SPOOR (SpoorNr, StatusSpoorNr, LijnNr, Sector)
values (38,1,'2',3);
insert into SPOOR (SpoorNr, StatusSpoorNr, LijnNr, Sector)
values (40,2,'1',1);
insert into SPOOR (SpoorNr, StatusSpoorNr, LijnNr, Sector)
values (41,2,'5',3);
insert into SPOOR (SpoorNr, StatusSpoorNr, LijnNr, Sector)
values (42,1,'10',2);
insert into SPOOR (SpoorNr, StatusSpoorNr, LijnNr, Sector)
values (43,1,'1',1);
insert into SPOOR (SpoorNr, StatusSpoorNr, LijnNr, Sector)
values (44,2,'55',1);
insert into SPOOR (SpoorNr, StatusSpoorNr, LijnNr, Sector)
values (45,3,'55',5);
insert into SPOOR (SpoorNr, StatusSpoorNr, LijnNr, Sector)
values (51,1,'10',1);
insert into SPOOR (SpoorNr, StatusSpoorNr, LijnNr, Sector)
values (52,1,'2',5);
insert into SPOOR (SpoorNr, StatusSpoorNr, LijnNr, Sector)
values (53,2,'1',1);
insert into SPOOR (SpoorNr, StatusSpoorNr, LijnNr, Sector)
values (54,2,'17',4);
insert into SPOOR (SpoorNr, StatusSpoorNr, LijnNr, Sector)
values (55,1,'55',2);
insert into SPOOR (SpoorNr, StatusSpoorNr, LijnNr, Sector)
values (56,1,'1',1);
insert into SPOOR (SpoorNr, StatusSpoorNr, LijnNr, Sector)
values (57,3,'13',3);
insert into SPOOR (SpoorNr, StatusSpoorNr, LijnNr, Sector)
values (58,1,'55',3);
insert into SPOOR (SpoorNr, StatusSpoorNr, LijnNr, Sector)
values (61,2,'OCVT',2);
insert into SPOOR (SpoorNr, StatusSpoorNr, LijnNr, Sector)
values (62,1,'1',1);
insert into SPOOR (SpoorNr, StatusSpoorNr, LijnNr, Sector)
values (63,1,'55',4);
insert into SPOOR (SpoorNr, StatusSpoorNr, LijnNr, Sector)
values (64,2,'2',4);
insert into SPOOR (SpoorNr, StatusSpoorNr, LijnNr, Sector)
values (74,1,'RES',1);
insert into SPOOR (SpoorNr, StatusSpoorNr, LijnNr, Sector)
values (75,1,'13',2);
insert into SPOOR (SpoorNr, StatusSpoorNr, LijnNr, Sector)
values (76,3,'RES',2);
insert into SPOOR (SpoorNr, StatusSpoorNr, LijnNr, Sector)
values (77,3,'OCVT',1);


insert into SPOOR (SpoorNr, StatusSpoorNr, LijnNr, Sector)
values (38,1,'2',1);

--TRAM
/*
insert into TRAM (TramNr, Bijzonderheden, TramTypeNr, StatusTramNr, SpoorNr)
values (807,'-',4,2,77);
insert into TRAM (TramNr, Bijzonderheden, TramTypeNr, StatusTramNr, SpoorNr)
values (802,'-',1,3,76);
insert into TRAM (TramNr, Bijzonderheden, TramTypeNr, StatusTramNr, SpoorNr)
values (790,'-',4,1,75);
insert into TRAM (TramNr, Bijzonderheden, TramTypeNr, StatusTramNr, SpoorNr)
values (795,'-',2,1,74);
insert into TRAM (TramNr, Bijzonderheden, TramTypeNr, StatusTramNr, SpoorNr)
values (809,'-',5,1,64);
insert into TRAM (TramNr, Bijzonderheden, TramTypeNr, StatusTramNr, SpoorNr)
values (791,'-',3,4,63);
insert into TRAM (TramNr, Bijzonderheden, TramTypeNr, StatusTramNr, SpoorNr)
values (788,'-',1,1,62);
insert into TRAM (TramNr, Bijzonderheden, TramTypeNr, StatusTramNr, SpoorNr)
values (789,'-',1,2,61);
insert into TRAM (TramNr, Bijzonderheden, TramTypeNr, StatusTramNr, SpoorNr)
values (815,'-',1,2,58);
insert into TRAM (TramNr, Bijzonderheden, TramTypeNr, StatusTramNr, SpoorNr)
values (793,'-',1,1,57);
insert into TRAM (TramNr, Bijzonderheden, TramTypeNr, StatusTramNr, SpoorNr)
values (783,'-',3,2,56);
insert into TRAM (TramNr, Bijzonderheden, TramTypeNr, StatusTramNr, SpoorNr)
values (800,'-',2,4,55);
insert into TRAM (TramNr, Bijzonderheden, TramTypeNr, StatusTramNr, SpoorNr)
values (799,'-',5,1,54);
insert into TRAM (TramNr, Bijzonderheden, TramTypeNr, StatusTramNr, SpoorNr)
values (828,'-',1,3,53);
insert into TRAM (TramNr, Bijzonderheden, TramTypeNr, StatusTramNr, SpoorNr)
values (2025,'-',3,4,52);
insert into TRAM (TramNr, Bijzonderheden, TramTypeNr, StatusTramNr, SpoorNr)
values (89,'-',1,1,51);
insert into TRAM (TramNr, Bijzonderheden, TramTypeNr, StatusTramNr, SpoorNr)
values (12,'-',1,2,45);
insert into TRAM (TramNr, Bijzonderheden, TramTypeNr, StatusTramNr, SpoorNr)
values (6,'-',1,4,44);
insert into TRAM (TramNr, Bijzonderheden, TramTypeNr, StatusTramNr, SpoorNr)
values (1,'-',5,4,43);
insert into TRAM (TramNr, Bijzonderheden, TramTypeNr, StatusTramNr, SpoorNr)
values (3,'-',2,3,42);
insert into TRAM (TramNr, Bijzonderheden, TramTypeNr, StatusTramNr, SpoorNr)
values (4,'-',1,4,41);
insert into TRAM (TramNr, Bijzonderheden, TramTypeNr, StatusTramNr, SpoorNr)
values (5,'-',1,2,40);
insert into TRAM (TramNr, Bijzonderheden, TramTypeNr, StatusTramNr, SpoorNr)
values (903,'-',1,2,38);
insert into TRAM (TramNr, Bijzonderheden, TramTypeNr, StatusTramNr, SpoorNr)
values (2056,'-',1,3,37);
insert into TRAM (TramNr, Bijzonderheden, TramTypeNr, StatusTramNr, SpoorNr)
values (2,'-',1,1,36);
insert into TRAM (TramNr, Bijzonderheden, TramTypeNr, StatusTramNr, SpoorNr)
values (10,'-',1,3,35);
insert into TRAM (TramNr, Bijzonderheden, TramTypeNr, StatusTramNr, SpoorNr)
values (11,'-',5,2,34);
insert into TRAM (TramNr, Bijzonderheden, TramTypeNr, StatusTramNr, SpoorNr)
values (23,'-',4,4,33);
insert into TRAM (TramNr, Bijzonderheden, TramTypeNr, StatusTramNr, SpoorNr)
values (2070,'-',2,2,32);
insert into TRAM (TramNr, Bijzonderheden, TramTypeNr, StatusTramNr, SpoorNr)
values (2202,'-',5,1,31);
insert into TRAM (TramNr, Bijzonderheden, TramTypeNr, StatusTramNr, SpoorNr)
values (2072,'-',1,4,30);
insert into TRAM (TramNr, Bijzonderheden, TramTypeNr, StatusTramNr, SpoorNr)
values (2029,'-',1,1,21);
insert into TRAM (TramNr, Bijzonderheden, TramTypeNr, StatusTramNr, SpoorNr)
values (2028,'-',4,1,20);
insert into TRAM (TramNr, Bijzonderheden, TramTypeNr, StatusTramNr, SpoorNr)
values (2024,'-',3,2,19);
insert into TRAM (TramNr, Bijzonderheden, TramTypeNr, StatusTramNr, SpoorNr)
values (2066,'-',1,4,18);
insert into TRAM (TramNr, Bijzonderheden, TramTypeNr, StatusTramNr, SpoorNr)
values (2012,'-',1,4,17);
insert into TRAM (TramNr, Bijzonderheden, TramTypeNr, StatusTramNr, SpoorNr)
values (2044,'-',1,4,16);
insert into TRAM (TramNr, Bijzonderheden, TramTypeNr, StatusTramNr, SpoorNr)
values (798,'-',5,2,15);
insert into TRAM (TramNr, Bijzonderheden, TramTypeNr, StatusTramNr, SpoorNr)
values (803,'-',2,2,14);
insert into TRAM (TramNr, Bijzonderheden, TramTypeNr, StatusTramNr, SpoorNr)
values (808,'-',1,3,13);
insert into TRAM (TramNr, Bijzonderheden, TramTypeNr, StatusTramNr, SpoorNr)
values (13,'-',1,1,12);
insert into TRAM (TramNr, Bijzonderheden, TramTypeNr, StatusTramNr, SpoorNr)
values (2035,'-',5,1,55);
insert into TRAM (TramNr, Bijzonderheden, TramTypeNr, StatusTramNr, SpoorNr)
values (2063,'-',2,4,64);
insert into TRAM (TramNr, Bijzonderheden, TramTypeNr, StatusTramNr, SpoorNr)
values (2045,'-',1,4,42);
insert into TRAM (TramNr, Bijzonderheden, TramTypeNr, StatusTramNr, SpoorNr)
values (2054,'-',2,3,58);
insert into TRAM (TramNr, Bijzonderheden, TramTypeNr, StatusTramNr, SpoorNr)
values (2003,'-',1,4,55);
insert into TRAM (TramNr, Bijzonderheden, TramTypeNr, StatusTramNr, SpoorNr)
values (816,'-',2,1,62);
insert into TRAM (TramNr, Bijzonderheden, TramTypeNr, StatusTramNr, SpoorNr)
values (835,'-',1,1,64);
insert into TRAM (TramNr, Bijzonderheden, TramTypeNr, StatusTramNr, SpoorNr)
values (2065,'-',2,2,58);
insert into TRAM (TramNr, Bijzonderheden, TramTypeNr, StatusTramNr, SpoorNr)
values (824,'-',3,4,55);
insert into TRAM (TramNr, Bijzonderheden, TramTypeNr, StatusTramNr, SpoorNr)
values (2021,'-',1,1,62);
insert into TRAM (TramNr, Bijzonderheden, TramTypeNr, StatusTramNr, SpoorNr)
values (2011,'-',1,3,42);
insert into TRAM (TramNr, Bijzonderheden, TramTypeNr, StatusTramNr, SpoorNr)
values (904,'-',3,3,51);
insert into TRAM (TramNr, Bijzonderheden, TramTypeNr, StatusTramNr, SpoorNr)
values (841,'-',4,1,58);
insert into TRAM (TramNr, Bijzonderheden, TramTypeNr, StatusTramNr, SpoorNr)
values (917,'-',1,4,55);
insert into TRAM (TramNr, Bijzonderheden, TramTypeNr, StatusTramNr, SpoorNr)
values (2057,'-',1,2,64);
insert into TRAM (TramNr, Bijzonderheden, TramTypeNr, StatusTramNr, SpoorNr)
values (918,'-',5,1,35);
insert into TRAM (TramNr, Bijzonderheden, TramTypeNr, StatusTramNr, SpoorNr)
values (909,'-',3,2,51);
insert into TRAM (TramNr, Bijzonderheden, TramTypeNr, StatusTramNr, SpoorNr)
values (911,'-',2,3,55);
insert into TRAM (TramNr, Bijzonderheden, TramTypeNr, StatusTramNr, SpoorNr)
values (833,'-',2,2,35);
insert into TRAM (TramNr, Bijzonderheden, TramTypeNr, StatusTramNr, SpoorNr)
values (2091,'-',4,3,58);
*/

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

--Opleidingstrams
insert into TRAM (TramNr, TramTypeNr, StatusTramNr)
values (809, 5, 3);
insert into TRAM (TramNr, TramTypeNr, StatusTramNr)
values (816, 5, 3);

--DIENST
insert into DIENST (DienstNr, Uitrijtijd, Inrijtijd, LijnNr, Bijzonderheden)
values (1,'06:41','07:45','1','-');
insert into DIENST (DienstNr, Uitrijtijd, Inrijtijd, LijnNr, Bijzonderheden)
values (2,'08:39','10:22','2','-');
insert into DIENST (DienstNr, Uitrijtijd, Inrijtijd, LijnNr, Bijzonderheden)
values (3,'09:23','11:01','5','-');
insert into DIENST (DienstNr, Uitrijtijd, Inrijtijd, LijnNr, Bijzonderheden)
values (4,'10:10','12:56','10','-');
insert into DIENST (DienstNr, Uitrijtijd, Inrijtijd, LijnNr, Bijzonderheden)
values (5,'13:21','16:15','13','-');
insert into DIENST (DienstNr, Uitrijtijd, Inrijtijd, LijnNr, Bijzonderheden)
values (6,'12:53','14:37','16/24','-');
insert into DIENST (DienstNr, Uitrijtijd, Inrijtijd, LijnNr, Bijzonderheden)
values (7,'14:32','15:25','17','-');
insert into DIENST (DienstNr, Uitrijtijd, Inrijtijd, LijnNr, Bijzonderheden)
values (8,'21:15','23:59','55','-');
insert into DIENST (DienstNr, Uitrijtijd, Inrijtijd, LijnNr, Bijzonderheden)
values (9,'16:24','18:00','RES','-');
insert into DIENST (DienstNr, Uitrijtijd, Inrijtijd, LijnNr, Bijzonderheden)
values (0010,'19:44','20:04','OCVT','-');

--DIENSTREGELING
insert into DIENSTREGELING (DienstregelingNr, PersoonID, DienstNr, TramNr)
values (1,1,1,807);
insert into DIENSTREGELING (DienstregelingNr, PersoonID, DienstNr, TramNr)
values (2,2,2,802);
insert into DIENSTREGELING (DienstregelingNr, PersoonID, DienstNr, TramNr)
values (3,3,3,790);
insert into DIENSTREGELING (DienstregelingNr, PersoonID, DienstNr, TramNr)
values (4,4,4,795);
insert into DIENSTREGELING (DienstregelingNr, PersoonID, DienstNr, TramNr)
values (5,1,5,809);


--SCHOONMAAK
insert into SCHOONMAAK (SchoonmaakNr, TramNr, PersoonID, BeginTijd, EindTijd)
values (1,807,1,'08:30','09:30');
insert into SCHOONMAAK (SchoonmaakNr, TramNr, PersoonID, BeginTijd, EindTijd)
values (2,790,3,'09:30','10:30');
insert into SCHOONMAAK (SchoonmaakNr, TramNr, PersoonID, BeginTijd, EindTijd)
values (3,791,4,'10:30','11:30');
insert into SCHOONMAAK (SchoonmaakNr, TramNr, PersoonID, BeginTijd, EindTijd)
values (4,802,2,'11:30','12:30');
insert into SCHOONMAAK (SchoonmaakNr, TramNr, PersoonID, BeginTijd, EindTijd)
values (5,815,2,'12:30','14:30');
insert into SCHOONMAAK (SchoonmaakNr, TramNr, PersoonID, BeginTijd, EindTijd)
values (6,783,4,'14:30','16:30');


--ONDERHOUD
insert into ONDERHOUD (OnderhoudsNr, TramNr, PersoonID, TijdsIndicatie)
values (1,807,1,'120 minuten');
insert into ONDERHOUD (OnderhoudsNr, TramNr, PersoonID, TijdsIndicatie)
values (2,799,3,'90 minuten');
insert into ONDERHOUD (OnderhoudsNr, TramNr, PersoonID, TijdsIndicatie)
values (3,2044,3,'160 minuten');
insert into ONDERHOUD (OnderhoudsNr, TramNr, PersoonID, TijdsIndicatie)
values (4,808,2,'140 minuten');
insert into ONDERHOUD (OnderhoudsNr, TramNr, PersoonID, TijdsIndicatie)
values (5,2045,4,'60 minuten');

savepoint sp_Clean;
---------------------------------------------------------------------------------------------
--------------------------------------TESTING------------------------------------------------
---------------------------------------------------------------------------------------------
-- Hier check ik of de check constraints van statusspoor het goed doet, 
--als het goed is kun je alleen 'Bezet','Geblokkeerd' of 'Vrij' invullen bij beschrijving.
insert into STATUSSPOOR (StatusSpoorNr, Beschrijving)
values (1,'Test');
/*Error starting at line : 506 in command -
insert into STATUSSPOOR (StatusSpoorNr, Beschrijving)
values (1,'Test')
Error report -
SQL Error: ORA-02290: check constraint (MICKY.CHK_STATUSSPOOR_BESCHRIJVING) violated
02290. 00 -  "check constraint (%s.%s) violated"
*Cause:    The values being inserted do not satisfy the named check
           
*Action:   do not insert values that violate the constraint.
*/


-- Hier check ik of de check constraints van statusspoor het goed doet, 
--als het goed is kun je alleen 'Beheerder','Technicus','WagenparkBeheerder', 'Bestuurder' of 'Vrij' invullen bij beschrijving.
insert into STATUSACCOUNT (StatusAccountNr, Beschrijving)
values (1,'Test');
/*Error starting at line : 522 in command -
insert into STATUSACCOUNT (StatusAccountNr, Beschrijving)
values (1,'Test')
Error report -
SQL Error: ORA-02290: check constraint (MICKY.CHK_STATUSACCOUNT_BESCHRIJVING) violated
02290. 00 -  "check constraint (%s.%s) violated"
*Cause:    The values being inserted do not satisfy the named check
           
*Action:   do not insert values that violate the constraint.*/


-- Hier check ik of de check constraints van statusspoor het goed doet, 
--als het goed is kun je alleen 'Schoonmaak','Defect','Dienst' of 'Remise' invullen bij beschrijving.
insert into STATUSTRAM (StatusTramNr, Beschrijving)
values (1,'Schoonmaak');
/*Error starting at line : 537 in command -
insert into STATUSTRAM (StatusTramNr, Beschrijving)
values (1,'Schoonmaak')
Error report -
SQL Error: ORA-01: unique constraint (MICKY.SYS_C008292) violated
01. 00 -  "unique constraint (%s.%s) violated"
*Cause:    An UPDATE or INSERT statement attempted to insert a duplicate key.
           For Trusted Oracle configured in DBMS MAC mode, you may see
           this message if a duplicate entry exists at a different level.
*Action:   Either remove the unique restriction or do not insert the key.*/

-- Hier check ik of de check constraints van statusspoor het goed doet, 
--als het goed is kun je alleen 'Combino','Dubbel Kop Combino','11G','12G' of 'Opleidingstram' invullen bij beschrijving.
insert into TRAMTYPE (TramTypeNr, Beschrijving)
values (1,'Test');
/*Error starting at line : 552 in command -
insert into TRAMTYPE (TramTypeNr, Beschrijving)
values (1,'Test')
Error report -
SQL Error: ORA-02290: check constraint (MICKY.CHK_TRAMTYPE_BESCHRIJVING) violated
02290. 00 -  "check constraint (%s.%s) violated"
*Cause:    The values being inserted do not satisfy the named check
           
*Action:   do not insert values that violate the constraint.
*/
-- Hier ga ik terug naar de database voordat ik het ging testen.
rollback to sp_Clean;