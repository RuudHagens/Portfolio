/*
Due to bugs in the SQL exporter I had to make changes to this script:
-add / after each trigger so the next alter table wouldn't fail
-add cascade constraints to each drop table so the script can easily/neatly be rerun

Navicat Oracle Data Transfer
Oracle Client Version : 12.1.0.1.0

Source Server         : camping@localhost
Source Server Version : 110200
Source Host           : localhost:1521
Source Schema         : CAMPING

Target Server Type    : ORACLE
Target Server Version : 110200
File Encoding         : 65001

Date: 2014-10-23 00:15:49
*/

-- ----------------------------
-- Table structure for "TEST"."ACCOUNT"
-- ----------------------------
DROP TABLE "TEST"."ACCOUNT" cascade constraints;
CREATE TABLE "TEST"."ACCOUNT" (
"ID" NUMBER(10) NOT NULL ,
"gebruikersgroep_id" NUMBER(10) NOT NULL ,
"gebruikersnaam" NVARCHAR2(255) NULL ,
"wachtwoord" NVARCHAR2(255) NULL ,
"email" NVARCHAR2(255) NOT NULL ,
"activatiehash" NVARCHAR2(255) NOT NULL ,
"geactiveerd" NUMBER(1) DEFAULT (0)  NOT NULL 
)
LOGGING
NOCOMPRESS
NOCACHE

;

-- ----------------------------
-- Records of ACCOUNT
-- ----------------------------
INSERT INTO "TEST"."ACCOUNT" VALUES ('1', '1', 'admin', 'admin', 'admin@bla.nl', 'af1a67e7919c0e9539fac8eb0828f208', '1');
INSERT INTO "TEST"."ACCOUNT" VALUES ('2', '2', 'JanPietersen', 'geheim', 'JanPietersen@temp.nl', 'ee41bbbb4c16dfe60f17484439043f97', '1');
INSERT INTO "TEST"."ACCOUNT" VALUES ('3', '2', 'WillemVries', 'geheim', 'WillemVries@jaja.nl', '69e60f8670abebc6b4d1cb6f183890b0', '1');
INSERT INTO "TEST"."ACCOUNT" VALUES ('4', '2', 'KlaasVaak', 'geheim', 'KlaasVaak@jaja.nl', '47fe977ab3b4ecfc5d6103b3f5dc107f', '1');

-- ----------------------------
-- Table structure for "TEST"."ACCOUNT_BIJDRAGE"
-- ----------------------------
DROP TABLE "TEST"."ACCOUNT_BIJDRAGE" cascade constraints;
CREATE TABLE "TEST"."ACCOUNT_BIJDRAGE" (
"ID" NUMBER(10) NOT NULL ,
"account_id" NUMBER(10) NOT NULL ,
"bijdrage_id" NUMBER(10) NOT NULL ,
"like" NUMBER(1) DEFAULT (0)  NOT NULL ,
"ongewenst" NUMBER(1) DEFAULT (0)  NOT NULL 
)
LOGGING
NOCOMPRESS
NOCACHE

;

-- ----------------------------
-- Records of ACCOUNT_BIJDRAGE
-- ----------------------------
INSERT INTO "TEST"."ACCOUNT_BIJDRAGE" VALUES ('1', '3', '11', '1', '0');
INSERT INTO "TEST"."ACCOUNT_BIJDRAGE" VALUES ('2', '3', '7', '1', '0');
INSERT INTO "TEST"."ACCOUNT_BIJDRAGE" VALUES ('3', '3', '8', '1', '0');
INSERT INTO "TEST"."ACCOUNT_BIJDRAGE" VALUES ('4', '3', '10', '0', '0');

-- ----------------------------
-- Table structure for "TEST"."BERICHT"
-- ----------------------------
DROP TABLE "TEST"."BERICHT"  cascade constraints;
CREATE TABLE "TEST"."BERICHT" (
"bijdrage_id" NUMBER(10) NOT NULL ,
"bijdrage_id_over" NUMBER(10) NULL ,
"titel" NVARCHAR2(255) NULL ,
"inhoud" NCLOB NOT NULL 
)
LOGGING
NOCOMPRESS
NOCACHE

;

-- ----------------------------
-- Records of BERICHT
-- ----------------------------
INSERT INTO "TEST"."BERICHT" VALUES ('11', '14', 'Jan Smit - Mij en ik', 'Ik heb het nieuwe album van Jan Smit gedeeld genaamd Mij en ik. Echt een toppertje!');
INSERT INTO "TEST"."BERICHT" VALUES ('13', '11', null, 'Mwha ik vind het niet zo''n goed album. Kwaliteit van de .mp3''s is wel goed!');

-- ----------------------------
-- Table structure for "TEST"."BESTAND"
-- ----------------------------
DROP TABLE "TEST"."BESTAND" cascade constraints;
CREATE TABLE "TEST"."BESTAND" (
"bijdrage_id" NUMBER(10) NOT NULL ,
"categorie_id" NUMBER(10) NOT NULL ,
"bestandslocatie" NVARCHAR2(255) NOT NULL ,
"grootte" NUMBER(10) DEFAULT (0)  NULL 
)
LOGGING
NOCOMPRESS
NOCACHE

;

-- ----------------------------
-- Records of BESTAND
-- ----------------------------
INSERT INTO "TEST"."BESTAND" VALUES ('7', '6', 'Jij en ik/01 - Mooier dan ik dacht.mp3', '3500000');
INSERT INTO "TEST"."BESTAND" VALUES ('8', '6', 'Jij en ik/02 - Als ik maar even bij jouw kan zijn.mp3', '3000000');
INSERT INTO "TEST"."BESTAND" VALUES ('10', '9', 'terrein.jpg', '250000');

-- ----------------------------
-- Table structure for "TEST"."BIJDRAGE"
-- ----------------------------
DROP TABLE "TEST"."BIJDRAGE" cascade constraints;
CREATE TABLE "TEST"."BIJDRAGE" (
"ID" NUMBER(10) NOT NULL ,
"account_id" NUMBER(10) NOT NULL ,
"datum" DATE NULL ,
"soort" NVARCHAR2(255) NOT NULL 
)
LOGGING
NOCOMPRESS
NOCACHE

;

-- ----------------------------
-- Records of BIJDRAGE
-- ----------------------------
INSERT INTO "TEST"."BIJDRAGE" VALUES ('1', '1', TO_DATE('2014-10-14 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), 'categorie');
INSERT INTO "TEST"."BIJDRAGE" VALUES ('2', '1', TO_DATE('2014-10-14 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), 'categorie');
INSERT INTO "TEST"."BIJDRAGE" VALUES ('3', '1', TO_DATE('2014-10-14 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), 'categorie');
INSERT INTO "TEST"."BIJDRAGE" VALUES ('4', '1', TO_DATE('2014-10-14 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), 'categorie');
INSERT INTO "TEST"."BIJDRAGE" VALUES ('5', '1', TO_DATE('2014-10-14 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), 'categorie');
INSERT INTO "TEST"."BIJDRAGE" VALUES ('6', '2', TO_DATE('2014-10-14 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), 'categorie');
INSERT INTO "TEST"."BIJDRAGE" VALUES ('7', '2', TO_DATE('2014-10-14 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), 'bestand');
INSERT INTO "TEST"."BIJDRAGE" VALUES ('8', '2', TO_DATE('2014-10-14 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), 'bestand');
INSERT INTO "TEST"."BIJDRAGE" VALUES ('9', '2', TO_DATE('2014-10-14 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), 'categorie');
INSERT INTO "TEST"."BIJDRAGE" VALUES ('10', '2', TO_DATE('2014-10-14 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), 'bestand');
INSERT INTO "TEST"."BIJDRAGE" VALUES ('11', '2', TO_DATE('2013-10-27 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), 'bericht');
INSERT INTO "TEST"."BIJDRAGE" VALUES ('13', '3', TO_DATE('2013-10-28 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), 'bericht');
INSERT INTO "TEST"."BIJDRAGE" VALUES ('14', '2', TO_DATE('2013-10-14 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), 'categorie');

-- ----------------------------
-- Table structure for "TEST"."CATEGORIE"
-- ----------------------------
DROP TABLE "TEST"."CATEGORIE" cascade constraints;
CREATE TABLE "TEST"."CATEGORIE" (
"bijdrage_id" NUMBER(10) NOT NULL ,
"categorie_id" NUMBER(10) NULL ,
"naam" NVARCHAR2(255) NOT NULL 
)
LOGGING
NOCOMPRESS
NOCACHE

;

-- ----------------------------
-- Records of CATEGORIE
-- ----------------------------
INSERT INTO "TEST"."CATEGORIE" VALUES ('1', null, 'Muziek');
INSERT INTO "TEST"."CATEGORIE" VALUES ('2', null, 'Films');
INSERT INTO "TEST"."CATEGORIE" VALUES ('3', null, 'TV Shows');
INSERT INTO "TEST"."CATEGORIE" VALUES ('4', null, 'Fotos');
INSERT INTO "TEST"."CATEGORIE" VALUES ('5', '1', 'Nederlandse artiesten');
INSERT INTO "TEST"."CATEGORIE" VALUES ('6', '5', 'Jan Smit');
INSERT INTO "TEST"."CATEGORIE" VALUES ('9', '4', 'SME De Valkenhof 2014');
INSERT INTO "TEST"."CATEGORIE" VALUES ('14', '6', 'Jij en ik');

-- ----------------------------
-- Table structure for "TEST"."EVENT"
-- ----------------------------
DROP TABLE "TEST"."EVENT" cascade constraints;
CREATE TABLE "TEST"."EVENT" (
"ID" NUMBER(10) NOT NULL ,
"locatie_id" NUMBER(10) NULL ,
"naam" NVARCHAR2(255) NOT NULL ,
"datumstart" DATE NULL ,
"datumEinde" DATE NULL ,
"maxBezoekers" NUMBER(10) DEFAULT (0)  NULL 
)
LOGGING
NOCOMPRESS
NOCACHE

;

-- ----------------------------
-- Records of EVENT
-- ----------------------------
INSERT INTO "TEST"."EVENT" VALUES ('1', '1', 'SME De Valkenhof 2014', TO_DATE('2013-12-27 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2013-12-30 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '100');

-- ----------------------------
-- Table structure for "TEST"."GEBRUIKERSGROEP"
-- ----------------------------
DROP TABLE "TEST"."GEBRUIKERSGROEP" cascade constraints;
CREATE TABLE "TEST"."GEBRUIKERSGROEP" (
"ID" NUMBER(10) NOT NULL ,
"naam" NVARCHAR2(255) NOT NULL 
)
LOGGING
NOCOMPRESS
NOCACHE

;

-- ----------------------------
-- Records of GEBRUIKERSGROEP
-- ----------------------------
INSERT INTO "TEST"."GEBRUIKERSGROEP" VALUES ('1', 'Admin');
INSERT INTO "TEST"."GEBRUIKERSGROEP" VALUES ('2', 'Bezoekers');

-- ----------------------------
-- Table structure for "TEST"."LOCATIE"
-- ----------------------------
DROP TABLE "TEST"."LOCATIE" cascade constraints;
CREATE TABLE "TEST"."LOCATIE" (
"ID" NUMBER(10) NOT NULL ,
"naam" NVARCHAR2(255) NOT NULL ,
"straat" NVARCHAR2(255) NULL ,
"nr" NVARCHAR2(255) NULL ,
"postcode" NVARCHAR2(255) NULL ,
"plaats" NVARCHAR2(255) NULL 
)
LOGGING
NOCOMPRESS
NOCACHE

;

-- ----------------------------
-- Records of LOCATIE
-- ----------------------------
INSERT INTO "TEST"."LOCATIE" VALUES ('1', 'Camping De Valkenhof', null, null, null, null);

-- ----------------------------
-- Table structure for "TEST"."PERSOON"
-- ----------------------------
DROP TABLE "TEST"."PERSOON" cascade constraints;
CREATE TABLE "TEST"."PERSOON" (
"ID" NUMBER(10) NOT NULL ,
"voornaam" NVARCHAR2(255) NOT NULL ,
"tussenvoegsel" NVARCHAR2(255) NULL ,
"achternaam" NVARCHAR2(255) NOT NULL ,
"straat" NVARCHAR2(255) NULL ,
"huisnr" NVARCHAR2(255) NULL ,
"woonplaats" NVARCHAR2(255) NULL ,
"banknr" NVARCHAR2(255) NULL 
)
LOGGING
NOCOMPRESS
NOCACHE

;

-- ----------------------------
-- Records of PERSOON
-- ----------------------------
INSERT INTO "TEST"."PERSOON" VALUES ('1', 'Jan', null, 'Pietersen', 'Rachelsmolen', '1', '5611MA', 'NL91ABNA0417164300');

-- ----------------------------
-- Table structure for "TEST"."PLEK"
-- ----------------------------
DROP TABLE "TEST"."PLEK" cascade constraints;
CREATE TABLE "TEST"."PLEK" (
"ID" NUMBER(10) NOT NULL ,
"locatie_id" NUMBER(10) NOT NULL ,
"nummer" NVARCHAR2(255) NULL ,
"capaciteit" NUMBER(10) DEFAULT (0)  NULL 
)
LOGGING
NOCOMPRESS
NOCACHE

;

-- ----------------------------
-- Records of PLEK
-- ----------------------------
INSERT INTO "TEST"."PLEK" VALUES ('1', '1', '1', '5');
INSERT INTO "TEST"."PLEK" VALUES ('2', '1', '2', '5');
INSERT INTO "TEST"."PLEK" VALUES ('3', '1', '3', '5');

-- ----------------------------
-- Table structure for "TEST"."PLEK_RESERVERING"
-- ----------------------------
DROP TABLE "TEST"."PLEK_RESERVERING" cascade constraints;
CREATE TABLE "TEST"."PLEK_RESERVERING" (
"ID" NUMBER(10) NOT NULL ,
"plek_id" NUMBER(10) NOT NULL ,
"reservering_id" NUMBER(10) NOT NULL 
)
LOGGING
NOCOMPRESS
NOCACHE

;

-- ----------------------------
-- Records of PLEK_RESERVERING
-- ----------------------------
INSERT INTO "TEST"."PLEK_RESERVERING" VALUES ('1', '1', '1');
INSERT INTO "TEST"."PLEK_RESERVERING" VALUES ('2', '2', '1');

-- ----------------------------
-- Table structure for "TEST"."PLEK_SPECIFICATIE"
-- ----------------------------
DROP TABLE "TEST"."PLEK_SPECIFICATIE" cascade constraints;
CREATE TABLE "TEST"."PLEK_SPECIFICATIE" (
"id" NUMBER(10) NOT NULL ,
"specificatie_id" NUMBER(10) NOT NULL ,
"plek_id" NUMBER(10) NOT NULL ,
"waarde" NVARCHAR2(255) NOT NULL 
)
LOGGING
NOCOMPRESS
NOCACHE

;

-- ----------------------------
-- Records of PLEK_SPECIFICATIE
-- ----------------------------
INSERT INTO "TEST"."PLEK_SPECIFICATIE" VALUES ('1', '2', '1', 'ja');
INSERT INTO "TEST"."PLEK_SPECIFICATIE" VALUES ('2', '2', '2', 'ja');
INSERT INTO "TEST"."PLEK_SPECIFICATIE" VALUES ('3', '3', '3', 'ja');
INSERT INTO "TEST"."PLEK_SPECIFICATIE" VALUES ('4', '4', '1', '30');
INSERT INTO "TEST"."PLEK_SPECIFICATIE" VALUES ('5', '4', '2', '30');
INSERT INTO "TEST"."PLEK_SPECIFICATIE" VALUES ('6', '4', '3', '30');
INSERT INTO "TEST"."PLEK_SPECIFICATIE" VALUES ('7', '5', '1', 'ja');
INSERT INTO "TEST"."PLEK_SPECIFICATIE" VALUES ('8', '5', '2', 'ja');
INSERT INTO "TEST"."PLEK_SPECIFICATIE" VALUES ('9', '5', '3', 'nee');

-- ----------------------------
-- Table structure for "TEST"."POLSBANDJE"
-- ----------------------------
DROP TABLE "TEST"."POLSBANDJE" cascade constraints;
CREATE TABLE "TEST"."POLSBANDJE" (
"ID" NUMBER(10) NOT NULL ,
"rfid" NVARCHAR2(255) NOT NULL ,
"nummer" NUMBER(10) DEFAULT (0)  NOT NULL ,
"actief" NUMBER(1) DEFAULT (0)  NOT NULL 
)
LOGGING
NOCOMPRESS
NOCACHE

;

-- ----------------------------
-- Records of POLSBANDJE
-- ----------------------------
INSERT INTO "TEST"."POLSBANDJE" VALUES ('1', '42977fbd8b23ad459ee8a135292b87af', '123456789', '1');
INSERT INTO "TEST"."POLSBANDJE" VALUES ('2', 'db47aac789fa79ad1eba14030d95062b', '123456788', '1');
INSERT INTO "TEST"."POLSBANDJE" VALUES ('3', '9a15493038a7365e9ae4c0cfba1136cf', '123456787', '1');
INSERT INTO "TEST"."POLSBANDJE" VALUES ('4', 'ad03c9b1601cd50b9b0b1ed4ac74a724', '123456786', '1');

-- ----------------------------
-- Table structure for "TEST"."PRODUCT"
-- ----------------------------
DROP TABLE "TEST"."PRODUCT" cascade constraints;
CREATE TABLE "TEST"."PRODUCT" (
"ID" NUMBER(10) NOT NULL ,
"productcat_id" NUMBER(10) NOT NULL ,
"merk" NVARCHAR2(255) NULL ,
"serie" NVARCHAR2(255) NULL ,
"typenummer" NVARCHAR2(255) NULL ,
"prijs" NUMBER(19,2) DEFAULT (0)  NULL 
)
LOGGING
NOCOMPRESS
NOCACHE

;

-- ----------------------------
-- Records of PRODUCT
-- ----------------------------
INSERT INTO "TEST"."PRODUCT" VALUES ('1', '1', 'Samsung', 'Nexus 10', '1000', '10');
INSERT INTO "TEST"."PRODUCT" VALUES ('2', '2', 'Logitech', 'Mouse MX Revolution Laser Cordless', '1001', '2');
INSERT INTO "TEST"."PRODUCT" VALUES ('3', '3', 'Asus', 'RT-N66U', '1002', '4');

-- ----------------------------
-- Table structure for "TEST"."PRODUCTCAT"
-- ----------------------------
DROP TABLE "TEST"."PRODUCTCAT" cascade constraints;
CREATE TABLE "TEST"."PRODUCTCAT" (
"ID" NUMBER(10) NOT NULL ,
"productcat_id" NUMBER(10) NULL ,
"naam" NVARCHAR2(255) NOT NULL 
)
LOGGING
NOCOMPRESS
NOCACHE

;

-- ----------------------------
-- Records of PRODUCTCAT
-- ----------------------------
INSERT INTO "TEST"."PRODUCTCAT" VALUES ('1', '4', '>9.0 inch');
INSERT INTO "TEST"."PRODUCTCAT" VALUES ('2', null, 'Muis (USB)');
INSERT INTO "TEST"."PRODUCTCAT" VALUES ('3', null, 'Wireless n Router');
INSERT INTO "TEST"."PRODUCTCAT" VALUES ('4', null, 'Tablets');

-- ----------------------------
-- Table structure for "TEST"."PRODUCTEXEMPLAAR"
-- ----------------------------
DROP TABLE "TEST"."PRODUCTEXEMPLAAR" cascade constraints;
CREATE TABLE "TEST"."PRODUCTEXEMPLAAR" (
"ID" NUMBER(10) NOT NULL ,
"product_id" NUMBER(10) NOT NULL ,
"volgnummer" NUMBER(10) DEFAULT (0)  NOT NULL ,
"barcode" NVARCHAR2(255) NULL 
)
LOGGING
NOCOMPRESS
NOCACHE

;

-- ----------------------------
-- Records of PRODUCTEXEMPLAAR
-- ----------------------------
INSERT INTO "TEST"."PRODUCTEXEMPLAAR" VALUES ('1', '1', '1', '1000.001');
INSERT INTO "TEST"."PRODUCTEXEMPLAAR" VALUES ('2', '1', '2', '1000.002');
INSERT INTO "TEST"."PRODUCTEXEMPLAAR" VALUES ('3', '1', '3', '1000.003');
INSERT INTO "TEST"."PRODUCTEXEMPLAAR" VALUES ('4', '2', '1', '1001.001');
INSERT INTO "TEST"."PRODUCTEXEMPLAAR" VALUES ('5', '2', '2', '1001.002');
INSERT INTO "TEST"."PRODUCTEXEMPLAAR" VALUES ('6', '3', '1', '1002.001');

-- ----------------------------
-- Table structure for "TEST"."RESERVERING"
-- ----------------------------
DROP TABLE "TEST"."RESERVERING" cascade constraints;
CREATE TABLE "TEST"."RESERVERING" (
"ID" NUMBER(10) NOT NULL ,
"persoon_id" NUMBER(10) NOT NULL ,
"datumStart" DATE NULL ,
"datumEinde" DATE NULL ,
"betaald" NUMBER(1) DEFAULT (0)  NOT NULL 
)
LOGGING
NOCOMPRESS
NOCACHE

;

-- ----------------------------
-- Records of RESERVERING
-- ----------------------------
INSERT INTO "TEST"."RESERVERING" VALUES ('1', '1', TO_DATE('2013-12-27 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2013-12-30 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '1');

-- ----------------------------
-- Table structure for "TEST"."RESERVERING_POLSBANDJE"
-- ----------------------------
DROP TABLE "TEST"."RESERVERING_POLSBANDJE" cascade constraints;
CREATE TABLE "TEST"."RESERVERING_POLSBANDJE" (
"ID" NUMBER(10) NOT NULL ,
"reservering_id" NUMBER(10) NOT NULL ,
"polsbandje_id" NUMBER(10) NOT NULL ,
"account_id" NUMBER(10) NOT NULL ,
"aanwezig" NUMBER(1) DEFAULT (0)  NOT NULL 
)
LOGGING
NOCOMPRESS
NOCACHE

;

-- ----------------------------
-- Records of RESERVERING_POLSBANDJE
-- ----------------------------
INSERT INTO "TEST"."RESERVERING_POLSBANDJE" VALUES ('1', '1', '1', '1', '1');
INSERT INTO "TEST"."RESERVERING_POLSBANDJE" VALUES ('2', '1', '2', '2', '1');
INSERT INTO "TEST"."RESERVERING_POLSBANDJE" VALUES ('3', '1', '3', '3', '0');
INSERT INTO "TEST"."RESERVERING_POLSBANDJE" VALUES ('4', '1', '4', '4', '0');

-- ----------------------------
-- Table structure for "TEST"."SPECIFICATIE"
-- ----------------------------
DROP TABLE "TEST"."SPECIFICATIE" cascade constraints;
CREATE TABLE "TEST"."SPECIFICATIE" (
"ID" NUMBER(10) NOT NULL ,
"naam" NVARCHAR2(255) NOT NULL 
)
LOGGING
NOCOMPRESS
NOCACHE

;

-- ----------------------------
-- Records of SPECIFICATIE
-- ----------------------------
INSERT INTO "TEST"."SPECIFICATIE" VALUES ('4', 'afmeting');
INSERT INTO "TEST"."SPECIFICATIE" VALUES ('2', 'comfortplek');
INSERT INTO "TEST"."SPECIFICATIE" VALUES ('3', 'handicap geschikt');
INSERT INTO "TEST"."SPECIFICATIE" VALUES ('5', 'kraan beschikbaar');

-- ----------------------------
-- Table structure for "TEST"."VERHUUR"
-- ----------------------------
DROP TABLE "TEST"."VERHUUR" cascade constraints;
CREATE TABLE "TEST"."VERHUUR" (
"ID" NUMBER(10) NOT NULL ,
"productexemplaar_id" NUMBER(10) NULL ,
"res_pb_id" NUMBER(10) NULL ,
"datumIn" DATE NULL ,
"datumUit" DATE NULL ,
"prijs" NUMBER(19,2) DEFAULT (0)  NULL ,
"betaald" NUMBER(1) DEFAULT (0)  NOT NULL 
)
LOGGING
NOCOMPRESS
NOCACHE

;

-- ----------------------------
-- Records of VERHUUR
-- ----------------------------
INSERT INTO "TEST"."VERHUUR" VALUES ('1', '1', '1', TO_DATE('2013-12-27 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2013-12-30 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '10', '1');
INSERT INTO "TEST"."VERHUUR" VALUES ('2', '2', '2', TO_DATE('2013-12-27 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2013-12-30 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '10', '1');
INSERT INTO "TEST"."VERHUUR" VALUES ('3', '4', '3', TO_DATE('2013-12-27 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2013-12-30 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '2', '1');
INSERT INTO "TEST"."VERHUUR" VALUES ('4', '6', '3', TO_DATE('2013-12-27 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2013-12-30 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '4', '1');

-- ----------------------------
-- Sequence structure for "TEST"."ACCOUNT_BIJDRAGE_FCSEQ"
-- ----------------------------
DROP SEQUENCE "TEST"."ACCOUNT_BIJDRAGE_FCSEQ";
CREATE SEQUENCE "TEST"."ACCOUNT_BIJDRAGE_FCSEQ"
 INCREMENT BY 1
 MINVALUE 1
 MAXVALUE 9999999999999999999999999999
 START WITH 5
 CACHE 20;

-- ----------------------------
-- Sequence structure for "TEST"."ACCOUNT_FCSEQ"
-- ----------------------------
DROP SEQUENCE "TEST"."ACCOUNT_FCSEQ";
CREATE SEQUENCE "TEST"."ACCOUNT_FCSEQ"
 INCREMENT BY 1
 MINVALUE 1
 MAXVALUE 9999999999999999999999999999
 START WITH 5
 CACHE 20;

-- ----------------------------
-- Sequence structure for "TEST"."BIJDRAGE_FCSEQ"
-- ----------------------------
DROP SEQUENCE "TEST"."BIJDRAGE_FCSEQ";
CREATE SEQUENCE "TEST"."BIJDRAGE_FCSEQ"
 INCREMENT BY 1
 MINVALUE 1
 MAXVALUE 9999999999999999999999999999
 START WITH 15
 CACHE 20;

-- ----------------------------
-- Sequence structure for "TEST"."EVENT_FCSEQ"
-- ----------------------------
DROP SEQUENCE "TEST"."EVENT_FCSEQ";
CREATE SEQUENCE "TEST"."EVENT_FCSEQ"
 INCREMENT BY 1
 MINVALUE 1
 MAXVALUE 9999999999999999999999999999
 START WITH 2
 CACHE 20;

-- ----------------------------
-- Sequence structure for "TEST"."GEBRUIKERSGROEP_FCSEQ"
-- ----------------------------
DROP SEQUENCE "TEST"."GEBRUIKERSGROEP_FCSEQ";
CREATE SEQUENCE "TEST"."GEBRUIKERSGROEP_FCSEQ"
 INCREMENT BY 1
 MINVALUE 1
 MAXVALUE 9999999999999999999999999999
 START WITH 3
 CACHE 20;

-- ----------------------------
-- Sequence structure for "TEST"."LOCATIE_FCSEQ"
-- ----------------------------
DROP SEQUENCE "TEST"."LOCATIE_FCSEQ";
CREATE SEQUENCE "TEST"."LOCATIE_FCSEQ"
 INCREMENT BY 1
 MINVALUE 1
 MAXVALUE 9999999999999999999999999999
 START WITH 2
 CACHE 20;

-- ----------------------------
-- Sequence structure for "TEST"."PERSOON_FCSEQ"
-- ----------------------------
DROP SEQUENCE "TEST"."PERSOON_FCSEQ";
CREATE SEQUENCE "TEST"."PERSOON_FCSEQ"
 INCREMENT BY 1
 MINVALUE 1
 MAXVALUE 9999999999999999999999999999
 START WITH 2
 CACHE 20;

-- ----------------------------
-- Sequence structure for "TEST"."PLEK_FCSEQ"
-- ----------------------------
DROP SEQUENCE "TEST"."PLEK_FCSEQ";
CREATE SEQUENCE "TEST"."PLEK_FCSEQ"
 INCREMENT BY 1
 MINVALUE 1
 MAXVALUE 9999999999999999999999999999
 START WITH 4
 CACHE 20;

-- ----------------------------
-- Sequence structure for "TEST"."PLEK_RESERVERING_FCSEQ"
-- ----------------------------
DROP SEQUENCE "TEST"."PLEK_RESERVERING_FCSEQ";
CREATE SEQUENCE "TEST"."PLEK_RESERVERING_FCSEQ"
 INCREMENT BY 1
 MINVALUE 1
 MAXVALUE 9999999999999999999999999999
 START WITH 3
 CACHE 20;

-- ----------------------------
-- Sequence structure for "TEST"."PLEK_SPECIFICATIE_FCSEQ"
-- ----------------------------
DROP SEQUENCE "TEST"."PLEK_SPECIFICATIE_FCSEQ";
CREATE SEQUENCE "TEST"."PLEK_SPECIFICATIE_FCSEQ"
 INCREMENT BY 1
 MINVALUE 1
 MAXVALUE 9999999999999999999999999999
 START WITH 10
 CACHE 20;

-- ----------------------------
-- Sequence structure for "TEST"."POLSBANDJE_FCSEQ"
-- ----------------------------
DROP SEQUENCE "TEST"."POLSBANDJE_FCSEQ";
CREATE SEQUENCE "TEST"."POLSBANDJE_FCSEQ"
 INCREMENT BY 1
 MINVALUE 1
 MAXVALUE 9999999999999999999999999999
 START WITH 5
 CACHE 20;

-- ----------------------------
-- Sequence structure for "TEST"."PRODUCT_FCSEQ"
-- ----------------------------
DROP SEQUENCE "TEST"."PRODUCT_FCSEQ";
CREATE SEQUENCE "TEST"."PRODUCT_FCSEQ"
 INCREMENT BY 1
 MINVALUE 1
 MAXVALUE 9999999999999999999999999999
 START WITH 4
 CACHE 20;

-- ----------------------------
-- Sequence structure for "TEST"."PRODUCTCAT_FCSEQ"
-- ----------------------------
DROP SEQUENCE "TEST"."PRODUCTCAT_FCSEQ";
CREATE SEQUENCE "TEST"."PRODUCTCAT_FCSEQ"
 INCREMENT BY 1
 MINVALUE 1
 MAXVALUE 9999999999999999999999999999
 START WITH 5
 CACHE 20;

-- ----------------------------
-- Sequence structure for "TEST"."PRODUCTEXEMPLAAR_FCSEQ"
-- ----------------------------
DROP SEQUENCE "TEST"."PRODUCTEXEMPLAAR_FCSEQ";
CREATE SEQUENCE "TEST"."PRODUCTEXEMPLAAR_FCSEQ"
 INCREMENT BY 1
 MINVALUE 1
 MAXVALUE 9999999999999999999999999999
 START WITH 7
 CACHE 20;

-- ----------------------------
-- Sequence structure for "TEST"."RESERVERING_FCSEQ"
-- ----------------------------
DROP SEQUENCE "TEST"."RESERVERING_FCSEQ";
CREATE SEQUENCE "TEST"."RESERVERING_FCSEQ"
 INCREMENT BY 1
 MINVALUE 1
 MAXVALUE 9999999999999999999999999999
 START WITH 2
 CACHE 20;

-- ----------------------------
-- Sequence structure for "TEST"."RESERVERING_POLSBANDJE_FCSEQ"
-- ----------------------------
DROP SEQUENCE "TEST"."RESERVERING_POLSBANDJE_FCSEQ";
CREATE SEQUENCE "TEST"."RESERVERING_POLSBANDJE_FCSEQ"
 INCREMENT BY 1
 MINVALUE 1
 MAXVALUE 9999999999999999999999999999
 START WITH 5
 CACHE 20;

-- ----------------------------
-- Sequence structure for "TEST"."SPECIFICATIE_FCSEQ"
-- ----------------------------
DROP SEQUENCE "TEST"."SPECIFICATIE_FCSEQ";
CREATE SEQUENCE "TEST"."SPECIFICATIE_FCSEQ"
 INCREMENT BY 1
 MINVALUE 1
 MAXVALUE 9999999999999999999999999999
 START WITH 6
 CACHE 20;

-- ----------------------------
-- Sequence structure for "TEST"."VERHUUR_FCSEQ"
-- ----------------------------
DROP SEQUENCE "TEST"."VERHUUR_FCSEQ";
CREATE SEQUENCE "TEST"."VERHUUR_FCSEQ"
 INCREMENT BY 1
 MINVALUE 1
 MAXVALUE 9999999999999999999999999999
 START WITH 5
 CACHE 20;

-- ----------------------------
-- Indexes structure for table ACCOUNT
-- ----------------------------
CREATE UNIQUE INDEX "TEST"."email"
ON "TEST"."ACCOUNT" ("email" ASC)
LOGGING
VISIBLE;
CREATE INDEX "TEST"."gebruikersgroep_id"
ON "TEST"."ACCOUNT" ("gebruikersgroep_id" ASC)
LOGGING
VISIBLE;
CREATE UNIQUE INDEX "TEST"."gebruikersnaam"
ON "TEST"."ACCOUNT" ("gebruikersnaam" ASC)
LOGGING
VISIBLE;

-- ----------------------------
-- Triggers structure for table "TEST"."ACCOUNT"
-- ----------------------------
CREATE OR REPLACE TRIGGER "TEST"."ACCOUNT_FCTG_BI" BEFORE INSERT ON "TEST"."ACCOUNT" REFERENCING OLD AS "OLD" NEW AS "NEW" FOR EACH ROW ENABLE WHEN (new."ID" IS NULL)
BEGIN
  SELECT ACCOUNT_FCSEQ.NEXTVAL INTO :new."ID" FROM dual;
END;
/
-- ----------------------------
-- Checks structure for table "TEST"."ACCOUNT"
-- ----------------------------
ALTER TABLE "TEST"."ACCOUNT" ADD CHECK ("ID" IS NOT NULL);
ALTER TABLE "TEST"."ACCOUNT" ADD CHECK ("gebruikersgroep_id" IS NOT NULL);
ALTER TABLE "TEST"."ACCOUNT" ADD CHECK ("email" IS NOT NULL);
ALTER TABLE "TEST"."ACCOUNT" ADD CHECK ("activatiehash" IS NOT NULL);
ALTER TABLE "TEST"."ACCOUNT" ADD CHECK ("geactiveerd" IS NOT NULL);

-- ----------------------------
-- Primary Key structure for table "TEST"."ACCOUNT"
-- ----------------------------
ALTER TABLE "TEST"."ACCOUNT" ADD PRIMARY KEY ("ID");

-- ----------------------------
-- Indexes structure for table ACCOUNT_BIJDRAGE
-- ----------------------------
CREATE UNIQUE INDEX "TEST"."account_bijdrage"
ON "TEST"."ACCOUNT_BIJDRAGE" ("account_id" ASC, "bijdrage_id" ASC)
LOGGING
VISIBLE;
CREATE INDEX "TEST"."account_id2"
ON "TEST"."ACCOUNT_BIJDRAGE" ("account_id" ASC)
LOGGING
VISIBLE;
CREATE INDEX "TEST"."bijdrage_id"
ON "TEST"."ACCOUNT_BIJDRAGE" ("bijdrage_id" ASC)
LOGGING
VISIBLE;

-- ----------------------------
-- Triggers structure for table "TEST"."ACCOUNT_BIJDRAGE"
-- ----------------------------
CREATE OR REPLACE TRIGGER "TEST"."ACCOUNT_BIJDRAGE_FCTG_BI" BEFORE INSERT ON "TEST"."ACCOUNT_BIJDRAGE" REFERENCING OLD AS "OLD" NEW AS "NEW" FOR EACH ROW ENABLE WHEN (new."ID" IS NULL)
BEGIN
  SELECT ACCOUNT_BIJDRAGE_FCSEQ.NEXTVAL INTO :new."ID" FROM dual;
END;
/
-- ----------------------------
-- Checks structure for table "TEST"."ACCOUNT_BIJDRAGE"
-- ----------------------------
ALTER TABLE "TEST"."ACCOUNT_BIJDRAGE" ADD CHECK ("ID" IS NOT NULL);
ALTER TABLE "TEST"."ACCOUNT_BIJDRAGE" ADD CHECK ("account_id" IS NOT NULL);
ALTER TABLE "TEST"."ACCOUNT_BIJDRAGE" ADD CHECK ("bijdrage_id" IS NOT NULL);
ALTER TABLE "TEST"."ACCOUNT_BIJDRAGE" ADD CHECK ("like" IS NOT NULL);
ALTER TABLE "TEST"."ACCOUNT_BIJDRAGE" ADD CHECK ("ongewenst" IS NOT NULL);

-- ----------------------------
-- Primary Key structure for table "TEST"."ACCOUNT_BIJDRAGE"
-- ----------------------------
ALTER TABLE "TEST"."ACCOUNT_BIJDRAGE" ADD PRIMARY KEY ("ID");

-- ----------------------------
-- Indexes structure for table BERICHT
-- ----------------------------

-- ----------------------------
-- Checks structure for table "TEST"."BERICHT"
-- ----------------------------
ALTER TABLE "TEST"."BERICHT" ADD CHECK ("bijdrage_id" IS NOT NULL);
ALTER TABLE "TEST"."BERICHT" ADD CHECK ("inhoud" IS NOT NULL);

-- ----------------------------
-- Primary Key structure for table "TEST"."BERICHT"
-- ----------------------------
ALTER TABLE "TEST"."BERICHT" ADD PRIMARY KEY ("bijdrage_id");

-- ----------------------------
-- Indexes structure for table BESTAND
-- ----------------------------
CREATE INDEX "TEST"."categorie_id1"
ON "TEST"."BESTAND" ("categorie_id" ASC)
LOGGING
VISIBLE;

-- ----------------------------
-- Checks structure for table "TEST"."BESTAND"
-- ----------------------------
ALTER TABLE "TEST"."BESTAND" ADD CHECK ("bijdrage_id" IS NOT NULL);
ALTER TABLE "TEST"."BESTAND" ADD CHECK ("categorie_id" IS NOT NULL);
ALTER TABLE "TEST"."BESTAND" ADD CHECK ("bestandslocatie" IS NOT NULL);

-- ----------------------------
-- Primary Key structure for table "TEST"."BESTAND"
-- ----------------------------
ALTER TABLE "TEST"."BESTAND" ADD PRIMARY KEY ("bijdrage_id");

-- ----------------------------
-- Indexes structure for table BIJDRAGE
-- ----------------------------
CREATE INDEX "TEST"."account_id1"
ON "TEST"."BIJDRAGE" ("account_id" ASC)
LOGGING
VISIBLE;

-- ----------------------------
-- Triggers structure for table "TEST"."BIJDRAGE"
-- ----------------------------
CREATE OR REPLACE TRIGGER "TEST"."BIJDRAGE_FCTG_BI" BEFORE INSERT ON "TEST"."BIJDRAGE" REFERENCING OLD AS "OLD" NEW AS "NEW" FOR EACH ROW ENABLE WHEN (new."ID" IS NULL)
BEGIN
  SELECT BIJDRAGE_FCSEQ.NEXTVAL INTO :new."ID" FROM dual;
END;
/
-- ----------------------------
-- Checks structure for table "TEST"."BIJDRAGE"
-- ----------------------------
ALTER TABLE "TEST"."BIJDRAGE" ADD CHECK ("ID" IS NOT NULL);
ALTER TABLE "TEST"."BIJDRAGE" ADD CHECK ("account_id" IS NOT NULL);
ALTER TABLE "TEST"."BIJDRAGE" ADD CHECK ("soort" IS NOT NULL);

-- ----------------------------
-- Primary Key structure for table "TEST"."BIJDRAGE"
-- ----------------------------
ALTER TABLE "TEST"."BIJDRAGE" ADD PRIMARY KEY ("ID");

-- ----------------------------
-- Indexes structure for table CATEGORIE
-- ----------------------------
CREATE INDEX "TEST"."categorie_id"
ON "TEST"."CATEGORIE" ("categorie_id" ASC)
LOGGING
VISIBLE;

-- ----------------------------
-- Checks structure for table "TEST"."CATEGORIE"
-- ----------------------------
ALTER TABLE "TEST"."CATEGORIE" ADD CHECK ("bijdrage_id" IS NOT NULL);
ALTER TABLE "TEST"."CATEGORIE" ADD CHECK ("naam" IS NOT NULL);

-- ----------------------------
-- Primary Key structure for table "TEST"."CATEGORIE"
-- ----------------------------
ALTER TABLE "TEST"."CATEGORIE" ADD PRIMARY KEY ("bijdrage_id");

-- ----------------------------
-- Indexes structure for table EVENT
-- ----------------------------
CREATE INDEX "TEST"."locatie_id"
ON "TEST"."EVENT" ("locatie_id" ASC)
LOGGING
VISIBLE;
CREATE UNIQUE INDEX "TEST"."naam_datumStart"
ON "TEST"."EVENT" ("naam" ASC, "datumstart" ASC)
LOGGING
VISIBLE;

-- ----------------------------
-- Triggers structure for table "TEST"."EVENT"
-- ----------------------------
CREATE OR REPLACE TRIGGER "TEST"."EVENT_FCTG_BI" BEFORE INSERT ON "TEST"."EVENT" REFERENCING OLD AS "OLD" NEW AS "NEW" FOR EACH ROW ENABLE WHEN (new."ID" IS NULL)
BEGIN
  SELECT EVENT_FCSEQ.NEXTVAL INTO :new."ID" FROM dual;
END;
/
-- ----------------------------
-- Checks structure for table "TEST"."EVENT"
-- ----------------------------
ALTER TABLE "TEST"."EVENT" ADD CHECK ("ID" IS NOT NULL);
ALTER TABLE "TEST"."EVENT" ADD CHECK ("naam" IS NOT NULL);

-- ----------------------------
-- Primary Key structure for table "TEST"."EVENT"
-- ----------------------------
ALTER TABLE "TEST"."EVENT" ADD PRIMARY KEY ("ID");

-- ----------------------------
-- Indexes structure for table GEBRUIKERSGROEP
-- ----------------------------
CREATE UNIQUE INDEX "TEST"."naam2"
ON "TEST"."GEBRUIKERSGROEP" ("naam" ASC)
LOGGING
VISIBLE;

-- ----------------------------
-- Triggers structure for table "TEST"."GEBRUIKERSGROEP"
-- ----------------------------
CREATE OR REPLACE TRIGGER "TEST"."GEBRUIKERSGROEP_FCTG_BI" BEFORE INSERT ON "TEST"."GEBRUIKERSGROEP" REFERENCING OLD AS "OLD" NEW AS "NEW" FOR EACH ROW ENABLE WHEN (new."ID" IS NULL)
BEGIN
  SELECT GEBRUIKERSGROEP_FCSEQ.NEXTVAL INTO :new."ID" FROM dual;
END;
/
-- ----------------------------
-- Checks structure for table "TEST"."GEBRUIKERSGROEP"
-- ----------------------------
ALTER TABLE "TEST"."GEBRUIKERSGROEP" ADD CHECK ("ID" IS NOT NULL);
ALTER TABLE "TEST"."GEBRUIKERSGROEP" ADD CHECK ("naam" IS NOT NULL);

-- ----------------------------
-- Primary Key structure for table "TEST"."GEBRUIKERSGROEP"
-- ----------------------------
ALTER TABLE "TEST"."GEBRUIKERSGROEP" ADD PRIMARY KEY ("ID");

-- ----------------------------
-- Indexes structure for table LOCATIE
-- ----------------------------
CREATE UNIQUE INDEX "TEST"."naam"
ON "TEST"."LOCATIE" ("naam" ASC)
LOGGING
VISIBLE;
CREATE INDEX "TEST"."postcode"
ON "TEST"."LOCATIE" ("postcode" ASC)
LOGGING
VISIBLE;

-- ----------------------------
-- Triggers structure for table "TEST"."LOCATIE"
-- ----------------------------
CREATE OR REPLACE TRIGGER "TEST"."LOCATIE_FCTG_BI" BEFORE INSERT ON "TEST"."LOCATIE" REFERENCING OLD AS "OLD" NEW AS "NEW" FOR EACH ROW ENABLE WHEN (new."ID" IS NULL)
BEGIN
  SELECT LOCATIE_FCSEQ.NEXTVAL INTO :new."ID" FROM dual;
END;
/
-- ----------------------------
-- Checks structure for table "TEST"."LOCATIE"
-- ----------------------------
ALTER TABLE "TEST"."LOCATIE" ADD CHECK ("ID" IS NOT NULL);
ALTER TABLE "TEST"."LOCATIE" ADD CHECK ("naam" IS NOT NULL);

-- ----------------------------
-- Primary Key structure for table "TEST"."LOCATIE"
-- ----------------------------
ALTER TABLE "TEST"."LOCATIE" ADD PRIMARY KEY ("ID");

-- ----------------------------
-- Indexes structure for table PERSOON
-- ----------------------------

-- ----------------------------
-- Triggers structure for table "TEST"."PERSOON"
-- ----------------------------
CREATE OR REPLACE TRIGGER "TEST"."PERSOON_FCTG_BI" BEFORE INSERT ON "TEST"."PERSOON" REFERENCING OLD AS "OLD" NEW AS "NEW" FOR EACH ROW ENABLE WHEN (new."ID" IS NULL)
BEGIN
  SELECT PERSOON_FCSEQ.NEXTVAL INTO :new."ID" FROM dual;
END;
/
-- ----------------------------
-- Checks structure for table "TEST"."PERSOON"
-- ----------------------------
ALTER TABLE "TEST"."PERSOON" ADD CHECK ("ID" IS NOT NULL);
ALTER TABLE "TEST"."PERSOON" ADD CHECK ("voornaam" IS NOT NULL);
ALTER TABLE "TEST"."PERSOON" ADD CHECK ("achternaam" IS NOT NULL);

-- ----------------------------
-- Primary Key structure for table "TEST"."PERSOON"
-- ----------------------------
ALTER TABLE "TEST"."PERSOON" ADD PRIMARY KEY ("ID");

-- ----------------------------
-- Indexes structure for table PLEK
-- ----------------------------
CREATE INDEX "TEST"."locatie_id1"
ON "TEST"."PLEK" ("locatie_id" ASC)
LOGGING
VISIBLE;
CREATE UNIQUE INDEX "TEST"."locatie_nummer"
ON "TEST"."PLEK" ("locatie_id" ASC, "nummer" ASC)
LOGGING
VISIBLE;
CREATE INDEX "TEST"."nummer1"
ON "TEST"."PLEK" ("nummer" ASC)
LOGGING
VISIBLE;

-- ----------------------------
-- Triggers structure for table "TEST"."PLEK"
-- ----------------------------
CREATE OR REPLACE TRIGGER "TEST"."PLEK_FCTG_BI" BEFORE INSERT ON "TEST"."PLEK" REFERENCING OLD AS "OLD" NEW AS "NEW" FOR EACH ROW ENABLE WHEN (new."ID" IS NULL)
BEGIN
  SELECT PLEK_FCSEQ.NEXTVAL INTO :new."ID" FROM dual;
END;
/
-- ----------------------------
-- Checks structure for table "TEST"."PLEK"
-- ----------------------------
ALTER TABLE "TEST"."PLEK" ADD CHECK ("ID" IS NOT NULL);
ALTER TABLE "TEST"."PLEK" ADD CHECK ("locatie_id" IS NOT NULL);

-- ----------------------------
-- Primary Key structure for table "TEST"."PLEK"
-- ----------------------------
ALTER TABLE "TEST"."PLEK" ADD PRIMARY KEY ("ID");

-- ----------------------------
-- Indexes structure for table PLEK_RESERVERING
-- ----------------------------
CREATE INDEX "TEST"."plek_id"
ON "TEST"."PLEK_RESERVERING" ("plek_id" ASC)
LOGGING
VISIBLE;
CREATE UNIQUE INDEX "TEST"."plek_reservering"
ON "TEST"."PLEK_RESERVERING" ("plek_id" ASC, "reservering_id" ASC)
LOGGING
VISIBLE;
CREATE INDEX "TEST"."reservering_id2"
ON "TEST"."PLEK_RESERVERING" ("reservering_id" ASC)
LOGGING
VISIBLE;

-- ----------------------------
-- Triggers structure for table "TEST"."PLEK_RESERVERING"
-- ----------------------------
CREATE OR REPLACE TRIGGER "TEST"."PLEK_RESERVERING_FCTG_BI" BEFORE INSERT ON "TEST"."PLEK_RESERVERING" REFERENCING OLD AS "OLD" NEW AS "NEW" FOR EACH ROW ENABLE WHEN (new."ID" IS NULL)
BEGIN
  SELECT PLEK_RESERVERING_FCSEQ.NEXTVAL INTO :new."ID" FROM dual;
END;
/
-- ----------------------------
-- Checks structure for table "TEST"."PLEK_RESERVERING"
-- ----------------------------
ALTER TABLE "TEST"."PLEK_RESERVERING" ADD CHECK ("ID" IS NOT NULL);
ALTER TABLE "TEST"."PLEK_RESERVERING" ADD CHECK ("plek_id" IS NOT NULL);
ALTER TABLE "TEST"."PLEK_RESERVERING" ADD CHECK ("reservering_id" IS NOT NULL);

-- ----------------------------
-- Primary Key structure for table "TEST"."PLEK_RESERVERING"
-- ----------------------------
ALTER TABLE "TEST"."PLEK_RESERVERING" ADD PRIMARY KEY ("ID");

-- ----------------------------
-- Indexes structure for table PLEK_SPECIFICATIE
-- ----------------------------
CREATE INDEX "TEST"."plek_id1"
ON "TEST"."PLEK_SPECIFICATIE" ("plek_id" ASC)
LOGGING
VISIBLE;
CREATE UNIQUE INDEX "TEST"."plek_specificatie"
ON "TEST"."PLEK_SPECIFICATIE" ("plek_id" ASC, "specificatie_id" ASC)
LOGGING
VISIBLE;

-- ----------------------------
-- Triggers structure for table "TEST"."PLEK_SPECIFICATIE"
-- ----------------------------
CREATE OR REPLACE TRIGGER "TEST"."PLEK_SPECIFICATIE_FCTG_BI" BEFORE INSERT ON "TEST"."PLEK_SPECIFICATIE" REFERENCING OLD AS "OLD" NEW AS "NEW" FOR EACH ROW ENABLE WHEN (new."id" IS NULL)
BEGIN
  SELECT PLEK_SPECIFICATIE_FCSEQ.NEXTVAL INTO :new."id" FROM dual;
END;
/
-- ----------------------------
-- Checks structure for table "TEST"."PLEK_SPECIFICATIE"
-- ----------------------------
ALTER TABLE "TEST"."PLEK_SPECIFICATIE" ADD CHECK ("id" IS NOT NULL);
ALTER TABLE "TEST"."PLEK_SPECIFICATIE" ADD CHECK ("specificatie_id" IS NOT NULL);
ALTER TABLE "TEST"."PLEK_SPECIFICATIE" ADD CHECK ("plek_id" IS NOT NULL);
ALTER TABLE "TEST"."PLEK_SPECIFICATIE" ADD CHECK ("waarde" IS NOT NULL);

-- ----------------------------
-- Primary Key structure for table "TEST"."PLEK_SPECIFICATIE"
-- ----------------------------
ALTER TABLE "TEST"."PLEK_SPECIFICATIE" ADD PRIMARY KEY ("id");

-- ----------------------------
-- Indexes structure for table POLSBANDJE
-- ----------------------------
CREATE UNIQUE INDEX "TEST"."RFID"
ON "TEST"."POLSBANDJE" ("rfid" ASC)
LOGGING
VISIBLE;
CREATE UNIQUE INDEX "TEST"."nummer"
ON "TEST"."POLSBANDJE" ("nummer" ASC)
LOGGING
VISIBLE;

-- ----------------------------
-- Triggers structure for table "TEST"."POLSBANDJE"
-- ----------------------------
CREATE OR REPLACE TRIGGER "TEST"."POLSBANDJE_FCTG_BI" BEFORE INSERT ON "TEST"."POLSBANDJE" REFERENCING OLD AS "OLD" NEW AS "NEW" FOR EACH ROW ENABLE WHEN (new."ID" IS NULL)
BEGIN
  SELECT POLSBANDJE_FCSEQ.NEXTVAL INTO :new."ID" FROM dual;
END;
/
-- ----------------------------
-- Checks structure for table "TEST"."POLSBANDJE"
-- ----------------------------
ALTER TABLE "TEST"."POLSBANDJE" ADD CHECK ("ID" IS NOT NULL);
ALTER TABLE "TEST"."POLSBANDJE" ADD CHECK ("rfid" IS NOT NULL);
ALTER TABLE "TEST"."POLSBANDJE" ADD CHECK ("nummer" IS NOT NULL);
ALTER TABLE "TEST"."POLSBANDJE" ADD CHECK ("actief" IS NOT NULL);

-- ----------------------------
-- Primary Key structure for table "TEST"."POLSBANDJE"
-- ----------------------------
ALTER TABLE "TEST"."POLSBANDJE" ADD PRIMARY KEY ("ID");

-- ----------------------------
-- Indexes structure for table PRODUCT
-- ----------------------------
CREATE INDEX "TEST"."productcat_id1"
ON "TEST"."PRODUCT" ("productcat_id" ASC)
LOGGING
VISIBLE;

-- ----------------------------
-- Triggers structure for table "TEST"."PRODUCT"
-- ----------------------------
CREATE OR REPLACE TRIGGER "TEST"."PRODUCT_FCTG_BI" BEFORE INSERT ON "TEST"."PRODUCT" REFERENCING OLD AS "OLD" NEW AS "NEW" FOR EACH ROW ENABLE WHEN (new."ID" IS NULL)
BEGIN
  SELECT PRODUCT_FCSEQ.NEXTVAL INTO :new."ID" FROM dual;
END;
/
-- ----------------------------
-- Checks structure for table "TEST"."PRODUCT"
-- ----------------------------
ALTER TABLE "TEST"."PRODUCT" ADD CHECK ("ID" IS NOT NULL);
ALTER TABLE "TEST"."PRODUCT" ADD CHECK ("productcat_id" IS NOT NULL);

-- ----------------------------
-- Primary Key structure for table "TEST"."PRODUCT"
-- ----------------------------
ALTER TABLE "TEST"."PRODUCT" ADD PRIMARY KEY ("ID");

-- ----------------------------
-- Indexes structure for table PRODUCTCAT
-- ----------------------------
CREATE UNIQUE INDEX "TEST"."naam1"
ON "TEST"."PRODUCTCAT" ("naam" ASC)
LOGGING
VISIBLE;
CREATE INDEX "TEST"."productcat_id"
ON "TEST"."PRODUCTCAT" ("productcat_id" ASC)
LOGGING
VISIBLE;

-- ----------------------------
-- Triggers structure for table "TEST"."PRODUCTCAT"
-- ----------------------------
CREATE OR REPLACE TRIGGER "TEST"."PRODUCTCAT_FCTG_BI" BEFORE INSERT ON "TEST"."PRODUCTCAT" REFERENCING OLD AS "OLD" NEW AS "NEW" FOR EACH ROW ENABLE WHEN (new."ID" IS NULL)
BEGIN
  SELECT PRODUCTCAT_FCSEQ.NEXTVAL INTO :new."ID" FROM dual;
END;
/
-- ----------------------------
-- Checks structure for table "TEST"."PRODUCTCAT"
-- ----------------------------
ALTER TABLE "TEST"."PRODUCTCAT" ADD CHECK ("ID" IS NOT NULL);
ALTER TABLE "TEST"."PRODUCTCAT" ADD CHECK ("naam" IS NOT NULL);

-- ----------------------------
-- Primary Key structure for table "TEST"."PRODUCTCAT"
-- ----------------------------
ALTER TABLE "TEST"."PRODUCTCAT" ADD PRIMARY KEY ("ID");

-- ----------------------------
-- Indexes structure for table PRODUCTEXEMPLAAR
-- ----------------------------
CREATE UNIQUE INDEX "TEST"."barcode"
ON "TEST"."PRODUCTEXEMPLAAR" ("barcode" ASC)
LOGGING
VISIBLE;
CREATE UNIQUE INDEX "TEST"."product_volgnummer"
ON "TEST"."PRODUCTEXEMPLAAR" ("product_id" ASC, "volgnummer" ASC)
LOGGING
VISIBLE;

-- ----------------------------
-- Triggers structure for table "TEST"."PRODUCTEXEMPLAAR"
-- ----------------------------
CREATE OR REPLACE TRIGGER "TEST"."PRODUCTEXEMPLAAR_FCTG_BI" BEFORE INSERT ON "TEST"."PRODUCTEXEMPLAAR" REFERENCING OLD AS "OLD" NEW AS "NEW" FOR EACH ROW ENABLE WHEN (new."ID" IS NULL)
BEGIN
  SELECT PRODUCTEXEMPLAAR_FCSEQ.NEXTVAL INTO :new."ID" FROM dual;
END;
/
-- ----------------------------
-- Checks structure for table "TEST"."PRODUCTEXEMPLAAR"
-- ----------------------------
ALTER TABLE "TEST"."PRODUCTEXEMPLAAR" ADD CHECK ("ID" IS NOT NULL);
ALTER TABLE "TEST"."PRODUCTEXEMPLAAR" ADD CHECK ("product_id" IS NOT NULL);
ALTER TABLE "TEST"."PRODUCTEXEMPLAAR" ADD CHECK ("volgnummer" IS NOT NULL);

-- ----------------------------
-- Primary Key structure for table "TEST"."PRODUCTEXEMPLAAR"
-- ----------------------------
ALTER TABLE "TEST"."PRODUCTEXEMPLAAR" ADD PRIMARY KEY ("ID");

-- ----------------------------
-- Indexes structure for table RESERVERING
-- ----------------------------
CREATE INDEX "TEST"."persoon_id"
ON "TEST"."RESERVERING" ("persoon_id" ASC)
LOGGING
VISIBLE;

-- ----------------------------
-- Triggers structure for table "TEST"."RESERVERING"
-- ----------------------------
CREATE OR REPLACE TRIGGER "TEST"."RESERVERING_FCTG_BI" BEFORE INSERT ON "TEST"."RESERVERING" REFERENCING OLD AS "OLD" NEW AS "NEW" FOR EACH ROW ENABLE WHEN (new."ID" IS NULL)
BEGIN
  SELECT RESERVERING_FCSEQ.NEXTVAL INTO :new."ID" FROM dual;
END;
/
-- ----------------------------
-- Checks structure for table "TEST"."RESERVERING"
-- ----------------------------
ALTER TABLE "TEST"."RESERVERING" ADD CHECK ("ID" IS NOT NULL);
ALTER TABLE "TEST"."RESERVERING" ADD CHECK ("persoon_id" IS NOT NULL);
ALTER TABLE "TEST"."RESERVERING" ADD CHECK ("betaald" IS NOT NULL);

-- ----------------------------
-- Primary Key structure for table "TEST"."RESERVERING"
-- ----------------------------
ALTER TABLE "TEST"."RESERVERING" ADD PRIMARY KEY ("ID");

-- ----------------------------
-- Indexes structure for table RESERVERING_POLSBANDJE
-- ----------------------------
CREATE INDEX "TEST"."account_id"
ON "TEST"."RESERVERING_POLSBANDJE" ("account_id" ASC)
LOGGING
VISIBLE;
CREATE INDEX "TEST"."polsbandje_id"
ON "TEST"."RESERVERING_POLSBANDJE" ("polsbandje_id" ASC)
LOGGING
VISIBLE;
CREATE UNIQUE INDEX "TEST"."reservering_account"
ON "TEST"."RESERVERING_POLSBANDJE" ("reservering_id" ASC, "account_id" ASC)
LOGGING
VISIBLE;
CREATE INDEX "TEST"."reservering_id1"
ON "TEST"."RESERVERING_POLSBANDJE" ("reservering_id" ASC)
LOGGING
VISIBLE;
CREATE UNIQUE INDEX "TEST"."reservering_polsbandje"
ON "TEST"."RESERVERING_POLSBANDJE" ("reservering_id" ASC, "polsbandje_id" ASC)
LOGGING
VISIBLE;

-- ----------------------------
-- Triggers structure for table "TEST"."RESERVERING_POLSBANDJE"
-- ----------------------------
CREATE OR REPLACE TRIGGER "TEST"."RESERVERING_POLSBANDJE_FCTG_BI" BEFORE INSERT ON "TEST"."RESERVERING_POLSBANDJE" REFERENCING OLD AS "OLD" NEW AS "NEW" FOR EACH ROW ENABLE WHEN (new."ID" IS NULL)
BEGIN
  SELECT RESERVERING_POLSBANDJE_FCSEQ.NEXTVAL INTO :new."ID" FROM dual;
END;
/
-- ----------------------------
-- Checks structure for table "TEST"."RESERVERING_POLSBANDJE"
-- ----------------------------
ALTER TABLE "TEST"."RESERVERING_POLSBANDJE" ADD CHECK ("ID" IS NOT NULL);
ALTER TABLE "TEST"."RESERVERING_POLSBANDJE" ADD CHECK ("reservering_id" IS NOT NULL);
ALTER TABLE "TEST"."RESERVERING_POLSBANDJE" ADD CHECK ("polsbandje_id" IS NOT NULL);
ALTER TABLE "TEST"."RESERVERING_POLSBANDJE" ADD CHECK ("account_id" IS NOT NULL);
ALTER TABLE "TEST"."RESERVERING_POLSBANDJE" ADD CHECK ("aanwezig" IS NOT NULL);

-- ----------------------------
-- Primary Key structure for table "TEST"."RESERVERING_POLSBANDJE"
-- ----------------------------
ALTER TABLE "TEST"."RESERVERING_POLSBANDJE" ADD PRIMARY KEY ("ID");

-- ----------------------------
-- Indexes structure for table SPECIFICATIE
-- ----------------------------
CREATE UNIQUE INDEX "TEST"."naam3"
ON "TEST"."SPECIFICATIE" ("naam" ASC)
LOGGING
VISIBLE;

-- ----------------------------
-- Triggers structure for table "TEST"."SPECIFICATIE"
-- ----------------------------
CREATE OR REPLACE TRIGGER "TEST"."SPECIFICATIE_FCTG_BI" BEFORE INSERT ON "TEST"."SPECIFICATIE" REFERENCING OLD AS "OLD" NEW AS "NEW" FOR EACH ROW ENABLE WHEN (new."ID" IS NULL)
BEGIN
  SELECT SPECIFICATIE_FCSEQ.NEXTVAL INTO :new."ID" FROM dual;
END;
/
-- ----------------------------
-- Checks structure for table "TEST"."SPECIFICATIE"
-- ----------------------------
ALTER TABLE "TEST"."SPECIFICATIE" ADD CHECK ("ID" IS NOT NULL);
ALTER TABLE "TEST"."SPECIFICATIE" ADD CHECK ("naam" IS NOT NULL);

-- ----------------------------
-- Primary Key structure for table "TEST"."SPECIFICATIE"
-- ----------------------------
ALTER TABLE "TEST"."SPECIFICATIE" ADD PRIMARY KEY ("ID");

-- ----------------------------
-- Indexes structure for table VERHUUR
-- ----------------------------
CREATE INDEX "TEST"."reservering_id"
ON "TEST"."VERHUUR" ("res_pb_id" ASC)
LOGGING
VISIBLE;

-- ----------------------------
-- Triggers structure for table "TEST"."VERHUUR"
-- ----------------------------
CREATE OR REPLACE TRIGGER "TEST"."VERHUUR_FCTG_BI" BEFORE INSERT ON "TEST"."VERHUUR" REFERENCING OLD AS "OLD" NEW AS "NEW" FOR EACH ROW ENABLE WHEN (new."ID" IS NULL)
BEGIN
  SELECT VERHUUR_FCSEQ.NEXTVAL INTO :new."ID" FROM dual;
END;
/
-- ----------------------------
-- Checks structure for table "TEST"."VERHUUR"
-- ----------------------------
ALTER TABLE "TEST"."VERHUUR" ADD CHECK ("ID" IS NOT NULL);
ALTER TABLE "TEST"."VERHUUR" ADD CHECK ("betaald" IS NOT NULL);

-- ----------------------------
-- Primary Key structure for table "TEST"."VERHUUR"
-- ----------------------------
ALTER TABLE "TEST"."VERHUUR" ADD PRIMARY KEY ("ID");

-- ----------------------------
-- Foreign Key structure for table "TEST"."ACCOUNT"
-- ----------------------------
ALTER TABLE "TEST"."ACCOUNT" ADD FOREIGN KEY ("gebruikersgroep_id") REFERENCES "TEST"."GEBRUIKERSGROEP" ("ID");

-- ----------------------------
-- Foreign Key structure for table "TEST"."ACCOUNT_BIJDRAGE"
-- ----------------------------
ALTER TABLE "TEST"."ACCOUNT_BIJDRAGE" ADD FOREIGN KEY ("account_id") REFERENCES "TEST"."ACCOUNT" ("ID");
ALTER TABLE "TEST"."ACCOUNT_BIJDRAGE" ADD FOREIGN KEY ("bijdrage_id") REFERENCES "TEST"."BIJDRAGE" ("ID");

-- ----------------------------
-- Foreign Key structure for table "TEST"."BERICHT"
-- ----------------------------
ALTER TABLE "TEST"."BERICHT" ADD FOREIGN KEY ("bijdrage_id") REFERENCES "TEST"."BIJDRAGE" ("ID");
ALTER TABLE "TEST"."BERICHT" ADD FOREIGN KEY ("bijdrage_id_over") REFERENCES "TEST"."BIJDRAGE" ("ID");

-- ----------------------------
-- Foreign Key structure for table "TEST"."BESTAND"
-- ----------------------------
ALTER TABLE "TEST"."BESTAND" ADD FOREIGN KEY ("bijdrage_id") REFERENCES "TEST"."BIJDRAGE" ("ID");
ALTER TABLE "TEST"."BESTAND" ADD FOREIGN KEY ("categorie_id") REFERENCES "TEST"."CATEGORIE" ("bijdrage_id");

-- ----------------------------
-- Foreign Key structure for table "TEST"."BIJDRAGE"
-- ----------------------------
ALTER TABLE "TEST"."BIJDRAGE" ADD FOREIGN KEY ("account_id") REFERENCES "TEST"."ACCOUNT" ("ID");

-- ----------------------------
-- Foreign Key structure for table "TEST"."CATEGORIE"
-- ----------------------------
ALTER TABLE "TEST"."CATEGORIE" ADD FOREIGN KEY ("bijdrage_id") REFERENCES "TEST"."BIJDRAGE" ("ID");
ALTER TABLE "TEST"."CATEGORIE" ADD FOREIGN KEY ("categorie_id") REFERENCES "TEST"."CATEGORIE" ("bijdrage_id");

-- ----------------------------
-- Foreign Key structure for table "TEST"."EVENT"
-- ----------------------------
ALTER TABLE "TEST"."EVENT" ADD FOREIGN KEY ("locatie_id") REFERENCES "TEST"."LOCATIE" ("ID");

-- ----------------------------
-- Foreign Key structure for table "TEST"."PLEK"
-- ----------------------------
ALTER TABLE "TEST"."PLEK" ADD FOREIGN KEY ("locatie_id") REFERENCES "TEST"."LOCATIE" ("ID");

-- ----------------------------
-- Foreign Key structure for table "TEST"."PLEK_RESERVERING"
-- ----------------------------
ALTER TABLE "TEST"."PLEK_RESERVERING" ADD FOREIGN KEY ("plek_id") REFERENCES "TEST"."PLEK" ("ID");
ALTER TABLE "TEST"."PLEK_RESERVERING" ADD FOREIGN KEY ("reservering_id") REFERENCES "TEST"."RESERVERING" ("ID");

-- ----------------------------
-- Foreign Key structure for table "TEST"."PLEK_SPECIFICATIE"
-- ----------------------------
ALTER TABLE "TEST"."PLEK_SPECIFICATIE" ADD FOREIGN KEY ("plek_id") REFERENCES "TEST"."PLEK" ("ID");
ALTER TABLE "TEST"."PLEK_SPECIFICATIE" ADD FOREIGN KEY ("specificatie_id") REFERENCES "TEST"."SPECIFICATIE" ("ID");

-- ----------------------------
-- Foreign Key structure for table "TEST"."PRODUCT"
-- ----------------------------
ALTER TABLE "TEST"."PRODUCT" ADD FOREIGN KEY ("productcat_id") REFERENCES "TEST"."PRODUCTCAT" ("ID");

-- ----------------------------
-- Foreign Key structure for table "TEST"."PRODUCTCAT"
-- ----------------------------
ALTER TABLE "TEST"."PRODUCTCAT" ADD FOREIGN KEY ("productcat_id") REFERENCES "TEST"."PRODUCTCAT" ("ID");

-- ----------------------------
-- Foreign Key structure for table "TEST"."PRODUCTEXEMPLAAR"
-- ----------------------------
ALTER TABLE "TEST"."PRODUCTEXEMPLAAR" ADD FOREIGN KEY ("product_id") REFERENCES "TEST"."PRODUCT" ("ID");

-- ----------------------------
-- Foreign Key structure for table "TEST"."RESERVERING"
-- ----------------------------
ALTER TABLE "TEST"."RESERVERING" ADD FOREIGN KEY ("persoon_id") REFERENCES "TEST"."PERSOON" ("ID");

-- ----------------------------
-- Foreign Key structure for table "TEST"."RESERVERING_POLSBANDJE"
-- ----------------------------
ALTER TABLE "TEST"."RESERVERING_POLSBANDJE" ADD FOREIGN KEY ("account_id") REFERENCES "TEST"."ACCOUNT" ("ID");
ALTER TABLE "TEST"."RESERVERING_POLSBANDJE" ADD FOREIGN KEY ("polsbandje_id") REFERENCES "TEST"."POLSBANDJE" ("ID");
ALTER TABLE "TEST"."RESERVERING_POLSBANDJE" ADD FOREIGN KEY ("reservering_id") REFERENCES "TEST"."RESERVERING" ("ID");

-- ----------------------------
-- Foreign Key structure for table "TEST"."VERHUUR"
-- ----------------------------
ALTER TABLE "TEST"."VERHUUR" ADD FOREIGN KEY ("productexemplaar_id") REFERENCES "TEST"."PRODUCTEXEMPLAAR" ("ID");
ALTER TABLE "TEST"."VERHUUR" ADD FOREIGN KEY ("res_pb_id") REFERENCES "TEST"."RESERVERING_POLSBANDJE" ("ID");
