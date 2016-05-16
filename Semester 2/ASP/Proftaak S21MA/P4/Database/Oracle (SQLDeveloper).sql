/*
Added:
-Set define off to be sure
-drop table and drop sequence for easy rerun of this script
*/

--Disables the parsing of commands to replace substitution variables with their values
set define off;

DROP TABLE FUNCTIE CASCADE CONSTRAINTS;
DROP TABLE FUNCTIE_RECHT CASCADE CONSTRAINTS;
DROP TABLE LIJN CASCADE CONSTRAINTS;
DROP TABLE MEDEWERKER CASCADE CONSTRAINTS;
DROP TABLE ONDERHOUD CASCADE CONSTRAINTS;
DROP TABLE RECHT CASCADE CONSTRAINTS;
DROP TABLE REMISE CASCADE CONSTRAINTS;
DROP TABLE RESERVERING CASCADE CONSTRAINTS;
DROP TABLE SECTOR CASCADE CONSTRAINTS;
DROP TABLE SPOOR CASCADE CONSTRAINTS;
DROP TABLE TRAM CASCADE CONSTRAINTS;
DROP TABLE TRAMTYPE CASCADE CONSTRAINTS;
DROP TABLE TRAM_LIJN CASCADE CONSTRAINTS;
DROP TABLE TRAM_ONDERHOUD CASCADE CONSTRAINTS;
DROP TABLE TRANSFER CASCADE CONSTRAINTS;
DROP TABLE VERBINDING CASCADE CONSTRAINTS;

DROP SEQUENCE FUNCTIE_FCSEQ;
DROP SEQUENCE LIJN_FCSEQ;
DROP SEQUENCE MEDEWERKER_FCSEQ;
DROP SEQUENCE RECHT_FCSEQ;
DROP SEQUENCE REMISE_FCSEQ;
DROP SEQUENCE RESERVERING_FCSEQ;
DROP SEQUENCE SECTOR_FCSEQ;
DROP SEQUENCE SPOOR_FCSEQ;
DROP SEQUENCE TRAMTYPE_FCSEQ;
DROP SEQUENCE TRAM_FCSEQ;
DROP SEQUENCE TRAM_LIJN_FCSEQ;
DROP SEQUENCE TRAM_ONDERHOUD_FCSEQ;
DROP SEQUENCE VERBINDING_FCSEQ;

--------------------------------------------------------
--  File created - donderdag-oktober-23-2014   
--------------------------------------------------------
--------------------------------------------------------
--  DDL for Sequence FUNCTIE_FCSEQ
--------------------------------------------------------

   CREATE SEQUENCE  FUNCTIE_FCSEQ  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 6 CACHE 20 NOORDER  NOCYCLE ;
--------------------------------------------------------
--  DDL for Sequence LIJN_FCSEQ
--------------------------------------------------------

   CREATE SEQUENCE  LIJN_FCSEQ  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 15 CACHE 20 NOORDER  NOCYCLE ;
--------------------------------------------------------
--  DDL for Sequence MEDEWERKER_FCSEQ
--------------------------------------------------------

   CREATE SEQUENCE  MEDEWERKER_FCSEQ  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 6 CACHE 20 NOORDER  NOCYCLE ;
--------------------------------------------------------
--  DDL for Sequence RECHT_FCSEQ
--------------------------------------------------------

   CREATE SEQUENCE  RECHT_FCSEQ  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 8 CACHE 20 NOORDER  NOCYCLE ;
--------------------------------------------------------
--  DDL for Sequence REMISE_FCSEQ
--------------------------------------------------------

   CREATE SEQUENCE  REMISE_FCSEQ  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 3 CACHE 20 NOORDER  NOCYCLE ;
--------------------------------------------------------
--  DDL for Sequence RESERVERING_FCSEQ
--------------------------------------------------------

   CREATE SEQUENCE  RESERVERING_FCSEQ  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 1 CACHE 20 NOORDER  NOCYCLE ;
--------------------------------------------------------
--  DDL for Sequence SECTOR_FCSEQ
--------------------------------------------------------

   CREATE SEQUENCE  SECTOR_FCSEQ  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 1 CACHE 20 NOORDER  NOCYCLE ;
--------------------------------------------------------
--  DDL for Sequence SPOOR_FCSEQ
--------------------------------------------------------

   CREATE SEQUENCE  SPOOR_FCSEQ  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 44 CACHE 20 NOORDER  NOCYCLE ;
--------------------------------------------------------
--  DDL for Sequence TRAMTYPE_FCSEQ
--------------------------------------------------------

   CREATE SEQUENCE  TRAMTYPE_FCSEQ  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 8 CACHE 20 NOORDER  NOCYCLE ;
--------------------------------------------------------
--  DDL for Sequence TRAM_FCSEQ
--------------------------------------------------------

   CREATE SEQUENCE  TRAM_FCSEQ  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 215 CACHE 20 NOORDER  NOCYCLE ;
--------------------------------------------------------
--  DDL for Sequence TRAM_LIJN_FCSEQ
--------------------------------------------------------

   CREATE SEQUENCE  TRAM_LIJN_FCSEQ  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 147 CACHE 20 NOORDER  NOCYCLE ;
--------------------------------------------------------
--  DDL for Sequence TRAM_ONDERHOUD_FCSEQ
--------------------------------------------------------

   CREATE SEQUENCE  TRAM_ONDERHOUD_FCSEQ  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 1 CACHE 20 NOORDER  NOCYCLE ;
--------------------------------------------------------
--  DDL for Sequence VERBINDING_FCSEQ
--------------------------------------------------------

   CREATE SEQUENCE  VERBINDING_FCSEQ  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 1 CACHE 20 NOORDER  NOCYCLE ;
--------------------------------------------------------
--  DDL for Table FUNCTIE
--------------------------------------------------------

  CREATE TABLE FUNCTIE 
   (	ID NUMBER(10,0), 
	Naam NVARCHAR2(255)
   ) ;
--------------------------------------------------------
--  DDL for Table FUNCTIE_RECHT
--------------------------------------------------------

  CREATE TABLE FUNCTIE_RECHT 
   (	Functie_ID NUMBER(10,0), 
	Recht_ID NUMBER(10,0)
   ) ;
--------------------------------------------------------
--  DDL for Table LIJN
--------------------------------------------------------

  CREATE TABLE LIJN 
   (	ID NUMBER(10,0), 
	Remise_ID NUMBER(10,0), 
	Nummer NUMBER(10,0) DEFAULT (0), 
	ConducteurRijdtMee NUMBER(1,0) DEFAULT (0)
   ) ;
--------------------------------------------------------
--  DDL for Table MEDEWERKER
--------------------------------------------------------

  CREATE TABLE MEDEWERKER 
   (	ID NUMBER(10,0), 
	Functie_ID NUMBER(10,0), 
	Naam NVARCHAR2(255)
   ) ;
--------------------------------------------------------
--  DDL for Table ONDERHOUD
--------------------------------------------------------

  CREATE TABLE ONDERHOUD 
   (	GroteServiceBeurtenPerJaar NUMBER(10,0) DEFAULT (0), 
	KleineServiceBeurtenPerJaar NUMBER(10,0) DEFAULT (0), 
	GroteSchoonmaakBeurtenPerJaar NUMBER(10,0) DEFAULT (0), 
	KleineSchoonmaakBeurtenPerJaar NUMBER(10,0) DEFAULT (0)
   ) ;
--------------------------------------------------------
--  DDL for Table RECHT
--------------------------------------------------------

  CREATE TABLE RECHT 
   (	ID NUMBER(10,0), 
	Omschrijving NVARCHAR2(255)
   ) ;
--------------------------------------------------------
--  DDL for Table REMISE
--------------------------------------------------------

  CREATE TABLE REMISE 
   (	ID NUMBER(10,0), 
	Naam NVARCHAR2(255), 
	GroteServiceBeurtenPerDag NUMBER(10,0) DEFAULT (0), 
	KleineServiceBeurtenPerDag NUMBER(10,0) DEFAULT (0), 
	GroteSchoonmaakBeurtenPerDag NUMBER(10,0) DEFAULT (0), 
	KleineSchoonmaakBeurtenPerDag NUMBER(10,0) DEFAULT (0)
   ) ;
--------------------------------------------------------
--  DDL for Table RESERVERING
--------------------------------------------------------

  CREATE TABLE RESERVERING 
   (	Reservering_ID NUMBER(10,0), 
	Tram_ID NUMBER(10,0) DEFAULT (0), 
	Sector_ID NUMBER(10,0) DEFAULT (0)
   ) ;
--------------------------------------------------------
--  DDL for Table SECTOR
--------------------------------------------------------

  CREATE TABLE SECTOR 
   (	ID NUMBER(10,0), 
	Spoor_ID NUMBER(10,0) DEFAULT (0), 
	Tram_ID NUMBER(10,0) DEFAULT (0), 
	Nummer NUMBER(10,0) DEFAULT (0), 
	Beschikbaar NUMBER(1,0) DEFAULT (0), 
	Blokkade NUMBER(1,0) DEFAULT (0)
   ) ;
--------------------------------------------------------
--  DDL for Table SPOOR
--------------------------------------------------------

  CREATE TABLE SPOOR 
   (	ID NUMBER(10,0), 
	Remise_ID NUMBER(10,0), 
	Nummer NUMBER(10,0) DEFAULT (0), 
	Lengte NUMBER(10,0) DEFAULT (0), 
	Beschikbaar NUMBER(1,0) DEFAULT (0), 
	InUitRijspoor NUMBER(1,0) DEFAULT (0)
   ) ;
--------------------------------------------------------
--  DDL for Table TRAM
--------------------------------------------------------

  CREATE TABLE TRAM 
   (	ID NUMBER(10,0), 
	Remise_ID_Standplaats NUMBER(10,0), 
	Tramtype_ID NUMBER(10,0), 
	Nummer NUMBER(10,0) DEFAULT (0), 
	Lengte NUMBER(10,0) DEFAULT (1), 
	Status NVARCHAR2(255), 
	Vervuild NUMBER(1,0) DEFAULT (0), 
	Defect NUMBER(1,0) DEFAULT (0), 
	ConducteurGeschikt NUMBER(1,0) DEFAULT (0), 
	Beschikbaar NUMBER(1,0) DEFAULT (0)
   ) ;
--------------------------------------------------------
--  DDL for Table TRAMTYPE
--------------------------------------------------------

  CREATE TABLE TRAMTYPE 
   (	ID NUMBER(10,0), 
	Omschrijving NVARCHAR2(255)
   ) ;
--------------------------------------------------------
--  DDL for Table TRAM_LIJN
--------------------------------------------------------

  CREATE TABLE TRAM_LIJN 
   (	TL_ID NUMBER(10,0), 
	Tram_ID NUMBER(10,0), 
	Lijn_ID NUMBER(10,0), 
	Gebonden NUMBER(1,0) DEFAULT (0)
   ) ;
--------------------------------------------------------
--  DDL for Table TRAM_ONDERHOUD
--------------------------------------------------------

  CREATE TABLE TRAM_ONDERHOUD 
   (	ID NUMBER(10,0), 
	Medewerker_ID NUMBER(10,0) DEFAULT (0), 
	Tram_ID NUMBER(10,0) DEFAULT (0), 
	DatumTijdstip DATE, 
	BeschikbaarDatum DATE,
  EindDatum DATE,
	TypeOnderhoud NVARCHAR2(255) CHECK (TypeOnderhoud IN ('GroteServiceBeurt', 'KleineServiceBeurt', 'GroteSchoonmaakBeurt', 'KleineSchoonmaakBeurt')),
  Beschrijving VARCHAR2 (255)
   ) ;
--------------------------------------------------------
--  DDL for Table TRANSFER
--------------------------------------------------------

  CREATE TABLE TRANSFER 
   (	Remise_ID_Van NUMBER(10,0), 
	Remise_ID_Naar NUMBER(10,0), 
	Aantal NUMBER(10,0) DEFAULT (0)
   ) ;
--------------------------------------------------------
--  DDL for Table VERBINDING
--------------------------------------------------------

  CREATE TABLE VERBINDING 
   (	ID NUMBER(10,0), 
	Sector_ID_Van NUMBER(10,0) DEFAULT (0), 
	Sector_ID_Naar NUMBER(10,0) DEFAULT (0)
   ) ;
REM INSERTING into FUNCTIE
SET DEFINE OFF;
Insert into FUNCTIE (ID,Naam) values (1,'	Beheerder');
Insert into FUNCTIE (ID,Naam) values (2,'	Wagenparkbeheerder');
Insert into FUNCTIE (ID,Naam) values (3,'	Bestuurder');
Insert into FUNCTIE (ID,Naam) values (4,'	Technicus');
Insert into FUNCTIE (ID,Naam) values (5,'	Schoonmaker');
REM INSERTING into FUNCTIE_RECHT
SET DEFINE OFF;
Insert into FUNCTIE_RECHT (Functie_ID,Recht_ID) values (1,1);
Insert into FUNCTIE_RECHT (Functie_ID,Recht_ID) values (1,2);
Insert into FUNCTIE_RECHT (Functie_ID,Recht_ID) values (1,3);
Insert into FUNCTIE_RECHT (Functie_ID,Recht_ID) values (1,4);
Insert into FUNCTIE_RECHT (Functie_ID,Recht_ID) values (1,5);
Insert into FUNCTIE_RECHT (Functie_ID,Recht_ID) values (1,6);
Insert into FUNCTIE_RECHT (Functie_ID,Recht_ID) values (1,7);
Insert into FUNCTIE_RECHT (Functie_ID,Recht_ID) values (2,1);
Insert into FUNCTIE_RECHT (Functie_ID,Recht_ID) values (2,2);
Insert into FUNCTIE_RECHT (Functie_ID,Recht_ID) values (2,3);
Insert into FUNCTIE_RECHT (Functie_ID,Recht_ID) values (2,4);
Insert into FUNCTIE_RECHT (Functie_ID,Recht_ID) values (3,1);
Insert into FUNCTIE_RECHT (Functie_ID,Recht_ID) values (3,2);
Insert into FUNCTIE_RECHT (Functie_ID,Recht_ID) values (3,4);
Insert into FUNCTIE_RECHT (Functie_ID,Recht_ID) values (4,2);
Insert into FUNCTIE_RECHT (Functie_ID,Recht_ID) values (4,5);
Insert into FUNCTIE_RECHT (Functie_ID,Recht_ID) values (5,6);
Insert into FUNCTIE_RECHT (Functie_ID,Recht_ID) values (5,7);
REM INSERTING into LIJN
SET DEFINE OFF;
Insert into LIJN (ID,Remise_ID,Nummer,ConducteurRijdtMee) values (1,1,1,1);
Insert into LIJN (ID,Remise_ID,Nummer,ConducteurRijdtMee) values (2,1,2,1);
Insert into LIJN (ID,Remise_ID,Nummer,ConducteurRijdtMee) values (3,1,5,0);
Insert into LIJN (ID,Remise_ID,Nummer,ConducteurRijdtMee) values (4,1,10,1);
Insert into LIJN (ID,Remise_ID,Nummer,ConducteurRijdtMee) values (5,1,13,1);
Insert into LIJN (ID,Remise_ID,Nummer,ConducteurRijdtMee) values (6,1,16,0);
Insert into LIJN (ID,Remise_ID,Nummer,ConducteurRijdtMee) values (7,1,17,1);
Insert into LIJN (ID,Remise_ID,Nummer,ConducteurRijdtMee) values (8,1,24,0);
Insert into LIJN (ID,Remise_ID,Nummer,ConducteurRijdtMee) values (9,2,4,0);
Insert into LIJN (ID,Remise_ID,Nummer,ConducteurRijdtMee) values (10,2,7,0);
Insert into LIJN (ID,Remise_ID,Nummer,ConducteurRijdtMee) values (11,2,9,0);
Insert into LIJN (ID,Remise_ID,Nummer,ConducteurRijdtMee) values (12,2,12,0);
Insert into LIJN (ID,Remise_ID,Nummer,ConducteurRijdtMee) values (13,2,14,0);
Insert into LIJN (ID,Remise_ID,Nummer,ConducteurRijdtMee) values (14,2,25,0);
REM INSERTING into MEDEWERKER
SET DEFINE OFF;
Insert into MEDEWERKER (ID,Functie_ID,Naam) values (1,1,'Jan');
Insert into MEDEWERKER (ID,Functie_ID,Naam) values (2,1,'Chiel');
Insert into MEDEWERKER (ID,Functie_ID,Naam) values (3,1,'Admin');
Insert into MEDEWERKER (ID,Functie_ID,Naam) values (4,2,'Piet');
Insert into MEDEWERKER (ID,Functie_ID,Naam) values (5,2,'Adw');
Insert into MEDEWERKER (ID,Functie_ID,Naam) values (6,3,'Henk');
Insert into MEDEWERKER (ID,Functie_ID,Naam) values (7,3,'Kenneth');
Insert into MEDEWERKER (ID,Functie_ID,Naam) values (8,4,'Klaas');
Insert into MEDEWERKER (ID,Functie_ID,Naam) values (9,4,'Mick');
Insert into MEDEWERKER (ID,Functie_ID,Naam) values (10,5,'Sjaak');
Insert into MEDEWERKER (ID,Functie_ID,Naam) values (11,5,'Ruud');
REM INSERTING into ONDERHOUD
SET DEFINE OFF;
Insert into ONDERHOUD (GroteServiceBeurtenPerJaar,KleineServiceBeurtenPerJaar,GroteSchoonmaakBeurtenPerJaar,KleineSchoonmaakBeurtenPerJaar) values (2,4,4,12);
REM INSERTING into RECHT
SET DEFINE OFF;
Insert into RECHT (ID,Omschrijving) values (1,'Wagens invoeren');
Insert into RECHT (ID,Omschrijving) values (2,'Status veranderen');
Insert into RECHT (ID,Omschrijving) values (3,'Sporen blokkeren');
Insert into RECHT (ID,Omschrijving) values (4,'Wagens naar de schoonmaak sturen');
Insert into RECHT (ID,Omschrijving) values (5,'Tijdsindicatie reparatie geven');
Insert into RECHT (ID,Omschrijving) values (6,'Schoonmaak lijst opvragen');
Insert into RECHT (ID,Omschrijving) values (7,'Datum/tijd schoonmaak invoeren');
REM INSERTING into REMISE
SET DEFINE OFF;
Insert into REMISE (ID,Naam,GroteServiceBeurtenPerDag,KleineServiceBeurtenPerDag,GroteSchoonmaakBeurtenPerDag,KleineSchoonmaakBeurtenPerDag) values (1,'Remise Havenstraat',1,4,2,3);
Insert into REMISE (ID,Naam,GroteServiceBeurtenPerDag,KleineServiceBeurtenPerDag,GroteSchoonmaakBeurtenPerDag,KleineSchoonmaakBeurtenPerDag) values (2,'Remise Lekstraat',1,4,2,3);
REM INSERTING into RESERVERING
SET DEFINE OFF;
REM INSERTING into SECTOR
SET DEFINE OFF;
insert into SECTOR ( ID, NUMMER, SPOOR_ID, BESCHIKBAAR, BLOKKADE)
values (1,1,1,1,0);
insert into SECTOR ( ID, NUMMER, SPOOR_ID, BESCHIKBAAR, BLOKKADE)
values (2,1,2,1,0);
insert into SECTOR ( ID, NUMMER, SPOOR_ID, BESCHIKBAAR, BLOKKADE)
values (3,1,3,1,0);
insert into SECTOR ( ID, NUMMER, SPOOR_ID, BESCHIKBAAR, BLOKKADE)
values (4,1,4,1,0);
insert into SECTOR ( ID, NUMMER, SPOOR_ID, BESCHIKBAAR, BLOKKADE)
values (5,1,5,1,0);
insert into SECTOR ( ID, NUMMER, SPOOR_ID, BESCHIKBAAR, BLOKKADE)
values (6,1,6,1,0);
insert into SECTOR ( ID, NUMMER, SPOOR_ID, BESCHIKBAAR, BLOKKADE)
values (7,1,7,1,0);
insert into SECTOR ( ID, NUMMER, SPOOR_ID, BESCHIKBAAR, BLOKKADE)
values (8,1,8,1,0);
insert into SECTOR ( ID, NUMMER, SPOOR_ID, BESCHIKBAAR, BLOKKADE)
values (9,1,9,1,0);
insert into SECTOR ( ID, NUMMER, SPOOR_ID, BESCHIKBAAR, BLOKKADE)
values (10,1,10,1,0);

-- SECTOR 38(4)
insert into SECTOR ( ID, NUMMER, SPOOR_ID, BESCHIKBAAR, BLOKKADE)
values (11,1,19,1,0);
insert into SECTOR ( ID, NUMMER, SPOOR_ID, BESCHIKBAAR, BLOKKADE)
values (12,2,19,1,0);
insert into SECTOR ( ID, NUMMER, SPOOR_ID, BESCHIKBAAR, BLOKKADE)
values (13,3,19,1,0);
insert into SECTOR ( ID, NUMMER, SPOOR_ID, BESCHIKBAAR, BLOKKADE)
values (14,4,19,1,0);

-- SECTOR 37(4)
insert into SECTOR ( ID, NUMMER, SPOOR_ID, BESCHIKBAAR, BLOKKADE)
values (15,1,18,1,0);
insert into SECTOR ( ID, NUMMER, SPOOR_ID, BESCHIKBAAR, BLOKKADE)
values (16,2,18,1,0);
insert into SECTOR ( ID, NUMMER, SPOOR_ID, BESCHIKBAAR, BLOKKADE)
values (17,3,18,1,0);
insert into SECTOR ( ID, NUMMER, SPOOR_ID, BESCHIKBAAR, BLOKKADE)
values (18,4,18,1,0);

-- SECTOR 36(4)
insert into SECTOR ( ID, NUMMER, SPOOR_ID, BESCHIKBAAR, BLOKKADE)
values (19,1,17,1,0);
insert into SECTOR ( ID, NUMMER, SPOOR_ID, BESCHIKBAAR, BLOKKADE)
values (20,2,17,1,0);
insert into SECTOR ( ID, NUMMER, SPOOR_ID, BESCHIKBAAR, BLOKKADE)
values (21,3,17,1,0);
insert into SECTOR ( ID, NUMMER, SPOOR_ID, BESCHIKBAAR, BLOKKADE)
values (22,4,17,1,0);

-- SECTOR 35(4)
insert into SECTOR ( ID, NUMMER, SPOOR_ID, BESCHIKBAAR, BLOKKADE)
values (23,1,16,1,0);
insert into SECTOR ( ID, NUMMER, SPOOR_ID, BESCHIKBAAR, BLOKKADE)
values (24,2,16,1,0);
insert into SECTOR ( ID, NUMMER, SPOOR_ID, BESCHIKBAAR, BLOKKADE)
values (25,3,16,1,0);
insert into SECTOR ( ID, NUMMER, SPOOR_ID, BESCHIKBAAR, BLOKKADE)
values (26,4,16,1,0);

-- SECTOR 34(4)
insert into SECTOR ( ID, NUMMER, SPOOR_ID, BESCHIKBAAR, BLOKKADE)
values (27,1,15,1,0);
insert into SECTOR ( ID, NUMMER, SPOOR_ID, BESCHIKBAAR, BLOKKADE)
values (28,2,15,1,0);
insert into SECTOR ( ID, NUMMER, SPOOR_ID, BESCHIKBAAR, BLOKKADE)
values (29,3,15,1,0);
insert into SECTOR ( ID, NUMMER, SPOOR_ID, BESCHIKBAAR, BLOKKADE)
values (30,4,15,1,0);

-- SECTOR 33(4)
insert into SECTOR ( ID, NUMMER, SPOOR_ID, BESCHIKBAAR, BLOKKADE)
values (31,1,14,1,0);
insert into SECTOR ( ID, NUMMER, SPOOR_ID, BESCHIKBAAR, BLOKKADE)
values (32,2,14,1,0);
insert into SECTOR ( ID, NUMMER, SPOOR_ID, BESCHIKBAAR, BLOKKADE)
values (33,3,14,1,0);
insert into SECTOR ( ID, NUMMER, SPOOR_ID, BESCHIKBAAR, BLOKKADE)
values (34,4,14,1,0);

-- SECTOR 32(4)
insert into SECTOR ( ID, NUMMER, SPOOR_ID, BESCHIKBAAR, BLOKKADE)
values (35,1,13,1,0);
insert into SECTOR ( ID, NUMMER, SPOOR_ID, BESCHIKBAAR, BLOKKADE)
values (36,2,13,1,0);
insert into SECTOR ( ID, NUMMER, SPOOR_ID, BESCHIKBAAR, BLOKKADE)
values (37,3,13,1,0);
insert into SECTOR ( ID, NUMMER, SPOOR_ID, BESCHIKBAAR, BLOKKADE)
values (38,4,13,1,0);

-- SECTOR 31(3)
insert into SECTOR ( ID, NUMMER, SPOOR_ID, BESCHIKBAAR, BLOKKADE)
values (39,1,12,1,0);
insert into SECTOR ( ID, NUMMER, SPOOR_ID, BESCHIKBAAR, BLOKKADE)
values (40,2,12,1,0);
insert into SECTOR ( ID, NUMMER, SPOOR_ID, BESCHIKBAAR, BLOKKADE)
values (41,3,12,1,0);

-- SECTOR 30(3)
insert into SECTOR ( ID, NUMMER, SPOOR_ID, BESCHIKBAAR, BLOKKADE)
values (42,1,11,1,0);
insert into SECTOR ( ID, NUMMER, SPOOR_ID, BESCHIKBAAR, BLOKKADE)
values (43,2,11,1,0);
insert into SECTOR ( ID, NUMMER, SPOOR_ID, BESCHIKBAAR, BLOKKADE)
values (44,3,11,1,0);

-- SECTOR 40(8)
insert into SECTOR ( ID, NUMMER, SPOOR_ID, BESCHIKBAAR, BLOKKADE)
values (45,1,20,2,0);
insert into SECTOR ( ID, NUMMER, SPOOR_ID, BESCHIKBAAR, BLOKKADE)
values (46,2,20,2,0);
insert into SECTOR ( ID, NUMMER, SPOOR_ID, BESCHIKBAAR, BLOKKADE)
values (47,3,20,2,0);
insert into SECTOR ( ID, NUMMER, SPOOR_ID, BESCHIKBAAR, BLOKKADE)
values (48,4,20,2,0);
insert into SECTOR ( ID, NUMMER, SPOOR_ID, BESCHIKBAAR, BLOKKADE)
values (49,5,20,2,0);
insert into SECTOR ( ID, NUMMER, SPOOR_ID, BESCHIKBAAR, BLOKKADE)
values (50,6,20,2,0);
insert into SECTOR ( ID, NUMMER, SPOOR_ID, BESCHIKBAAR, BLOKKADE)
values (51,7,20,2,0);
insert into SECTOR ( ID, NUMMER, SPOOR_ID, BESCHIKBAAR, BLOKKADE)
values (52,8,20,2,0);

-- SECTOR 41(4)
insert into SECTOR ( ID, NUMMER, SPOOR_ID, BESCHIKBAAR, BLOKKADE)
values (53,1,21,1,0);
insert into SECTOR ( ID, NUMMER, SPOOR_ID, BESCHIKBAAR, BLOKKADE)
values (54,2,21,1,0);
insert into SECTOR ( ID, NUMMER, SPOOR_ID, BESCHIKBAAR, BLOKKADE)
values (55,3,21,1,0);
insert into SECTOR ( ID, NUMMER, SPOOR_ID, BESCHIKBAAR, BLOKKADE)
values (56,4,21,1,0);

-- SECTOR 42(4)
insert into SECTOR ( ID, NUMMER, SPOOR_ID, BESCHIKBAAR, BLOKKADE)
values (57,1,22,1,0);
insert into SECTOR ( ID, NUMMER, SPOOR_ID, BESCHIKBAAR, BLOKKADE)
values (58,2,22,1,0);
insert into SECTOR ( ID, NUMMER, SPOOR_ID, BESCHIKBAAR, BLOKKADE)
values (59,3,22,1,0);
insert into SECTOR ( ID, NUMMER, SPOOR_ID, BESCHIKBAAR, BLOKKADE)
values (60,4,22,1,0);

-- SECTOR 43(4)
insert into SECTOR ( ID, NUMMER, SPOOR_ID, BESCHIKBAAR, BLOKKADE)
values (61,1,23,1,0);
insert into SECTOR ( ID, NUMMER, SPOOR_ID, BESCHIKBAAR, BLOKKADE)
values (62,2,23,1,0);
insert into SECTOR ( ID, NUMMER, SPOOR_ID, BESCHIKBAAR, BLOKKADE)
values (63,3,23,1,0);
insert into SECTOR ( ID, NUMMER, SPOOR_ID, BESCHIKBAAR, BLOKKADE)
values (64,4,23,1,0);

-- SECTOR 44(4)
insert into SECTOR ( ID, NUMMER, SPOOR_ID, BESCHIKBAAR, BLOKKADE)
values (65,1,24,1,0);
insert into SECTOR ( ID, NUMMER, SPOOR_ID, BESCHIKBAAR, BLOKKADE)
values (66,2,24,1,0);
insert into SECTOR ( ID, NUMMER, SPOOR_ID, BESCHIKBAAR, BLOKKADE)
values (67,3,24,1,0);
insert into SECTOR ( ID, NUMMER, SPOOR_ID, BESCHIKBAAR, BLOKKADE)
values (68,4,24,1,0);

-- SECTOR 45(9)
insert into SECTOR ( ID, NUMMER, SPOOR_ID, BESCHIKBAAR, BLOKKADE)
values (69,1,25,1,0);
insert into SECTOR ( ID, NUMMER, SPOOR_ID, BESCHIKBAAR, BLOKKADE)
values (70,2,25,1,0);
insert into SECTOR ( ID, NUMMER, SPOOR_ID, BESCHIKBAAR, BLOKKADE)
values (71,3,25,1,0);
insert into SECTOR ( ID, NUMMER, SPOOR_ID, BESCHIKBAAR, BLOKKADE)
values (72,4,25,1,0);
insert into SECTOR ( ID, NUMMER, SPOOR_ID, BESCHIKBAAR, BLOKKADE)
values (73,5,25,1,0);
insert into SECTOR ( ID, NUMMER, SPOOR_ID, BESCHIKBAAR, BLOKKADE)
values (74,6,25,1,0);
insert into SECTOR ( ID, NUMMER, SPOOR_ID, BESCHIKBAAR, BLOKKADE)
values (75,7,25,1,0);
insert into SECTOR ( ID, NUMMER, SPOOR_ID, BESCHIKBAAR, BLOKKADE)
values (76,8,25,1,0);
insert into SECTOR ( ID, NUMMER, SPOOR_ID, BESCHIKBAAR, BLOKKADE)
values (77,9,25,1,0);


-- SECTOR 51(6)
insert into SECTOR ( ID, NUMMER, SPOOR_ID, BESCHIKBAAR, BLOKKADE)
values (78,1,27,1,0);
insert into SECTOR ( ID, NUMMER, SPOOR_ID, BESCHIKBAAR, BLOKKADE)
values (79,2,27,1,0);
insert into SECTOR ( ID, NUMMER, SPOOR_ID, BESCHIKBAAR, BLOKKADE)
values (80,3,27,1,0);
insert into SECTOR ( ID, NUMMER, SPOOR_ID, BESCHIKBAAR, BLOKKADE)
values (81,4,27,1,0);
insert into SECTOR ( ID, NUMMER, SPOOR_ID, BESCHIKBAAR, BLOKKADE)
values (82,5,27,1,0);

-- SECTOR 52(7)
insert into SECTOR ( ID, NUMMER, SPOOR_ID, BESCHIKBAAR, BLOKKADE)
values (84,1,28,1,0);
insert into SECTOR ( ID, NUMMER, SPOOR_ID, BESCHIKBAAR, BLOKKADE)
values (85,2,28,1,0);
insert into SECTOR ( ID, NUMMER, SPOOR_ID, BESCHIKBAAR, BLOKKADE)
values (86,3,28,1,0);
insert into SECTOR ( ID, NUMMER, SPOOR_ID, BESCHIKBAAR, BLOKKADE)
values (87,4,28,1,0);
insert into SECTOR ( ID, NUMMER, SPOOR_ID, BESCHIKBAAR, BLOKKADE)
values (88,5,28,1,0);
insert into SECTOR ( ID, NUMMER, SPOOR_ID, BESCHIKBAAR, BLOKKADE)
values (89,6,28,1,0);


-- SECTOR 53(7)
insert into SECTOR ( ID, NUMMER, SPOOR_ID, BESCHIKBAAR, BLOKKADE)
values (91,1,29,1,0);
insert into SECTOR ( ID, NUMMER, SPOOR_ID, BESCHIKBAAR, BLOKKADE)
values (92,2,29,1,0);
insert into SECTOR ( ID, NUMMER, SPOOR_ID, BESCHIKBAAR, BLOKKADE)
values (93,3,29,1,0);
insert into SECTOR ( ID, NUMMER, SPOOR_ID, BESCHIKBAAR, BLOKKADE)
values (94,4,29,1,0);
insert into SECTOR ( ID, NUMMER, SPOOR_ID, BESCHIKBAAR, BLOKKADE)
values (95,5,29,1,0);
insert into SECTOR ( ID, NUMMER, SPOOR_ID, BESCHIKBAAR, BLOKKADE)
values (96,6,29,1,0);


-- SECTOR 54(7)
insert into SECTOR ( ID, NUMMER, SPOOR_ID, BESCHIKBAAR, BLOKKADE)
values (98,1,30,1,0);
insert into SECTOR ( ID, NUMMER, SPOOR_ID, BESCHIKBAAR, BLOKKADE)
values (99,2,30,1,0);
insert into SECTOR ( ID, NUMMER, SPOOR_ID, BESCHIKBAAR, BLOKKADE)
values (100,3,30,1,0);
insert into SECTOR ( ID, NUMMER, SPOOR_ID, BESCHIKBAAR, BLOKKADE)
values (101,4,30,1,0);
insert into SECTOR ( ID, NUMMER, SPOOR_ID, BESCHIKBAAR, BLOKKADE)
values (102,5,30,1,0);
insert into SECTOR ( ID, NUMMER, SPOOR_ID, BESCHIKBAAR, BLOKKADE)
values (103,6,30,1,0);
insert into SECTOR ( ID, NUMMER, SPOOR_ID, BESCHIKBAAR, BLOKKADE)
values (104,7,30,1,0);


-- SECTOR 55(8)
insert into SECTOR ( ID, NUMMER, SPOOR_ID, BESCHIKBAAR, BLOKKADE)
values (105,1,31,1,0);
insert into SECTOR ( ID, NUMMER, SPOOR_ID, BESCHIKBAAR, BLOKKADE)
values (106,2,31,1,0);
insert into SECTOR ( ID, NUMMER, SPOOR_ID, BESCHIKBAAR, BLOKKADE)
values (107,3,31,1,0);
insert into SECTOR ( ID, NUMMER, SPOOR_ID, BESCHIKBAAR, BLOKKADE)
values (108,4,31,1,0);
insert into SECTOR ( ID, NUMMER, SPOOR_ID, BESCHIKBAAR, BLOKKADE)
values (109,5,31,1,0);
insert into SECTOR ( ID, NUMMER, SPOOR_ID, BESCHIKBAAR, BLOKKADE)
values (110,6,31,1,0);
insert into SECTOR ( ID, NUMMER, SPOOR_ID, BESCHIKBAAR, BLOKKADE)
values (111,7,31,1,0);


-- SECTOR 56(8)
insert into SECTOR ( ID, NUMMER, SPOOR_ID, BESCHIKBAAR, BLOKKADE)
values (113,1,32,1,0);
insert into SECTOR ( ID, NUMMER, SPOOR_ID, BESCHIKBAAR, BLOKKADE)
values (114,2,32,1,0);
insert into SECTOR ( ID, NUMMER, SPOOR_ID, BESCHIKBAAR, BLOKKADE)
values (115,3,32,1,0);
insert into SECTOR ( ID, NUMMER, SPOOR_ID, BESCHIKBAAR, BLOKKADE)
values (116,4,32,1,0);
insert into SECTOR ( ID, NUMMER, SPOOR_ID, BESCHIKBAAR, BLOKKADE)
values (117,5,32,1,0);
insert into SECTOR ( ID, NUMMER, SPOOR_ID, BESCHIKBAAR, BLOKKADE)
values (118,6,32,1,0);
insert into SECTOR ( ID, NUMMER, SPOOR_ID, BESCHIKBAAR, BLOKKADE)
values (119,7,32,1,0);

-- SECTOR 57(8)
insert into SECTOR ( ID, NUMMER, SPOOR_ID, BESCHIKBAAR, BLOKKADE)
values (121,1,33,1,0);
insert into SECTOR ( ID, NUMMER, SPOOR_ID, BESCHIKBAAR, BLOKKADE)
values (122,2,33,1,0);
insert into SECTOR ( ID, NUMMER, SPOOR_ID, BESCHIKBAAR, BLOKKADE)
values (123,3,33,1,0);
insert into SECTOR ( ID, NUMMER, SPOOR_ID, BESCHIKBAAR, BLOKKADE)
values (124,4,33,1,0);
insert into SECTOR ( ID, NUMMER, SPOOR_ID, BESCHIKBAAR, BLOKKADE)
values (125,5,33,1,0);
insert into SECTOR ( ID, NUMMER, SPOOR_ID, BESCHIKBAAR, BLOKKADE)
values (126,6,33,1,0);
insert into SECTOR ( ID, NUMMER, SPOOR_ID, BESCHIKBAAR, BLOKKADE)
values (127,7,33,1,0);
insert into SECTOR ( ID, NUMMER, SPOOR_ID, BESCHIKBAAR, BLOKKADE)
values (128,8,33,1,0);


-- SECTOR 58(6)
insert into SECTOR ( ID, NUMMER, SPOOR_ID, BESCHIKBAAR, BLOKKADE)
values (129,1,34,2,0);
insert into SECTOR ( ID, NUMMER, SPOOR_ID, BESCHIKBAAR, BLOKKADE)
values (130,2,34,2,0);
insert into SECTOR ( ID, NUMMER, SPOOR_ID, BESCHIKBAAR, BLOKKADE)
values (131,3,34,2,0);
insert into SECTOR ( ID, NUMMER, SPOOR_ID, BESCHIKBAAR, BLOKKADE)
values (132,4,34,2,0);
insert into SECTOR ( ID, NUMMER, SPOOR_ID, BESCHIKBAAR, BLOKKADE)
values (133,5,34,2,0);
insert into SECTOR ( ID, NUMMER, SPOOR_ID, BESCHIKBAAR, BLOKKADE)
values (134,6,34,2,0);


-- SECTOR 61(3)
insert into SECTOR ( ID, NUMMER, SPOOR_ID, BESCHIKBAAR, BLOKKADE)
values (135,1,36,1,0);
insert into SECTOR ( ID, NUMMER, SPOOR_ID, BESCHIKBAAR, BLOKKADE)
values (136,2,36,1,0);
insert into SECTOR ( ID, NUMMER, SPOOR_ID, BESCHIKBAAR, BLOKKADE)
values (137,3,36,1,0);


-- SECTOR 62(3)
insert into SECTOR ( ID, NUMMER, SPOOR_ID, BESCHIKBAAR, BLOKKADE)
values (138,1,37,1,0);
insert into SECTOR ( ID, NUMMER, SPOOR_ID, BESCHIKBAAR, BLOKKADE)
values (139,2,37,1,0);
insert into SECTOR ( ID, NUMMER, SPOOR_ID, BESCHIKBAAR, BLOKKADE)
values (140,3,37,1,0);


-- SECTOR 63(4)
insert into SECTOR ( ID, NUMMER, SPOOR_ID, BESCHIKBAAR, BLOKKADE)
values (141,1,38,1,0);
insert into SECTOR ( ID, NUMMER, SPOOR_ID, BESCHIKBAAR, BLOKKADE)
values (142,2,38,1,0);
insert into SECTOR ( ID, NUMMER, SPOOR_ID, BESCHIKBAAR, BLOKKADE)
values (143,3,38,1,0);
insert into SECTOR ( ID, NUMMER, SPOOR_ID, BESCHIKBAAR, BLOKKADE)
values (144,4,38,1,0);


-- SECTOR 64(5)
insert into SECTOR ( ID, NUMMER, SPOOR_ID, BESCHIKBAAR, BLOKKADE)
values (145,1,39,1,0);
insert into SECTOR ( ID, NUMMER, SPOOR_ID, BESCHIKBAAR, BLOKKADE)
values (146,2,39,1,0);
insert into SECTOR ( ID, NUMMER, SPOOR_ID, BESCHIKBAAR, BLOKKADE)
values (147,3,39,1,0);
insert into SECTOR ( ID, NUMMER, SPOOR_ID, BESCHIKBAAR, BLOKKADE)
values (148,4,39,1,0);
insert into SECTOR ( ID, NUMMER, SPOOR_ID, BESCHIKBAAR, BLOKKADE)
values (149,5,39,1,0);


-- SECTOR 74(5)
insert into SECTOR ( ID, NUMMER, SPOOR_ID, BESCHIKBAAR, BLOKKADE)
values (150,1,40,1,0);
insert into SECTOR ( ID, NUMMER, SPOOR_ID, BESCHIKBAAR, BLOKKADE)
values (151,2,40,1,0);
insert into SECTOR ( ID, NUMMER, SPOOR_ID, BESCHIKBAAR, BLOKKADE)
values (152,3,40,1,0);
insert into SECTOR ( ID, NUMMER, SPOOR_ID, BESCHIKBAAR, BLOKKADE)
values (153,4,40,1,0);
insert into SECTOR ( ID, NUMMER, SPOOR_ID, BESCHIKBAAR, BLOKKADE)
values (154,5,40,1,0);

-- SECTOR 75(4)
insert into SECTOR ( ID, NUMMER, SPOOR_ID, BESCHIKBAAR, BLOKKADE)
values (155,1,41,1,0);
insert into SECTOR ( ID, NUMMER, SPOOR_ID, BESCHIKBAAR, BLOKKADE)
values (156,2,41,1,0);
insert into SECTOR ( ID, NUMMER, SPOOR_ID, BESCHIKBAAR, BLOKKADE)
values (157,3,41,1,0);
insert into SECTOR ( ID, NUMMER, SPOOR_ID, BESCHIKBAAR, BLOKKADE)
values (158,4,41,1,0);


-- SECTOR 76(5)
insert into SECTOR ( ID, NUMMER, SPOOR_ID, BESCHIKBAAR, BLOKKADE)
values (159,1,42,1,0);
insert into SECTOR ( ID, NUMMER, SPOOR_ID, BESCHIKBAAR, BLOKKADE)
values (160,2,42,1,0);
insert into SECTOR ( ID, NUMMER, SPOOR_ID, BESCHIKBAAR, BLOKKADE)
values (161,3,42,1,0);
insert into SECTOR ( ID, NUMMER, SPOOR_ID, BESCHIKBAAR, BLOKKADE)
values (162,4,42,1,0);
insert into SECTOR ( ID, NUMMER, SPOOR_ID, BESCHIKBAAR, BLOKKADE)
values (163,5,42,1,0);


-- SECTOR 77(5)
insert into SECTOR ( ID, NUMMER, SPOOR_ID, BESCHIKBAAR, BLOKKADE)
values (164,1,43,1,0);
insert into SECTOR ( ID, NUMMER, SPOOR_ID, BESCHIKBAAR, BLOKKADE)
values (165,2,43,1,0);
insert into SECTOR ( ID, NUMMER, SPOOR_ID, BESCHIKBAAR, BLOKKADE)
values (166,3,43,1,0);
insert into SECTOR ( ID, NUMMER, SPOOR_ID, BESCHIKBAAR, BLOKKADE)
values (167,4,43,1,0);
insert into SECTOR ( ID, NUMMER, SPOOR_ID, BESCHIKBAAR, BLOKKADE)
values (168,5,43,1,0);

REM INSERTING into SPOOR
SET DEFINE OFF;
Insert into SPOOR (ID,Remise_ID,Nummer,Lengte,Beschikbaar,InUitRijspoor) values (1,1,12,0,0,0);
Insert into SPOOR (ID,Remise_ID,Nummer,Lengte,Beschikbaar,InUitRijspoor) values (2,1,13,0,0,0);
Insert into SPOOR (ID,Remise_ID,Nummer,Lengte,Beschikbaar,InUitRijspoor) values (3,1,14,0,0,0);
Insert into SPOOR (ID,Remise_ID,Nummer,Lengte,Beschikbaar,InUitRijspoor) values (4,1,15,0,0,0);
Insert into SPOOR (ID,Remise_ID,Nummer,Lengte,Beschikbaar,InUitRijspoor) values (5,1,16,0,0,0);
Insert into SPOOR (ID,Remise_ID,Nummer,Lengte,Beschikbaar,InUitRijspoor) values (6,1,17,0,0,0);
Insert into SPOOR (ID,Remise_ID,Nummer,Lengte,Beschikbaar,InUitRijspoor) values (7,1,18,0,0,0);
Insert into SPOOR (ID,Remise_ID,Nummer,Lengte,Beschikbaar,InUitRijspoor) values (8,1,19,0,0,0);
Insert into SPOOR (ID,Remise_ID,Nummer,Lengte,Beschikbaar,InUitRijspoor) values (9,1,20,0,0,0);
Insert into SPOOR (ID,Remise_ID,Nummer,Lengte,Beschikbaar,InUitRijspoor) values (10,1,21,0,0,0);
Insert into SPOOR (ID,Remise_ID,Nummer,Lengte,Beschikbaar,InUitRijspoor) values (11,1,30,0,0,0);
Insert into SPOOR (ID,Remise_ID,Nummer,Lengte,Beschikbaar,InUitRijspoor) values (12,1,31,0,0,0);
Insert into SPOOR (ID,Remise_ID,Nummer,Lengte,Beschikbaar,InUitRijspoor) values (13,1,32,0,0,0);
Insert into SPOOR (ID,Remise_ID,Nummer,Lengte,Beschikbaar,InUitRijspoor) values (14,1,33,0,0,0);
Insert into SPOOR (ID,Remise_ID,Nummer,Lengte,Beschikbaar,InUitRijspoor) values (15,1,34,0,0,0);
Insert into SPOOR (ID,Remise_ID,Nummer,Lengte,Beschikbaar,InUitRijspoor) values (16,1,35,0,0,0);
Insert into SPOOR (ID,Remise_ID,Nummer,Lengte,Beschikbaar,InUitRijspoor) values (17,1,36,0,0,0);
Insert into SPOOR (ID,Remise_ID,Nummer,Lengte,Beschikbaar,InUitRijspoor) values (18,1,37,0,0,0);
Insert into SPOOR (ID,Remise_ID,Nummer,Lengte,Beschikbaar,InUitRijspoor) values (19,1,38,0,0,0);
Insert into SPOOR (ID,Remise_ID,Nummer,Lengte,Beschikbaar,InUitRijspoor) values (20,1,40,0,0,1);
Insert into SPOOR (ID,Remise_ID,Nummer,Lengte,Beschikbaar,InUitRijspoor) values (21,1,41,0,0,0);
Insert into SPOOR (ID,Remise_ID,Nummer,Lengte,Beschikbaar,InUitRijspoor) values (22,1,42,0,0,0);
Insert into SPOOR (ID,Remise_ID,Nummer,Lengte,Beschikbaar,InUitRijspoor) values (23,1,43,0,0,0);
Insert into SPOOR (ID,Remise_ID,Nummer,Lengte,Beschikbaar,InUitRijspoor) values (24,1,44,0,0,0);
Insert into SPOOR (ID,Remise_ID,Nummer,Lengte,Beschikbaar,InUitRijspoor) values (25,1,45,0,0,0);
Insert into SPOOR (ID,Remise_ID,Nummer,Lengte,Beschikbaar,InUitRijspoor) values (27,1,51,0,0,0);
Insert into SPOOR (ID,Remise_ID,Nummer,Lengte,Beschikbaar,InUitRijspoor) values (28,1,52,0,0,0);
Insert into SPOOR (ID,Remise_ID,Nummer,Lengte,Beschikbaar,InUitRijspoor) values (29,1,53,0,0,0);
Insert into SPOOR (ID,Remise_ID,Nummer,Lengte,Beschikbaar,InUitRijspoor) values (30,1,54,0,0,0);
Insert into SPOOR (ID,Remise_ID,Nummer,Lengte,Beschikbaar,InUitRijspoor) values (31,1,55,0,0,0);
Insert into SPOOR (ID,Remise_ID,Nummer,Lengte,Beschikbaar,InUitRijspoor) values (32,1,56,0,0,0);
Insert into SPOOR (ID,Remise_ID,Nummer,Lengte,Beschikbaar,InUitRijspoor) values (33,1,57,0,0,0);
Insert into SPOOR (ID,Remise_ID,Nummer,Lengte,Beschikbaar,InUitRijspoor) values (34,1,58,0,0,1);
Insert into SPOOR (ID,Remise_ID,Nummer,Lengte,Beschikbaar,InUitRijspoor) values (36,1,61,0,0,0);
Insert into SPOOR (ID,Remise_ID,Nummer,Lengte,Beschikbaar,InUitRijspoor) values (37,1,62,0,0,0);
Insert into SPOOR (ID,Remise_ID,Nummer,Lengte,Beschikbaar,InUitRijspoor) values (38,1,63,0,0,0);
Insert into SPOOR (ID,Remise_ID,Nummer,Lengte,Beschikbaar,InUitRijspoor) values (39,1,64,0,0,0);
Insert into SPOOR (ID,Remise_ID,Nummer,Lengte,Beschikbaar,InUitRijspoor) values (40,1,74,0,0,0);
Insert into SPOOR (ID,Remise_ID,Nummer,Lengte,Beschikbaar,InUitRijspoor) values (41,1,75,0,0,0);
Insert into SPOOR (ID,Remise_ID,Nummer,Lengte,Beschikbaar,InUitRijspoor) values (42,1,76,0,0,0);
Insert into SPOOR (ID,Remise_ID,Nummer,Lengte,Beschikbaar,InUitRijspoor) values (43,1,77,0,0,0);
REM INSERTING into TRAM
SET DEFINE OFF;
Insert into TRAM (ID,Remise_ID_Standplaats,Tramtype_ID,Nummer,Lengte,Status,Vervuild,Defect,ConducteurGeschikt,Beschikbaar) values (1,1,1,2001, 1,'Dienst',0,0,1,0);
Insert into TRAM (ID,Remise_ID_Standplaats,Tramtype_ID,Nummer,Lengte,Status,Vervuild,Defect,ConducteurGeschikt,Beschikbaar) values (2,1,1,2002, 1,'Dienst',0,0,1,0);
Insert into TRAM (ID,Remise_ID_Standplaats,Tramtype_ID,Nummer,Lengte,Status,Vervuild,Defect,ConducteurGeschikt,Beschikbaar) values (3,1,1,2003, 1,'Dienst',0,0,1,0);
Insert into TRAM (ID,Remise_ID_Standplaats,Tramtype_ID,Nummer,Lengte,Status,Vervuild,Defect,ConducteurGeschikt,Beschikbaar) values (4,1,1,2004, 1,'Dienst',0,0,1,0);
Insert into TRAM (ID,Remise_ID_Standplaats,Tramtype_ID,Nummer,Lengte,Status,Vervuild,Defect,ConducteurGeschikt,Beschikbaar) values (5,1,1,2005, 1,'Dienst',0,0,1,0);
Insert into TRAM (ID,Remise_ID_Standplaats,Tramtype_ID,Nummer,Lengte,Status,Vervuild,Defect,ConducteurGeschikt,Beschikbaar) values (6,1,1,2006, 1,'Dienst',0,0,1,0);
Insert into TRAM (ID,Remise_ID_Standplaats,Tramtype_ID,Nummer,Lengte,Status,Vervuild,Defect,ConducteurGeschikt,Beschikbaar) values (7,1,1,2007, 1,'Dienst',0,0,1,0);
Insert into TRAM (ID,Remise_ID_Standplaats,Tramtype_ID,Nummer,Lengte,Status,Vervuild,Defect,ConducteurGeschikt,Beschikbaar) values (8,1,1,2008, 1,'Dienst',0,0,1,0);
Insert into TRAM (ID,Remise_ID_Standplaats,Tramtype_ID,Nummer,Lengte,Status,Vervuild,Defect,ConducteurGeschikt,Beschikbaar) values (9,1,1,2009, 1,'Dienst',0,0,1,0);
Insert into TRAM (ID,Remise_ID_Standplaats,Tramtype_ID,Nummer,Lengte,Status,Vervuild,Defect,ConducteurGeschikt,Beschikbaar) values (10,1,1,2010, 1,'Dienst',0,0,1,0);
Insert into TRAM (ID,Remise_ID_Standplaats,Tramtype_ID,Nummer,Lengte,Status,Vervuild,Defect,ConducteurGeschikt,Beschikbaar) values (11,1,1,2011, 1,'Dienst',0,0,1,0);
Insert into TRAM (ID,Remise_ID_Standplaats,Tramtype_ID,Nummer,Lengte,Status,Vervuild,Defect,ConducteurGeschikt,Beschikbaar) values (12,1,1,2012, 1,'Dienst',0,0,1,0);
Insert into TRAM (ID,Remise_ID_Standplaats,Tramtype_ID,Nummer,Lengte,Status,Vervuild,Defect,ConducteurGeschikt,Beschikbaar) values (13,1,1,2013, 1,'Dienst',0,0,1,0);
Insert into TRAM (ID,Remise_ID_Standplaats,Tramtype_ID,Nummer,Lengte,Status,Vervuild,Defect,ConducteurGeschikt,Beschikbaar) values (14,1,1,2014, 1,'Dienst',0,0,1,0);
Insert into TRAM (ID,Remise_ID_Standplaats,Tramtype_ID,Nummer,Lengte,Status,Vervuild,Defect,ConducteurGeschikt,Beschikbaar) values (15,1,1,2015, 1,'Dienst',0,0,1,0);
Insert into TRAM (ID,Remise_ID_Standplaats,Tramtype_ID,Nummer,Lengte,Status,Vervuild,Defect,ConducteurGeschikt,Beschikbaar) values (16,1,1,2016, 1,'Dienst',0,0,1,0);
Insert into TRAM (ID,Remise_ID_Standplaats,Tramtype_ID,Nummer,Lengte,Status,Vervuild,Defect,ConducteurGeschikt,Beschikbaar) values (17,1,1,2017, 1,'Dienst',0,0,1,0);
Insert into TRAM (ID,Remise_ID_Standplaats,Tramtype_ID,Nummer,Lengte,Status,Vervuild,Defect,ConducteurGeschikt,Beschikbaar) values (18,1,1,2018, 1,'Dienst',0,0,1,0);
Insert into TRAM (ID,Remise_ID_Standplaats,Tramtype_ID,Nummer,Lengte,Status,Vervuild,Defect,ConducteurGeschikt,Beschikbaar) values (19,1,1,2019, 1,'Dienst',0,0,1,0);
Insert into TRAM (ID,Remise_ID_Standplaats,Tramtype_ID,Nummer,Lengte,Status,Vervuild,Defect,ConducteurGeschikt,Beschikbaar) values (20,1,1,2020, 1,'Dienst',0,0,1,0);
Insert into TRAM (ID,Remise_ID_Standplaats,Tramtype_ID,Nummer,Lengte,Status,Vervuild,Defect,ConducteurGeschikt,Beschikbaar) values (21,1,1,2021, 1,'Dienst',0,0,1,0);
Insert into TRAM (ID,Remise_ID_Standplaats,Tramtype_ID,Nummer,Lengte,Status,Vervuild,Defect,ConducteurGeschikt,Beschikbaar) values (22,1,1,2022, 1,'Dienst',0,0,1,0);
Insert into TRAM (ID,Remise_ID_Standplaats,Tramtype_ID,Nummer,Lengte,Status,Vervuild,Defect,ConducteurGeschikt,Beschikbaar) values (23,1,1,2023, 1,'Dienst',0,0,1,0);
Insert into TRAM (ID,Remise_ID_Standplaats,Tramtype_ID,Nummer,Lengte,Status,Vervuild,Defect,ConducteurGeschikt,Beschikbaar) values (24,1,1,2024, 1,'Dienst',0,0,1,0);
Insert into TRAM (ID,Remise_ID_Standplaats,Tramtype_ID,Nummer,Lengte,Status,Vervuild,Defect,ConducteurGeschikt,Beschikbaar) values (25,1,1,2025, 1,'Dienst',0,0,1,0);
Insert into TRAM (ID,Remise_ID_Standplaats,Tramtype_ID,Nummer,Lengte,Status,Vervuild,Defect,ConducteurGeschikt,Beschikbaar) values (26,1,1,2026, 1,'Dienst',0,0,1,0);
Insert into TRAM (ID,Remise_ID_Standplaats,Tramtype_ID,Nummer,Lengte,Status,Vervuild,Defect,ConducteurGeschikt,Beschikbaar) values (27,1,1,2027, 1,'Dienst',0,0,1,0);
Insert into TRAM (ID,Remise_ID_Standplaats,Tramtype_ID,Nummer,Lengte,Status,Vervuild,Defect,ConducteurGeschikt,Beschikbaar) values (28,1,1,2028, 1,'Dienst',0,0,1,0);
Insert into TRAM (ID,Remise_ID_Standplaats,Tramtype_ID,Nummer,Lengte,Status,Vervuild,Defect,ConducteurGeschikt,Beschikbaar) values (29,1,1,2029, 1,'Dienst',0,0,1,0);
Insert into TRAM (ID,Remise_ID_Standplaats,Tramtype_ID,Nummer,Lengte,Status,Vervuild,Defect,ConducteurGeschikt,Beschikbaar) values (30,1,1,2030, 1,'Dienst',0,0,1,0);
Insert into TRAM (ID,Remise_ID_Standplaats,Tramtype_ID,Nummer,Lengte,Status,Vervuild,Defect,ConducteurGeschikt,Beschikbaar) values (31,1,1,2031, 1,'Dienst',0,0,1,0);
Insert into TRAM (ID,Remise_ID_Standplaats,Tramtype_ID,Nummer,Lengte,Status,Vervuild,Defect,ConducteurGeschikt,Beschikbaar) values (32,1,1,2032, 1,'Dienst',0,0,1,0);
Insert into TRAM (ID,Remise_ID_Standplaats,Tramtype_ID,Nummer,Lengte,Status,Vervuild,Defect,ConducteurGeschikt,Beschikbaar) values (33,1,1,2033, 1,'Dienst',0,0,1,0);
Insert into TRAM (ID,Remise_ID_Standplaats,Tramtype_ID,Nummer,Lengte,Status,Vervuild,Defect,ConducteurGeschikt,Beschikbaar) values (34,1,1,2034, 1,'Dienst',0,0,1,0);
Insert into TRAM (ID,Remise_ID_Standplaats,Tramtype_ID,Nummer,Lengte,Status,Vervuild,Defect,ConducteurGeschikt,Beschikbaar) values (35,1,1,2035, 1,'Dienst',0,0,1,0);
Insert into TRAM (ID,Remise_ID_Standplaats,Tramtype_ID,Nummer,Lengte,Status,Vervuild,Defect,ConducteurGeschikt,Beschikbaar) values (36,1,1,2036, 1,'Dienst',0,0,1,0);
Insert into TRAM (ID,Remise_ID_Standplaats,Tramtype_ID,Nummer,Lengte,Status,Vervuild,Defect,ConducteurGeschikt,Beschikbaar) values (37,1,1,2037, 1,'Dienst',0,0,1,0);
Insert into TRAM (ID,Remise_ID_Standplaats,Tramtype_ID,Nummer,Lengte,Status,Vervuild,Defect,ConducteurGeschikt,Beschikbaar) values (38,1,1,2038, 1,'Dienst',0,0,1,0);
Insert into TRAM (ID,Remise_ID_Standplaats,Tramtype_ID,Nummer,Lengte,Status,Vervuild,Defect,ConducteurGeschikt,Beschikbaar) values (39,1,1,2039, 1,'Dienst',0,0,1,0);
Insert into TRAM (ID,Remise_ID_Standplaats,Tramtype_ID,Nummer,Lengte,Status,Vervuild,Defect,ConducteurGeschikt,Beschikbaar) values (40,1,1,2040, 1,'Dienst',0,0,1,0);
Insert into TRAM (ID,Remise_ID_Standplaats,Tramtype_ID,Nummer,Lengte,Status,Vervuild,Defect,ConducteurGeschikt,Beschikbaar) values (41,1,1,2041, 1,'Dienst',0,0,1,0);
Insert into TRAM (ID,Remise_ID_Standplaats,Tramtype_ID,Nummer,Lengte,Status,Vervuild,Defect,ConducteurGeschikt,Beschikbaar) values (42,1,1,2042, 1,'Dienst',0,0,1,0);
Insert into TRAM (ID,Remise_ID_Standplaats,Tramtype_ID,Nummer,Lengte,Status,Vervuild,Defect,ConducteurGeschikt,Beschikbaar) values (43,1,1,2043, 1,'Dienst',0,0,1,0);
Insert into TRAM (ID,Remise_ID_Standplaats,Tramtype_ID,Nummer,Lengte,Status,Vervuild,Defect,ConducteurGeschikt,Beschikbaar) values (44,1,1,2044, 1,'Dienst',0,0,1,0);
Insert into TRAM (ID,Remise_ID_Standplaats,Tramtype_ID,Nummer,Lengte,Status,Vervuild,Defect,ConducteurGeschikt,Beschikbaar) values (45,1,1,2045, 1,'Dienst',0,0,1,0);
Insert into TRAM (ID,Remise_ID_Standplaats,Tramtype_ID,Nummer,Lengte,Status,Vervuild,Defect,ConducteurGeschikt,Beschikbaar) values (46,1,1,2046, 1,'Dienst',0,0,1,0);
Insert into TRAM (ID,Remise_ID_Standplaats,Tramtype_ID,Nummer,Lengte,Status,Vervuild,Defect,ConducteurGeschikt,Beschikbaar) values (47,1,1,2047, 1,'Dienst',0,0,1,0);
Insert into TRAM (ID,Remise_ID_Standplaats,Tramtype_ID,Nummer,Lengte,Status,Vervuild,Defect,ConducteurGeschikt,Beschikbaar) values (48,1,1,2048, 1,'Dienst',0,0,1,0);
Insert into TRAM (ID,Remise_ID_Standplaats,Tramtype_ID,Nummer,Lengte,Status,Vervuild,Defect,ConducteurGeschikt,Beschikbaar) values (49,1,1,2049, 1,'Dienst',0,0,1,0);
Insert into TRAM (ID,Remise_ID_Standplaats,Tramtype_ID,Nummer,Lengte,Status,Vervuild,Defect,ConducteurGeschikt,Beschikbaar) values (50,1,1,2050, 1,'Dienst',0,0,1,0);
Insert into TRAM (ID,Remise_ID_Standplaats,Tramtype_ID,Nummer,Lengte,Status,Vervuild,Defect,ConducteurGeschikt,Beschikbaar) values (51,1,1,2051, 1,'Dienst',0,0,1,0);
Insert into TRAM (ID,Remise_ID_Standplaats,Tramtype_ID,Nummer,Lengte,Status,Vervuild,Defect,ConducteurGeschikt,Beschikbaar) values (52,1,1,2052, 1,'Dienst',0,0,1,0);
Insert into TRAM (ID,Remise_ID_Standplaats,Tramtype_ID,Nummer,Lengte,Status,Vervuild,Defect,ConducteurGeschikt,Beschikbaar) values (53,1,1,2053, 1,'Dienst',0,0,1,0);
Insert into TRAM (ID,Remise_ID_Standplaats,Tramtype_ID,Nummer,Lengte,Status,Vervuild,Defect,ConducteurGeschikt,Beschikbaar) values (54,1,1,2054, 1,'Dienst',0,0,1,0);
Insert into TRAM (ID,Remise_ID_Standplaats,Tramtype_ID,Nummer,Lengte,Status,Vervuild,Defect,ConducteurGeschikt,Beschikbaar) values (55,1,1,2055, 1,'Dienst',0,0,1,0);
Insert into TRAM (ID,Remise_ID_Standplaats,Tramtype_ID,Nummer,Lengte,Status,Vervuild,Defect,ConducteurGeschikt,Beschikbaar) values (56,1,1,2056, 1,'Dienst',0,0,1,0);
Insert into TRAM (ID,Remise_ID_Standplaats,Tramtype_ID,Nummer,Lengte,Status,Vervuild,Defect,ConducteurGeschikt,Beschikbaar) values (57,1,1,2057, 1,'Dienst',0,0,1,0);
Insert into TRAM (ID,Remise_ID_Standplaats,Tramtype_ID,Nummer,Lengte,Status,Vervuild,Defect,ConducteurGeschikt,Beschikbaar) values (58,1,1,2058, 1,'Dienst',0,0,1,0);
Insert into TRAM (ID,Remise_ID_Standplaats,Tramtype_ID,Nummer,Lengte,Status,Vervuild,Defect,ConducteurGeschikt,Beschikbaar) values (59,1,1,2059, 1,'Dienst',0,0,1,0);
Insert into TRAM (ID,Remise_ID_Standplaats,Tramtype_ID,Nummer,Lengte,Status,Vervuild,Defect,ConducteurGeschikt,Beschikbaar) values (60,1,1,2060, 1,'Dienst',0,0,1,0);
Insert into TRAM (ID,Remise_ID_Standplaats,Tramtype_ID,Nummer,Lengte,Status,Vervuild,Defect,ConducteurGeschikt,Beschikbaar) values (61,1,1,2061, 1,'Dienst',0,0,1,0);
Insert into TRAM (ID,Remise_ID_Standplaats,Tramtype_ID,Nummer,Lengte,Status,Vervuild,Defect,ConducteurGeschikt,Beschikbaar) values (62,1,1,2062, 1,'Dienst',0,0,1,0);
Insert into TRAM (ID,Remise_ID_Standplaats,Tramtype_ID,Nummer,Lengte,Status,Vervuild,Defect,ConducteurGeschikt,Beschikbaar) values (63,1,1,2063, 1,'Dienst',0,0,1,0);
Insert into TRAM (ID,Remise_ID_Standplaats,Tramtype_ID,Nummer,Lengte,Status,Vervuild,Defect,ConducteurGeschikt,Beschikbaar) values (64,1,1,2064, 1,'Dienst',0,0,1,0);
Insert into TRAM (ID,Remise_ID_Standplaats,Tramtype_ID,Nummer,Lengte,Status,Vervuild,Defect,ConducteurGeschikt,Beschikbaar) values (65,1,1,2065, 1,'Dienst',0,0,1,0);
Insert into TRAM (ID,Remise_ID_Standplaats,Tramtype_ID,Nummer,Lengte,Status,Vervuild,Defect,ConducteurGeschikt,Beschikbaar) values (66,1,1,2066, 1,'Dienst',0,0,1,0);
Insert into TRAM (ID,Remise_ID_Standplaats,Tramtype_ID,Nummer,Lengte,Status,Vervuild,Defect,ConducteurGeschikt,Beschikbaar) values (67,1,1,2067, 1,'Dienst',0,0,1,0);
Insert into TRAM (ID,Remise_ID_Standplaats,Tramtype_ID,Nummer,Lengte,Status,Vervuild,Defect,ConducteurGeschikt,Beschikbaar) values (68,1,1,2068, 1,'Dienst',0,0,1,0);
Insert into TRAM (ID,Remise_ID_Standplaats,Tramtype_ID,Nummer,Lengte,Status,Vervuild,Defect,ConducteurGeschikt,Beschikbaar) values (69,1,1,2069, 1,'Dienst',0,0,1,0);
Insert into TRAM (ID,Remise_ID_Standplaats,Tramtype_ID,Nummer,Lengte,Status,Vervuild,Defect,ConducteurGeschikt,Beschikbaar) values (70,1,1,2070, 1,'Dienst',0,0,1,0);
Insert into TRAM (ID,Remise_ID_Standplaats,Tramtype_ID,Nummer,Lengte,Status,Vervuild,Defect,ConducteurGeschikt,Beschikbaar) values (71,1,1,2071, 1,'Dienst',0,0,1,0);
Insert into TRAM (ID,Remise_ID_Standplaats,Tramtype_ID,Nummer,Lengte,Status,Vervuild,Defect,ConducteurGeschikt,Beschikbaar) values (72,1,1,2072, 1,'Dienst',0,0,1,0);
Insert into TRAM (ID,Remise_ID_Standplaats,Tramtype_ID,Nummer,Lengte,Status,Vervuild,Defect,ConducteurGeschikt,Beschikbaar) values (73,1,2,901, 1,'Dienst',0,0,0,0);
Insert into TRAM (ID,Remise_ID_Standplaats,Tramtype_ID,Nummer,Lengte,Status,Vervuild,Defect,ConducteurGeschikt,Beschikbaar) values (74,1,2,902, 1,'Dienst',0,0,0,0);
Insert into TRAM (ID,Remise_ID_Standplaats,Tramtype_ID,Nummer,Lengte,Status,Vervuild,Defect,ConducteurGeschikt,Beschikbaar) values (75,1,2,903, 1,'Dienst',0,0,0,0);
Insert into TRAM (ID,Remise_ID_Standplaats,Tramtype_ID,Nummer,Lengte,Status,Vervuild,Defect,ConducteurGeschikt,Beschikbaar) values (76,1,2,904, 1,'Dienst',0,0,0,0);
Insert into TRAM (ID,Remise_ID_Standplaats,Tramtype_ID,Nummer,Lengte,Status,Vervuild,Defect,ConducteurGeschikt,Beschikbaar) values (77,1,2,905, 1,'Dienst',0,0,0,0);
Insert into TRAM (ID,Remise_ID_Standplaats,Tramtype_ID,Nummer,Lengte,Status,Vervuild,Defect,ConducteurGeschikt,Beschikbaar) values (78,1,2,906, 1,'Dienst',0,0,0,0);
Insert into TRAM (ID,Remise_ID_Standplaats,Tramtype_ID,Nummer,Lengte,Status,Vervuild,Defect,ConducteurGeschikt,Beschikbaar) values (79,1,2,907, 1,'Dienst',0,0,0,0);
Insert into TRAM (ID,Remise_ID_Standplaats,Tramtype_ID,Nummer,Lengte,Status,Vervuild,Defect,ConducteurGeschikt,Beschikbaar) values (80,1,2,908, 1,'Dienst',0,0,0,0);
Insert into TRAM (ID,Remise_ID_Standplaats,Tramtype_ID,Nummer,Lengte,Status,Vervuild,Defect,ConducteurGeschikt,Beschikbaar) values (81,1,2,909, 1,'Dienst',0,0,0,0);
Insert into TRAM (ID,Remise_ID_Standplaats,Tramtype_ID,Nummer,Lengte,Status,Vervuild,Defect,ConducteurGeschikt,Beschikbaar) values (82,1,2,910, 1,'Dienst',0,0,0,0);
Insert into TRAM (ID,Remise_ID_Standplaats,Tramtype_ID,Nummer,Lengte,Status,Vervuild,Defect,ConducteurGeschikt,Beschikbaar) values (83,1,2,911, 1,'Dienst',0,0,0,0);
Insert into TRAM (ID,Remise_ID_Standplaats,Tramtype_ID,Nummer,Lengte,Status,Vervuild,Defect,ConducteurGeschikt,Beschikbaar) values (84,1,2,912, 1,'Dienst',0,0,0,0);
Insert into TRAM (ID,Remise_ID_Standplaats,Tramtype_ID,Nummer,Lengte,Status,Vervuild,Defect,ConducteurGeschikt,Beschikbaar) values (85,1,2,913, 1,'Dienst',0,0,0,0);
Insert into TRAM (ID,Remise_ID_Standplaats,Tramtype_ID,Nummer,Lengte,Status,Vervuild,Defect,ConducteurGeschikt,Beschikbaar) values (86,1,2,914, 1,'Dienst',0,0,0,0);
Insert into TRAM (ID,Remise_ID_Standplaats,Tramtype_ID,Nummer,Lengte,Status,Vervuild,Defect,ConducteurGeschikt,Beschikbaar) values (87,1,2,915, 1,'Dienst',0,0,0,0);
Insert into TRAM (ID,Remise_ID_Standplaats,Tramtype_ID,Nummer,Lengte,Status,Vervuild,Defect,ConducteurGeschikt,Beschikbaar) values (88,1,2,916, 1,'Dienst',0,0,0,0);
Insert into TRAM (ID,Remise_ID_Standplaats,Tramtype_ID,Nummer,Lengte,Status,Vervuild,Defect,ConducteurGeschikt,Beschikbaar) values (89,1,2,917, 1,'Dienst',0,0,0,0);
Insert into TRAM (ID,Remise_ID_Standplaats,Tramtype_ID,Nummer,Lengte,Status,Vervuild,Defect,ConducteurGeschikt,Beschikbaar) values (90,1,2,918, 1,'Dienst',0,0,0,0);
Insert into TRAM (ID,Remise_ID_Standplaats,Tramtype_ID,Nummer,Lengte,Status,Vervuild,Defect,ConducteurGeschikt,Beschikbaar) values (91,1,2,919, 1,'Dienst',0,0,0,0);
Insert into TRAM (ID,Remise_ID_Standplaats,Tramtype_ID,Nummer,Lengte,Status,Vervuild,Defect,ConducteurGeschikt,Beschikbaar) values (92,1,2,920, 1,'Dienst',0,0,0,0);
Insert into TRAM (ID,Remise_ID_Standplaats,Tramtype_ID,Nummer,Lengte,Status,Vervuild,Defect,ConducteurGeschikt,Beschikbaar) values (93,1,3,2201, 1,'Dienst',0,0,0,0);
Insert into TRAM (ID,Remise_ID_Standplaats,Tramtype_ID,Nummer,Lengte,Status,Vervuild,Defect,ConducteurGeschikt,Beschikbaar) values (94,1,3,2202, 1,'Dienst',0,0,0,0);
Insert into TRAM (ID,Remise_ID_Standplaats,Tramtype_ID,Nummer,Lengte,Status,Vervuild,Defect,ConducteurGeschikt,Beschikbaar) values (95,1,3,2203, 1,'Dienst',0,0,0,0);
Insert into TRAM (ID,Remise_ID_Standplaats,Tramtype_ID,Nummer,Lengte,Status,Vervuild,Defect,ConducteurGeschikt,Beschikbaar) values (96,1,3,2204, 1,'Dienst',0,0,0,0);
Insert into TRAM (ID,Remise_ID_Standplaats,Tramtype_ID,Nummer,Lengte,Status,Vervuild,Defect,ConducteurGeschikt,Beschikbaar) values (97,1,4,817, 1,'Dienst',0,0,0,0);
Insert into TRAM (ID,Remise_ID_Standplaats,Tramtype_ID,Nummer,Lengte,Status,Vervuild,Defect,ConducteurGeschikt,Beschikbaar) values (98,1,4,818, 1,'Dienst',0,0,0,0);
Insert into TRAM (ID,Remise_ID_Standplaats,Tramtype_ID,Nummer,Lengte,Status,Vervuild,Defect,ConducteurGeschikt,Beschikbaar) values (99,1,4,819, 1,'Dienst',0,0,0,0);
Insert into TRAM (ID,Remise_ID_Standplaats,Tramtype_ID,Nummer,Lengte,Status,Vervuild,Defect,ConducteurGeschikt,Beschikbaar) values (100,1,4,820, 1,'Dienst',0,0,0,0);
Insert into TRAM (ID,Remise_ID_Standplaats,Tramtype_ID,Nummer,Lengte,Status,Vervuild,Defect,ConducteurGeschikt,Beschikbaar) values (101,1,4,821, 1,'Dienst',0,0,0,0);
Insert into TRAM (ID,Remise_ID_Standplaats,Tramtype_ID,Nummer,Lengte,Status,Vervuild,Defect,ConducteurGeschikt,Beschikbaar) values (102,1,4,822, 1,'Dienst',0,0,0,0);
Insert into TRAM (ID,Remise_ID_Standplaats,Tramtype_ID,Nummer,Lengte,Status,Vervuild,Defect,ConducteurGeschikt,Beschikbaar) values (103,1,4,823, 1,'Dienst',0,0,0,0);
Insert into TRAM (ID,Remise_ID_Standplaats,Tramtype_ID,Nummer,Lengte,Status,Vervuild,Defect,ConducteurGeschikt,Beschikbaar) values (104,1,4,824, 1,'Dienst',0,0,0,0);
Insert into TRAM (ID,Remise_ID_Standplaats,Tramtype_ID,Nummer,Lengte,Status,Vervuild,Defect,ConducteurGeschikt,Beschikbaar) values (105,1,4,825, 1,'Dienst',0,0,0,0);
Insert into TRAM (ID,Remise_ID_Standplaats,Tramtype_ID,Nummer,Lengte,Status,Vervuild,Defect,ConducteurGeschikt,Beschikbaar) values (106,1,4,826, 1,'Dienst',0,0,0,0);
Insert into TRAM (ID,Remise_ID_Standplaats,Tramtype_ID,Nummer,Lengte,Status,Vervuild,Defect,ConducteurGeschikt,Beschikbaar) values (107,1,4,827, 1,'Dienst',0,0,0,0);
Insert into TRAM (ID,Remise_ID_Standplaats,Tramtype_ID,Nummer,Lengte,Status,Vervuild,Defect,ConducteurGeschikt,Beschikbaar) values (108,1,4,828, 1,'Dienst',0,0,0,0);
Insert into TRAM (ID,Remise_ID_Standplaats,Tramtype_ID,Nummer,Lengte,Status,Vervuild,Defect,ConducteurGeschikt,Beschikbaar) values (109,1,4,829, 1,'Dienst',0,0,0,0);
Insert into TRAM (ID,Remise_ID_Standplaats,Tramtype_ID,Nummer,Lengte,Status,Vervuild,Defect,ConducteurGeschikt,Beschikbaar) values (110,1,4,830, 1,'Dienst',0,0,0,0);
Insert into TRAM (ID,Remise_ID_Standplaats,Tramtype_ID,Nummer,Lengte,Status,Vervuild,Defect,ConducteurGeschikt,Beschikbaar) values (111,1,4,831, 1,'Dienst',0,0,0,0);
Insert into TRAM (ID,Remise_ID_Standplaats,Tramtype_ID,Nummer,Lengte,Status,Vervuild,Defect,ConducteurGeschikt,Beschikbaar) values (112,1,4,832, 1,'Dienst',0,0,0,0);
Insert into TRAM (ID,Remise_ID_Standplaats,Tramtype_ID,Nummer,Lengte,Status,Vervuild,Defect,ConducteurGeschikt,Beschikbaar) values (113,1,4,833, 1,'Dienst',0,0,0,0);
Insert into TRAM (ID,Remise_ID_Standplaats,Tramtype_ID,Nummer,Lengte,Status,Vervuild,Defect,ConducteurGeschikt,Beschikbaar) values (114,1,4,834, 1,'Dienst',0,0,0,0);
Insert into TRAM (ID,Remise_ID_Standplaats,Tramtype_ID,Nummer,Lengte,Status,Vervuild,Defect,ConducteurGeschikt,Beschikbaar) values (115,1,4,835, 1,'Dienst',0,0,0,0);
Insert into TRAM (ID,Remise_ID_Standplaats,Tramtype_ID,Nummer,Lengte,Status,Vervuild,Defect,ConducteurGeschikt,Beschikbaar) values (116,1,4,836, 1,'Dienst',0,0,0,0);
Insert into TRAM (ID,Remise_ID_Standplaats,Tramtype_ID,Nummer,Lengte,Status,Vervuild,Defect,ConducteurGeschikt,Beschikbaar) values (117,1,4,837, 1,'Dienst',0,0,0,0);
Insert into TRAM (ID,Remise_ID_Standplaats,Tramtype_ID,Nummer,Lengte,Status,Vervuild,Defect,ConducteurGeschikt,Beschikbaar) values (118,1,4,838, 1,'Dienst',0,0,0,0);
Insert into TRAM (ID,Remise_ID_Standplaats,Tramtype_ID,Nummer,Lengte,Status,Vervuild,Defect,ConducteurGeschikt,Beschikbaar) values (119,1,4,839, 1,'Dienst',0,0,0,0);
Insert into TRAM (ID,Remise_ID_Standplaats,Tramtype_ID,Nummer,Lengte,Status,Vervuild,Defect,ConducteurGeschikt,Beschikbaar) values (120,1,4,840, 1,'Dienst',0,0,0,0);
Insert into TRAM (ID,Remise_ID_Standplaats,Tramtype_ID,Nummer,Lengte,Status,Vervuild,Defect,ConducteurGeschikt,Beschikbaar) values (121,1,4,841, 1,'Dienst',0,0,0,0);
Insert into TRAM (ID,Remise_ID_Standplaats,Tramtype_ID,Nummer,Lengte,Status,Vervuild,Defect,ConducteurGeschikt,Beschikbaar) values (122,1,5,809, 1,'Dienst',0,0,1,0);
Insert into TRAM (ID,Remise_ID_Standplaats,Tramtype_ID,Nummer,Lengte,Status,Vervuild,Defect,ConducteurGeschikt,Beschikbaar) values (123,1,5,816, 1,'Dienst',0,0,1,0);
Insert into TRAM (ID,Remise_ID_Standplaats,Tramtype_ID,Nummer,Lengte,Status,Vervuild,Defect,ConducteurGeschikt,Beschikbaar) values (124,2,6,780, 1,'Dienst',0,0,1,0);
Insert into TRAM (ID,Remise_ID_Standplaats,Tramtype_ID,Nummer,Lengte,Status,Vervuild,Defect,ConducteurGeschikt,Beschikbaar) values (125,2,6,781, 1,'Dienst',0,0,1,0);
Insert into TRAM (ID,Remise_ID_Standplaats,Tramtype_ID,Nummer,Lengte,Status,Vervuild,Defect,ConducteurGeschikt,Beschikbaar) values (126,2,6,782, 1,'Dienst',0,0,1,0);
Insert into TRAM (ID,Remise_ID_Standplaats,Tramtype_ID,Nummer,Lengte,Status,Vervuild,Defect,ConducteurGeschikt,Beschikbaar) values (127,2,6,784, 1,'Dienst',0,0,1,0);
Insert into TRAM (ID,Remise_ID_Standplaats,Tramtype_ID,Nummer,Lengte,Status,Vervuild,Defect,ConducteurGeschikt,Beschikbaar) values (128,2,6,785, 1,'Dienst',0,0,1,0);
Insert into TRAM (ID,Remise_ID_Standplaats,Tramtype_ID,Nummer,Lengte,Status,Vervuild,Defect,ConducteurGeschikt,Beschikbaar) values (129,2,6,786, 1,'Dienst',0,0,1,0);
Insert into TRAM (ID,Remise_ID_Standplaats,Tramtype_ID,Nummer,Lengte,Status,Vervuild,Defect,ConducteurGeschikt,Beschikbaar) values (130,2,6,787, 1,'Dienst',0,0,1,0);
Insert into TRAM (ID,Remise_ID_Standplaats,Tramtype_ID,Nummer,Lengte,Status,Vervuild,Defect,ConducteurGeschikt,Beschikbaar) values (131,2,6,797, 1,'Dienst',0,0,1,0);
Insert into TRAM (ID,Remise_ID_Standplaats,Tramtype_ID,Nummer,Lengte,Status,Vervuild,Defect,ConducteurGeschikt,Beschikbaar) values (132,2,7,804, 1,'Dienst',0,0,1,0);
Insert into TRAM (ID,Remise_ID_Standplaats,Tramtype_ID,Nummer,Lengte,Status,Vervuild,Defect,ConducteurGeschikt,Beschikbaar) values (133,2,7,810, 1,'Dienst',0,0,1,0);
Insert into TRAM (ID,Remise_ID_Standplaats,Tramtype_ID,Nummer,Lengte,Status,Vervuild,Defect,ConducteurGeschikt,Beschikbaar) values (134,2,7,813, 1,'Dienst',0,0,1,0);
Insert into TRAM (ID,Remise_ID_Standplaats,Tramtype_ID,Nummer,Lengte,Status,Vervuild,Defect,ConducteurGeschikt,Beschikbaar) values (135,2,7,815, 1,'Dienst',0,0,1,0);
Insert into TRAM (ID,Remise_ID_Standplaats,Tramtype_ID,Nummer,Lengte,Status,Vervuild,Defect,ConducteurGeschikt,Beschikbaar) values (136,2,1,2073, 1,'Dienst',0,0,1,0);
Insert into TRAM (ID,Remise_ID_Standplaats,Tramtype_ID,Nummer,Lengte,Status,Vervuild,Defect,ConducteurGeschikt,Beschikbaar) values (137,2,1,2074, 1,'Dienst',0,0,1,0);
Insert into TRAM (ID,Remise_ID_Standplaats,Tramtype_ID,Nummer,Lengte,Status,Vervuild,Defect,ConducteurGeschikt,Beschikbaar) values (138,2,1,2075, 1,'Dienst',0,0,1,0);
Insert into TRAM (ID,Remise_ID_Standplaats,Tramtype_ID,Nummer,Lengte,Status,Vervuild,Defect,ConducteurGeschikt,Beschikbaar) values (139,2,1,2076, 1,'Dienst',0,0,1,0);
Insert into TRAM (ID,Remise_ID_Standplaats,Tramtype_ID,Nummer,Lengte,Status,Vervuild,Defect,ConducteurGeschikt,Beschikbaar) values (140,2,1,2077, 1,'Dienst',0,0,1,0);
Insert into TRAM (ID,Remise_ID_Standplaats,Tramtype_ID,Nummer,Lengte,Status,Vervuild,Defect,ConducteurGeschikt,Beschikbaar) values (141,2,1,2078, 1,'Dienst',0,0,1,0);
Insert into TRAM (ID,Remise_ID_Standplaats,Tramtype_ID,Nummer,Lengte,Status,Vervuild,Defect,ConducteurGeschikt,Beschikbaar) values (142,2,1,2079, 1,'Dienst',0,0,1,0);
Insert into TRAM (ID,Remise_ID_Standplaats,Tramtype_ID,Nummer,Lengte,Status,Vervuild,Defect,ConducteurGeschikt,Beschikbaar) values (143,2,1,2080, 1,'Dienst',0,0,1,0);
Insert into TRAM (ID,Remise_ID_Standplaats,Tramtype_ID,Nummer,Lengte,Status,Vervuild,Defect,ConducteurGeschikt,Beschikbaar) values (144,2,1,2081, 1,'Dienst',0,0,1,0);
Insert into TRAM (ID,Remise_ID_Standplaats,Tramtype_ID,Nummer,Lengte,Status,Vervuild,Defect,ConducteurGeschikt,Beschikbaar) values (145,2,1,2082, 1,'Dienst',0,0,1,0);
Insert into TRAM (ID,Remise_ID_Standplaats,Tramtype_ID,Nummer,Lengte,Status,Vervuild,Defect,ConducteurGeschikt,Beschikbaar) values (146,2,1,2083, 1,'Dienst',0,0,1,0);
Insert into TRAM (ID,Remise_ID_Standplaats,Tramtype_ID,Nummer,Lengte,Status,Vervuild,Defect,ConducteurGeschikt,Beschikbaar) values (147,2,1,2084, 1,'Dienst',0,0,1,0);
Insert into TRAM (ID,Remise_ID_Standplaats,Tramtype_ID,Nummer,Lengte,Status,Vervuild,Defect,ConducteurGeschikt,Beschikbaar) values (148,2,1,2085, 1,'Dienst',0,0,1,0);
Insert into TRAM (ID,Remise_ID_Standplaats,Tramtype_ID,Nummer,Lengte,Status,Vervuild,Defect,ConducteurGeschikt,Beschikbaar) values (149,2,1,2086, 1,'Dienst',0,0,1,0);
Insert into TRAM (ID,Remise_ID_Standplaats,Tramtype_ID,Nummer,Lengte,Status,Vervuild,Defect,ConducteurGeschikt,Beschikbaar) values (150,2,1,2087, 1,'Dienst',0,0,1,0);
Insert into TRAM (ID,Remise_ID_Standplaats,Tramtype_ID,Nummer,Lengte,Status,Vervuild,Defect,ConducteurGeschikt,Beschikbaar) values (151,2,1,2088, 1,'Dienst',0,0,1,0);
Insert into TRAM (ID,Remise_ID_Standplaats,Tramtype_ID,Nummer,Lengte,Status,Vervuild,Defect,ConducteurGeschikt,Beschikbaar) values (152,2,1,2089, 1,'Dienst',0,0,1,0);
Insert into TRAM (ID,Remise_ID_Standplaats,Tramtype_ID,Nummer,Lengte,Status,Vervuild,Defect,ConducteurGeschikt,Beschikbaar) values (153,2,1,2090, 1,'Dienst',0,0,1,0);
Insert into TRAM (ID,Remise_ID_Standplaats,Tramtype_ID,Nummer,Lengte,Status,Vervuild,Defect,ConducteurGeschikt,Beschikbaar) values (154,2,1,2091, 1,'Dienst',0,0,1,0);
Insert into TRAM (ID,Remise_ID_Standplaats,Tramtype_ID,Nummer,Lengte,Status,Vervuild,Defect,ConducteurGeschikt,Beschikbaar) values (155,2,1,2092, 1,'Dienst',0,0,1,0);
Insert into TRAM (ID,Remise_ID_Standplaats,Tramtype_ID,Nummer,Lengte,Status,Vervuild,Defect,ConducteurGeschikt,Beschikbaar) values (156,2,1,2093, 1,'Dienst',0,0,1,0);
Insert into TRAM (ID,Remise_ID_Standplaats,Tramtype_ID,Nummer,Lengte,Status,Vervuild,Defect,ConducteurGeschikt,Beschikbaar) values (157,2,1,2094, 1,'Dienst',0,0,1,0);
Insert into TRAM (ID,Remise_ID_Standplaats,Tramtype_ID,Nummer,Lengte,Status,Vervuild,Defect,ConducteurGeschikt,Beschikbaar) values (158,2,1,2095, 1,'Dienst',0,0,1,0);
Insert into TRAM (ID,Remise_ID_Standplaats,Tramtype_ID,Nummer,Lengte,Status,Vervuild,Defect,ConducteurGeschikt,Beschikbaar) values (159,2,1,2096, 1,'Dienst',0,0,1,0);
Insert into TRAM (ID,Remise_ID_Standplaats,Tramtype_ID,Nummer,Lengte,Status,Vervuild,Defect,ConducteurGeschikt,Beschikbaar) values (160,2,1,2097, 1,'Dienst',0,0,1,0);
Insert into TRAM (ID,Remise_ID_Standplaats,Tramtype_ID,Nummer,Lengte,Status,Vervuild,Defect,ConducteurGeschikt,Beschikbaar) values (161,2,1,2098, 1,'Dienst',0,0,1,0);
Insert into TRAM (ID,Remise_ID_Standplaats,Tramtype_ID,Nummer,Lengte,Status,Vervuild,Defect,ConducteurGeschikt,Beschikbaar) values (162,2,1,2099, 1,'Dienst',0,0,1,0);
Insert into TRAM (ID,Remise_ID_Standplaats,Tramtype_ID,Nummer,Lengte,Status,Vervuild,Defect,ConducteurGeschikt,Beschikbaar) values (163,2,1,2100, 1,'Dienst',0,0,1,0);
Insert into TRAM (ID,Remise_ID_Standplaats,Tramtype_ID,Nummer,Lengte,Status,Vervuild,Defect,ConducteurGeschikt,Beschikbaar) values (164,2,1,2101, 1,'Dienst',0,0,1,0);
Insert into TRAM (ID,Remise_ID_Standplaats,Tramtype_ID,Nummer,Lengte,Status,Vervuild,Defect,ConducteurGeschikt,Beschikbaar) values (165,2,1,2102, 1,'Dienst',0,0,1,0);
Insert into TRAM (ID,Remise_ID_Standplaats,Tramtype_ID,Nummer,Lengte,Status,Vervuild,Defect,ConducteurGeschikt,Beschikbaar) values (166,2,1,2103, 1,'Dienst',0,0,1,0);
Insert into TRAM (ID,Remise_ID_Standplaats,Tramtype_ID,Nummer,Lengte,Status,Vervuild,Defect,ConducteurGeschikt,Beschikbaar) values (167,2,1,2104, 1,'Dienst',0,0,1,0);
Insert into TRAM (ID,Remise_ID_Standplaats,Tramtype_ID,Nummer,Lengte,Status,Vervuild,Defect,ConducteurGeschikt,Beschikbaar) values (168,2,1,2105, 1,'Dienst',0,0,1,0);
Insert into TRAM (ID,Remise_ID_Standplaats,Tramtype_ID,Nummer,Lengte,Status,Vervuild,Defect,ConducteurGeschikt,Beschikbaar) values (169,2,1,2106, 1,'Dienst',0,0,1,0);
Insert into TRAM (ID,Remise_ID_Standplaats,Tramtype_ID,Nummer,Lengte,Status,Vervuild,Defect,ConducteurGeschikt,Beschikbaar) values (170,2,1,2107, 1,'Dienst',0,0,1,0);
Insert into TRAM (ID,Remise_ID_Standplaats,Tramtype_ID,Nummer,Lengte,Status,Vervuild,Defect,ConducteurGeschikt,Beschikbaar) values (171,2,1,2108, 1,'Dienst',0,0,1,0);
Insert into TRAM (ID,Remise_ID_Standplaats,Tramtype_ID,Nummer,Lengte,Status,Vervuild,Defect,ConducteurGeschikt,Beschikbaar) values (172,2,1,2109, 1,'Dienst',0,0,1,0);
Insert into TRAM (ID,Remise_ID_Standplaats,Tramtype_ID,Nummer,Lengte,Status,Vervuild,Defect,ConducteurGeschikt,Beschikbaar) values (173,2,1,2110, 1,'Dienst',0,0,1,0);
Insert into TRAM (ID,Remise_ID_Standplaats,Tramtype_ID,Nummer,Lengte,Status,Vervuild,Defect,ConducteurGeschikt,Beschikbaar) values (174,2,1,2111, 1,'Dienst',0,0,1,0);
Insert into TRAM (ID,Remise_ID_Standplaats,Tramtype_ID,Nummer,Lengte,Status,Vervuild,Defect,ConducteurGeschikt,Beschikbaar) values (175,2,1,2112, 1,'Dienst',0,0,1,0);
Insert into TRAM (ID,Remise_ID_Standplaats,Tramtype_ID,Nummer,Lengte,Status,Vervuild,Defect,ConducteurGeschikt,Beschikbaar) values (176,2,1,2113, 1,'Dienst',0,0,1,0);
Insert into TRAM (ID,Remise_ID_Standplaats,Tramtype_ID,Nummer,Lengte,Status,Vervuild,Defect,ConducteurGeschikt,Beschikbaar) values (177,2,1,2114, 1,'Dienst',0,0,1,0);
Insert into TRAM (ID,Remise_ID_Standplaats,Tramtype_ID,Nummer,Lengte,Status,Vervuild,Defect,ConducteurGeschikt,Beschikbaar) values (178,2,1,2115, 1,'Dienst',0,0,1,0);
Insert into TRAM (ID,Remise_ID_Standplaats,Tramtype_ID,Nummer,Lengte,Status,Vervuild,Defect,ConducteurGeschikt,Beschikbaar) values (179,2,1,2116, 1,'Dienst',0,0,1,0);
Insert into TRAM (ID,Remise_ID_Standplaats,Tramtype_ID,Nummer,Lengte,Status,Vervuild,Defect,ConducteurGeschikt,Beschikbaar) values (180,2,1,2117, 1,'Dienst',0,0,1,0);
Insert into TRAM (ID,Remise_ID_Standplaats,Tramtype_ID,Nummer,Lengte,Status,Vervuild,Defect,ConducteurGeschikt,Beschikbaar) values (181,2,1,2118, 1,'Dienst',0,0,1,0);
Insert into TRAM (ID,Remise_ID_Standplaats,Tramtype_ID,Nummer,Lengte,Status,Vervuild,Defect,ConducteurGeschikt,Beschikbaar) values (182,2,1,2119, 1,'Dienst',0,0,1,0);
Insert into TRAM (ID,Remise_ID_Standplaats,Tramtype_ID,Nummer,Lengte,Status,Vervuild,Defect,ConducteurGeschikt,Beschikbaar) values (183,2,1,2120, 1,'Dienst',0,0,1,0);
Insert into TRAM (ID,Remise_ID_Standplaats,Tramtype_ID,Nummer,Lengte,Status,Vervuild,Defect,ConducteurGeschikt,Beschikbaar) values (184,2,1,2121, 1,'Dienst',0,0,1,0);
Insert into TRAM (ID,Remise_ID_Standplaats,Tramtype_ID,Nummer,Lengte,Status,Vervuild,Defect,ConducteurGeschikt,Beschikbaar) values (185,2,1,2122, 1,'Dienst',0,0,1,0);
Insert into TRAM (ID,Remise_ID_Standplaats,Tramtype_ID,Nummer,Lengte,Status,Vervuild,Defect,ConducteurGeschikt,Beschikbaar) values (186,2,1,2123, 1,'Dienst',0,0,1,0);
Insert into TRAM (ID,Remise_ID_Standplaats,Tramtype_ID,Nummer,Lengte,Status,Vervuild,Defect,ConducteurGeschikt,Beschikbaar) values (187,2,1,2124, 1,'Dienst',0,0,1,0);
Insert into TRAM (ID,Remise_ID_Standplaats,Tramtype_ID,Nummer,Lengte,Status,Vervuild,Defect,ConducteurGeschikt,Beschikbaar) values (188,2,1,2125, 1,'Dienst',0,0,1,0);
Insert into TRAM (ID,Remise_ID_Standplaats,Tramtype_ID,Nummer,Lengte,Status,Vervuild,Defect,ConducteurGeschikt,Beschikbaar) values (189,2,1,2126, 1,'Dienst',0,0,1,0);
Insert into TRAM (ID,Remise_ID_Standplaats,Tramtype_ID,Nummer,Lengte,Status,Vervuild,Defect,ConducteurGeschikt,Beschikbaar) values (190,2,1,2127, 1,'Dienst',0,0,1,0);
Insert into TRAM (ID,Remise_ID_Standplaats,Tramtype_ID,Nummer,Lengte,Status,Vervuild,Defect,ConducteurGeschikt,Beschikbaar) values (191,2,1,2128, 1,'Dienst',0,0,1,0);
Insert into TRAM (ID,Remise_ID_Standplaats,Tramtype_ID,Nummer,Lengte,Status,Vervuild,Defect,ConducteurGeschikt,Beschikbaar) values (192,2,1,2129, 1,'Dienst',0,0,1,0);
Insert into TRAM (ID,Remise_ID_Standplaats,Tramtype_ID,Nummer,Lengte,Status,Vervuild,Defect,ConducteurGeschikt,Beschikbaar) values (193,2,1,2130, 1,'Dienst',0,0,1,0);
Insert into TRAM (ID,Remise_ID_Standplaats,Tramtype_ID,Nummer,Lengte,Status,Vervuild,Defect,ConducteurGeschikt,Beschikbaar) values (194,2,1,2131, 1,'Dienst',0,0,1,0);
Insert into TRAM (ID,Remise_ID_Standplaats,Tramtype_ID,Nummer,Lengte,Status,Vervuild,Defect,ConducteurGeschikt,Beschikbaar) values (195,2,1,2132, 1,'Dienst',0,0,1,0);
Insert into TRAM (ID,Remise_ID_Standplaats,Tramtype_ID,Nummer,Lengte,Status,Vervuild,Defect,ConducteurGeschikt,Beschikbaar) values (196,2,1,2133, 1,'Dienst',0,0,1,0);
Insert into TRAM (ID,Remise_ID_Standplaats,Tramtype_ID,Nummer,Lengte,Status,Vervuild,Defect,ConducteurGeschikt,Beschikbaar) values (197,2,1,2134, 1,'Dienst',0,0,1,0);
Insert into TRAM (ID,Remise_ID_Standplaats,Tramtype_ID,Nummer,Lengte,Status,Vervuild,Defect,ConducteurGeschikt,Beschikbaar) values (198,2,1,2135, 1,'Dienst',0,0,1,0);
Insert into TRAM (ID,Remise_ID_Standplaats,Tramtype_ID,Nummer,Lengte,Status,Vervuild,Defect,ConducteurGeschikt,Beschikbaar) values (199,2,1,2136, 1,'Dienst',0,0,1,0);
Insert into TRAM (ID,Remise_ID_Standplaats,Tramtype_ID,Nummer,Lengte,Status,Vervuild,Defect,ConducteurGeschikt,Beschikbaar) values (200,2,1,2137, 1,'Dienst',0,0,1,0);
Insert into TRAM (ID,Remise_ID_Standplaats,Tramtype_ID,Nummer,Lengte,Status,Vervuild,Defect,ConducteurGeschikt,Beschikbaar) values (201,2,1,2138, 1,'Dienst',0,0,1,0);
Insert into TRAM (ID,Remise_ID_Standplaats,Tramtype_ID,Nummer,Lengte,Status,Vervuild,Defect,ConducteurGeschikt,Beschikbaar) values (202,2,1,2139, 1,'Dienst',0,0,1,0);
Insert into TRAM (ID,Remise_ID_Standplaats,Tramtype_ID,Nummer,Lengte,Status,Vervuild,Defect,ConducteurGeschikt,Beschikbaar) values (203,2,1,2140, 1,'Dienst',0,0,1,0);
Insert into TRAM (ID,Remise_ID_Standplaats,Tramtype_ID,Nummer,Lengte,Status,Vervuild,Defect,ConducteurGeschikt,Beschikbaar) values (204,2,1,2141, 1,'Dienst',0,0,1,0);
Insert into TRAM (ID,Remise_ID_Standplaats,Tramtype_ID,Nummer,Lengte,Status,Vervuild,Defect,ConducteurGeschikt,Beschikbaar) values (205,2,1,2142, 1,'Dienst',0,0,1,0);
Insert into TRAM (ID,Remise_ID_Standplaats,Tramtype_ID,Nummer,Lengte,Status,Vervuild,Defect,ConducteurGeschikt,Beschikbaar) values (206,2,1,2143, 1,'Dienst',0,0,1,0);
Insert into TRAM (ID,Remise_ID_Standplaats,Tramtype_ID,Nummer,Lengte,Status,Vervuild,Defect,ConducteurGeschikt,Beschikbaar) values (207,2,1,2144, 1,'Dienst',0,0,1,0);
Insert into TRAM (ID,Remise_ID_Standplaats,Tramtype_ID,Nummer,Lengte,Status,Vervuild,Defect,ConducteurGeschikt,Beschikbaar) values (208,2,1,2145, 1,'Dienst',0,0,1,0);
Insert into TRAM (ID,Remise_ID_Standplaats,Tramtype_ID,Nummer,Lengte,Status,Vervuild,Defect,ConducteurGeschikt,Beschikbaar) values (209,2,1,2146, 1,'Dienst',0,0,1,0);
Insert into TRAM (ID,Remise_ID_Standplaats,Tramtype_ID,Nummer,Lengte,Status,Vervuild,Defect,ConducteurGeschikt,Beschikbaar) values (210,2,1,2147, 1,'Dienst',0,0,1,0);
Insert into TRAM (ID,Remise_ID_Standplaats,Tramtype_ID,Nummer,Lengte,Status,Vervuild,Defect,ConducteurGeschikt,Beschikbaar) values (211,2,1,2148, 1,'Dienst',0,0,1,0);
Insert into TRAM (ID,Remise_ID_Standplaats,Tramtype_ID,Nummer,Lengte,Status,Vervuild,Defect,ConducteurGeschikt,Beschikbaar) values (212,2,1,2149, 1,'Dienst',0,0,1,0);
Insert into TRAM (ID,Remise_ID_Standplaats,Tramtype_ID,Nummer,Lengte,Status,Vervuild,Defect,ConducteurGeschikt,Beschikbaar) values (213,2,1,2150, 1,'Dienst',0,0,1,0);
Insert into TRAM (ID,Remise_ID_Standplaats,Tramtype_ID,Nummer,Lengte,Status,Vervuild,Defect,ConducteurGeschikt,Beschikbaar) values (214,2,1,2151, 1,'Dienst',0,0,1,0);
REM INSERTING into TRAMTYPE
SET DEFINE OFF;
Insert into TRAMTYPE (ID,Omschrijving) values (1,'Combino');
Insert into TRAMTYPE (ID,Omschrijving) values (2,'11G');
Insert into TRAMTYPE (ID,Omschrijving) values (3,'Dubbel kop Combino');
Insert into TRAMTYPE (ID,Omschrijving) values (4,'12G');
Insert into TRAMTYPE (ID,Omschrijving) values (5,'Opleidingtram');
Insert into TRAMTYPE (ID,Omschrijving) values (6,'9G');
Insert into TRAMTYPE (ID,Omschrijving) values (7,'10G');
REM INSERTING into TRAM_LIJN
SET DEFINE OFF;
Insert into TRAM_LIJN (TL_ID,Tram_ID,Lijn_ID,Gebonden) values (1,1,4,0);
Insert into TRAM_LIJN (TL_ID,Tram_ID,Lijn_ID,Gebonden) values (2,2,2,0);
Insert into TRAM_LIJN (TL_ID,Tram_ID,Lijn_ID,Gebonden) values (3,3,7,0);
Insert into TRAM_LIJN (TL_ID,Tram_ID,Lijn_ID,Gebonden) values (4,4,4,0);
Insert into TRAM_LIJN (TL_ID,Tram_ID,Lijn_ID,Gebonden) values (5,5,7,0);
Insert into TRAM_LIJN (TL_ID,Tram_ID,Lijn_ID,Gebonden) values (6,6,5,0);
Insert into TRAM_LIJN (TL_ID,Tram_ID,Lijn_ID,Gebonden) values (7,7,1,0);
Insert into TRAM_LIJN (TL_ID,Tram_ID,Lijn_ID,Gebonden) values (8,8,2,0);
Insert into TRAM_LIJN (TL_ID,Tram_ID,Lijn_ID,Gebonden) values (9,9,1,0);
Insert into TRAM_LIJN (TL_ID,Tram_ID,Lijn_ID,Gebonden) values (10,10,5,0);
Insert into TRAM_LIJN (TL_ID,Tram_ID,Lijn_ID,Gebonden) values (11,11,7,0);
Insert into TRAM_LIJN (TL_ID,Tram_ID,Lijn_ID,Gebonden) values (12,12,7,0);
Insert into TRAM_LIJN (TL_ID,Tram_ID,Lijn_ID,Gebonden) values (13,13,7,0);
Insert into TRAM_LIJN (TL_ID,Tram_ID,Lijn_ID,Gebonden) values (14,14,4,0);
Insert into TRAM_LIJN (TL_ID,Tram_ID,Lijn_ID,Gebonden) values (15,15,5,0);
Insert into TRAM_LIJN (TL_ID,Tram_ID,Lijn_ID,Gebonden) values (16,16,7,0);
Insert into TRAM_LIJN (TL_ID,Tram_ID,Lijn_ID,Gebonden) values (17,17,2,0);
Insert into TRAM_LIJN (TL_ID,Tram_ID,Lijn_ID,Gebonden) values (18,18,2,0);
Insert into TRAM_LIJN (TL_ID,Tram_ID,Lijn_ID,Gebonden) values (19,19,2,0);
Insert into TRAM_LIJN (TL_ID,Tram_ID,Lijn_ID,Gebonden) values (20,20,7,0);
Insert into TRAM_LIJN (TL_ID,Tram_ID,Lijn_ID,Gebonden) values (21,21,5,0);
Insert into TRAM_LIJN (TL_ID,Tram_ID,Lijn_ID,Gebonden) values (22,22,7,0);
Insert into TRAM_LIJN (TL_ID,Tram_ID,Lijn_ID,Gebonden) values (23,23,1,0);
Insert into TRAM_LIJN (TL_ID,Tram_ID,Lijn_ID,Gebonden) values (24,24,1,0);
Insert into TRAM_LIJN (TL_ID,Tram_ID,Lijn_ID,Gebonden) values (25,25,2,0);
Insert into TRAM_LIJN (TL_ID,Tram_ID,Lijn_ID,Gebonden) values (26,26,7,0);
Insert into TRAM_LIJN (TL_ID,Tram_ID,Lijn_ID,Gebonden) values (27,27,7,0);
Insert into TRAM_LIJN (TL_ID,Tram_ID,Lijn_ID,Gebonden) values (28,28,7,0);
Insert into TRAM_LIJN (TL_ID,Tram_ID,Lijn_ID,Gebonden) values (29,29,1,0);
Insert into TRAM_LIJN (TL_ID,Tram_ID,Lijn_ID,Gebonden) values (30,30,5,0);
Insert into TRAM_LIJN (TL_ID,Tram_ID,Lijn_ID,Gebonden) values (31,31,2,0);
Insert into TRAM_LIJN (TL_ID,Tram_ID,Lijn_ID,Gebonden) values (32,32,4,0);
Insert into TRAM_LIJN (TL_ID,Tram_ID,Lijn_ID,Gebonden) values (33,33,1,0);
Insert into TRAM_LIJN (TL_ID,Tram_ID,Lijn_ID,Gebonden) values (34,34,1,0);
Insert into TRAM_LIJN (TL_ID,Tram_ID,Lijn_ID,Gebonden) values (35,35,1,0);
Insert into TRAM_LIJN (TL_ID,Tram_ID,Lijn_ID,Gebonden) values (36,36,2,0);
Insert into TRAM_LIJN (TL_ID,Tram_ID,Lijn_ID,Gebonden) values (37,37,4,0);
Insert into TRAM_LIJN (TL_ID,Tram_ID,Lijn_ID,Gebonden) values (38,38,7,0);
Insert into TRAM_LIJN (TL_ID,Tram_ID,Lijn_ID,Gebonden) values (39,39,4,0);
Insert into TRAM_LIJN (TL_ID,Tram_ID,Lijn_ID,Gebonden) values (40,40,5,0);
Insert into TRAM_LIJN (TL_ID,Tram_ID,Lijn_ID,Gebonden) values (41,41,1,0);
Insert into TRAM_LIJN (TL_ID,Tram_ID,Lijn_ID,Gebonden) values (42,42,2,0);
Insert into TRAM_LIJN (TL_ID,Tram_ID,Lijn_ID,Gebonden) values (43,43,4,0);
Insert into TRAM_LIJN (TL_ID,Tram_ID,Lijn_ID,Gebonden) values (44,44,7,0);
Insert into TRAM_LIJN (TL_ID,Tram_ID,Lijn_ID,Gebonden) values (45,45,5,0);
Insert into TRAM_LIJN (TL_ID,Tram_ID,Lijn_ID,Gebonden) values (46,46,5,0);
Insert into TRAM_LIJN (TL_ID,Tram_ID,Lijn_ID,Gebonden) values (47,47,7,0);
Insert into TRAM_LIJN (TL_ID,Tram_ID,Lijn_ID,Gebonden) values (48,48,5,0);
Insert into TRAM_LIJN (TL_ID,Tram_ID,Lijn_ID,Gebonden) values (49,49,2,0);
Insert into TRAM_LIJN (TL_ID,Tram_ID,Lijn_ID,Gebonden) values (50,50,4,0);
Insert into TRAM_LIJN (TL_ID,Tram_ID,Lijn_ID,Gebonden) values (51,51,2,0);
Insert into TRAM_LIJN (TL_ID,Tram_ID,Lijn_ID,Gebonden) values (52,52,1,0);
Insert into TRAM_LIJN (TL_ID,Tram_ID,Lijn_ID,Gebonden) values (53,53,1,0);
Insert into TRAM_LIJN (TL_ID,Tram_ID,Lijn_ID,Gebonden) values (54,54,2,0);
Insert into TRAM_LIJN (TL_ID,Tram_ID,Lijn_ID,Gebonden) values (55,55,2,0);
Insert into TRAM_LIJN (TL_ID,Tram_ID,Lijn_ID,Gebonden) values (56,56,5,0);
Insert into TRAM_LIJN (TL_ID,Tram_ID,Lijn_ID,Gebonden) values (57,57,1,0);
Insert into TRAM_LIJN (TL_ID,Tram_ID,Lijn_ID,Gebonden) values (58,58,4,0);
Insert into TRAM_LIJN (TL_ID,Tram_ID,Lijn_ID,Gebonden) values (59,59,1,0);
Insert into TRAM_LIJN (TL_ID,Tram_ID,Lijn_ID,Gebonden) values (60,60,7,0);
Insert into TRAM_LIJN (TL_ID,Tram_ID,Lijn_ID,Gebonden) values (61,61,1,0);
Insert into TRAM_LIJN (TL_ID,Tram_ID,Lijn_ID,Gebonden) values (62,62,2,0);
Insert into TRAM_LIJN (TL_ID,Tram_ID,Lijn_ID,Gebonden) values (63,63,2,0);
Insert into TRAM_LIJN (TL_ID,Tram_ID,Lijn_ID,Gebonden) values (64,64,1,0);
Insert into TRAM_LIJN (TL_ID,Tram_ID,Lijn_ID,Gebonden) values (65,65,2,0);
Insert into TRAM_LIJN (TL_ID,Tram_ID,Lijn_ID,Gebonden) values (66,66,1,0);
Insert into TRAM_LIJN (TL_ID,Tram_ID,Lijn_ID,Gebonden) values (67,67,5,0);
Insert into TRAM_LIJN (TL_ID,Tram_ID,Lijn_ID,Gebonden) values (68,68,1,0);
Insert into TRAM_LIJN (TL_ID,Tram_ID,Lijn_ID,Gebonden) values (69,69,2,0);
Insert into TRAM_LIJN (TL_ID,Tram_ID,Lijn_ID,Gebonden) values (70,70,5,0);
Insert into TRAM_LIJN (TL_ID,Tram_ID,Lijn_ID,Gebonden) values (71,71,7,0);
Insert into TRAM_LIJN (TL_ID,Tram_ID,Lijn_ID,Gebonden) values (72,72,4,0);
Insert into TRAM_LIJN (TL_ID,Tram_ID,Lijn_ID,Gebonden) values (73,73,3,1);
Insert into TRAM_LIJN (TL_ID,Tram_ID,Lijn_ID,Gebonden) values (74,74,3,1);
Insert into TRAM_LIJN (TL_ID,Tram_ID,Lijn_ID,Gebonden) values (75,75,3,1);
Insert into TRAM_LIJN (TL_ID,Tram_ID,Lijn_ID,Gebonden) values (76,76,3,1);
Insert into TRAM_LIJN (TL_ID,Tram_ID,Lijn_ID,Gebonden) values (77,77,3,1);
Insert into TRAM_LIJN (TL_ID,Tram_ID,Lijn_ID,Gebonden) values (78,78,3,1);
Insert into TRAM_LIJN (TL_ID,Tram_ID,Lijn_ID,Gebonden) values (79,79,3,1);
Insert into TRAM_LIJN (TL_ID,Tram_ID,Lijn_ID,Gebonden) values (80,80,3,1);
Insert into TRAM_LIJN (TL_ID,Tram_ID,Lijn_ID,Gebonden) values (81,81,3,1);
Insert into TRAM_LIJN (TL_ID,Tram_ID,Lijn_ID,Gebonden) values (82,82,3,1);
Insert into TRAM_LIJN (TL_ID,Tram_ID,Lijn_ID,Gebonden) values (83,83,3,1);
Insert into TRAM_LIJN (TL_ID,Tram_ID,Lijn_ID,Gebonden) values (84,84,3,1);
Insert into TRAM_LIJN (TL_ID,Tram_ID,Lijn_ID,Gebonden) values (85,85,3,1);
Insert into TRAM_LIJN (TL_ID,Tram_ID,Lijn_ID,Gebonden) values (86,86,3,1);
Insert into TRAM_LIJN (TL_ID,Tram_ID,Lijn_ID,Gebonden) values (87,87,3,1);
Insert into TRAM_LIJN (TL_ID,Tram_ID,Lijn_ID,Gebonden) values (88,88,3,1);
Insert into TRAM_LIJN (TL_ID,Tram_ID,Lijn_ID,Gebonden) values (89,89,3,1);
Insert into TRAM_LIJN (TL_ID,Tram_ID,Lijn_ID,Gebonden) values (90,90,3,1);
Insert into TRAM_LIJN (TL_ID,Tram_ID,Lijn_ID,Gebonden) values (91,91,3,1);
Insert into TRAM_LIJN (TL_ID,Tram_ID,Lijn_ID,Gebonden) values (92,92,3,1);
Insert into TRAM_LIJN (TL_ID,Tram_ID,Lijn_ID,Gebonden) values (93,93,3,0);
Insert into TRAM_LIJN (TL_ID,Tram_ID,Lijn_ID,Gebonden) values (94,94,3,0);
Insert into TRAM_LIJN (TL_ID,Tram_ID,Lijn_ID,Gebonden) values (95,95,3,0);
Insert into TRAM_LIJN (TL_ID,Tram_ID,Lijn_ID,Gebonden) values (96,96,3,0);
Insert into TRAM_LIJN (TL_ID,Tram_ID,Lijn_ID,Gebonden) values (97,97,6,0);
Insert into TRAM_LIJN (TL_ID,Tram_ID,Lijn_ID,Gebonden) values (98,98,6,0);
Insert into TRAM_LIJN (TL_ID,Tram_ID,Lijn_ID,Gebonden) values (99,99,6,0);
Insert into TRAM_LIJN (TL_ID,Tram_ID,Lijn_ID,Gebonden) values (100,100,6,0);
Insert into TRAM_LIJN (TL_ID,Tram_ID,Lijn_ID,Gebonden) values (101,101,6,0);
Insert into TRAM_LIJN (TL_ID,Tram_ID,Lijn_ID,Gebonden) values (102,102,6,0);
Insert into TRAM_LIJN (TL_ID,Tram_ID,Lijn_ID,Gebonden) values (103,103,6,0);
Insert into TRAM_LIJN (TL_ID,Tram_ID,Lijn_ID,Gebonden) values (104,104,6,0);
Insert into TRAM_LIJN (TL_ID,Tram_ID,Lijn_ID,Gebonden) values (105,105,6,0);
Insert into TRAM_LIJN (TL_ID,Tram_ID,Lijn_ID,Gebonden) values (106,106,6,0);
Insert into TRAM_LIJN (TL_ID,Tram_ID,Lijn_ID,Gebonden) values (107,107,6,0);
Insert into TRAM_LIJN (TL_ID,Tram_ID,Lijn_ID,Gebonden) values (108,109,6,0);
Insert into TRAM_LIJN (TL_ID,Tram_ID,Lijn_ID,Gebonden) values (109,110,6,0);
Insert into TRAM_LIJN (TL_ID,Tram_ID,Lijn_ID,Gebonden) values (110,111,6,0);
Insert into TRAM_LIJN (TL_ID,Tram_ID,Lijn_ID,Gebonden) values (111,112,6,0);
Insert into TRAM_LIJN (TL_ID,Tram_ID,Lijn_ID,Gebonden) values (112,113,6,0);
Insert into TRAM_LIJN (TL_ID,Tram_ID,Lijn_ID,Gebonden) values (113,114,6,0);
Insert into TRAM_LIJN (TL_ID,Tram_ID,Lijn_ID,Gebonden) values (114,115,6,0);
Insert into TRAM_LIJN (TL_ID,Tram_ID,Lijn_ID,Gebonden) values (115,116,6,0);
Insert into TRAM_LIJN (TL_ID,Tram_ID,Lijn_ID,Gebonden) values (116,117,6,0);
Insert into TRAM_LIJN (TL_ID,Tram_ID,Lijn_ID,Gebonden) values (117,118,6,0);
Insert into TRAM_LIJN (TL_ID,Tram_ID,Lijn_ID,Gebonden) values (118,119,6,0);
Insert into TRAM_LIJN (TL_ID,Tram_ID,Lijn_ID,Gebonden) values (119,120,6,0);
Insert into TRAM_LIJN (TL_ID,Tram_ID,Lijn_ID,Gebonden) values (120,121,6,0);
Insert into TRAM_LIJN (TL_ID,Tram_ID,Lijn_ID,Gebonden) values (121,122,null,0);
Insert into TRAM_LIJN (TL_ID,Tram_ID,Lijn_ID,Gebonden) values (122,123,null,0);
Insert into TRAM_LIJN (TL_ID,Tram_ID,Lijn_ID,Gebonden) values (123,97,8,0);
Insert into TRAM_LIJN (TL_ID,Tram_ID,Lijn_ID,Gebonden) values (124,98,8,0);
Insert into TRAM_LIJN (TL_ID,Tram_ID,Lijn_ID,Gebonden) values (125,99,8,0);
Insert into TRAM_LIJN (TL_ID,Tram_ID,Lijn_ID,Gebonden) values (126,100,8,0);
Insert into TRAM_LIJN (TL_ID,Tram_ID,Lijn_ID,Gebonden) values (127,101,8,0);
Insert into TRAM_LIJN (TL_ID,Tram_ID,Lijn_ID,Gebonden) values (128,102,8,0);
Insert into TRAM_LIJN (TL_ID,Tram_ID,Lijn_ID,Gebonden) values (129,103,8,0);
Insert into TRAM_LIJN (TL_ID,Tram_ID,Lijn_ID,Gebonden) values (130,104,8,0);
Insert into TRAM_LIJN (TL_ID,Tram_ID,Lijn_ID,Gebonden) values (131,105,8,0);
Insert into TRAM_LIJN (TL_ID,Tram_ID,Lijn_ID,Gebonden) values (132,106,8,0);
Insert into TRAM_LIJN (TL_ID,Tram_ID,Lijn_ID,Gebonden) values (133,107,8,0);
Insert into TRAM_LIJN (TL_ID,Tram_ID,Lijn_ID,Gebonden) values (134,109,8,0);
Insert into TRAM_LIJN (TL_ID,Tram_ID,Lijn_ID,Gebonden) values (135,110,8,0);
Insert into TRAM_LIJN (TL_ID,Tram_ID,Lijn_ID,Gebonden) values (136,111,8,0);
Insert into TRAM_LIJN (TL_ID,Tram_ID,Lijn_ID,Gebonden) values (137,112,8,0);
Insert into TRAM_LIJN (TL_ID,Tram_ID,Lijn_ID,Gebonden) values (138,113,8,0);
Insert into TRAM_LIJN (TL_ID,Tram_ID,Lijn_ID,Gebonden) values (139,114,8,0);
Insert into TRAM_LIJN (TL_ID,Tram_ID,Lijn_ID,Gebonden) values (140,115,8,0);
Insert into TRAM_LIJN (TL_ID,Tram_ID,Lijn_ID,Gebonden) values (141,116,8,0);
Insert into TRAM_LIJN (TL_ID,Tram_ID,Lijn_ID,Gebonden) values (142,117,8,0);
Insert into TRAM_LIJN (TL_ID,Tram_ID,Lijn_ID,Gebonden) values (143,118,8,0);
Insert into TRAM_LIJN (TL_ID,Tram_ID,Lijn_ID,Gebonden) values (144,119,8,0);
Insert into TRAM_LIJN (TL_ID,Tram_ID,Lijn_ID,Gebonden) values (145,120,8,0);
Insert into TRAM_LIJN (TL_ID,Tram_ID,Lijn_ID,Gebonden) values (146,121,8,0);
Insert into TRAM_ONDERHOUD(ID,Medewerker_ID,Tram_ID,DatumTijdstip,BeschikbaarDatum,EindDatum,TypeOnderhoud,Beschrijving) Values (1,1,1,TO_DATE('10-06-2015','DD-MM-YYYY'),TO_DATE('01-01-0001','DD-MM-YYYY'),TO_DATE('11-06-2005','DD-MM-YYYY'),'KleineServiceBeurt','Ruit Vervangen');
REM INSERTING into TRAM_ONDERHOUD
SET DEFINE OFF;
REM INSERTING into TRANSFER
SET DEFINE OFF;
Insert into TRANSFER (Remise_ID_Van,Remise_ID_Naar,Aantal) values (2,1,3);
REM INSERTING into VERBINDING
SET DEFINE OFF;
--------------------------------------------------------
--  DDL for Index PrimaryKey1
--------------------------------------------------------

  CREATE UNIQUE INDEX PrimaryKey1 ON TRAM_LIJN (TL_ID) 
  ;
--------------------------------------------------------
--  DDL for Index TRAMTRAM_LIJN
--------------------------------------------------------

  CREATE INDEX TRAMTRAM_LIJN ON TRAM_LIJN (Tram_ID) 
  ;
--------------------------------------------------------
--  DDL for Index PrimaryKey11
--------------------------------------------------------

  CREATE UNIQUE INDEX PrimaryKey11 ON MEDEWERKER (ID) 
  ;
--------------------------------------------------------
--  DDL for Index REMISETRAM
--------------------------------------------------------

  CREATE INDEX REMISETRAM ON TRAM (Remise_ID_Standplaats) 
  ;
--------------------------------------------------------
--  DDL for Index SECTORVERBINDING
--------------------------------------------------------

  CREATE INDEX SECTORVERBINDING ON VERBINDING (Sector_ID_Van) 
  ;
--------------------------------------------------------
--  DDL for Index PrimaryKey8
--------------------------------------------------------

  CREATE UNIQUE INDEX PrimaryKey8 ON SPOOR (ID) 
  ;
--------------------------------------------------------
--  DDL for Index SECTORVERBINDING1
--------------------------------------------------------

  CREATE INDEX SECTORVERBINDING1 ON VERBINDING (Sector_ID_Naar) 
  ;
--------------------------------------------------------
--  DDL for Index SPOORSECTOR
--------------------------------------------------------

  CREATE INDEX SPOORSECTOR ON SECTOR (Spoor_ID) 
  ;
--------------------------------------------------------
--  DDL for Index Tram_ID
--------------------------------------------------------

  CREATE INDEX Tram_ID ON RESERVERING (Tram_ID) 
  ;
--------------------------------------------------------
--  DDL for Index PrimaryKey5
--------------------------------------------------------

  CREATE UNIQUE INDEX PrimaryKey5 ON RESERVERING (Reservering_ID) 
  ;
--------------------------------------------------------
--  DDL for Index Recht_ID
--------------------------------------------------------

  CREATE INDEX Recht_ID ON FUNCTIE_RECHT (Recht_ID) 
  ;
--------------------------------------------------------
--  DDL for Index PrimaryKey10
--------------------------------------------------------

  CREATE UNIQUE INDEX PrimaryKey10 ON LIJN (ID) 
  ;
--------------------------------------------------------
--  DDL for Index REMISETRANSFER1
--------------------------------------------------------

  CREATE INDEX REMISETRANSFER1 ON TRANSFER (Remise_ID_Naar) 
  ;
--------------------------------------------------------
--  DDL for Index REMISETRANSFER
--------------------------------------------------------

  CREATE INDEX REMISETRANSFER ON TRANSFER (Remise_ID_Van) 
  ;
--------------------------------------------------------
--  DDL for Index PrimaryKey14
--------------------------------------------------------

  CREATE UNIQUE INDEX PrimaryKey14 ON REMISE (ID) 
  ;
--------------------------------------------------------
--  DDL for Index PrimaryKey13
--------------------------------------------------------

  CREATE UNIQUE INDEX PrimaryKey13 ON TRAM (ID) 
  ;
--------------------------------------------------------
--  DDL for Index PrimaryKey7
--------------------------------------------------------

  CREATE UNIQUE INDEX PrimaryKey7 ON TRANSFER (Remise_ID_Van, Remise_ID_Naar) 
  ;
--------------------------------------------------------
--  DDL for Index TRAMTYPETRAM
--------------------------------------------------------

  CREATE INDEX TRAMTYPETRAM ON TRAM (Tramtype_ID) 
  ;
--------------------------------------------------------
--  DDL for Index Medewerker_ID
--------------------------------------------------------

  CREATE INDEX Medewerker_ID ON TRAM_ONDERHOUD (Medewerker_ID) 
  ;
--------------------------------------------------------
--  DDL for Index PrimaryKey3
--------------------------------------------------------

  CREATE UNIQUE INDEX PrimaryKey3 ON FUNCTIE (ID) 
  ;
--------------------------------------------------------
--  DDL for Index FUNCTIEFUNCTIE_RECHT
--------------------------------------------------------

  CREATE INDEX FUNCTIEFUNCTIE_RECHT ON FUNCTIE_RECHT (Functie_ID) 
  ;
--------------------------------------------------------
--  DDL for Index Functie_ID
--------------------------------------------------------

  CREATE INDEX Functie_ID ON MEDEWERKER (Functie_ID) 
  ;
--------------------------------------------------------
--  DDL for Index Spoor_ID
--------------------------------------------------------

  CREATE INDEX Sector_ID ON RESERVERING (Sector_ID) 
  ;
--------------------------------------------------------
--  DDL for Index PrimaryKey6
--------------------------------------------------------

  CREATE UNIQUE INDEX PrimaryKey6 ON FUNCTIE_RECHT (Functie_ID, Recht_ID) 
  ;
--------------------------------------------------------
--  DDL for Index PrimaryKey2
--------------------------------------------------------

  CREATE UNIQUE INDEX PrimaryKey2 ON RECHT (ID) 
  ;
--------------------------------------------------------
--  DDL for Index PrimaryKey4
--------------------------------------------------------

  CREATE UNIQUE INDEX PrimaryKey4 ON TRAM_ONDERHOUD (ID) 
  ;
--------------------------------------------------------
--  DDL for Index PrimaryKey12
--------------------------------------------------------

  CREATE UNIQUE INDEX PrimaryKey12 ON VERBINDING (ID) 
  ;
--------------------------------------------------------
--  DDL for Index TRAMTRAM_ONDERHOUD
--------------------------------------------------------

  CREATE INDEX TRAMTRAM_ONDERHOUD ON TRAM_ONDERHOUD (Tram_ID) 
  ;
--------------------------------------------------------
--  DDL for Index REMISESPOOR
--------------------------------------------------------

  CREATE INDEX REMISESPOOR ON SPOOR (Remise_ID) 
  ;
--------------------------------------------------------
--  DDL for Index PrimaryKey9
--------------------------------------------------------

  CREATE UNIQUE INDEX PrimaryKey9 ON SECTOR (ID) 
  ;
--------------------------------------------------------
--  DDL for Index PrimaryKey
--------------------------------------------------------

  CREATE UNIQUE INDEX PrimaryKey ON TRAMTYPE (ID) 
  ;
--------------------------------------------------------
--  DDL for Index Nummer
--------------------------------------------------------

  CREATE UNIQUE INDEX Nummer ON TRAM (Nummer) 
  ;
--------------------------------------------------------
--  DDL for Index LIJNTRAM_LIJN
--------------------------------------------------------

  CREATE INDEX LIJNTRAM_LIJN ON TRAM_LIJN (Lijn_ID) 
  ;
--------------------------------------------------------
--  DDL for Index Remise_ID
--------------------------------------------------------

  CREATE INDEX Remise_ID ON LIJN (Remise_ID) 
  ;
--------------------------------------------------------
--  DDL for Index Nummer1
--------------------------------------------------------

  CREATE INDEX Nummer1 ON LIJN (Nummer) 
  ;
--------------------------------------------------------
--  Constraints for Table VERBINDING
--------------------------------------------------------

  ALTER TABLE VERBINDING ADD CONSTRAINT PrimaryKey12 PRIMARY KEY (ID) ENABLE;
 
  ALTER TABLE VERBINDING MODIFY (ID NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table RESERVERING
--------------------------------------------------------

  ALTER TABLE RESERVERING ADD CONSTRAINT PrimaryKey5 PRIMARY KEY (Reservering_ID) ENABLE;
 
  ALTER TABLE RESERVERING MODIFY (Reservering_ID NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table FUNCTIE_RECHT
--------------------------------------------------------

  ALTER TABLE FUNCTIE_RECHT ADD CONSTRAINT PrimaryKey6 PRIMARY KEY (Functie_ID, Recht_ID) ENABLE;
 
  ALTER TABLE FUNCTIE_RECHT MODIFY (Functie_ID NOT NULL ENABLE);
 
  ALTER TABLE FUNCTIE_RECHT MODIFY (Recht_ID NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table TRAMTYPE
--------------------------------------------------------

  ALTER TABLE TRAMTYPE ADD CONSTRAINT PrimaryKey PRIMARY KEY (ID) ENABLE;
 
  ALTER TABLE TRAMTYPE MODIFY (ID NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table TRAM_LIJN
--------------------------------------------------------

  ALTER TABLE TRAM_LIJN ADD CONSTRAINT PrimaryKey1 PRIMARY KEY (TL_ID) ENABLE;
 
  ALTER TABLE TRAM_LIJN MODIFY (TL_ID NOT NULL ENABLE);
 
  ALTER TABLE TRAM_LIJN MODIFY (Tram_ID NOT NULL ENABLE);
 
  ALTER TABLE TRAM_LIJN MODIFY (Gebonden NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table LIJN
--------------------------------------------------------

  ALTER TABLE LIJN ADD CONSTRAINT PrimaryKey10 PRIMARY KEY (ID) ENABLE;
 
  ALTER TABLE LIJN MODIFY (ID NOT NULL ENABLE);
 
  ALTER TABLE LIJN MODIFY (ConducteurRijdtMee NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table REMISE
--------------------------------------------------------

  ALTER TABLE REMISE ADD CONSTRAINT PrimaryKey14 PRIMARY KEY (ID) ENABLE;
 
  ALTER TABLE REMISE MODIFY (ID NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table TRAM
--------------------------------------------------------

  ALTER TABLE TRAM ADD CONSTRAINT PrimaryKey13 PRIMARY KEY (ID) ENABLE;
 
  ALTER TABLE TRAM MODIFY (ID NOT NULL ENABLE);
 
  ALTER TABLE TRAM MODIFY (Vervuild NOT NULL ENABLE);
 
  ALTER TABLE TRAM MODIFY (Defect NOT NULL ENABLE);
 
  ALTER TABLE TRAM MODIFY (ConducteurGeschikt NOT NULL ENABLE);
 
  ALTER TABLE TRAM MODIFY (Beschikbaar NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table RECHT
--------------------------------------------------------

  ALTER TABLE RECHT ADD CONSTRAINT PrimaryKey2 PRIMARY KEY (ID) ENABLE;
 
  ALTER TABLE RECHT MODIFY (ID NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table TRAM_ONDERHOUD
--------------------------------------------------------

  ALTER TABLE TRAM_ONDERHOUD ADD CONSTRAINT PrimaryKey4 PRIMARY KEY (ID) ENABLE;
 
  ALTER TABLE TRAM_ONDERHOUD MODIFY (ID NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table MEDEWERKER
--------------------------------------------------------

  ALTER TABLE MEDEWERKER ADD CONSTRAINT PrimaryKey11 PRIMARY KEY (ID) ENABLE;
 
  ALTER TABLE MEDEWERKER MODIFY (ID NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table SPOOR
--------------------------------------------------------

  ALTER TABLE SPOOR ADD CONSTRAINT PrimaryKey8 PRIMARY KEY (ID) ENABLE;
 
  ALTER TABLE SPOOR MODIFY (ID NOT NULL ENABLE);
 
  ALTER TABLE SPOOR MODIFY (Beschikbaar NOT NULL ENABLE);
 
  ALTER TABLE SPOOR MODIFY (InUitRijspoor NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table FUNCTIE
--------------------------------------------------------

  ALTER TABLE FUNCTIE ADD CONSTRAINT PrimaryKey3 PRIMARY KEY (ID) ENABLE;
 
  ALTER TABLE FUNCTIE MODIFY (ID NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table TRANSFER
--------------------------------------------------------

  ALTER TABLE TRANSFER ADD CONSTRAINT PrimaryKey7 PRIMARY KEY (Remise_ID_Van, Remise_ID_Naar) ENABLE;
 
  ALTER TABLE TRANSFER MODIFY (Remise_ID_Van NOT NULL ENABLE);
 
  ALTER TABLE TRANSFER MODIFY (Remise_ID_Naar NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table SECTOR
--------------------------------------------------------

  ALTER TABLE SECTOR ADD CONSTRAINT PrimaryKey9 PRIMARY KEY (ID) ENABLE;
 
  ALTER TABLE SECTOR MODIFY (ID NOT NULL ENABLE);
 
  ALTER TABLE SECTOR MODIFY (Beschikbaar NOT NULL ENABLE);
 
  ALTER TABLE SECTOR MODIFY (Blokkade NOT NULL ENABLE);
--------------------------------------------------------
--  Ref Constraints for Table FUNCTIE_RECHT
--------------------------------------------------------

  ALTER TABLE FUNCTIE_RECHT ADD CONSTRAINT FUNCTIEFUNCTIE_RECHT FOREIGN KEY (Functie_ID)
	  REFERENCES FUNCTIE (ID) ENABLE;
 
  ALTER TABLE FUNCTIE_RECHT ADD CONSTRAINT RECHTFUNCTIE_RECHT FOREIGN KEY (Recht_ID)
	  REFERENCES RECHT (ID) ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table LIJN
--------------------------------------------------------

  ALTER TABLE LIJN ADD CONSTRAINT REMISELIJN FOREIGN KEY (Remise_ID)
	  REFERENCES REMISE (ID) ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table MEDEWERKER
--------------------------------------------------------

  ALTER TABLE MEDEWERKER ADD CONSTRAINT FUNCTIEMEDEWERKER FOREIGN KEY (Functie_ID)
	  REFERENCES FUNCTIE (ID) ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table RESERVERING
--------------------------------------------------------

  ALTER TABLE RESERVERING ADD CONSTRAINT SPOORRESERVERING FOREIGN KEY (Sector_ID)
	  REFERENCES SECTOR (ID) ENABLE;
 
  ALTER TABLE RESERVERING ADD CONSTRAINT TRAMRESERVERING FOREIGN KEY (Tram_ID)
	  REFERENCES TRAM (ID) ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table SECTOR
--------------------------------------------------------

  ALTER TABLE SECTOR ADD CONSTRAINT SPOORSECTOR FOREIGN KEY (Spoor_ID)
	  REFERENCES SPOOR (ID) ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table SPOOR
--------------------------------------------------------

  ALTER TABLE SPOOR ADD CONSTRAINT REMISESPOOR FOREIGN KEY (Remise_ID)
	  REFERENCES REMISE (ID) ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table TRAM
--------------------------------------------------------

  ALTER TABLE TRAM ADD CONSTRAINT REMISETRAM FOREIGN KEY (Remise_ID_Standplaats)
	  REFERENCES REMISE (ID) ENABLE;
 
  ALTER TABLE TRAM ADD CONSTRAINT TRAMTYPETRAM FOREIGN KEY (Tramtype_ID)
	  REFERENCES TRAMTYPE (ID) ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table TRAM_LIJN
--------------------------------------------------------

  ALTER TABLE TRAM_LIJN ADD CONSTRAINT LIJNTRAM_LIJN FOREIGN KEY (Lijn_ID)
	  REFERENCES LIJN (ID) ENABLE;
 
  ALTER TABLE TRAM_LIJN ADD CONSTRAINT TRAMTRAM_LIJN FOREIGN KEY (Tram_ID)
	  REFERENCES TRAM (ID) ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table TRAM_ONDERHOUD
--------------------------------------------------------

  ALTER TABLE TRAM_ONDERHOUD ADD CONSTRAINT MEDEWERKERTRAM_ONDERHOUD FOREIGN KEY (Medewerker_ID)
	  REFERENCES MEDEWERKER (ID) ENABLE;
 
  ALTER TABLE TRAM_ONDERHOUD ADD CONSTRAINT TRAMTRAM_ONDERHOUD FOREIGN KEY (Tram_ID)
	  REFERENCES TRAM (ID) ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table TRANSFER
--------------------------------------------------------

  ALTER TABLE TRANSFER ADD CONSTRAINT REMISETRANSFER FOREIGN KEY (Remise_ID_Van)
	  REFERENCES REMISE (ID) ENABLE;
 
  ALTER TABLE TRANSFER ADD CONSTRAINT REMISETRANSFER1 FOREIGN KEY (Remise_ID_Naar)
	  REFERENCES REMISE (ID) ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table VERBINDING
--------------------------------------------------------

  ALTER TABLE VERBINDING ADD CONSTRAINT SECTORVERBINDING FOREIGN KEY (Sector_ID_Van)
	  REFERENCES SECTOR (ID) ENABLE;
 
  ALTER TABLE VERBINDING ADD CONSTRAINT SECTORVERBINDING1 FOREIGN KEY (Sector_ID_Naar)
	  REFERENCES SECTOR (ID) ENABLE;
--------------------------------------------------------
--  DDL for Trigger FUNCTIE_FCTG_BI
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER FUNCTIE_FCTG_BI BEFORE INSERT ON FUNCTIE
FOR EACH ROW
 WHEN (new.ID IS NULL) BEGIN
  SELECT FUNCTIE_FCSEQ.NEXTVAL INTO :new.ID FROM dual;
END;
/
ALTER TRIGGER FUNCTIE_FCTG_BI ENABLE;
--------------------------------------------------------
--  DDL for Trigger LIJN_FCTG_BI
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER LIJN_FCTG_BI BEFORE INSERT ON LIJN
FOR EACH ROW
 WHEN (new.ID IS NULL) BEGIN
  SELECT LIJN_FCSEQ.NEXTVAL INTO :new.ID FROM dual;
END;
/
ALTER TRIGGER LIJN_FCTG_BI ENABLE;
--------------------------------------------------------
--  DDL for Trigger MEDEWERKER_FCTG_BI
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER MEDEWERKER_FCTG_BI BEFORE INSERT ON MEDEWERKER
FOR EACH ROW
 WHEN (new.ID IS NULL) BEGIN
  SELECT MEDEWERKER_FCSEQ.NEXTVAL INTO :new.ID FROM dual;
END;
/
ALTER TRIGGER MEDEWERKER_FCTG_BI ENABLE;
--------------------------------------------------------
--  DDL for Trigger RECHT_FCTG_BI
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER RECHT_FCTG_BI BEFORE INSERT ON RECHT
FOR EACH ROW
 WHEN (new.ID IS NULL) BEGIN
  SELECT RECHT_FCSEQ.NEXTVAL INTO :new.ID FROM dual;
END;
/
ALTER TRIGGER RECHT_FCTG_BI ENABLE;
--------------------------------------------------------
--  DDL for Trigger REMISE_FCTG_BI
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER REMISE_FCTG_BI BEFORE INSERT ON REMISE
FOR EACH ROW
 WHEN (new.ID IS NULL) BEGIN
  SELECT REMISE_FCSEQ.NEXTVAL INTO :new.ID FROM dual;
END;
/
ALTER TRIGGER REMISE_FCTG_BI ENABLE;
--------------------------------------------------------
--  DDL for Trigger RESERVERING_FCTG_BI
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER RESERVERING_FCTG_BI BEFORE INSERT ON RESERVERING
FOR EACH ROW
 WHEN (new.Reservering_ID IS NULL) BEGIN
  SELECT RESERVERING_FCSEQ.NEXTVAL INTO :new.Reservering_ID FROM dual;
END;
/
ALTER TRIGGER RESERVERING_FCTG_BI ENABLE;
--------------------------------------------------------
--  DDL for Trigger SECTOR_FCTG_BI
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER SECTOR_FCTG_BI BEFORE INSERT ON SECTOR
FOR EACH ROW
 WHEN (new.ID IS NULL) BEGIN
  SELECT SECTOR_FCSEQ.NEXTVAL INTO :new.ID FROM dual;
END;
/
ALTER TRIGGER SECTOR_FCTG_BI ENABLE;
--------------------------------------------------------
--  DDL for Trigger SPOOR_FCTG_BI
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER SPOOR_FCTG_BI BEFORE INSERT ON SPOOR
FOR EACH ROW
 WHEN (new.ID IS NULL) BEGIN
  SELECT SPOOR_FCSEQ.NEXTVAL INTO :new.ID FROM dual;
END;
/
ALTER TRIGGER SPOOR_FCTG_BI ENABLE;
--------------------------------------------------------
--  DDL for Trigger TRAMTYPE_FCTG_BI
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER TRAMTYPE_FCTG_BI BEFORE INSERT ON TRAMTYPE
FOR EACH ROW
 WHEN (new.ID IS NULL) BEGIN
  SELECT TRAMTYPE_FCSEQ.NEXTVAL INTO :new.ID FROM dual;
END;
/
ALTER TRIGGER TRAMTYPE_FCTG_BI ENABLE;
--------------------------------------------------------
--  DDL for Trigger TRAM_FCTG_BI
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER TRAM_FCTG_BI BEFORE INSERT ON TRAM
FOR EACH ROW
 WHEN (new.ID IS NULL) BEGIN
  SELECT TRAM_FCSEQ.NEXTVAL INTO :new.ID FROM dual;
END;
/
ALTER TRIGGER TRAM_FCTG_BI ENABLE;
--------------------------------------------------------
--  DDL for Trigger TRAM_LIJN_FCTG_BI
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER TRAM_LIJN_FCTG_BI BEFORE INSERT ON TRAM_LIJN
FOR EACH ROW
 WHEN (new.TL_ID IS NULL) BEGIN
  SELECT TRAM_LIJN_FCSEQ.NEXTVAL INTO :new.TL_ID FROM dual;
END;
/
ALTER TRIGGER TRAM_LIJN_FCTG_BI ENABLE;
--------------------------------------------------------
--  DDL for Trigger TRAM_ONDERHOUD_FCTG_BI
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER TRAM_ONDERHOUD_FCTG_BI BEFORE INSERT ON TRAM_ONDERHOUD
FOR EACH ROW
 WHEN (new.ID IS NULL) BEGIN
  SELECT TRAM_ONDERHOUD_FCSEQ.NEXTVAL INTO :new.ID FROM dual;
END;
/
ALTER TRIGGER TRAM_ONDERHOUD_FCTG_BI ENABLE;
--------------------------------------------------------
--  DDL for Trigger VERBINDING_FCTG_BI
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER VERBINDING_FCTG_BI BEFORE INSERT ON VERBINDING
FOR EACH ROW
 WHEN (new.ID IS NULL) BEGIN
  SELECT VERBINDING_FCSEQ.NEXTVAL INTO :new.ID FROM dual;
END;
/
ALTER TRIGGER VERBINDING_FCTG_BI ENABLE;

/