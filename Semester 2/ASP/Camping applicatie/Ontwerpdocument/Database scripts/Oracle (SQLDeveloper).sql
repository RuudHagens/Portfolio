/*
Due to bugs in the SQL exporter I had to make changes to this script:
-Long Text (Access) is NCLOB but the contents of this column was always NULL
-Set Date Language so date fields are correctly inserted

Added:
-Set define off to be sure
-drop table and drop sequence for easy rerun of this script
*/

--Disables the parsing of commands to replace substitution variables with their values
set define off;

--belangrijk zodat Engelse afkortingen van maanden goed worden herkend dus 
-- MAR is March (Engels) en MRT is Maart (Nederlands)
ALTER SESSION set NLS_DATE_LANGUAGE = 'AMERICAN';

DROP TABLE ACCOUNT CASCADE CONSTRAINTS;
DROP TABLE ACCOUNT_BIJDRAGE CASCADE CONSTRAINTS;
DROP TABLE BERICHT CASCADE CONSTRAINTS;
DROP TABLE BESTAND CASCADE CONSTRAINTS;
DROP TABLE BIJDRAGE CASCADE CONSTRAINTS;
DROP TABLE CATEGORIE CASCADE CONSTRAINTS;
DROP TABLE EVENT CASCADE CONSTRAINTS;
DROP TABLE GEBRUIKERSGROEP CASCADE CONSTRAINTS;
DROP TABLE LOCATIE CASCADE CONSTRAINTS;
DROP TABLE PERSOON CASCADE CONSTRAINTS;
DROP TABLE PLEK CASCADE CONSTRAINTS;
DROP TABLE PLEK_RESERVERING CASCADE CONSTRAINTS;
DROP TABLE PLEK_SPECIFICATIE CASCADE CONSTRAINTS;
DROP TABLE POLSBANDJE CASCADE CONSTRAINTS;
DROP TABLE PRODUCT CASCADE CONSTRAINTS;
DROP TABLE PRODUCTCAT CASCADE CONSTRAINTS;
DROP TABLE PRODUCTEXEMPLAAR CASCADE CONSTRAINTS;
DROP TABLE RESERVERING CASCADE CONSTRAINTS;
DROP TABLE RESERVERING_POLSBANDJE CASCADE CONSTRAINTS;
DROP TABLE VERHUUR CASCADE CONSTRAINTS;
DROP TABLE SPECIFICATIE CASCADE CONSTRAINTS;

DROP SEQUENCE ACCOUNT_BIJDRAGE_FCSEQ;
DROP SEQUENCE ACCOUNT_FCSEQ;
DROP SEQUENCE BIJDRAGE_FCSEQ;
DROP SEQUENCE EVENT_FCSEQ;
DROP SEQUENCE GEBRUIKERSGROEP_FCSEQ;
DROP SEQUENCE LOCATIE_FCSEQ;
DROP SEQUENCE PERSOON_FCSEQ;
DROP SEQUENCE PLEK_FCSEQ;
DROP SEQUENCE PLEK_RESERVERING_FCSEQ;
DROP SEQUENCE PLEK_SPECIFICATIE_FCSEQ;
DROP SEQUENCE POLSBANDJE_FCSEQ;
DROP SEQUENCE PRODUCTCAT_FCSEQ;
DROP SEQUENCE PRODUCTEXEMPLAAR_FCSEQ;
DROP SEQUENCE PRODUCT_FCSEQ;
DROP SEQUENCE RESERVERING_FCSEQ;
DROP SEQUENCE RESERVERING_POLSBANDJE_FCSEQ;
DROP SEQUENCE SPECIFICATIE_FCSEQ;
DROP SEQUENCE VERHUUR_FCSEQ;

--------------------------------------------------------
--  File created - donderdag-oktober-23-2014   
--------------------------------------------------------
--------------------------------------------------------
--  DDL for Sequence ACCOUNT_BIJDRAGE_FCSEQ
--------------------------------------------------------

   CREATE SEQUENCE  "ACCOUNT_BIJDRAGE_FCSEQ"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 5 CACHE 20 NOORDER  NOCYCLE ;
--------------------------------------------------------
--  DDL for Sequence ACCOUNT_FCSEQ
--------------------------------------------------------

   CREATE SEQUENCE  "ACCOUNT_FCSEQ"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 5 CACHE 20 NOORDER  NOCYCLE ;
--------------------------------------------------------
--  DDL for Sequence BIJDRAGE_FCSEQ
--------------------------------------------------------

   CREATE SEQUENCE  "BIJDRAGE_FCSEQ"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 15 CACHE 20 NOORDER  NOCYCLE ;
--------------------------------------------------------
--  DDL for Sequence EVENT_FCSEQ
--------------------------------------------------------

   CREATE SEQUENCE  "EVENT_FCSEQ"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 2 CACHE 20 NOORDER  NOCYCLE ;
--------------------------------------------------------
--  DDL for Sequence GEBRUIKERSGROEP_FCSEQ
--------------------------------------------------------

   CREATE SEQUENCE  "GEBRUIKERSGROEP_FCSEQ"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 3 CACHE 20 NOORDER  NOCYCLE ;
--------------------------------------------------------
--  DDL for Sequence LOCATIE_FCSEQ
--------------------------------------------------------

   CREATE SEQUENCE  "LOCATIE_FCSEQ"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 2 CACHE 20 NOORDER  NOCYCLE ;
--------------------------------------------------------
--  DDL for Sequence PERSOON_FCSEQ
--------------------------------------------------------

   CREATE SEQUENCE  "PERSOON_FCSEQ"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 2 CACHE 20 NOORDER  NOCYCLE ;
--------------------------------------------------------
--  DDL for Sequence PLEK_FCSEQ
--------------------------------------------------------

   CREATE SEQUENCE  "PLEK_FCSEQ"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 4 CACHE 20 NOORDER  NOCYCLE ;
--------------------------------------------------------
--  DDL for Sequence PLEK_RESERVERING_FCSEQ
--------------------------------------------------------

   CREATE SEQUENCE  "PLEK_RESERVERING_FCSEQ"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 3 CACHE 20 NOORDER  NOCYCLE ;
--------------------------------------------------------
--  DDL for Sequence PLEK_SPECIFICATIE_FCSEQ
--------------------------------------------------------

   CREATE SEQUENCE  "PLEK_SPECIFICATIE_FCSEQ"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 10 CACHE 20 NOORDER  NOCYCLE ;
--------------------------------------------------------
--  DDL for Sequence POLSBANDJE_FCSEQ
--------------------------------------------------------

   CREATE SEQUENCE  "POLSBANDJE_FCSEQ"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 5 CACHE 20 NOORDER  NOCYCLE ;
--------------------------------------------------------
--  DDL for Sequence PRODUCTCAT_FCSEQ
--------------------------------------------------------

   CREATE SEQUENCE  "PRODUCTCAT_FCSEQ"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 5 CACHE 20 NOORDER  NOCYCLE ;
--------------------------------------------------------
--  DDL for Sequence PRODUCTEXEMPLAAR_FCSEQ
--------------------------------------------------------

   CREATE SEQUENCE  "PRODUCTEXEMPLAAR_FCSEQ"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 7 CACHE 20 NOORDER  NOCYCLE ;
--------------------------------------------------------
--  DDL for Sequence PRODUCT_FCSEQ
--------------------------------------------------------

   CREATE SEQUENCE  "PRODUCT_FCSEQ"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 4 CACHE 20 NOORDER  NOCYCLE ;
--------------------------------------------------------
--  DDL for Sequence RESERVERING_FCSEQ
--------------------------------------------------------

   CREATE SEQUENCE  "RESERVERING_FCSEQ"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 2 CACHE 20 NOORDER  NOCYCLE ;
--------------------------------------------------------
--  DDL for Sequence RESERVERING_POLSBANDJE_FCSEQ
--------------------------------------------------------

   CREATE SEQUENCE  "RESERVERING_POLSBANDJE_FCSEQ"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 5 CACHE 20 NOORDER  NOCYCLE ;
--------------------------------------------------------
--  DDL for Sequence SPECIFICATIE_FCSEQ
--------------------------------------------------------

   CREATE SEQUENCE  "SPECIFICATIE_FCSEQ"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 6 CACHE 20 NOORDER  NOCYCLE ;
--------------------------------------------------------
--  DDL for Sequence VERHUUR_FCSEQ
--------------------------------------------------------

   CREATE SEQUENCE  "VERHUUR_FCSEQ"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 5 CACHE 20 NOORDER  NOCYCLE ;
--------------------------------------------------------
--  DDL for Table ACCOUNT
--------------------------------------------------------

  CREATE TABLE "ACCOUNT" 
   (	"ID" NUMBER(10,0), 
	"gebruikersgroep_id" NUMBER(10,0), 
	"gebruikersnaam" NVARCHAR2(255), 
	"wachtwoord" NVARCHAR2(255), 
	"email" NVARCHAR2(255), 
	"activatiehash" NVARCHAR2(255), 
	"geactiveerd" NUMBER(1,0) DEFAULT (0)
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Table ACCOUNT_BIJDRAGE
--------------------------------------------------------

  CREATE TABLE "ACCOUNT_BIJDRAGE" 
   (	"ID" NUMBER(10,0), 
	"account_id" NUMBER(10,0), 
	"bijdrage_id" NUMBER(10,0), 
	"like" NUMBER(1,0) DEFAULT (0), 
	"ongewenst" NUMBER(1,0) DEFAULT (0)
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Table BERICHT
--------------------------------------------------------

  CREATE TABLE "BERICHT" 
   (	"bijdrage_id" NUMBER(10,0), 
	"bijdrage_id_over" NUMBER(10,0), 
	"titel" NVARCHAR2(255), 
	"inhoud" NCLOB
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" 
 LOB ("inhoud") STORE AS BASICFILE (
  TABLESPACE "USERS" ENABLE STORAGE IN ROW CHUNK 8192 RETENTION 
  NOCACHE LOGGING 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)) ;
--------------------------------------------------------
--  DDL for Table BESTAND
--------------------------------------------------------

  CREATE TABLE "BESTAND" 
   (	"bijdrage_id" NUMBER(10,0), 
	"categorie_id" NUMBER(10,0), 
	"bestandslocatie" NVARCHAR2(255), 
	"grootte" NUMBER(10,0) DEFAULT (0)
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Table BIJDRAGE
--------------------------------------------------------

  CREATE TABLE "BIJDRAGE" 
   (	"ID" NUMBER(10,0), 
	"account_id" NUMBER(10,0), 
	"datum" DATE, 
	"soort" NVARCHAR2(255)
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Table CATEGORIE
--------------------------------------------------------

  CREATE TABLE "CATEGORIE" 
   (	"bijdrage_id" NUMBER(10,0), 
	"categorie_id" NUMBER(10,0), 
	"naam" NVARCHAR2(255)
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Table EVENT
--------------------------------------------------------

  CREATE TABLE "EVENT" 
   (	"ID" NUMBER(10,0), 
	"locatie_id" NUMBER(10,0), 
	"naam" NVARCHAR2(255), 
	"datumstart" DATE, 
	"datumEinde" DATE, 
	"maxBezoekers" NUMBER(10,0) DEFAULT (0)
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Table GEBRUIKERSGROEP
--------------------------------------------------------

  CREATE TABLE "GEBRUIKERSGROEP" 
   (	"ID" NUMBER(10,0), 
	"naam" NVARCHAR2(255)
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Table LOCATIE
--------------------------------------------------------

  CREATE TABLE "LOCATIE" 
   (	"ID" NUMBER(10,0), 
	"naam" NVARCHAR2(255), 
	"straat" NVARCHAR2(255), 
	"nr" NVARCHAR2(255), 
	"postcode" NVARCHAR2(255), 
	"plaats" NVARCHAR2(255)
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Table PERSOON
--------------------------------------------------------

  CREATE TABLE "PERSOON" 
   (	"ID" NUMBER(10,0), 
	"voornaam" NVARCHAR2(255), 
	"tussenvoegsel" NVARCHAR2(255), 
	"achternaam" NVARCHAR2(255), 
	"straat" NVARCHAR2(255), 
	"huisnr" NVARCHAR2(255), 
	"woonplaats" NVARCHAR2(255), 
	"banknr" NVARCHAR2(255)
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Table PLEK
--------------------------------------------------------

  CREATE TABLE "PLEK" 
   (	"ID" NUMBER(10,0), 
	"locatie_id" NUMBER(10,0), 
	"nummer" NVARCHAR2(255), 
	"capaciteit" NUMBER(10,0) DEFAULT (0)
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Table PLEK_RESERVERING
--------------------------------------------------------

  CREATE TABLE "PLEK_RESERVERING" 
   (	"ID" NUMBER(10,0), 
	"plek_id" NUMBER(10,0), 
	"reservering_id" NUMBER(10,0)
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Table PLEK_SPECIFICATIE
--------------------------------------------------------

  CREATE TABLE "PLEK_SPECIFICATIE" 
   (	"id" NUMBER(10,0), 
	"specificatie_id" NUMBER(10,0), 
	"plek_id" NUMBER(10,0), 
	"waarde" NVARCHAR2(255)
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Table POLSBANDJE
--------------------------------------------------------

  CREATE TABLE "POLSBANDJE" 
   (	"ID" NUMBER(10,0), 
	"rfid" NVARCHAR2(255), 
	"nummer" NUMBER(10,0) DEFAULT (0), 
	"actief" NUMBER(1,0) DEFAULT (0)
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Table PRODUCT
--------------------------------------------------------

  CREATE TABLE "PRODUCT" 
   (	"ID" NUMBER(10,0), 
	"productcat_id" NUMBER(10,0), 
	"merk" NVARCHAR2(255), 
	"serie" NVARCHAR2(255), 
	"typenummer" NVARCHAR2(255), 
	"prijs" NUMBER(19,2) DEFAULT (0)
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Table PRODUCTCAT
--------------------------------------------------------

  CREATE TABLE "PRODUCTCAT" 
   (	"ID" NUMBER(10,0), 
	"productcat_id" NUMBER(10,0), 
	"naam" NVARCHAR2(255)
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Table PRODUCTEXEMPLAAR
--------------------------------------------------------

  CREATE TABLE "PRODUCTEXEMPLAAR" 
   (	"ID" NUMBER(10,0), 
	"product_id" NUMBER(10,0), 
	"volgnummer" NUMBER(10,0) DEFAULT (0), 
	"barcode" NVARCHAR2(255)
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Table RESERVERING
--------------------------------------------------------

  CREATE TABLE "RESERVERING" 
   (	"ID" NUMBER(10,0), 
	"persoon_id" NUMBER(10,0), 
	"datumStart" DATE, 
	"datumEinde" DATE, 
	"betaald" NUMBER(1,0) DEFAULT (0)
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Table RESERVERING_POLSBANDJE
--------------------------------------------------------

  CREATE TABLE "RESERVERING_POLSBANDJE" 
   (	"ID" NUMBER(10,0), 
	"reservering_id" NUMBER(10,0), 
	"polsbandje_id" NUMBER(10,0), 
	"account_id" NUMBER(10,0), 
	"aanwezig" NUMBER(1,0) DEFAULT (0)
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Table SPECIFICATIE
--------------------------------------------------------

  CREATE TABLE "SPECIFICATIE" 
   (	"ID" NUMBER(10,0), 
	"naam" NVARCHAR2(255)
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Table VERHUUR
--------------------------------------------------------

  CREATE TABLE "VERHUUR" 
   (	"ID" NUMBER(10,0), 
	"productexemplaar_id" NUMBER(10,0), 
	"res_pb_id" NUMBER(10,0), 
	"datumIn" DATE, 
	"datumUit" DATE, 
	"prijs" NUMBER(19,2) DEFAULT (0), 
	"betaald" NUMBER(1,0) DEFAULT (0)
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
REM INSERTING into ACCOUNT
SET DEFINE OFF;
Insert into ACCOUNT (ID,"gebruikersgroep_id","gebruikersnaam","wachtwoord","email","activatiehash","geactiveerd") values (1,1,'admin','admin','admin@bla.nl','af1a67e7919c0e9539fac8eb0828f208',1);
Insert into ACCOUNT (ID,"gebruikersgroep_id","gebruikersnaam","wachtwoord","email","activatiehash","geactiveerd") values (2,2,'JanPietersen','geheim','JanPietersen@temp.nl','ee41bbbb4c16dfe60f17484439043f97',1);
Insert into ACCOUNT (ID,"gebruikersgroep_id","gebruikersnaam","wachtwoord","email","activatiehash","geactiveerd") values (3,2,'WillemVries','geheim','WillemVries@jaja.nl','69e60f8670abebc6b4d1cb6f183890b0',1);
Insert into ACCOUNT (ID,"gebruikersgroep_id","gebruikersnaam","wachtwoord","email","activatiehash","geactiveerd") values (4,2,'KlaasVaak','geheim','KlaasVaak@jaja.nl','47fe977ab3b4ecfc5d6103b3f5dc107f',1);
REM INSERTING into ACCOUNT_BIJDRAGE
SET DEFINE OFF;
Insert into ACCOUNT_BIJDRAGE (ID,"account_id","bijdrage_id","like","ongewenst") values (1,3,11,1,0);
Insert into ACCOUNT_BIJDRAGE (ID,"account_id","bijdrage_id","like","ongewenst") values (2,3,7,1,0);
Insert into ACCOUNT_BIJDRAGE (ID,"account_id","bijdrage_id","like","ongewenst") values (3,3,8,1,0);
Insert into ACCOUNT_BIJDRAGE (ID,"account_id","bijdrage_id","like","ongewenst") values (4,3,10,0,0);
REM INSERTING into BERICHT
SET DEFINE OFF;
Insert into BERICHT ("bijdrage_id","bijdrage_id_over","titel","inhoud") values (11,14,'Jan Smit - Mij en ik','Ik heb het nieuwe album van Jan Smit gedeeld genaamd Mij en ik. Echt een toppertje!');
Insert into BERICHT ("bijdrage_id","bijdrage_id_over","titel","inhoud") values (13,11,null,'Mwha ik vind het niet zo''n goed album. Kwaliteit van de .mp3''s is wel goed!');
REM INSERTING into BESTAND
SET DEFINE OFF;
Insert into BESTAND ("bijdrage_id","categorie_id","bestandslocatie","grootte") values (7,6,'Jij en ik/01 - Mooier dan ik dacht.mp3',3500000);
Insert into BESTAND ("bijdrage_id","categorie_id","bestandslocatie","grootte") values (8,6,'Jij en ik/02 - Als ik maar even bij jouw kan zijn.mp3',3000000);
Insert into BESTAND ("bijdrage_id","categorie_id","bestandslocatie","grootte") values (10,9,'terrein.jpg',250000);
REM INSERTING into BIJDRAGE
SET DEFINE OFF;
Insert into BIJDRAGE (ID,"account_id","datum","soort") values (1,1,to_date('14-OCT-14 00:00:00','DD-MON-RR HH24:MI:SS'),'categorie');
Insert into BIJDRAGE (ID,"account_id","datum","soort") values (2,1,to_date('14-OCT-14 00:00:00','DD-MON-RR HH24:MI:SS'),'categorie');
Insert into BIJDRAGE (ID,"account_id","datum","soort") values (3,1,to_date('14-OCT-14 00:00:00','DD-MON-RR HH24:MI:SS'),'categorie');
Insert into BIJDRAGE (ID,"account_id","datum","soort") values (4,1,to_date('14-OCT-14 00:00:00','DD-MON-RR HH24:MI:SS'),'categorie');
Insert into BIJDRAGE (ID,"account_id","datum","soort") values (5,1,to_date('14-OCT-14 00:00:00','DD-MON-RR HH24:MI:SS'),'categorie');
Insert into BIJDRAGE (ID,"account_id","datum","soort") values (6,2,to_date('14-OCT-14 00:00:00','DD-MON-RR HH24:MI:SS'),'categorie');
Insert into BIJDRAGE (ID,"account_id","datum","soort") values (7,2,to_date('14-OCT-14 00:00:00','DD-MON-RR HH24:MI:SS'),'bestand');
Insert into BIJDRAGE (ID,"account_id","datum","soort") values (8,2,to_date('14-OCT-14 00:00:00','DD-MON-RR HH24:MI:SS'),'bestand');
Insert into BIJDRAGE (ID,"account_id","datum","soort") values (9,2,to_date('14-OCT-14 00:00:00','DD-MON-RR HH24:MI:SS'),'categorie');
Insert into BIJDRAGE (ID,"account_id","datum","soort") values (10,2,to_date('14-OCT-14 00:00:00','DD-MON-RR HH24:MI:SS'),'bestand');
Insert into BIJDRAGE (ID,"account_id","datum","soort") values (11,2,to_date('27-OCT-13 00:00:00','DD-MON-RR HH24:MI:SS'),'bericht');
Insert into BIJDRAGE (ID,"account_id","datum","soort") values (13,3,to_date('28-OCT-13 00:00:00','DD-MON-RR HH24:MI:SS'),'bericht');
Insert into BIJDRAGE (ID,"account_id","datum","soort") values (14,2,to_date('14-OCT-13 00:00:00','DD-MON-RR HH24:MI:SS'),'categorie');
REM INSERTING into CATEGORIE
SET DEFINE OFF;
Insert into CATEGORIE ("bijdrage_id","categorie_id","naam") values (1,null,'Muziek');
Insert into CATEGORIE ("bijdrage_id","categorie_id","naam") values (2,null,'Films');
Insert into CATEGORIE ("bijdrage_id","categorie_id","naam") values (3,null,'TV Shows');
Insert into CATEGORIE ("bijdrage_id","categorie_id","naam") values (4,null,'Fotos');
Insert into CATEGORIE ("bijdrage_id","categorie_id","naam") values (5,1,'Nederlandse artiesten');
Insert into CATEGORIE ("bijdrage_id","categorie_id","naam") values (6,5,'Jan Smit');
Insert into CATEGORIE ("bijdrage_id","categorie_id","naam") values (9,4,'SME De Valkenhof 2014');
Insert into CATEGORIE ("bijdrage_id","categorie_id","naam") values (14,6,'Jij en ik');
REM INSERTING into EVENT
SET DEFINE OFF;
Insert into EVENT (ID,"locatie_id","naam","datumstart","datumEinde","maxBezoekers") values (1,1,'SME De Valkenhof 2014',to_date('27-DEC-13 00:00:00','DD-MON-RR HH24:MI:SS'),to_date('30-DEC-13 00:00:00','DD-MON-RR HH24:MI:SS'),100);
REM INSERTING into GEBRUIKERSGROEP
SET DEFINE OFF;
Insert into GEBRUIKERSGROEP (ID,"naam") values (1,'Admin');
Insert into GEBRUIKERSGROEP (ID,"naam") values (2,'Bezoekers');
REM INSERTING into LOCATIE
SET DEFINE OFF;
Insert into LOCATIE (ID,"naam","straat","nr","postcode","plaats") values (1,'Camping De Valkenhof',null,null,null,null);
REM INSERTING into PERSOON
SET DEFINE OFF;
Insert into PERSOON (ID,"voornaam","tussenvoegsel","achternaam","straat","huisnr","woonplaats","banknr") values (1,'Jan',null,'Pietersen','Rachelsmolen','1','5611MA','NL91ABNA0417164300');
REM INSERTING into PLEK
SET DEFINE OFF;
Insert into PLEK (ID,"locatie_id","nummer","capaciteit") values (1,1,'1',5);
Insert into PLEK (ID,"locatie_id","nummer","capaciteit") values (2,1,'2',5);
Insert into PLEK (ID,"locatie_id","nummer","capaciteit") values (3,1,'3',5);
REM INSERTING into PLEK_RESERVERING
SET DEFINE OFF;
Insert into PLEK_RESERVERING (ID,"plek_id","reservering_id") values (1,1,1);
Insert into PLEK_RESERVERING (ID,"plek_id","reservering_id") values (2,2,1);
REM INSERTING into PLEK_SPECIFICATIE
SET DEFINE OFF;
Insert into PLEK_SPECIFICATIE ("id","specificatie_id","plek_id","waarde") values (1,2,1,'ja');
Insert into PLEK_SPECIFICATIE ("id","specificatie_id","plek_id","waarde") values (2,2,2,'ja');
Insert into PLEK_SPECIFICATIE ("id","specificatie_id","plek_id","waarde") values (3,3,3,'ja');
Insert into PLEK_SPECIFICATIE ("id","specificatie_id","plek_id","waarde") values (4,4,1,'30');
Insert into PLEK_SPECIFICATIE ("id","specificatie_id","plek_id","waarde") values (5,4,2,'30');
Insert into PLEK_SPECIFICATIE ("id","specificatie_id","plek_id","waarde") values (6,4,3,'30');
Insert into PLEK_SPECIFICATIE ("id","specificatie_id","plek_id","waarde") values (7,5,1,'ja');
Insert into PLEK_SPECIFICATIE ("id","specificatie_id","plek_id","waarde") values (8,5,2,'ja');
Insert into PLEK_SPECIFICATIE ("id","specificatie_id","plek_id","waarde") values (9,5,3,'nee');
REM INSERTING into POLSBANDJE
SET DEFINE OFF;
Insert into POLSBANDJE (ID,"rfid","nummer","actief") values (1,'42977fbd8b23ad459ee8a135292b87af',123456789,1);
Insert into POLSBANDJE (ID,"rfid","nummer","actief") values (2,'db47aac789fa79ad1eba14030d95062b',123456788,1);
Insert into POLSBANDJE (ID,"rfid","nummer","actief") values (3,'9a15493038a7365e9ae4c0cfba1136cf',123456787,1);
Insert into POLSBANDJE (ID,"rfid","nummer","actief") values (4,'ad03c9b1601cd50b9b0b1ed4ac74a724',123456786,1);
REM INSERTING into PRODUCT
SET DEFINE OFF;
Insert into PRODUCT (ID,"productcat_id","merk","serie","typenummer","prijs") values (1,1,'Samsung','Nexus 10','1000',10);
Insert into PRODUCT (ID,"productcat_id","merk","serie","typenummer","prijs") values (2,2,'Logitech','Mouse MX Revolution Laser Cordless','1001',2);
Insert into PRODUCT (ID,"productcat_id","merk","serie","typenummer","prijs") values (3,3,'Asus','RT-N66U','1002',4);
REM INSERTING into PRODUCTCAT
SET DEFINE OFF;
Insert into PRODUCTCAT (ID,"productcat_id","naam") values (1,4,'>9.0 inch');
Insert into PRODUCTCAT (ID,"productcat_id","naam") values (2,null,'Muis (USB)');
Insert into PRODUCTCAT (ID,"productcat_id","naam") values (3,null,'Wireless n Router');
Insert into PRODUCTCAT (ID,"productcat_id","naam") values (4,null,'Tablets');
REM INSERTING into PRODUCTEXEMPLAAR
SET DEFINE OFF;
Insert into PRODUCTEXEMPLAAR (ID,"product_id","volgnummer","barcode") values (1,1,1,'1000.001');
Insert into PRODUCTEXEMPLAAR (ID,"product_id","volgnummer","barcode") values (2,1,2,'1000.002');
Insert into PRODUCTEXEMPLAAR (ID,"product_id","volgnummer","barcode") values (3,1,3,'1000.003');
Insert into PRODUCTEXEMPLAAR (ID,"product_id","volgnummer","barcode") values (4,2,1,'1001.001');
Insert into PRODUCTEXEMPLAAR (ID,"product_id","volgnummer","barcode") values (5,2,2,'1001.002');
Insert into PRODUCTEXEMPLAAR (ID,"product_id","volgnummer","barcode") values (6,3,1,'1002.001');
REM INSERTING into RESERVERING
SET DEFINE OFF;
Insert into RESERVERING (ID,"persoon_id","datumStart","datumEinde","betaald") values (1,1,to_date('27-DEC-13 00:00:00','DD-MON-RR HH24:MI:SS'),to_date('30-DEC-13 00:00:00','DD-MON-RR HH24:MI:SS'),1);
REM INSERTING into RESERVERING_POLSBANDJE
SET DEFINE OFF;
Insert into RESERVERING_POLSBANDJE (ID,"reservering_id","polsbandje_id","account_id","aanwezig") values (1,1,1,1,1);
Insert into RESERVERING_POLSBANDJE (ID,"reservering_id","polsbandje_id","account_id","aanwezig") values (2,1,2,2,1);
Insert into RESERVERING_POLSBANDJE (ID,"reservering_id","polsbandje_id","account_id","aanwezig") values (3,1,3,3,0);
Insert into RESERVERING_POLSBANDJE (ID,"reservering_id","polsbandje_id","account_id","aanwezig") values (4,1,4,4,0);
REM INSERTING into SPECIFICATIE
SET DEFINE OFF;
Insert into SPECIFICATIE (ID,"naam") values (4,'afmeting');
Insert into SPECIFICATIE (ID,"naam") values (2,'comfortplek');
Insert into SPECIFICATIE (ID,"naam") values (3,'handicap geschikt');
Insert into SPECIFICATIE (ID,"naam") values (5,'kraan beschikbaar');
REM INSERTING into VERHUUR
SET DEFINE OFF;
Insert into VERHUUR (ID,"productexemplaar_id","res_pb_id","datumIn","datumUit","prijs","betaald") values (1,1,1,to_date('27-DEC-13 00:00:00','DD-MON-RR HH24:MI:SS'),to_date('30-DEC-13 00:00:00','DD-MON-RR HH24:MI:SS'),10,1);
Insert into VERHUUR (ID,"productexemplaar_id","res_pb_id","datumIn","datumUit","prijs","betaald") values (2,2,2,to_date('27-DEC-13 00:00:00','DD-MON-RR HH24:MI:SS'),to_date('30-DEC-13 00:00:00','DD-MON-RR HH24:MI:SS'),10,1);
Insert into VERHUUR (ID,"productexemplaar_id","res_pb_id","datumIn","datumUit","prijs","betaald") values (3,4,3,to_date('27-DEC-13 00:00:00','DD-MON-RR HH24:MI:SS'),to_date('30-DEC-13 00:00:00','DD-MON-RR HH24:MI:SS'),2,1);
Insert into VERHUUR (ID,"productexemplaar_id","res_pb_id","datumIn","datumUit","prijs","betaald") values (4,6,3,to_date('27-DEC-13 00:00:00','DD-MON-RR HH24:MI:SS'),to_date('30-DEC-13 00:00:00','DD-MON-RR HH24:MI:SS'),4,1);
--------------------------------------------------------
--  DDL for Index reservering_id2
--------------------------------------------------------

  CREATE INDEX "reservering_id2" ON "PLEK_RESERVERING" ("reservering_id") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index categorie_id
--------------------------------------------------------

  CREATE INDEX "categorie_id" ON "CATEGORIE" ("categorie_id") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index PrimaryKey8
--------------------------------------------------------

  CREATE UNIQUE INDEX "PrimaryKey8" ON "PRODUCTCAT" ("ID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index bijdrage_id
--------------------------------------------------------

  CREATE INDEX "bijdrage_id" ON "ACCOUNT_BIJDRAGE" ("bijdrage_id") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index postcode
--------------------------------------------------------

  CREATE INDEX "postcode" ON "LOCATIE" ("postcode") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index account_id1
--------------------------------------------------------

  CREATE INDEX "account_id1" ON "BIJDRAGE" ("account_id") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index account_id2
--------------------------------------------------------

  CREATE INDEX "account_id2" ON "ACCOUNT_BIJDRAGE" ("account_id") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index naam3
--------------------------------------------------------

  CREATE UNIQUE INDEX "naam3" ON "SPECIFICATIE" ("naam") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index locatie_id
--------------------------------------------------------

  CREATE INDEX "locatie_id" ON "EVENT" ("locatie_id") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index PrimaryKey17
--------------------------------------------------------

  CREATE UNIQUE INDEX "PrimaryKey17" ON "POLSBANDJE" ("ID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index gebruikersnaam
--------------------------------------------------------

  CREATE UNIQUE INDEX "gebruikersnaam" ON "ACCOUNT" ("gebruikersnaam") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index plek_reservering
--------------------------------------------------------

  CREATE UNIQUE INDEX "plek_reservering" ON "PLEK_RESERVERING" ("plek_id", "reservering_id") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index PrimaryKey11
--------------------------------------------------------

  CREATE UNIQUE INDEX "PrimaryKey11" ON "ACCOUNT_BIJDRAGE" ("ID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index plek_specificatie
--------------------------------------------------------

  CREATE UNIQUE INDEX "plek_specificatie" ON "PLEK_SPECIFICATIE" ("plek_id", "specificatie_id") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index account_id
--------------------------------------------------------

  CREATE INDEX "account_id" ON "RESERVERING_POLSBANDJE" ("account_id") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index PrimaryKey7
--------------------------------------------------------

  CREATE UNIQUE INDEX "PrimaryKey7" ON "EVENT" ("ID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index polsbandje_id
--------------------------------------------------------

  CREATE INDEX "polsbandje_id" ON "RESERVERING_POLSBANDJE" ("polsbandje_id") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index PrimaryKey9
--------------------------------------------------------

  CREATE UNIQUE INDEX "PrimaryKey9" ON "CATEGORIE" ("bijdrage_id") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index plek_id
--------------------------------------------------------

  CREATE INDEX "plek_id" ON "PLEK_RESERVERING" ("plek_id") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index locatie_id1
--------------------------------------------------------

  CREATE INDEX "locatie_id1" ON "PLEK" ("locatie_id") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index PrimaryKey2
--------------------------------------------------------

  CREATE UNIQUE INDEX "PrimaryKey2" ON "PERSOON" ("ID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index gebruikersgroep_id
--------------------------------------------------------

  CREATE INDEX "gebruikersgroep_id" ON "ACCOUNT" ("gebruikersgroep_id") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index naam
--------------------------------------------------------

  CREATE UNIQUE INDEX "naam" ON "LOCATIE" ("naam") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index reservering_account
--------------------------------------------------------

  CREATE UNIQUE INDEX "reservering_account" ON "RESERVERING_POLSBANDJE" ("reservering_id", "account_id") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index PrimaryKey6
--------------------------------------------------------

  CREATE UNIQUE INDEX "PrimaryKey6" ON "RESERVERING" ("ID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index naam1
--------------------------------------------------------

  CREATE UNIQUE INDEX "naam1" ON "PRODUCTCAT" ("naam") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index PrimaryKey1
--------------------------------------------------------

  CREATE UNIQUE INDEX "PrimaryKey1" ON "RESERVERING_POLSBANDJE" ("ID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index RFID
--------------------------------------------------------

  CREATE UNIQUE INDEX "RFID" ON "POLSBANDJE" ("rfid") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index locatie_nummer
--------------------------------------------------------

  CREATE UNIQUE INDEX "locatie_nummer" ON "PLEK" ("locatie_id", "nummer") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index PRODUCTVERHUUR
--------------------------------------------------------

  CREATE INDEX "PRODUCTVERHUUR" ON "VERHUUR" ("productexemplaar_id") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index PrimaryKey13
--------------------------------------------------------

  CREATE UNIQUE INDEX "PrimaryKey13" ON "BIJDRAGE" ("ID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index persoon_id
--------------------------------------------------------

  CREATE INDEX "persoon_id" ON "RESERVERING" ("persoon_id") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index naam_datumStart
--------------------------------------------------------

  CREATE UNIQUE INDEX "naam_datumStart" ON "EVENT" ("naam", "datumstart") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index PrimaryKey14
--------------------------------------------------------

  CREATE UNIQUE INDEX "PrimaryKey14" ON "LOCATIE" ("ID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index PrimaryKey16
--------------------------------------------------------

  CREATE UNIQUE INDEX "PrimaryKey16" ON "VERHUUR" ("ID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index productcat_id
--------------------------------------------------------

  CREATE INDEX "productcat_id" ON "PRODUCTCAT" ("productcat_id") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index reservering_polsbandje
--------------------------------------------------------

  CREATE UNIQUE INDEX "reservering_polsbandje" ON "RESERVERING_POLSBANDJE" ("reservering_id", "polsbandje_id") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index naam2
--------------------------------------------------------

  CREATE UNIQUE INDEX "naam2" ON "GEBRUIKERSGROEP" ("naam") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index nummer
--------------------------------------------------------

  CREATE UNIQUE INDEX "nummer" ON "POLSBANDJE" ("nummer") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index reservering_id
--------------------------------------------------------

  CREATE INDEX "reservering_id" ON "VERHUUR" ("res_pb_id") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index PrimaryKey15
--------------------------------------------------------

  CREATE UNIQUE INDEX "PrimaryKey15" ON "GEBRUIKERSGROEP" ("ID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index categorie_id1
--------------------------------------------------------

  CREATE INDEX "categorie_id1" ON "BESTAND" ("categorie_id") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index PrimaryKey4
--------------------------------------------------------

  CREATE UNIQUE INDEX "PrimaryKey4" ON "BESTAND" ("bijdrage_id") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index PrimaryKey18
--------------------------------------------------------

  CREATE UNIQUE INDEX "PrimaryKey18" ON "PRODUCT" ("ID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index PrimaryKey19
--------------------------------------------------------

  CREATE UNIQUE INDEX "PrimaryKey19" ON "PRODUCTEXEMPLAAR" ("ID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index PrimaryKey3
--------------------------------------------------------

  CREATE UNIQUE INDEX "PrimaryKey3" ON "ACCOUNT" ("ID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index plek_id1
--------------------------------------------------------

  CREATE INDEX "plek_id1" ON "PLEK_SPECIFICATIE" ("plek_id") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index BIJDRAGEBERICHT1
--------------------------------------------------------

  CREATE INDEX "BIJDRAGEBERICHT1" ON "BERICHT" ("bijdrage_id_over") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index email
--------------------------------------------------------

  CREATE UNIQUE INDEX "email" ON "ACCOUNT" ("email") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index PrimaryKey12
--------------------------------------------------------

  CREATE UNIQUE INDEX "PrimaryKey12" ON "PLEK_RESERVERING" ("ID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index PrimaryKey20
--------------------------------------------------------

  CREATE UNIQUE INDEX "PrimaryKey20" ON "PLEK" ("ID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index account_bijdrage
--------------------------------------------------------

  CREATE UNIQUE INDEX "account_bijdrage" ON "ACCOUNT_BIJDRAGE" ("account_id", "bijdrage_id") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index SPECIFICATIEPLEK_SPECIFICATIE
--------------------------------------------------------

  CREATE INDEX "SPECIFICATIEPLEK_SPECIFICATIE" ON "PLEK_SPECIFICATIE" ("specificatie_id") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index product_volgnummer
--------------------------------------------------------

  CREATE UNIQUE INDEX "product_volgnummer" ON "PRODUCTEXEMPLAAR" ("product_id", "volgnummer") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index PrimaryKey10
--------------------------------------------------------

  CREATE UNIQUE INDEX "PrimaryKey10" ON "SPECIFICATIE" ("ID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index PrimaryKey5
--------------------------------------------------------

  CREATE UNIQUE INDEX "PrimaryKey5" ON "PLEK_SPECIFICATIE" ("id") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index reservering_id1
--------------------------------------------------------

  CREATE INDEX "reservering_id1" ON "RESERVERING_POLSBANDJE" ("reservering_id") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index productcat_id1
--------------------------------------------------------

  CREATE INDEX "productcat_id1" ON "PRODUCT" ("productcat_id") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index PRODUCTPRODUCTEXEMPLAAR
--------------------------------------------------------

  CREATE INDEX "PRODUCTPRODUCTEXEMPLAAR" ON "PRODUCTEXEMPLAAR" ("product_id") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index PrimaryKey
--------------------------------------------------------

  CREATE UNIQUE INDEX "PrimaryKey" ON "BERICHT" ("bijdrage_id") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index nummer1
--------------------------------------------------------

  CREATE INDEX "nummer1" ON "PLEK" ("nummer") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index barcode
--------------------------------------------------------

  CREATE UNIQUE INDEX "barcode" ON "PRODUCTEXEMPLAAR" ("barcode") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  Constraints for Table ACCOUNT
--------------------------------------------------------

  ALTER TABLE "ACCOUNT" ADD CONSTRAINT "PrimaryKey3" PRIMARY KEY ("ID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS"  ENABLE;
 
  ALTER TABLE "ACCOUNT" MODIFY ("ID" NOT NULL ENABLE);
 
  ALTER TABLE "ACCOUNT" MODIFY ("gebruikersgroep_id" NOT NULL ENABLE);
 
  ALTER TABLE "ACCOUNT" MODIFY ("email" NOT NULL ENABLE);
 
  ALTER TABLE "ACCOUNT" MODIFY ("activatiehash" NOT NULL ENABLE);
 
  ALTER TABLE "ACCOUNT" MODIFY ("geactiveerd" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table SPECIFICATIE
--------------------------------------------------------

  ALTER TABLE "SPECIFICATIE" ADD CONSTRAINT "PrimaryKey10" PRIMARY KEY ("ID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS"  ENABLE;
 
  ALTER TABLE "SPECIFICATIE" MODIFY ("ID" NOT NULL ENABLE);
 
  ALTER TABLE "SPECIFICATIE" MODIFY ("naam" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table PRODUCTCAT
--------------------------------------------------------

  ALTER TABLE "PRODUCTCAT" ADD CONSTRAINT "PrimaryKey8" PRIMARY KEY ("ID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS"  ENABLE;
 
  ALTER TABLE "PRODUCTCAT" MODIFY ("ID" NOT NULL ENABLE);
 
  ALTER TABLE "PRODUCTCAT" MODIFY ("naam" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table BESTAND
--------------------------------------------------------

  ALTER TABLE "BESTAND" ADD CONSTRAINT "PrimaryKey4" PRIMARY KEY ("bijdrage_id")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS"  ENABLE;
 
  ALTER TABLE "BESTAND" MODIFY ("bijdrage_id" NOT NULL ENABLE);
 
  ALTER TABLE "BESTAND" MODIFY ("categorie_id" NOT NULL ENABLE);
 
  ALTER TABLE "BESTAND" MODIFY ("bestandslocatie" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table PLEK_RESERVERING
--------------------------------------------------------

  ALTER TABLE "PLEK_RESERVERING" ADD CONSTRAINT "PrimaryKey12" PRIMARY KEY ("ID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS"  ENABLE;
 
  ALTER TABLE "PLEK_RESERVERING" MODIFY ("ID" NOT NULL ENABLE);
 
  ALTER TABLE "PLEK_RESERVERING" MODIFY ("plek_id" NOT NULL ENABLE);
 
  ALTER TABLE "PLEK_RESERVERING" MODIFY ("reservering_id" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table PRODUCT
--------------------------------------------------------

  ALTER TABLE "PRODUCT" ADD CONSTRAINT "PrimaryKey18" PRIMARY KEY ("ID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS"  ENABLE;
 
  ALTER TABLE "PRODUCT" MODIFY ("ID" NOT NULL ENABLE);
 
  ALTER TABLE "PRODUCT" MODIFY ("productcat_id" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table PLEK_SPECIFICATIE
--------------------------------------------------------

  ALTER TABLE "PLEK_SPECIFICATIE" ADD CONSTRAINT "PrimaryKey5" PRIMARY KEY ("id")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS"  ENABLE;
 
  ALTER TABLE "PLEK_SPECIFICATIE" MODIFY ("id" NOT NULL ENABLE);
 
  ALTER TABLE "PLEK_SPECIFICATIE" MODIFY ("specificatie_id" NOT NULL ENABLE);
 
  ALTER TABLE "PLEK_SPECIFICATIE" MODIFY ("plek_id" NOT NULL ENABLE);
 
  ALTER TABLE "PLEK_SPECIFICATIE" MODIFY ("waarde" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table GEBRUIKERSGROEP
--------------------------------------------------------

  ALTER TABLE "GEBRUIKERSGROEP" ADD CONSTRAINT "PrimaryKey15" PRIMARY KEY ("ID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS"  ENABLE;
 
  ALTER TABLE "GEBRUIKERSGROEP" MODIFY ("ID" NOT NULL ENABLE);
 
  ALTER TABLE "GEBRUIKERSGROEP" MODIFY ("naam" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table EVENT
--------------------------------------------------------

  ALTER TABLE "EVENT" ADD CONSTRAINT "PrimaryKey7" PRIMARY KEY ("ID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS"  ENABLE;
 
  ALTER TABLE "EVENT" MODIFY ("ID" NOT NULL ENABLE);
 
  ALTER TABLE "EVENT" MODIFY ("naam" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table PRODUCTEXEMPLAAR
--------------------------------------------------------

  ALTER TABLE "PRODUCTEXEMPLAAR" ADD CONSTRAINT "PrimaryKey19" PRIMARY KEY ("ID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS"  ENABLE;
 
  ALTER TABLE "PRODUCTEXEMPLAAR" MODIFY ("ID" NOT NULL ENABLE);
 
  ALTER TABLE "PRODUCTEXEMPLAAR" MODIFY ("product_id" NOT NULL ENABLE);
 
  ALTER TABLE "PRODUCTEXEMPLAAR" MODIFY ("volgnummer" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table POLSBANDJE
--------------------------------------------------------

  ALTER TABLE "POLSBANDJE" ADD CONSTRAINT "PrimaryKey17" PRIMARY KEY ("ID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS"  ENABLE;
 
  ALTER TABLE "POLSBANDJE" MODIFY ("ID" NOT NULL ENABLE);
 
  ALTER TABLE "POLSBANDJE" MODIFY ("rfid" NOT NULL ENABLE);
 
  ALTER TABLE "POLSBANDJE" MODIFY ("nummer" NOT NULL ENABLE);
 
  ALTER TABLE "POLSBANDJE" MODIFY ("actief" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table LOCATIE
--------------------------------------------------------

  ALTER TABLE "LOCATIE" ADD CONSTRAINT "PrimaryKey14" PRIMARY KEY ("ID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS"  ENABLE;
 
  ALTER TABLE "LOCATIE" MODIFY ("ID" NOT NULL ENABLE);
 
  ALTER TABLE "LOCATIE" MODIFY ("naam" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table CATEGORIE
--------------------------------------------------------

  ALTER TABLE "CATEGORIE" ADD CONSTRAINT "PrimaryKey9" PRIMARY KEY ("bijdrage_id")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS"  ENABLE;
 
  ALTER TABLE "CATEGORIE" MODIFY ("bijdrage_id" NOT NULL ENABLE);
 
  ALTER TABLE "CATEGORIE" MODIFY ("naam" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table RESERVERING_POLSBANDJE
--------------------------------------------------------

  ALTER TABLE "RESERVERING_POLSBANDJE" ADD CONSTRAINT "PrimaryKey1" PRIMARY KEY ("ID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS"  ENABLE;
 
  ALTER TABLE "RESERVERING_POLSBANDJE" MODIFY ("ID" NOT NULL ENABLE);
 
  ALTER TABLE "RESERVERING_POLSBANDJE" MODIFY ("reservering_id" NOT NULL ENABLE);
 
  ALTER TABLE "RESERVERING_POLSBANDJE" MODIFY ("polsbandje_id" NOT NULL ENABLE);
 
  ALTER TABLE "RESERVERING_POLSBANDJE" MODIFY ("account_id" NOT NULL ENABLE);
 
  ALTER TABLE "RESERVERING_POLSBANDJE" MODIFY ("aanwezig" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table RESERVERING
--------------------------------------------------------

  ALTER TABLE "RESERVERING" ADD CONSTRAINT "PrimaryKey6" PRIMARY KEY ("ID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS"  ENABLE;
 
  ALTER TABLE "RESERVERING" MODIFY ("ID" NOT NULL ENABLE);
 
  ALTER TABLE "RESERVERING" MODIFY ("persoon_id" NOT NULL ENABLE);
 
  ALTER TABLE "RESERVERING" MODIFY ("betaald" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table PERSOON
--------------------------------------------------------

  ALTER TABLE "PERSOON" ADD CONSTRAINT "PrimaryKey2" PRIMARY KEY ("ID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS"  ENABLE;
 
  ALTER TABLE "PERSOON" MODIFY ("ID" NOT NULL ENABLE);
 
  ALTER TABLE "PERSOON" MODIFY ("voornaam" NOT NULL ENABLE);
 
  ALTER TABLE "PERSOON" MODIFY ("achternaam" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table ACCOUNT_BIJDRAGE
--------------------------------------------------------

  ALTER TABLE "ACCOUNT_BIJDRAGE" ADD CONSTRAINT "PrimaryKey11" PRIMARY KEY ("ID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS"  ENABLE;
 
  ALTER TABLE "ACCOUNT_BIJDRAGE" MODIFY ("ID" NOT NULL ENABLE);
 
  ALTER TABLE "ACCOUNT_BIJDRAGE" MODIFY ("account_id" NOT NULL ENABLE);
 
  ALTER TABLE "ACCOUNT_BIJDRAGE" MODIFY ("bijdrage_id" NOT NULL ENABLE);
 
  ALTER TABLE "ACCOUNT_BIJDRAGE" MODIFY ("like" NOT NULL ENABLE);
 
  ALTER TABLE "ACCOUNT_BIJDRAGE" MODIFY ("ongewenst" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table VERHUUR
--------------------------------------------------------

  ALTER TABLE "VERHUUR" ADD CONSTRAINT "PrimaryKey16" PRIMARY KEY ("ID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS"  ENABLE;
 
  ALTER TABLE "VERHUUR" MODIFY ("ID" NOT NULL ENABLE);
 
  ALTER TABLE "VERHUUR" MODIFY ("betaald" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table BIJDRAGE
--------------------------------------------------------

  ALTER TABLE "BIJDRAGE" ADD CONSTRAINT "PrimaryKey13" PRIMARY KEY ("ID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS"  ENABLE;
 
  ALTER TABLE "BIJDRAGE" MODIFY ("ID" NOT NULL ENABLE);
 
  ALTER TABLE "BIJDRAGE" MODIFY ("account_id" NOT NULL ENABLE);
 
  ALTER TABLE "BIJDRAGE" MODIFY ("soort" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table BERICHT
--------------------------------------------------------

  ALTER TABLE "BERICHT" ADD CONSTRAINT "PrimaryKey" PRIMARY KEY ("bijdrage_id")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS"  ENABLE;
 
  ALTER TABLE "BERICHT" MODIFY ("bijdrage_id" NOT NULL ENABLE);
 
  ALTER TABLE "BERICHT" MODIFY ("inhoud" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table PLEK
--------------------------------------------------------

  ALTER TABLE "PLEK" ADD CONSTRAINT "PrimaryKey20" PRIMARY KEY ("ID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS"  ENABLE;
 
  ALTER TABLE "PLEK" MODIFY ("ID" NOT NULL ENABLE);
 
  ALTER TABLE "PLEK" MODIFY ("locatie_id" NOT NULL ENABLE);
--------------------------------------------------------
--  Ref Constraints for Table ACCOUNT
--------------------------------------------------------

  ALTER TABLE "ACCOUNT" ADD CONSTRAINT "GEBRUIKERSGROEPACCOUNT" FOREIGN KEY ("gebruikersgroep_id")
	  REFERENCES "GEBRUIKERSGROEP" ("ID") ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table ACCOUNT_BIJDRAGE
--------------------------------------------------------

  ALTER TABLE "ACCOUNT_BIJDRAGE" ADD CONSTRAINT "ACCOUNTACCOUNT_BIJDRAGE" FOREIGN KEY ("account_id")
	  REFERENCES "ACCOUNT" ("ID") ENABLE;
 
  ALTER TABLE "ACCOUNT_BIJDRAGE" ADD CONSTRAINT "BIJDRAGEACCOUNT_BIJDRAGE" FOREIGN KEY ("bijdrage_id")
	  REFERENCES "BIJDRAGE" ("ID") ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table BERICHT
--------------------------------------------------------

  ALTER TABLE "BERICHT" ADD CONSTRAINT "BIJDRAGEBERICHT" FOREIGN KEY ("bijdrage_id")
	  REFERENCES "BIJDRAGE" ("ID") ENABLE;
 
  ALTER TABLE "BERICHT" ADD CONSTRAINT "BIJDRAGEBERICHT1" FOREIGN KEY ("bijdrage_id_over")
	  REFERENCES "BIJDRAGE" ("ID") ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table BESTAND
--------------------------------------------------------

  ALTER TABLE "BESTAND" ADD CONSTRAINT "BIJDRAGEBESTAND" FOREIGN KEY ("bijdrage_id")
	  REFERENCES "BIJDRAGE" ("ID") ENABLE;
 
  ALTER TABLE "BESTAND" ADD CONSTRAINT "CATEGORIEBESTAND" FOREIGN KEY ("categorie_id")
	  REFERENCES "CATEGORIE" ("bijdrage_id") ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table BIJDRAGE
--------------------------------------------------------

  ALTER TABLE "BIJDRAGE" ADD CONSTRAINT "ACCOUNTBIJDRAGE" FOREIGN KEY ("account_id")
	  REFERENCES "ACCOUNT" ("ID") ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table CATEGORIE
--------------------------------------------------------

  ALTER TABLE "CATEGORIE" ADD CONSTRAINT "BIJDRAGECATEGORIE" FOREIGN KEY ("bijdrage_id")
	  REFERENCES "BIJDRAGE" ("ID") ENABLE;
 
  ALTER TABLE "CATEGORIE" ADD CONSTRAINT "CATEGORIECATEGORIE" FOREIGN KEY ("categorie_id")
	  REFERENCES "CATEGORIE" ("bijdrage_id") ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table EVENT
--------------------------------------------------------

  ALTER TABLE "EVENT" ADD CONSTRAINT "LOCATIEEVENT" FOREIGN KEY ("locatie_id")
	  REFERENCES "LOCATIE" ("ID") ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table PLEK
--------------------------------------------------------

  ALTER TABLE "PLEK" ADD CONSTRAINT "LOCATIEPLEK" FOREIGN KEY ("locatie_id")
	  REFERENCES "LOCATIE" ("ID") ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table PLEK_RESERVERING
--------------------------------------------------------

  ALTER TABLE "PLEK_RESERVERING" ADD CONSTRAINT "PLEKPLEK_RESERVERING" FOREIGN KEY ("plek_id")
	  REFERENCES "PLEK" ("ID") ENABLE;
 
  ALTER TABLE "PLEK_RESERVERING" ADD CONSTRAINT "RESERVERINGPLEK_RESERVERING" FOREIGN KEY ("reservering_id")
	  REFERENCES "RESERVERING" ("ID") ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table PLEK_SPECIFICATIE
--------------------------------------------------------

  ALTER TABLE "PLEK_SPECIFICATIE" ADD CONSTRAINT "PLEKPLEK_SPECIFICATIE" FOREIGN KEY ("plek_id")
	  REFERENCES "PLEK" ("ID") ENABLE;
 
  ALTER TABLE "PLEK_SPECIFICATIE" ADD CONSTRAINT "SPECIFICATIEPLEK_SPECIFICATIE" FOREIGN KEY ("specificatie_id")
	  REFERENCES "SPECIFICATIE" ("ID") ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table PRODUCT
--------------------------------------------------------

  ALTER TABLE "PRODUCT" ADD CONSTRAINT "PRODUCTCATPRODUCT" FOREIGN KEY ("productcat_id")
	  REFERENCES "PRODUCTCAT" ("ID") ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table PRODUCTCAT
--------------------------------------------------------

  ALTER TABLE "PRODUCTCAT" ADD CONSTRAINT "PRODUCTCATPRODUCTCAT" FOREIGN KEY ("productcat_id")
	  REFERENCES "PRODUCTCAT" ("ID") ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table PRODUCTEXEMPLAAR
--------------------------------------------------------

  ALTER TABLE "PRODUCTEXEMPLAAR" ADD CONSTRAINT "PRODUCTPRODUCTEXEMPLAAR" FOREIGN KEY ("product_id")
	  REFERENCES "PRODUCT" ("ID") ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table RESERVERING
--------------------------------------------------------

  ALTER TABLE "RESERVERING" ADD CONSTRAINT "PERSOONRESERVERING" FOREIGN KEY ("persoon_id")
	  REFERENCES "PERSOON" ("ID") ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table RESERVERING_POLSBANDJE
--------------------------------------------------------

  ALTER TABLE "RESERVERING_POLSBANDJE" ADD CONSTRAINT "ACCOUNTRESERVERING_POLSBANDJE" FOREIGN KEY ("account_id")
	  REFERENCES "ACCOUNT" ("ID") ENABLE;
 
  ALTER TABLE "RESERVERING_POLSBANDJE" ADD CONSTRAINT "POLSBANDJERESERVERING_POLSBAND" FOREIGN KEY ("polsbandje_id")
	  REFERENCES "POLSBANDJE" ("ID") ENABLE;
 
  ALTER TABLE "RESERVERING_POLSBANDJE" ADD CONSTRAINT "RESERVERINGRESERVERING_POLSBAN" FOREIGN KEY ("reservering_id")
	  REFERENCES "RESERVERING" ("ID") ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table VERHUUR
--------------------------------------------------------

  ALTER TABLE "VERHUUR" ADD CONSTRAINT "PRODUCTVERHUUR" FOREIGN KEY ("productexemplaar_id")
	  REFERENCES "PRODUCTEXEMPLAAR" ("ID") ENABLE;
 
  ALTER TABLE "VERHUUR" ADD CONSTRAINT "RESERVERING_POLSBANDJEVERHUUR" FOREIGN KEY ("res_pb_id")
	  REFERENCES "RESERVERING_POLSBANDJE" ("ID") ENABLE;
--------------------------------------------------------
--  DDL for Trigger ACCOUNT_BIJDRAGE_FCTG_BI
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "ACCOUNT_BIJDRAGE_FCTG_BI" BEFORE INSERT ON "ACCOUNT_BIJDRAGE"
FOR EACH ROW
 WHEN (new."ID" IS NULL) BEGIN
  SELECT ACCOUNT_BIJDRAGE_FCSEQ.NEXTVAL INTO :new."ID" FROM dual;
END;
/
ALTER TRIGGER "ACCOUNT_BIJDRAGE_FCTG_BI" ENABLE;
--------------------------------------------------------
--  DDL for Trigger ACCOUNT_FCTG_BI
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "ACCOUNT_FCTG_BI" BEFORE INSERT ON "ACCOUNT"
FOR EACH ROW
 WHEN (new."ID" IS NULL) BEGIN
  SELECT ACCOUNT_FCSEQ.NEXTVAL INTO :new."ID" FROM dual;
END;
/
ALTER TRIGGER "ACCOUNT_FCTG_BI" ENABLE;
--------------------------------------------------------
--  DDL for Trigger BIJDRAGE_FCTG_BI
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "BIJDRAGE_FCTG_BI" BEFORE INSERT ON "BIJDRAGE"
FOR EACH ROW
 WHEN (new."ID" IS NULL) BEGIN
  SELECT BIJDRAGE_FCSEQ.NEXTVAL INTO :new."ID" FROM dual;
END;
/
ALTER TRIGGER "BIJDRAGE_FCTG_BI" ENABLE;
--------------------------------------------------------
--  DDL for Trigger EVENT_FCTG_BI
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "EVENT_FCTG_BI" BEFORE INSERT ON "EVENT"
FOR EACH ROW
 WHEN (new."ID" IS NULL) BEGIN
  SELECT EVENT_FCSEQ.NEXTVAL INTO :new."ID" FROM dual;
END;
/
ALTER TRIGGER "EVENT_FCTG_BI" ENABLE;
--------------------------------------------------------
--  DDL for Trigger GEBRUIKERSGROEP_FCTG_BI
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "GEBRUIKERSGROEP_FCTG_BI" BEFORE INSERT ON "GEBRUIKERSGROEP"
FOR EACH ROW
 WHEN (new."ID" IS NULL) BEGIN
  SELECT GEBRUIKERSGROEP_FCSEQ.NEXTVAL INTO :new."ID" FROM dual;
END;
/
ALTER TRIGGER "GEBRUIKERSGROEP_FCTG_BI" ENABLE;
--------------------------------------------------------
--  DDL for Trigger LOCATIE_FCTG_BI
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "LOCATIE_FCTG_BI" BEFORE INSERT ON "LOCATIE"
FOR EACH ROW
 WHEN (new."ID" IS NULL) BEGIN
  SELECT LOCATIE_FCSEQ.NEXTVAL INTO :new."ID" FROM dual;
END;
/
ALTER TRIGGER "LOCATIE_FCTG_BI" ENABLE;
--------------------------------------------------------
--  DDL for Trigger PERSOON_FCTG_BI
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "PERSOON_FCTG_BI" BEFORE INSERT ON "PERSOON"
FOR EACH ROW
 WHEN (new."ID" IS NULL) BEGIN
  SELECT PERSOON_FCSEQ.NEXTVAL INTO :new."ID" FROM dual;
END;
/
ALTER TRIGGER "PERSOON_FCTG_BI" ENABLE;
--------------------------------------------------------
--  DDL for Trigger PLEK_FCTG_BI
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "PLEK_FCTG_BI" BEFORE INSERT ON "PLEK"
FOR EACH ROW
 WHEN (new."ID" IS NULL) BEGIN
  SELECT PLEK_FCSEQ.NEXTVAL INTO :new."ID" FROM dual;
END;
/
ALTER TRIGGER "PLEK_FCTG_BI" ENABLE;
--------------------------------------------------------
--  DDL for Trigger PLEK_RESERVERING_FCTG_BI
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "PLEK_RESERVERING_FCTG_BI" BEFORE INSERT ON "PLEK_RESERVERING"
FOR EACH ROW
 WHEN (new."ID" IS NULL) BEGIN
  SELECT PLEK_RESERVERING_FCSEQ.NEXTVAL INTO :new."ID" FROM dual;
END;
/
ALTER TRIGGER "PLEK_RESERVERING_FCTG_BI" ENABLE;
--------------------------------------------------------
--  DDL for Trigger PLEK_SPECIFICATIE_FCTG_BI
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "PLEK_SPECIFICATIE_FCTG_BI" BEFORE INSERT ON "PLEK_SPECIFICATIE"
FOR EACH ROW
 WHEN (new."id" IS NULL) BEGIN
  SELECT PLEK_SPECIFICATIE_FCSEQ.NEXTVAL INTO :new."id" FROM dual;
END;
/
ALTER TRIGGER "PLEK_SPECIFICATIE_FCTG_BI" ENABLE;
--------------------------------------------------------
--  DDL for Trigger POLSBANDJE_FCTG_BI
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "POLSBANDJE_FCTG_BI" BEFORE INSERT ON "POLSBANDJE"
FOR EACH ROW
 WHEN (new."ID" IS NULL) BEGIN
  SELECT POLSBANDJE_FCSEQ.NEXTVAL INTO :new."ID" FROM dual;
END;
/
ALTER TRIGGER "POLSBANDJE_FCTG_BI" ENABLE;
--------------------------------------------------------
--  DDL for Trigger PRODUCTCAT_FCTG_BI
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "PRODUCTCAT_FCTG_BI" BEFORE INSERT ON "PRODUCTCAT"
FOR EACH ROW
 WHEN (new."ID" IS NULL) BEGIN
  SELECT PRODUCTCAT_FCSEQ.NEXTVAL INTO :new."ID" FROM dual;
END;
/
ALTER TRIGGER "PRODUCTCAT_FCTG_BI" ENABLE;
--------------------------------------------------------
--  DDL for Trigger PRODUCTEXEMPLAAR_FCTG_BI
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "PRODUCTEXEMPLAAR_FCTG_BI" BEFORE INSERT ON "PRODUCTEXEMPLAAR"
FOR EACH ROW
 WHEN (new."ID" IS NULL) BEGIN
  SELECT PRODUCTEXEMPLAAR_FCSEQ.NEXTVAL INTO :new."ID" FROM dual;
END;
/
ALTER TRIGGER "PRODUCTEXEMPLAAR_FCTG_BI" ENABLE;
--------------------------------------------------------
--  DDL for Trigger PRODUCT_FCTG_BI
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "PRODUCT_FCTG_BI" BEFORE INSERT ON "PRODUCT"
FOR EACH ROW
 WHEN (new."ID" IS NULL) BEGIN
  SELECT PRODUCT_FCSEQ.NEXTVAL INTO :new."ID" FROM dual;
END;
/
ALTER TRIGGER "PRODUCT_FCTG_BI" ENABLE;
--------------------------------------------------------
--  DDL for Trigger RESERVERING_FCTG_BI
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "RESERVERING_FCTG_BI" BEFORE INSERT ON "RESERVERING"
FOR EACH ROW
 WHEN (new."ID" IS NULL) BEGIN
  SELECT RESERVERING_FCSEQ.NEXTVAL INTO :new."ID" FROM dual;
END;
/
ALTER TRIGGER "RESERVERING_FCTG_BI" ENABLE;
--------------------------------------------------------
--  DDL for Trigger RESERVERING_POLSBANDJE_FCTG_BI
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "RESERVERING_POLSBANDJE_FCTG_BI" BEFORE INSERT ON "RESERVERING_POLSBANDJE"
FOR EACH ROW
 WHEN (new."ID" IS NULL) BEGIN
  SELECT RESERVERING_POLSBANDJE_FCSEQ.NEXTVAL INTO :new."ID" FROM dual;
END;
/
ALTER TRIGGER "RESERVERING_POLSBANDJE_FCTG_BI" ENABLE;
--------------------------------------------------------
--  DDL for Trigger SPECIFICATIE_FCTG_BI
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "SPECIFICATIE_FCTG_BI" BEFORE INSERT ON "SPECIFICATIE"
FOR EACH ROW
 WHEN (new."ID" IS NULL) BEGIN
  SELECT SPECIFICATIE_FCSEQ.NEXTVAL INTO :new."ID" FROM dual;
END;
/
ALTER TRIGGER "SPECIFICATIE_FCTG_BI" ENABLE;
--------------------------------------------------------
--  DDL for Trigger VERHUUR_FCTG_BI
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "VERHUUR_FCTG_BI" BEFORE INSERT ON "VERHUUR"
FOR EACH ROW
 WHEN (new."ID" IS NULL) BEGIN
  SELECT VERHUUR_FCSEQ.NEXTVAL INTO :new."ID" FROM dual;
END;
/
ALTER TRIGGER "VERHUUR_FCTG_BI" ENABLE;
