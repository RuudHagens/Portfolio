/*
Due to bugs in the SQL exporter I had to make changes to this script:
-add / after each trigger so the next alter table wouldn't fail
-add cascade constraints to each drop table so the script can easily/neatly be rerun

Navicat Oracle Data Transfer
Oracle Client Version : 12.1.0.1.0

Source Server         : remise@localhost
Source Server Version : 110200
Source Host           : localhost:1521
Source Schema         : REMISE

Target Server Type    : ORACLE
Target Server Version : 110200
File Encoding         : 65001

Date: 2014-10-23 00:30:31
*/

-- ----------------------------
-- Table structure for "FUNCTIE"
-- ----------------------------
DROP TABLE "FUNCTIE" cascade constraints;
CREATE TABLE "FUNCTIE" (
"ID" NUMBER(10) NOT NULL ,
"Naam" NVARCHAR2(255) NULL 
)
LOGGING
NOCOMPRESS
NOCACHE

;

-- ----------------------------
-- Records of FUNCTIE
-- ----------------------------
INSERT INTO "FUNCTIE" VALUES ('1', '	Beheerder');
INSERT INTO "FUNCTIE" VALUES ('2', '	Wagenparkbeheerder');
INSERT INTO "FUNCTIE" VALUES ('3', '	Bestuurder');
INSERT INTO "FUNCTIE" VALUES ('4', '	Technicus');
INSERT INTO "FUNCTIE" VALUES ('5', '	Schoonmaker');

-- ----------------------------
-- Table structure for "FUNCTIE_RECHT"
-- ----------------------------
DROP TABLE "FUNCTIE_RECHT" cascade constraints;
CREATE TABLE "FUNCTIE_RECHT" (
"Functie_ID" NUMBER(10) NOT NULL ,
"Recht_ID" NUMBER(10) NOT NULL 
)
LOGGING
NOCOMPRESS
NOCACHE

;

-- ----------------------------
-- Records of FUNCTIE_RECHT
-- ----------------------------
INSERT INTO "FUNCTIE_RECHT" VALUES ('1', '1');
INSERT INTO "FUNCTIE_RECHT" VALUES ('1', '2');
INSERT INTO "FUNCTIE_RECHT" VALUES ('1', '3');
INSERT INTO "FUNCTIE_RECHT" VALUES ('1', '4');
INSERT INTO "FUNCTIE_RECHT" VALUES ('1', '5');
INSERT INTO "FUNCTIE_RECHT" VALUES ('1', '6');
INSERT INTO "FUNCTIE_RECHT" VALUES ('1', '7');
INSERT INTO "FUNCTIE_RECHT" VALUES ('2', '1');
INSERT INTO "FUNCTIE_RECHT" VALUES ('2', '2');
INSERT INTO "FUNCTIE_RECHT" VALUES ('2', '3');
INSERT INTO "FUNCTIE_RECHT" VALUES ('2', '4');
INSERT INTO "FUNCTIE_RECHT" VALUES ('3', '1');
INSERT INTO "FUNCTIE_RECHT" VALUES ('3', '2');
INSERT INTO "FUNCTIE_RECHT" VALUES ('3', '4');
INSERT INTO "FUNCTIE_RECHT" VALUES ('4', '2');
INSERT INTO "FUNCTIE_RECHT" VALUES ('4', '5');
INSERT INTO "FUNCTIE_RECHT" VALUES ('5', '6');
INSERT INTO "FUNCTIE_RECHT" VALUES ('5', '7');

-- ----------------------------
-- Table structure for "LIJN"
-- ----------------------------
DROP TABLE "LIJN" cascade constraints;
CREATE TABLE "LIJN" (
"ID" NUMBER(10) NOT NULL ,
"Remise_ID" NUMBER(10) NULL ,
"Nummer" NUMBER(10) DEFAULT (0)  NULL ,
"ConducteurRijdtMee" NUMBER(1) DEFAULT (0)  NOT NULL 
)
LOGGING
NOCOMPRESS
NOCACHE

;

-- ----------------------------
-- Records of LIJN
-- ----------------------------
INSERT INTO "LIJN" VALUES ('1', '1', '1', '1');
INSERT INTO "LIJN" VALUES ('2', '1', '2', '1');
INSERT INTO "LIJN" VALUES ('3', '1', '5', '0');
INSERT INTO "LIJN" VALUES ('4', '1', '10', '1');
INSERT INTO "LIJN" VALUES ('5', '1', '13', '1');
INSERT INTO "LIJN" VALUES ('6', '1', '16', '0');
INSERT INTO "LIJN" VALUES ('7', '1', '17', '1');
INSERT INTO "LIJN" VALUES ('8', '1', '24', '0');
INSERT INTO "LIJN" VALUES ('9', '2', '4', '0');
INSERT INTO "LIJN" VALUES ('10', '2', '7', '0');
INSERT INTO "LIJN" VALUES ('11', '2', '9', '0');
INSERT INTO "LIJN" VALUES ('12', '2', '12', '0');
INSERT INTO "LIJN" VALUES ('13', '2', '14', '0');
INSERT INTO "LIJN" VALUES ('14', '2', '25', '0');

-- ----------------------------
-- Table structure for "MEDEWERKER"
-- ----------------------------
DROP TABLE "MEDEWERKER" cascade constraints;
CREATE TABLE "MEDEWERKER" (
"ID" NUMBER(10) NOT NULL ,
"Functie_ID" NUMBER(10) NULL ,
"Naam" NVARCHAR2(255) NULL 
)
LOGGING
NOCOMPRESS
NOCACHE

;

-- ----------------------------
-- Records of MEDEWERKER
-- ----------------------------
INSERT INTO "MEDEWERKER" VALUES ('1', '1', 'Jan_Beheerder');
INSERT INTO "MEDEWERKER" VALUES ('2', '2', 'Piet_Wagenparkbeheerder');
INSERT INTO "MEDEWERKER" VALUES ('3', '3', 'Henk_Bestuurder');
INSERT INTO "MEDEWERKER" VALUES ('4', '4', 'Klaas_Technicus');
INSERT INTO "MEDEWERKER" VALUES ('5', '5', 'Sjaak_Schoonmaker');

-- ----------------------------
-- Table structure for "ONDERHOUD"
-- ----------------------------
DROP TABLE "ONDERHOUD" cascade constraints;
CREATE TABLE "ONDERHOUD" (
"GroteServiceBeurtenPerJaar" NUMBER(10) DEFAULT (0)  NULL ,
"KleineServiceBeurtenPerJaar" NUMBER(10) DEFAULT (0)  NULL ,
"GroteSchoonmaakBeurtenPerJaar" NUMBER(10) DEFAULT (0)  NULL ,
"KleineSchoonmaakBeurtenPerJaar" NUMBER(10) DEFAULT (0)  NULL 
)
LOGGING
NOCOMPRESS
NOCACHE

;

-- ----------------------------
-- Records of ONDERHOUD
-- ----------------------------
INSERT INTO "ONDERHOUD" VALUES ('2', '4', '4', '12');

-- ----------------------------
-- Table structure for "RECHT"
-- ----------------------------
DROP TABLE "RECHT" cascade constraints;
CREATE TABLE "RECHT" (
"ID" NUMBER(10) NOT NULL ,
"Omschrijving" NVARCHAR2(255) NULL 
)
LOGGING
NOCOMPRESS
NOCACHE

;

-- ----------------------------
-- Records of RECHT
-- ----------------------------
INSERT INTO "RECHT" VALUES ('1', 'Wagens invoeren');
INSERT INTO "RECHT" VALUES ('2', 'Status veranderen');
INSERT INTO "RECHT" VALUES ('3', 'Sporen blokkeren');
INSERT INTO "RECHT" VALUES ('4', 'Wagens naar de schoonmaak sturen');
INSERT INTO "RECHT" VALUES ('5', 'Tijdsindicatie reparatie geven');
INSERT INTO "RECHT" VALUES ('6', 'Schoonmaak lijst opvragen');
INSERT INTO "RECHT" VALUES ('7', 'Datum/tijd schoonmaak invoeren');

-- ----------------------------
-- Table structure for "REMISE"
-- ----------------------------
DROP TABLE "REMISE" cascade constraints;
CREATE TABLE "REMISE" (
"ID" NUMBER(10) NOT NULL ,
"Naam" NVARCHAR2(255) NULL ,
"GroteServiceBeurtenPerDag" NUMBER(10) DEFAULT (0)  NULL ,
"KleineServiceBeurtenPerDag" NUMBER(10) DEFAULT (0)  NULL ,
"GroteSchoonmaakBeurtenPerDag" NUMBER(10) DEFAULT (0)  NULL ,
"KleineSchoonmaakBeurtenPerDag" NUMBER(10) DEFAULT (0)  NULL 
)
LOGGING
NOCOMPRESS
NOCACHE

;

-- ----------------------------
-- Records of REMISE
-- ----------------------------
INSERT INTO "REMISE" VALUES ('1', 'Remise Havenstraat', '1', '4', '2', '3');
INSERT INTO "REMISE" VALUES ('2', 'Remise Lekstraat', '1', '4', '2', '3');

-- ----------------------------
-- Table structure for "RESERVERING"
-- ----------------------------
DROP TABLE "RESERVERING" cascade constraints;
CREATE TABLE "RESERVERING" (
"Reservering_ID" NUMBER(10) NOT NULL ,
"Tram_ID" NUMBER(10) DEFAULT (0)  NULL ,
"Spoor_ID" NUMBER(10) DEFAULT (0)  NULL 
)
LOGGING
NOCOMPRESS
NOCACHE

;

-- ----------------------------
-- Records of RESERVERING
-- ----------------------------

-- ----------------------------
-- Table structure for "SECTOR"
-- ----------------------------
DROP TABLE "SECTOR" cascade constraints;
CREATE TABLE "SECTOR" (
"ID" NUMBER(10) NOT NULL ,
"Spoor_ID" NUMBER(10) DEFAULT (0)  NULL ,
"Tram_ID" NUMBER(10) DEFAULT (0)  NULL ,
"Nummer" NUMBER(10) DEFAULT (0)  NULL ,
"Beschikbaar" NUMBER(1) DEFAULT (0)  NOT NULL ,
"Blokkade" NUMBER(1) DEFAULT (0)  NOT NULL 
)
LOGGING
NOCOMPRESS
NOCACHE

;

-- ----------------------------
-- Records of SECTOR
-- ----------------------------

-- ----------------------------
-- Table structure for "SPOOR"
-- ----------------------------
DROP TABLE "SPOOR" cascade constraints;
CREATE TABLE "SPOOR" (
"ID" NUMBER(10) NOT NULL ,
"Remise_ID" NUMBER(10) NULL ,
"Nummer" NUMBER(10) DEFAULT (0)  NULL ,
"Lengte" NUMBER(10) DEFAULT (0)  NULL ,
"Beschikbaar" NUMBER(1) DEFAULT (0)  NOT NULL ,
"InUitRijspoor" NUMBER(1) DEFAULT (0)  NOT NULL 
)
LOGGING
NOCOMPRESS
NOCACHE

;

-- ----------------------------
-- Records of SPOOR
-- ----------------------------
INSERT INTO "SPOOR" VALUES ('1', '1', '12', '0', '0', '0');
INSERT INTO "SPOOR" VALUES ('2', '1', '13', '0', '0', '0');
INSERT INTO "SPOOR" VALUES ('3', '1', '14', '0', '0', '0');
INSERT INTO "SPOOR" VALUES ('4', '1', '15', '0', '0', '0');
INSERT INTO "SPOOR" VALUES ('5', '1', '16', '0', '0', '0');
INSERT INTO "SPOOR" VALUES ('6', '1', '17', '0', '0', '0');
INSERT INTO "SPOOR" VALUES ('7', '1', '18', '0', '0', '0');
INSERT INTO "SPOOR" VALUES ('8', '1', '19', '0', '0', '0');
INSERT INTO "SPOOR" VALUES ('9', '1', '20', '0', '0', '0');
INSERT INTO "SPOOR" VALUES ('10', '1', '21', '0', '0', '0');
INSERT INTO "SPOOR" VALUES ('11', '1', '30', '0', '0', '0');
INSERT INTO "SPOOR" VALUES ('12', '1', '31', '0', '0', '0');
INSERT INTO "SPOOR" VALUES ('13', '1', '32', '0', '0', '0');
INSERT INTO "SPOOR" VALUES ('14', '1', '33', '0', '0', '0');
INSERT INTO "SPOOR" VALUES ('15', '1', '34', '0', '0', '0');
INSERT INTO "SPOOR" VALUES ('16', '1', '35', '0', '0', '0');
INSERT INTO "SPOOR" VALUES ('17', '1', '36', '0', '0', '0');
INSERT INTO "SPOOR" VALUES ('18', '1', '37', '0', '0', '0');
INSERT INTO "SPOOR" VALUES ('19', '1', '38', '0', '0', '0');
INSERT INTO "SPOOR" VALUES ('20', '1', '40', '0', '0', '1');
INSERT INTO "SPOOR" VALUES ('21', '1', '41', '0', '0', '0');
INSERT INTO "SPOOR" VALUES ('22', '1', '42', '0', '0', '0');
INSERT INTO "SPOOR" VALUES ('23', '1', '43', '0', '0', '0');
INSERT INTO "SPOOR" VALUES ('24', '1', '44', '0', '0', '0');
INSERT INTO "SPOOR" VALUES ('25', '1', '45', '0', '0', '0');
INSERT INTO "SPOOR" VALUES ('26', '1', '46', '0', '0', '0');
INSERT INTO "SPOOR" VALUES ('27', '1', '51', '0', '0', '0');
INSERT INTO "SPOOR" VALUES ('28', '1', '52', '0', '0', '0');
INSERT INTO "SPOOR" VALUES ('29', '1', '53', '0', '0', '0');
INSERT INTO "SPOOR" VALUES ('30', '1', '54', '0', '0', '0');
INSERT INTO "SPOOR" VALUES ('31', '1', '55', '0', '0', '0');
INSERT INTO "SPOOR" VALUES ('32', '1', '56', '0', '0', '0');
INSERT INTO "SPOOR" VALUES ('33', '1', '57', '0', '0', '0');
INSERT INTO "SPOOR" VALUES ('34', '1', '58', '0', '0', '1');
INSERT INTO "SPOOR" VALUES ('35', '1', '60', '0', '0', '0');
INSERT INTO "SPOOR" VALUES ('36', '1', '61', '0', '0', '0');
INSERT INTO "SPOOR" VALUES ('37', '1', '62', '0', '0', '0');
INSERT INTO "SPOOR" VALUES ('38', '1', '63', '0', '0', '0');
INSERT INTO "SPOOR" VALUES ('39', '1', '64', '0', '0', '0');
INSERT INTO "SPOOR" VALUES ('40', '1', '74', '0', '0', '0');
INSERT INTO "SPOOR" VALUES ('41', '1', '75', '0', '0', '0');
INSERT INTO "SPOOR" VALUES ('42', '1', '76', '0', '0', '0');
INSERT INTO "SPOOR" VALUES ('43', '1', '77', '0', '0', '0');

-- ----------------------------
-- Table structure for "TRAM"
-- ----------------------------
DROP TABLE "TRAM" cascade constraints;
CREATE TABLE "TRAM" (
"ID" NUMBER(10) NOT NULL ,
"Remise_ID_Standplaats" NUMBER(10) NULL ,
"Tramtype_ID" NUMBER(10) NULL ,
"Nummer" NUMBER(10) DEFAULT (0)  NULL ,
"Lengte" NUMBER(10) DEFAULT (1)  NULL ,
"Status" NVARCHAR2(255) NULL ,
"Vervuild" NUMBER(1) DEFAULT (0)  NOT NULL ,
"Defect" NUMBER(1) DEFAULT (0)  NOT NULL ,
"ConducteurGeschikt" NUMBER(1) DEFAULT (0)  NOT NULL ,
"Beschikbaar" NUMBER(1) DEFAULT (0)  NOT NULL 
)
LOGGING
NOCOMPRESS
NOCACHE

;

-- ----------------------------
-- Records of TRAM
-- ----------------------------
INSERT INTO "TRAM" VALUES ('1', '1', '1', '2001', '1', null, '0', '0', '1', '0');
INSERT INTO "TRAM" VALUES ('2', '1', '1', '2002', '1', null, '0', '0', '1', '0');
INSERT INTO "TRAM" VALUES ('3', '1', '1', '2003', '1', null, '0', '0', '1', '0');
INSERT INTO "TRAM" VALUES ('4', '1', '1', '2004', '1', null, '0', '0', '1', '0');
INSERT INTO "TRAM" VALUES ('5', '1', '1', '2005', '1', null, '0', '0', '1', '0');
INSERT INTO "TRAM" VALUES ('6', '1', '1', '2006', '1', null, '0', '0', '1', '0');
INSERT INTO "TRAM" VALUES ('7', '1', '1', '2007', '1', null, '0', '0', '1', '0');
INSERT INTO "TRAM" VALUES ('8', '1', '1', '2008', '1', null, '0', '0', '1', '0');
INSERT INTO "TRAM" VALUES ('9', '1', '1', '2009', '1', null, '0', '0', '1', '0');
INSERT INTO "TRAM" VALUES ('10', '1', '1', '2010', '1', null, '0', '0', '1', '0');
INSERT INTO "TRAM" VALUES ('11', '1', '1', '2011', '1', null, '0', '0', '1', '0');
INSERT INTO "TRAM" VALUES ('12', '1', '1', '2012', '1', null, '0', '0', '1', '0');
INSERT INTO "TRAM" VALUES ('13', '1', '1', '2013', '1', null, '0', '0', '1', '0');
INSERT INTO "TRAM" VALUES ('14', '1', '1', '2014', '1', null, '0', '0', '1', '0');
INSERT INTO "TRAM" VALUES ('15', '1', '1', '2015', '1', null, '0', '0', '1', '0');
INSERT INTO "TRAM" VALUES ('16', '1', '1', '2016', '1', null, '0', '0', '1', '0');
INSERT INTO "TRAM" VALUES ('17', '1', '1', '2017', '1', null, '0', '0', '1', '0');
INSERT INTO "TRAM" VALUES ('18', '1', '1', '2018', '1', null, '0', '0', '1', '0');
INSERT INTO "TRAM" VALUES ('19', '1', '1', '2019', '1', null, '0', '0', '1', '0');
INSERT INTO "TRAM" VALUES ('20', '1', '1', '2020', '1', null, '0', '0', '1', '0');
INSERT INTO "TRAM" VALUES ('21', '1', '1', '2021', '1', null, '0', '0', '1', '0');
INSERT INTO "TRAM" VALUES ('22', '1', '1', '2022', '1', null, '0', '0', '1', '0');
INSERT INTO "TRAM" VALUES ('23', '1', '1', '2023', '1', null, '0', '0', '1', '0');
INSERT INTO "TRAM" VALUES ('24', '1', '1', '2024', '1', null, '0', '0', '1', '0');
INSERT INTO "TRAM" VALUES ('25', '1', '1', '2025', '1', null, '0', '0', '1', '0');
INSERT INTO "TRAM" VALUES ('26', '1', '1', '2026', '1', null, '0', '0', '1', '0');
INSERT INTO "TRAM" VALUES ('27', '1', '1', '2027', '1', null, '0', '0', '1', '0');
INSERT INTO "TRAM" VALUES ('28', '1', '1', '2028', '1', null, '0', '0', '1', '0');
INSERT INTO "TRAM" VALUES ('29', '1', '1', '2029', '1', null, '0', '0', '1', '0');
INSERT INTO "TRAM" VALUES ('30', '1', '1', '2030', '1', null, '0', '0', '1', '0');
INSERT INTO "TRAM" VALUES ('31', '1', '1', '2031', '1', null, '0', '0', '1', '0');
INSERT INTO "TRAM" VALUES ('32', '1', '1', '2032', '1', null, '0', '0', '1', '0');
INSERT INTO "TRAM" VALUES ('33', '1', '1', '2033', '1', null, '0', '0', '1', '0');
INSERT INTO "TRAM" VALUES ('34', '1', '1', '2034', '1', null, '0', '0', '1', '0');
INSERT INTO "TRAM" VALUES ('35', '1', '1', '2035', '1', null, '0', '0', '1', '0');
INSERT INTO "TRAM" VALUES ('36', '1', '1', '2036', '1', null, '0', '0', '1', '0');
INSERT INTO "TRAM" VALUES ('37', '1', '1', '2037', '1', null, '0', '0', '1', '0');
INSERT INTO "TRAM" VALUES ('38', '1', '1', '2038', '1', null, '0', '0', '1', '0');
INSERT INTO "TRAM" VALUES ('39', '1', '1', '2039', '1', null, '0', '0', '1', '0');
INSERT INTO "TRAM" VALUES ('40', '1', '1', '2040', '1', null, '0', '0', '1', '0');
INSERT INTO "TRAM" VALUES ('41', '1', '1', '2041', '1', null, '0', '0', '1', '0');
INSERT INTO "TRAM" VALUES ('42', '1', '1', '2042', '1', null, '0', '0', '1', '0');
INSERT INTO "TRAM" VALUES ('43', '1', '1', '2043', '1', null, '0', '0', '1', '0');
INSERT INTO "TRAM" VALUES ('44', '1', '1', '2044', '1', null, '0', '0', '1', '0');
INSERT INTO "TRAM" VALUES ('45', '1', '1', '2045', '1', null, '0', '0', '1', '0');
INSERT INTO "TRAM" VALUES ('46', '1', '1', '2046', '1', null, '0', '0', '1', '0');
INSERT INTO "TRAM" VALUES ('47', '1', '1', '2047', '1', null, '0', '0', '1', '0');
INSERT INTO "TRAM" VALUES ('48', '1', '1', '2048', '1', null, '0', '0', '1', '0');
INSERT INTO "TRAM" VALUES ('49', '1', '1', '2049', '1', null, '0', '0', '1', '0');
INSERT INTO "TRAM" VALUES ('50', '1', '1', '2050', '1', null, '0', '0', '1', '0');
INSERT INTO "TRAM" VALUES ('51', '1', '1', '2051', '1', null, '0', '0', '1', '0');
INSERT INTO "TRAM" VALUES ('52', '1', '1', '2052', '1', null, '0', '0', '1', '0');
INSERT INTO "TRAM" VALUES ('53', '1', '1', '2053', '1', null, '0', '0', '1', '0');
INSERT INTO "TRAM" VALUES ('54', '1', '1', '2054', '1', null, '0', '0', '1', '0');
INSERT INTO "TRAM" VALUES ('55', '1', '1', '2055', '1', null, '0', '0', '1', '0');
INSERT INTO "TRAM" VALUES ('56', '1', '1', '2056', '1', null, '0', '0', '1', '0');
INSERT INTO "TRAM" VALUES ('57', '1', '1', '2057', '1', null, '0', '0', '1', '0');
INSERT INTO "TRAM" VALUES ('58', '1', '1', '2058', '1', null, '0', '0', '1', '0');
INSERT INTO "TRAM" VALUES ('59', '1', '1', '2059', '1', null, '0', '0', '1', '0');
INSERT INTO "TRAM" VALUES ('60', '1', '1', '2060', '1', null, '0', '0', '1', '0');
INSERT INTO "TRAM" VALUES ('61', '1', '1', '2061', '1', null, '0', '0', '1', '0');
INSERT INTO "TRAM" VALUES ('62', '1', '1', '2062', '1', null, '0', '0', '1', '0');
INSERT INTO "TRAM" VALUES ('63', '1', '1', '2063', '1', null, '0', '0', '1', '0');
INSERT INTO "TRAM" VALUES ('64', '1', '1', '2064', '1', null, '0', '0', '1', '0');
INSERT INTO "TRAM" VALUES ('65', '1', '1', '2065', '1', null, '0', '0', '1', '0');
INSERT INTO "TRAM" VALUES ('66', '1', '1', '2066', '1', null, '0', '0', '1', '0');
INSERT INTO "TRAM" VALUES ('67', '1', '1', '2067', '1', null, '0', '0', '1', '0');
INSERT INTO "TRAM" VALUES ('68', '1', '1', '2068', '1', null, '0', '0', '1', '0');
INSERT INTO "TRAM" VALUES ('69', '1', '1', '2069', '1', null, '0', '0', '1', '0');
INSERT INTO "TRAM" VALUES ('70', '1', '1', '2070', '1', null, '0', '0', '1', '0');
INSERT INTO "TRAM" VALUES ('71', '1', '1', '2071', '1', null, '0', '0', '1', '0');
INSERT INTO "TRAM" VALUES ('72', '1', '1', '2072', '1', null, '0', '0', '1', '0');
INSERT INTO "TRAM" VALUES ('73', '1', '2', '901', '1', null, '0', '0', '0', '0');
INSERT INTO "TRAM" VALUES ('74', '1', '2', '902', '1', null, '0', '0', '0', '0');
INSERT INTO "TRAM" VALUES ('75', '1', '2', '903', '1', null, '0', '0', '0', '0');
INSERT INTO "TRAM" VALUES ('76', '1', '2', '904', '1', null, '0', '0', '0', '0');
INSERT INTO "TRAM" VALUES ('77', '1', '2', '905', '1', null, '0', '0', '0', '0');
INSERT INTO "TRAM" VALUES ('78', '1', '2', '906', '1', null, '0', '0', '0', '0');
INSERT INTO "TRAM" VALUES ('79', '1', '2', '907', '1', null, '0', '0', '0', '0');
INSERT INTO "TRAM" VALUES ('80', '1', '2', '908', '1', null, '0', '0', '0', '0');
INSERT INTO "TRAM" VALUES ('81', '1', '2', '909', '1', null, '0', '0', '0', '0');
INSERT INTO "TRAM" VALUES ('82', '1', '2', '910', '1', null, '0', '0', '0', '0');
INSERT INTO "TRAM" VALUES ('83', '1', '2', '911', '1', null, '0', '0', '0', '0');
INSERT INTO "TRAM" VALUES ('84', '1', '2', '912', '1', null, '0', '0', '0', '0');
INSERT INTO "TRAM" VALUES ('85', '1', '2', '913', '1', null, '0', '0', '0', '0');
INSERT INTO "TRAM" VALUES ('86', '1', '2', '914', '1', null, '0', '0', '0', '0');
INSERT INTO "TRAM" VALUES ('87', '1', '2', '915', '1', null, '0', '0', '0', '0');
INSERT INTO "TRAM" VALUES ('88', '1', '2', '916', '1', null, '0', '0', '0', '0');
INSERT INTO "TRAM" VALUES ('89', '1', '2', '917', '1', null, '0', '0', '0', '0');
INSERT INTO "TRAM" VALUES ('90', '1', '2', '918', '1', null, '0', '0', '0', '0');
INSERT INTO "TRAM" VALUES ('91', '1', '2', '919', '1', null, '0', '0', '0', '0');
INSERT INTO "TRAM" VALUES ('92', '1', '2', '920', '1', null, '0', '0', '0', '0');
INSERT INTO "TRAM" VALUES ('93', '1', '3', '2201', '1', null, '0', '0', '0', '0');
INSERT INTO "TRAM" VALUES ('94', '1', '3', '2202', '1', null, '0', '0', '0', '0');
INSERT INTO "TRAM" VALUES ('95', '1', '3', '2203', '1', null, '0', '0', '0', '0');
INSERT INTO "TRAM" VALUES ('96', '1', '3', '2204', '1', null, '0', '0', '0', '0');
INSERT INTO "TRAM" VALUES ('97', '1', '4', '817', '1', null, '0', '0', '0', '0');
INSERT INTO "TRAM" VALUES ('98', '1', '4', '818', '1', null, '0', '0', '0', '0');
INSERT INTO "TRAM" VALUES ('99', '1', '4', '819', '1', null, '0', '0', '0', '0');
INSERT INTO "TRAM" VALUES ('100', '1', '4', '820', '1', null, '0', '0', '0', '0');
INSERT INTO "TRAM" VALUES ('101', '1', '4', '821', '1', null, '0', '0', '0', '0');
INSERT INTO "TRAM" VALUES ('102', '1', '4', '822', '1', null, '0', '0', '0', '0');
INSERT INTO "TRAM" VALUES ('103', '1', '4', '823', '1', null, '0', '0', '0', '0');
INSERT INTO "TRAM" VALUES ('104', '1', '4', '824', '1', null, '0', '0', '0', '0');
INSERT INTO "TRAM" VALUES ('105', '1', '4', '825', '1', null, '0', '0', '0', '0');
INSERT INTO "TRAM" VALUES ('106', '1', '4', '826', '1', null, '0', '0', '0', '0');
INSERT INTO "TRAM" VALUES ('107', '1', '4', '827', '1', null, '0', '0', '0', '0');
INSERT INTO "TRAM" VALUES ('108', '1', '4', '828', '1', null, '0', '0', '0', '0');
INSERT INTO "TRAM" VALUES ('109', '1', '4', '829', '1', null, '0', '0', '0', '0');
INSERT INTO "TRAM" VALUES ('110', '1', '4', '830', '1', null, '0', '0', '0', '0');
INSERT INTO "TRAM" VALUES ('111', '1', '4', '831', '1', null, '0', '0', '0', '0');
INSERT INTO "TRAM" VALUES ('112', '1', '4', '832', '1', null, '0', '0', '0', '0');
INSERT INTO "TRAM" VALUES ('113', '1', '4', '833', '1', null, '0', '0', '0', '0');
INSERT INTO "TRAM" VALUES ('114', '1', '4', '834', '1', null, '0', '0', '0', '0');
INSERT INTO "TRAM" VALUES ('115', '1', '4', '835', '1', null, '0', '0', '0', '0');
INSERT INTO "TRAM" VALUES ('116', '1', '4', '836', '1', null, '0', '0', '0', '0');
INSERT INTO "TRAM" VALUES ('117', '1', '4', '837', '1', null, '0', '0', '0', '0');
INSERT INTO "TRAM" VALUES ('118', '1', '4', '838', '1', null, '0', '0', '0', '0');
INSERT INTO "TRAM" VALUES ('119', '1', '4', '839', '1', null, '0', '0', '0', '0');
INSERT INTO "TRAM" VALUES ('120', '1', '4', '840', '1', null, '0', '0', '0', '0');
INSERT INTO "TRAM" VALUES ('121', '1', '4', '841', '1', null, '0', '0', '0', '0');
INSERT INTO "TRAM" VALUES ('122', '1', '5', '809', '1', null, '0', '0', '1', '0');
INSERT INTO "TRAM" VALUES ('123', '1', '5', '816', '1', null, '0', '0', '1', '0');
INSERT INTO "TRAM" VALUES ('124', '2', '6', '780', '1', null, '0', '0', '1', '0');
INSERT INTO "TRAM" VALUES ('125', '2', '6', '781', '1', null, '0', '0', '1', '0');
INSERT INTO "TRAM" VALUES ('126', '2', '6', '782', '1', null, '0', '0', '1', '0');
INSERT INTO "TRAM" VALUES ('127', '2', '6', '784', '1', null, '0', '0', '1', '0');
INSERT INTO "TRAM" VALUES ('128', '2', '6', '785', '1', null, '0', '0', '1', '0');
INSERT INTO "TRAM" VALUES ('129', '2', '6', '786', '1', null, '0', '0', '1', '0');
INSERT INTO "TRAM" VALUES ('130', '2', '6', '787', '1', null, '0', '0', '1', '0');
INSERT INTO "TRAM" VALUES ('131', '2', '6', '797', '1', null, '0', '0', '1', '0');
INSERT INTO "TRAM" VALUES ('132', '2', '7', '804', '1', null, '0', '0', '1', '0');
INSERT INTO "TRAM" VALUES ('133', '2', '7', '810', '1', null, '0', '0', '1', '0');
INSERT INTO "TRAM" VALUES ('134', '2', '7', '813', '1', null, '0', '0', '1', '0');
INSERT INTO "TRAM" VALUES ('135', '2', '7', '815', '1', null, '0', '0', '1', '0');
INSERT INTO "TRAM" VALUES ('136', '2', '1', '2073', '1', null, '0', '0', '1', '0');
INSERT INTO "TRAM" VALUES ('137', '2', '1', '2074', '1', null, '0', '0', '1', '0');
INSERT INTO "TRAM" VALUES ('138', '2', '1', '2075', '1', null, '0', '0', '1', '0');
INSERT INTO "TRAM" VALUES ('139', '2', '1', '2076', '1', null, '0', '0', '1', '0');
INSERT INTO "TRAM" VALUES ('140', '2', '1', '2077', '1', null, '0', '0', '1', '0');
INSERT INTO "TRAM" VALUES ('141', '2', '1', '2078', '1', null, '0', '0', '1', '0');
INSERT INTO "TRAM" VALUES ('142', '2', '1', '2079', '1', null, '0', '0', '1', '0');
INSERT INTO "TRAM" VALUES ('143', '2', '1', '2080', '1', null, '0', '0', '1', '0');
INSERT INTO "TRAM" VALUES ('144', '2', '1', '2081', '1', null, '0', '0', '1', '0');
INSERT INTO "TRAM" VALUES ('145', '2', '1', '2082', '1', null, '0', '0', '1', '0');
INSERT INTO "TRAM" VALUES ('146', '2', '1', '2083', '1', null, '0', '0', '1', '0');
INSERT INTO "TRAM" VALUES ('147', '2', '1', '2084', '1', null, '0', '0', '1', '0');
INSERT INTO "TRAM" VALUES ('148', '2', '1', '2085', '1', null, '0', '0', '1', '0');
INSERT INTO "TRAM" VALUES ('149', '2', '1', '2086', '1', null, '0', '0', '1', '0');
INSERT INTO "TRAM" VALUES ('150', '2', '1', '2087', '1', null, '0', '0', '1', '0');
INSERT INTO "TRAM" VALUES ('151', '2', '1', '2088', '1', null, '0', '0', '1', '0');
INSERT INTO "TRAM" VALUES ('152', '2', '1', '2089', '1', null, '0', '0', '1', '0');
INSERT INTO "TRAM" VALUES ('153', '2', '1', '2090', '1', null, '0', '0', '1', '0');
INSERT INTO "TRAM" VALUES ('154', '2', '1', '2091', '1', null, '0', '0', '1', '0');
INSERT INTO "TRAM" VALUES ('155', '2', '1', '2092', '1', null, '0', '0', '1', '0');
INSERT INTO "TRAM" VALUES ('156', '2', '1', '2093', '1', null, '0', '0', '1', '0');
INSERT INTO "TRAM" VALUES ('157', '2', '1', '2094', '1', null, '0', '0', '1', '0');
INSERT INTO "TRAM" VALUES ('158', '2', '1', '2095', '1', null, '0', '0', '1', '0');
INSERT INTO "TRAM" VALUES ('159', '2', '1', '2096', '1', null, '0', '0', '1', '0');
INSERT INTO "TRAM" VALUES ('160', '2', '1', '2097', '1', null, '0', '0', '1', '0');
INSERT INTO "TRAM" VALUES ('161', '2', '1', '2098', '1', null, '0', '0', '1', '0');
INSERT INTO "TRAM" VALUES ('162', '2', '1', '2099', '1', null, '0', '0', '1', '0');
INSERT INTO "TRAM" VALUES ('163', '2', '1', '2100', '1', null, '0', '0', '1', '0');
INSERT INTO "TRAM" VALUES ('164', '2', '1', '2101', '1', null, '0', '0', '1', '0');
INSERT INTO "TRAM" VALUES ('165', '2', '1', '2102', '1', null, '0', '0', '1', '0');
INSERT INTO "TRAM" VALUES ('166', '2', '1', '2103', '1', null, '0', '0', '1', '0');
INSERT INTO "TRAM" VALUES ('167', '2', '1', '2104', '1', null, '0', '0', '1', '0');
INSERT INTO "TRAM" VALUES ('168', '2', '1', '2105', '1', null, '0', '0', '1', '0');
INSERT INTO "TRAM" VALUES ('169', '2', '1', '2106', '1', null, '0', '0', '1', '0');
INSERT INTO "TRAM" VALUES ('170', '2', '1', '2107', '1', null, '0', '0', '1', '0');
INSERT INTO "TRAM" VALUES ('171', '2', '1', '2108', '1', null, '0', '0', '1', '0');
INSERT INTO "TRAM" VALUES ('172', '2', '1', '2109', '1', null, '0', '0', '1', '0');
INSERT INTO "TRAM" VALUES ('173', '2', '1', '2110', '1', null, '0', '0', '1', '0');
INSERT INTO "TRAM" VALUES ('174', '2', '1', '2111', '1', null, '0', '0', '1', '0');
INSERT INTO "TRAM" VALUES ('175', '2', '1', '2112', '1', null, '0', '0', '1', '0');
INSERT INTO "TRAM" VALUES ('176', '2', '1', '2113', '1', null, '0', '0', '1', '0');
INSERT INTO "TRAM" VALUES ('177', '2', '1', '2114', '1', null, '0', '0', '1', '0');
INSERT INTO "TRAM" VALUES ('178', '2', '1', '2115', '1', null, '0', '0', '1', '0');
INSERT INTO "TRAM" VALUES ('179', '2', '1', '2116', '1', null, '0', '0', '1', '0');
INSERT INTO "TRAM" VALUES ('180', '2', '1', '2117', '1', null, '0', '0', '1', '0');
INSERT INTO "TRAM" VALUES ('181', '2', '1', '2118', '1', null, '0', '0', '1', '0');
INSERT INTO "TRAM" VALUES ('182', '2', '1', '2119', '1', null, '0', '0', '1', '0');
INSERT INTO "TRAM" VALUES ('183', '2', '1', '2120', '1', null, '0', '0', '1', '0');
INSERT INTO "TRAM" VALUES ('184', '2', '1', '2121', '1', null, '0', '0', '1', '0');
INSERT INTO "TRAM" VALUES ('185', '2', '1', '2122', '1', null, '0', '0', '1', '0');
INSERT INTO "TRAM" VALUES ('186', '2', '1', '2123', '1', null, '0', '0', '1', '0');
INSERT INTO "TRAM" VALUES ('187', '2', '1', '2124', '1', null, '0', '0', '1', '0');
INSERT INTO "TRAM" VALUES ('188', '2', '1', '2125', '1', null, '0', '0', '1', '0');
INSERT INTO "TRAM" VALUES ('189', '2', '1', '2126', '1', null, '0', '0', '1', '0');
INSERT INTO "TRAM" VALUES ('190', '2', '1', '2127', '1', null, '0', '0', '1', '0');
INSERT INTO "TRAM" VALUES ('191', '2', '1', '2128', '1', null, '0', '0', '1', '0');
INSERT INTO "TRAM" VALUES ('192', '2', '1', '2129', '1', null, '0', '0', '1', '0');
INSERT INTO "TRAM" VALUES ('193', '2', '1', '2130', '1', null, '0', '0', '1', '0');
INSERT INTO "TRAM" VALUES ('194', '2', '1', '2131', '1', null, '0', '0', '1', '0');
INSERT INTO "TRAM" VALUES ('195', '2', '1', '2132', '1', null, '0', '0', '1', '0');
INSERT INTO "TRAM" VALUES ('196', '2', '1', '2133', '1', null, '0', '0', '1', '0');
INSERT INTO "TRAM" VALUES ('197', '2', '1', '2134', '1', null, '0', '0', '1', '0');
INSERT INTO "TRAM" VALUES ('198', '2', '1', '2135', '1', null, '0', '0', '1', '0');
INSERT INTO "TRAM" VALUES ('199', '2', '1', '2136', '1', null, '0', '0', '1', '0');
INSERT INTO "TRAM" VALUES ('200', '2', '1', '2137', '1', null, '0', '0', '1', '0');
INSERT INTO "TRAM" VALUES ('201', '2', '1', '2138', '1', null, '0', '0', '1', '0');
INSERT INTO "TRAM" VALUES ('202', '2', '1', '2139', '1', null, '0', '0', '1', '0');
INSERT INTO "TRAM" VALUES ('203', '2', '1', '2140', '1', null, '0', '0', '1', '0');
INSERT INTO "TRAM" VALUES ('204', '2', '1', '2141', '1', null, '0', '0', '1', '0');
INSERT INTO "TRAM" VALUES ('205', '2', '1', '2142', '1', null, '0', '0', '1', '0');
INSERT INTO "TRAM" VALUES ('206', '2', '1', '2143', '1', null, '0', '0', '1', '0');
INSERT INTO "TRAM" VALUES ('207', '2', '1', '2144', '1', null, '0', '0', '1', '0');
INSERT INTO "TRAM" VALUES ('208', '2', '1', '2145', '1', null, '0', '0', '1', '0');
INSERT INTO "TRAM" VALUES ('209', '2', '1', '2146', '1', null, '0', '0', '1', '0');
INSERT INTO "TRAM" VALUES ('210', '2', '1', '2147', '1', null, '0', '0', '1', '0');
INSERT INTO "TRAM" VALUES ('211', '2', '1', '2148', '1', null, '0', '0', '1', '0');
INSERT INTO "TRAM" VALUES ('212', '2', '1', '2149', '1', null, '0', '0', '1', '0');
INSERT INTO "TRAM" VALUES ('213', '2', '1', '2150', '1', null, '0', '0', '1', '0');
INSERT INTO "TRAM" VALUES ('214', '2', '1', '2151', '1', null, '0', '0', '1', '0');

-- ----------------------------
-- Table structure for "TRAM_LIJN"
-- ----------------------------
DROP TABLE "TRAM_LIJN" cascade constraints;
CREATE TABLE "TRAM_LIJN" (
"TL_ID" NUMBER(10) NOT NULL ,
"Tram_ID" NUMBER(10) NOT NULL ,
"Lijn_ID" NUMBER(10) NULL ,
"Gebonden" NUMBER(1) DEFAULT (0)  NOT NULL 
)
LOGGING
NOCOMPRESS
NOCACHE

;

-- ----------------------------
-- Records of TRAM_LIJN
-- ----------------------------
INSERT INTO "TRAM_LIJN" VALUES ('1', '1', '4', '0');
INSERT INTO "TRAM_LIJN" VALUES ('2', '2', '2', '0');
INSERT INTO "TRAM_LIJN" VALUES ('3', '3', '7', '0');
INSERT INTO "TRAM_LIJN" VALUES ('4', '4', '4', '0');
INSERT INTO "TRAM_LIJN" VALUES ('5', '5', '7', '0');
INSERT INTO "TRAM_LIJN" VALUES ('6', '6', '5', '0');
INSERT INTO "TRAM_LIJN" VALUES ('7', '7', '1', '0');
INSERT INTO "TRAM_LIJN" VALUES ('8', '8', '2', '0');
INSERT INTO "TRAM_LIJN" VALUES ('9', '9', '1', '0');
INSERT INTO "TRAM_LIJN" VALUES ('10', '10', '5', '0');
INSERT INTO "TRAM_LIJN" VALUES ('11', '11', '7', '0');
INSERT INTO "TRAM_LIJN" VALUES ('12', '12', '7', '0');
INSERT INTO "TRAM_LIJN" VALUES ('13', '13', '7', '0');
INSERT INTO "TRAM_LIJN" VALUES ('14', '14', '4', '0');
INSERT INTO "TRAM_LIJN" VALUES ('15', '15', '5', '0');
INSERT INTO "TRAM_LIJN" VALUES ('16', '16', '7', '0');
INSERT INTO "TRAM_LIJN" VALUES ('17', '17', '2', '0');
INSERT INTO "TRAM_LIJN" VALUES ('18', '18', '2', '0');
INSERT INTO "TRAM_LIJN" VALUES ('19', '19', '2', '0');
INSERT INTO "TRAM_LIJN" VALUES ('20', '20', '7', '0');
INSERT INTO "TRAM_LIJN" VALUES ('21', '21', '5', '0');
INSERT INTO "TRAM_LIJN" VALUES ('22', '22', '7', '0');
INSERT INTO "TRAM_LIJN" VALUES ('23', '23', '1', '0');
INSERT INTO "TRAM_LIJN" VALUES ('24', '24', '1', '0');
INSERT INTO "TRAM_LIJN" VALUES ('25', '25', '2', '0');
INSERT INTO "TRAM_LIJN" VALUES ('26', '26', '7', '0');
INSERT INTO "TRAM_LIJN" VALUES ('27', '27', '7', '0');
INSERT INTO "TRAM_LIJN" VALUES ('28', '28', '7', '0');
INSERT INTO "TRAM_LIJN" VALUES ('29', '29', '1', '0');
INSERT INTO "TRAM_LIJN" VALUES ('30', '30', '5', '0');
INSERT INTO "TRAM_LIJN" VALUES ('31', '31', '2', '0');
INSERT INTO "TRAM_LIJN" VALUES ('32', '32', '4', '0');
INSERT INTO "TRAM_LIJN" VALUES ('33', '33', '1', '0');
INSERT INTO "TRAM_LIJN" VALUES ('34', '34', '1', '0');
INSERT INTO "TRAM_LIJN" VALUES ('35', '35', '1', '0');
INSERT INTO "TRAM_LIJN" VALUES ('36', '36', '2', '0');
INSERT INTO "TRAM_LIJN" VALUES ('37', '37', '4', '0');
INSERT INTO "TRAM_LIJN" VALUES ('38', '38', '7', '0');
INSERT INTO "TRAM_LIJN" VALUES ('39', '39', '4', '0');
INSERT INTO "TRAM_LIJN" VALUES ('40', '40', '5', '0');
INSERT INTO "TRAM_LIJN" VALUES ('41', '41', '1', '0');
INSERT INTO "TRAM_LIJN" VALUES ('42', '42', '2', '0');
INSERT INTO "TRAM_LIJN" VALUES ('43', '43', '4', '0');
INSERT INTO "TRAM_LIJN" VALUES ('44', '44', '7', '0');
INSERT INTO "TRAM_LIJN" VALUES ('45', '45', '5', '0');
INSERT INTO "TRAM_LIJN" VALUES ('46', '46', '5', '0');
INSERT INTO "TRAM_LIJN" VALUES ('47', '47', '7', '0');
INSERT INTO "TRAM_LIJN" VALUES ('48', '48', '5', '0');
INSERT INTO "TRAM_LIJN" VALUES ('49', '49', '2', '0');
INSERT INTO "TRAM_LIJN" VALUES ('50', '50', '4', '0');
INSERT INTO "TRAM_LIJN" VALUES ('51', '51', '2', '0');
INSERT INTO "TRAM_LIJN" VALUES ('52', '52', '1', '0');
INSERT INTO "TRAM_LIJN" VALUES ('53', '53', '1', '0');
INSERT INTO "TRAM_LIJN" VALUES ('54', '54', '2', '0');
INSERT INTO "TRAM_LIJN" VALUES ('55', '55', '2', '0');
INSERT INTO "TRAM_LIJN" VALUES ('56', '56', '5', '0');
INSERT INTO "TRAM_LIJN" VALUES ('57', '57', '1', '0');
INSERT INTO "TRAM_LIJN" VALUES ('58', '58', '4', '0');
INSERT INTO "TRAM_LIJN" VALUES ('59', '59', '1', '0');
INSERT INTO "TRAM_LIJN" VALUES ('60', '60', '7', '0');
INSERT INTO "TRAM_LIJN" VALUES ('61', '61', '1', '0');
INSERT INTO "TRAM_LIJN" VALUES ('62', '62', '2', '0');
INSERT INTO "TRAM_LIJN" VALUES ('63', '63', '2', '0');
INSERT INTO "TRAM_LIJN" VALUES ('64', '64', '1', '0');
INSERT INTO "TRAM_LIJN" VALUES ('65', '65', '2', '0');
INSERT INTO "TRAM_LIJN" VALUES ('66', '66', '1', '0');
INSERT INTO "TRAM_LIJN" VALUES ('67', '67', '5', '0');
INSERT INTO "TRAM_LIJN" VALUES ('68', '68', '1', '0');
INSERT INTO "TRAM_LIJN" VALUES ('69', '69', '2', '0');
INSERT INTO "TRAM_LIJN" VALUES ('70', '70', '5', '0');
INSERT INTO "TRAM_LIJN" VALUES ('71', '71', '7', '0');
INSERT INTO "TRAM_LIJN" VALUES ('72', '72', '4', '0');
INSERT INTO "TRAM_LIJN" VALUES ('73', '73', '3', '1');
INSERT INTO "TRAM_LIJN" VALUES ('74', '74', '3', '1');
INSERT INTO "TRAM_LIJN" VALUES ('75', '75', '3', '1');
INSERT INTO "TRAM_LIJN" VALUES ('76', '76', '3', '1');
INSERT INTO "TRAM_LIJN" VALUES ('77', '77', '3', '1');
INSERT INTO "TRAM_LIJN" VALUES ('78', '78', '3', '1');
INSERT INTO "TRAM_LIJN" VALUES ('79', '79', '3', '1');
INSERT INTO "TRAM_LIJN" VALUES ('80', '80', '3', '1');
INSERT INTO "TRAM_LIJN" VALUES ('81', '81', '3', '1');
INSERT INTO "TRAM_LIJN" VALUES ('82', '82', '3', '1');
INSERT INTO "TRAM_LIJN" VALUES ('83', '83', '3', '1');
INSERT INTO "TRAM_LIJN" VALUES ('84', '84', '3', '1');
INSERT INTO "TRAM_LIJN" VALUES ('85', '85', '3', '1');
INSERT INTO "TRAM_LIJN" VALUES ('86', '86', '3', '1');
INSERT INTO "TRAM_LIJN" VALUES ('87', '87', '3', '1');
INSERT INTO "TRAM_LIJN" VALUES ('88', '88', '3', '1');
INSERT INTO "TRAM_LIJN" VALUES ('89', '89', '3', '1');
INSERT INTO "TRAM_LIJN" VALUES ('90', '90', '3', '1');
INSERT INTO "TRAM_LIJN" VALUES ('91', '91', '3', '1');
INSERT INTO "TRAM_LIJN" VALUES ('92', '92', '3', '1');
INSERT INTO "TRAM_LIJN" VALUES ('93', '93', '3', '0');
INSERT INTO "TRAM_LIJN" VALUES ('94', '94', '3', '0');
INSERT INTO "TRAM_LIJN" VALUES ('95', '95', '3', '0');
INSERT INTO "TRAM_LIJN" VALUES ('96', '96', '3', '0');
INSERT INTO "TRAM_LIJN" VALUES ('97', '97', '6', '0');
INSERT INTO "TRAM_LIJN" VALUES ('98', '98', '6', '0');
INSERT INTO "TRAM_LIJN" VALUES ('99', '99', '6', '0');
INSERT INTO "TRAM_LIJN" VALUES ('100', '100', '6', '0');
INSERT INTO "TRAM_LIJN" VALUES ('101', '101', '6', '0');
INSERT INTO "TRAM_LIJN" VALUES ('102', '102', '6', '0');
INSERT INTO "TRAM_LIJN" VALUES ('103', '103', '6', '0');
INSERT INTO "TRAM_LIJN" VALUES ('104', '104', '6', '0');
INSERT INTO "TRAM_LIJN" VALUES ('105', '105', '6', '0');
INSERT INTO "TRAM_LIJN" VALUES ('106', '106', '6', '0');
INSERT INTO "TRAM_LIJN" VALUES ('107', '107', '6', '0');
INSERT INTO "TRAM_LIJN" VALUES ('108', '109', '6', '0');
INSERT INTO "TRAM_LIJN" VALUES ('109', '110', '6', '0');
INSERT INTO "TRAM_LIJN" VALUES ('110', '111', '6', '0');
INSERT INTO "TRAM_LIJN" VALUES ('111', '112', '6', '0');
INSERT INTO "TRAM_LIJN" VALUES ('112', '113', '6', '0');
INSERT INTO "TRAM_LIJN" VALUES ('113', '114', '6', '0');
INSERT INTO "TRAM_LIJN" VALUES ('114', '115', '6', '0');
INSERT INTO "TRAM_LIJN" VALUES ('115', '116', '6', '0');
INSERT INTO "TRAM_LIJN" VALUES ('116', '117', '6', '0');
INSERT INTO "TRAM_LIJN" VALUES ('117', '118', '6', '0');
INSERT INTO "TRAM_LIJN" VALUES ('118', '119', '6', '0');
INSERT INTO "TRAM_LIJN" VALUES ('119', '120', '6', '0');
INSERT INTO "TRAM_LIJN" VALUES ('120', '121', '6', '0');
INSERT INTO "TRAM_LIJN" VALUES ('121', '122', null, '0');
INSERT INTO "TRAM_LIJN" VALUES ('122', '123', null, '0');
INSERT INTO "TRAM_LIJN" VALUES ('123', '97', '8', '0');
INSERT INTO "TRAM_LIJN" VALUES ('124', '98', '8', '0');
INSERT INTO "TRAM_LIJN" VALUES ('125', '99', '8', '0');
INSERT INTO "TRAM_LIJN" VALUES ('126', '100', '8', '0');
INSERT INTO "TRAM_LIJN" VALUES ('127', '101', '8', '0');
INSERT INTO "TRAM_LIJN" VALUES ('128', '102', '8', '0');
INSERT INTO "TRAM_LIJN" VALUES ('129', '103', '8', '0');
INSERT INTO "TRAM_LIJN" VALUES ('130', '104', '8', '0');
INSERT INTO "TRAM_LIJN" VALUES ('131', '105', '8', '0');
INSERT INTO "TRAM_LIJN" VALUES ('132', '106', '8', '0');
INSERT INTO "TRAM_LIJN" VALUES ('133', '107', '8', '0');
INSERT INTO "TRAM_LIJN" VALUES ('134', '109', '8', '0');
INSERT INTO "TRAM_LIJN" VALUES ('135', '110', '8', '0');
INSERT INTO "TRAM_LIJN" VALUES ('136', '111', '8', '0');
INSERT INTO "TRAM_LIJN" VALUES ('137', '112', '8', '0');
INSERT INTO "TRAM_LIJN" VALUES ('138', '113', '8', '0');
INSERT INTO "TRAM_LIJN" VALUES ('139', '114', '8', '0');
INSERT INTO "TRAM_LIJN" VALUES ('140', '115', '8', '0');
INSERT INTO "TRAM_LIJN" VALUES ('141', '116', '8', '0');
INSERT INTO "TRAM_LIJN" VALUES ('142', '117', '8', '0');
INSERT INTO "TRAM_LIJN" VALUES ('143', '118', '8', '0');
INSERT INTO "TRAM_LIJN" VALUES ('144', '119', '8', '0');
INSERT INTO "TRAM_LIJN" VALUES ('145', '120', '8', '0');
INSERT INTO "TRAM_LIJN" VALUES ('146', '121', '8', '0');

-- ----------------------------
-- Table structure for "TRAM_ONDERHOUD"
-- ----------------------------
DROP TABLE "TRAM_ONDERHOUD" cascade constraints;
CREATE TABLE "TRAM_ONDERHOUD" (
"ID" NUMBER(10) NOT NULL ,
"Medewerker_ID" NUMBER(10) DEFAULT (0)  NULL ,
"Tram_ID" NUMBER(10) DEFAULT (0)  NULL ,
"DatumTijdstip" DATE NULL ,
"BeschikbaarDatum" DATE NULL ,
"TypeOnderhoud" NVARCHAR2(255) NULL 
)
LOGGING
NOCOMPRESS
NOCACHE

;

-- ----------------------------
-- Records of TRAM_ONDERHOUD
-- ----------------------------

-- ----------------------------
-- Table structure for "TRAMTYPE"
-- ----------------------------
DROP TABLE "TRAMTYPE" cascade constraints;
CREATE TABLE "TRAMTYPE" (
"ID" NUMBER(10) NOT NULL ,
"Omschrijving" NVARCHAR2(255) NULL 
)
LOGGING
NOCOMPRESS
NOCACHE

;

-- ----------------------------
-- Records of TRAMTYPE
-- ----------------------------
INSERT INTO "TRAMTYPE" VALUES ('1', '	Combino');
INSERT INTO "TRAMTYPE" VALUES ('2', '11G');
INSERT INTO "TRAMTYPE" VALUES ('3', 'Dubbel kop Combino');
INSERT INTO "TRAMTYPE" VALUES ('4', '12G');
INSERT INTO "TRAMTYPE" VALUES ('5', 'Opleidingtram');
INSERT INTO "TRAMTYPE" VALUES ('6', '9G');
INSERT INTO "TRAMTYPE" VALUES ('7', '10G');

-- ----------------------------
-- Table structure for "TRANSFER"
-- ----------------------------
DROP TABLE "TRANSFER" cascade constraints;
CREATE TABLE "TRANSFER" (
"Remise_ID_Van" NUMBER(10) NOT NULL ,
"Remise_ID_Naar" NUMBER(10) NOT NULL ,
"Aantal" NUMBER(10) DEFAULT (0)  NULL 
)
LOGGING
NOCOMPRESS
NOCACHE

;

-- ----------------------------
-- Records of TRANSFER
-- ----------------------------
INSERT INTO "TRANSFER" VALUES ('2', '1', '3');

-- ----------------------------
-- Table structure for "VERBINDING"
-- ----------------------------
DROP TABLE "VERBINDING" cascade constraints;
CREATE TABLE "VERBINDING" (
"ID" NUMBER(10) NOT NULL ,
"Sector_ID_Van" NUMBER(10) DEFAULT (0)  NULL ,
"Sector_ID_Naar" NUMBER(10) DEFAULT (0)  NULL 
)
LOGGING
NOCOMPRESS
NOCACHE

;

-- ----------------------------
-- Records of VERBINDING
-- ----------------------------

-- ----------------------------
-- Sequence structure for "FUNCTIE_FCSEQ"
-- ----------------------------
DROP SEQUENCE "FUNCTIE_FCSEQ";
CREATE SEQUENCE "FUNCTIE_FCSEQ"
 INCREMENT BY 1
 MINVALUE 1
 MAXVALUE 9999999999999999999999999999
 START WITH 6
 CACHE 20;

-- ----------------------------
-- Sequence structure for "LIJN_FCSEQ"
-- ----------------------------
DROP SEQUENCE "LIJN_FCSEQ";
CREATE SEQUENCE "LIJN_FCSEQ"
 INCREMENT BY 1
 MINVALUE 1
 MAXVALUE 9999999999999999999999999999
 START WITH 15
 CACHE 20;

-- ----------------------------
-- Sequence structure for "MEDEWERKER_FCSEQ"
-- ----------------------------
DROP SEQUENCE "MEDEWERKER_FCSEQ";
CREATE SEQUENCE "MEDEWERKER_FCSEQ"
 INCREMENT BY 1
 MINVALUE 1
 MAXVALUE 9999999999999999999999999999
 START WITH 6
 CACHE 20;

-- ----------------------------
-- Sequence structure for "RECHT_FCSEQ"
-- ----------------------------
DROP SEQUENCE "RECHT_FCSEQ";
CREATE SEQUENCE "RECHT_FCSEQ"
 INCREMENT BY 1
 MINVALUE 1
 MAXVALUE 9999999999999999999999999999
 START WITH 8
 CACHE 20;

-- ----------------------------
-- Sequence structure for "REMISE_FCSEQ"
-- ----------------------------
DROP SEQUENCE "REMISE_FCSEQ";
CREATE SEQUENCE "REMISE_FCSEQ"
 INCREMENT BY 1
 MINVALUE 1
 MAXVALUE 9999999999999999999999999999
 START WITH 3
 CACHE 20;

-- ----------------------------
-- Sequence structure for "RESERVERING_FCSEQ"
-- ----------------------------
DROP SEQUENCE "RESERVERING_FCSEQ";
CREATE SEQUENCE "RESERVERING_FCSEQ"
 INCREMENT BY 1
 MINVALUE 1
 MAXVALUE 9999999999999999999999999999
 START WITH 1
 CACHE 20;

-- ----------------------------
-- Sequence structure for "SECTOR_FCSEQ"
-- ----------------------------
DROP SEQUENCE "SECTOR_FCSEQ";
CREATE SEQUENCE "SECTOR_FCSEQ"
 INCREMENT BY 1
 MINVALUE 1
 MAXVALUE 9999999999999999999999999999
 START WITH 1
 CACHE 20;

-- ----------------------------
-- Sequence structure for "SPOOR_FCSEQ"
-- ----------------------------
DROP SEQUENCE "SPOOR_FCSEQ";
CREATE SEQUENCE "SPOOR_FCSEQ"
 INCREMENT BY 1
 MINVALUE 1
 MAXVALUE 9999999999999999999999999999
 START WITH 44
 CACHE 20;

-- ----------------------------
-- Sequence structure for "TRAM_FCSEQ"
-- ----------------------------
DROP SEQUENCE "TRAM_FCSEQ";
CREATE SEQUENCE "TRAM_FCSEQ"
 INCREMENT BY 1
 MINVALUE 1
 MAXVALUE 9999999999999999999999999999
 START WITH 215
 CACHE 20;

-- ----------------------------
-- Sequence structure for "TRAM_LIJN_FCSEQ"
-- ----------------------------
DROP SEQUENCE "TRAM_LIJN_FCSEQ";
CREATE SEQUENCE "TRAM_LIJN_FCSEQ"
 INCREMENT BY 1
 MINVALUE 1
 MAXVALUE 9999999999999999999999999999
 START WITH 147
 CACHE 20;

-- ----------------------------
-- Sequence structure for "TRAM_ONDERHOUD_FCSEQ"
-- ----------------------------
DROP SEQUENCE "TRAM_ONDERHOUD_FCSEQ";
CREATE SEQUENCE "TRAM_ONDERHOUD_FCSEQ"
 INCREMENT BY 1
 MINVALUE 1
 MAXVALUE 9999999999999999999999999999
 START WITH 1
 CACHE 20;

-- ----------------------------
-- Sequence structure for "TRAMTYPE_FCSEQ"
-- ----------------------------
DROP SEQUENCE "TRAMTYPE_FCSEQ";
CREATE SEQUENCE "TRAMTYPE_FCSEQ"
 INCREMENT BY 1
 MINVALUE 1
 MAXVALUE 9999999999999999999999999999
 START WITH 8
 CACHE 20;

-- ----------------------------
-- Sequence structure for "VERBINDING_FCSEQ"
-- ----------------------------
DROP SEQUENCE "VERBINDING_FCSEQ";
CREATE SEQUENCE "VERBINDING_FCSEQ"
 INCREMENT BY 1
 MINVALUE 1
 MAXVALUE 9999999999999999999999999999
 START WITH 1
 CACHE 20;

-- ----------------------------
-- Indexes structure for table FUNCTIE
-- ----------------------------

-- ----------------------------
-- Triggers structure for table "FUNCTIE"
-- ----------------------------
CREATE OR REPLACE TRIGGER "FUNCTIE_FCTG_BI" BEFORE INSERT ON "FUNCTIE" REFERENCING OLD AS "OLD" NEW AS "NEW" FOR EACH ROW ENABLE WHEN (new."ID" IS NULL)
BEGIN
  SELECT FUNCTIE_FCSEQ.NEXTVAL INTO :new."ID" FROM dual;
END;
/
-- ----------------------------
-- Checks structure for table "FUNCTIE"
-- ----------------------------
ALTER TABLE "FUNCTIE" ADD CHECK ("ID" IS NOT NULL);

-- ----------------------------
-- Primary Key structure for table "FUNCTIE"
-- ----------------------------
ALTER TABLE "FUNCTIE" ADD PRIMARY KEY ("ID");

-- ----------------------------
-- Indexes structure for table FUNCTIE_RECHT
-- ----------------------------
CREATE INDEX "Recht_ID"
ON "FUNCTIE_RECHT" ("Recht_ID" ASC)
LOGGING
VISIBLE;

-- ----------------------------
-- Checks structure for table "FUNCTIE_RECHT"
-- ----------------------------
ALTER TABLE "FUNCTIE_RECHT" ADD CHECK ("Functie_ID" IS NOT NULL);
ALTER TABLE "FUNCTIE_RECHT" ADD CHECK ("Recht_ID" IS NOT NULL);

-- ----------------------------
-- Primary Key structure for table "FUNCTIE_RECHT"
-- ----------------------------
ALTER TABLE "FUNCTIE_RECHT" ADD PRIMARY KEY ("Functie_ID", "Recht_ID");

-- ----------------------------
-- Indexes structure for table LIJN
-- ----------------------------
CREATE INDEX "Nummer1"
ON "LIJN" ("Nummer" ASC)
LOGGING
VISIBLE;
CREATE INDEX "Remise_ID"
ON "LIJN" ("Remise_ID" ASC)
LOGGING
VISIBLE;

-- ----------------------------
-- Triggers structure for table "LIJN"
-- ----------------------------
CREATE OR REPLACE TRIGGER "LIJN_FCTG_BI" BEFORE INSERT ON "LIJN" REFERENCING OLD AS "OLD" NEW AS "NEW" FOR EACH ROW ENABLE WHEN (new."ID" IS NULL)
BEGIN
  SELECT LIJN_FCSEQ.NEXTVAL INTO :new."ID" FROM dual;
END;
/
-- ----------------------------
-- Checks structure for table "LIJN"
-- ----------------------------
ALTER TABLE "LIJN" ADD CHECK ("ID" IS NOT NULL);
ALTER TABLE "LIJN" ADD CHECK ("ConducteurRijdtMee" IS NOT NULL);

-- ----------------------------
-- Primary Key structure for table "LIJN"
-- ----------------------------
ALTER TABLE "LIJN" ADD PRIMARY KEY ("ID");

-- ----------------------------
-- Indexes structure for table MEDEWERKER
-- ----------------------------
CREATE INDEX "Functie_ID"
ON "MEDEWERKER" ("Functie_ID" ASC)
LOGGING
VISIBLE;

-- ----------------------------
-- Triggers structure for table "MEDEWERKER"
-- ----------------------------
CREATE OR REPLACE TRIGGER "MEDEWERKER_FCTG_BI" BEFORE INSERT ON "MEDEWERKER" REFERENCING OLD AS "OLD" NEW AS "NEW" FOR EACH ROW ENABLE WHEN (new."ID" IS NULL)
BEGIN
  SELECT MEDEWERKER_FCSEQ.NEXTVAL INTO :new."ID" FROM dual;
END;
/
-- ----------------------------
-- Checks structure for table "MEDEWERKER"
-- ----------------------------
ALTER TABLE "MEDEWERKER" ADD CHECK ("ID" IS NOT NULL);

-- ----------------------------
-- Primary Key structure for table "MEDEWERKER"
-- ----------------------------
ALTER TABLE "MEDEWERKER" ADD PRIMARY KEY ("ID");

-- ----------------------------
-- Indexes structure for table RECHT
-- ----------------------------

-- ----------------------------
-- Triggers structure for table "RECHT"
-- ----------------------------
CREATE OR REPLACE TRIGGER "RECHT_FCTG_BI" BEFORE INSERT ON "RECHT" REFERENCING OLD AS "OLD" NEW AS "NEW" FOR EACH ROW ENABLE WHEN (new."ID" IS NULL)
BEGIN
  SELECT RECHT_FCSEQ.NEXTVAL INTO :new."ID" FROM dual;
END;
/
-- ----------------------------
-- Checks structure for table "RECHT"
-- ----------------------------
ALTER TABLE "RECHT" ADD CHECK ("ID" IS NOT NULL);

-- ----------------------------
-- Primary Key structure for table "RECHT"
-- ----------------------------
ALTER TABLE "RECHT" ADD PRIMARY KEY ("ID");

-- ----------------------------
-- Indexes structure for table REMISE
-- ----------------------------

-- ----------------------------
-- Triggers structure for table "REMISE"
-- ----------------------------
CREATE OR REPLACE TRIGGER "REMISE_FCTG_BI" BEFORE INSERT ON "REMISE" REFERENCING OLD AS "OLD" NEW AS "NEW" FOR EACH ROW ENABLE WHEN (new."ID" IS NULL)
BEGIN
  SELECT REMISE_FCSEQ.NEXTVAL INTO :new."ID" FROM dual;
END;
/
-- ----------------------------
-- Checks structure for table "REMISE"
-- ----------------------------
ALTER TABLE "REMISE" ADD CHECK ("ID" IS NOT NULL);

-- ----------------------------
-- Primary Key structure for table "REMISE"
-- ----------------------------
ALTER TABLE "REMISE" ADD PRIMARY KEY ("ID");

-- ----------------------------
-- Indexes structure for table RESERVERING
-- ----------------------------
CREATE INDEX "Spoor_ID"
ON "RESERVERING" ("Spoor_ID" ASC)
LOGGING
VISIBLE;
CREATE INDEX "Tram_ID"
ON "RESERVERING" ("Tram_ID" ASC)
LOGGING
VISIBLE;

-- ----------------------------
-- Triggers structure for table "RESERVERING"
-- ----------------------------
CREATE OR REPLACE TRIGGER "RESERVERING_FCTG_BI" BEFORE INSERT ON "RESERVERING" REFERENCING OLD AS "OLD" NEW AS "NEW" FOR EACH ROW ENABLE WHEN (new."Reservering_ID" IS NULL)
BEGIN
  SELECT RESERVERING_FCSEQ.NEXTVAL INTO :new."Reservering_ID" FROM dual;
END;
/
-- ----------------------------
-- Checks structure for table "RESERVERING"
-- ----------------------------
ALTER TABLE "RESERVERING" ADD CHECK ("Reservering_ID" IS NOT NULL);

-- ----------------------------
-- Primary Key structure for table "RESERVERING"
-- ----------------------------
ALTER TABLE "RESERVERING" ADD PRIMARY KEY ("Reservering_ID");

-- ----------------------------
-- Indexes structure for table SECTOR
-- ----------------------------

-- ----------------------------
-- Triggers structure for table "SECTOR"
-- ----------------------------
CREATE OR REPLACE TRIGGER "SECTOR_FCTG_BI" BEFORE INSERT ON "SECTOR" REFERENCING OLD AS "OLD" NEW AS "NEW" FOR EACH ROW ENABLE WHEN (new."ID" IS NULL)
BEGIN
  SELECT SECTOR_FCSEQ.NEXTVAL INTO :new."ID" FROM dual;
END;
/
-- ----------------------------
-- Checks structure for table "SECTOR"
-- ----------------------------
ALTER TABLE "SECTOR" ADD CHECK ("ID" IS NOT NULL);
ALTER TABLE "SECTOR" ADD CHECK ("Beschikbaar" IS NOT NULL);
ALTER TABLE "SECTOR" ADD CHECK ("Blokkade" IS NOT NULL);

-- ----------------------------
-- Primary Key structure for table "SECTOR"
-- ----------------------------
ALTER TABLE "SECTOR" ADD PRIMARY KEY ("ID");

-- ----------------------------
-- Indexes structure for table SPOOR
-- ----------------------------

-- ----------------------------
-- Triggers structure for table "SPOOR"
-- ----------------------------
CREATE OR REPLACE TRIGGER "SPOOR_FCTG_BI" BEFORE INSERT ON "SPOOR" REFERENCING OLD AS "OLD" NEW AS "NEW" FOR EACH ROW ENABLE WHEN (new."ID" IS NULL)
BEGIN
  SELECT SPOOR_FCSEQ.NEXTVAL INTO :new."ID" FROM dual;
END;
/
-- ----------------------------
-- Checks structure for table "SPOOR"
-- ----------------------------
ALTER TABLE "SPOOR" ADD CHECK ("ID" IS NOT NULL);
ALTER TABLE "SPOOR" ADD CHECK ("Beschikbaar" IS NOT NULL);
ALTER TABLE "SPOOR" ADD CHECK ("InUitRijspoor" IS NOT NULL);

-- ----------------------------
-- Primary Key structure for table "SPOOR"
-- ----------------------------
ALTER TABLE "SPOOR" ADD PRIMARY KEY ("ID");

-- ----------------------------
-- Indexes structure for table TRAM
-- ----------------------------
CREATE UNIQUE INDEX "Nummer"
ON "TRAM" ("Nummer" ASC)
LOGGING
VISIBLE;

-- ----------------------------
-- Triggers structure for table "TRAM"
-- ----------------------------
CREATE OR REPLACE TRIGGER "TRAM_FCTG_BI" BEFORE INSERT ON "TRAM" REFERENCING OLD AS "OLD" NEW AS "NEW" FOR EACH ROW ENABLE WHEN (new."ID" IS NULL)
BEGIN
  SELECT TRAM_FCSEQ.NEXTVAL INTO :new."ID" FROM dual;
END;
/
-- ----------------------------
-- Checks structure for table "TRAM"
-- ----------------------------
ALTER TABLE "TRAM" ADD CHECK ("ID" IS NOT NULL);
ALTER TABLE "TRAM" ADD CHECK ("Vervuild" IS NOT NULL);
ALTER TABLE "TRAM" ADD CHECK ("Defect" IS NOT NULL);
ALTER TABLE "TRAM" ADD CHECK ("ConducteurGeschikt" IS NOT NULL);
ALTER TABLE "TRAM" ADD CHECK ("Beschikbaar" IS NOT NULL);

-- ----------------------------
-- Primary Key structure for table "TRAM"
-- ----------------------------
ALTER TABLE "TRAM" ADD PRIMARY KEY ("ID");

-- ----------------------------
-- Indexes structure for table TRAM_LIJN
-- ----------------------------

-- ----------------------------
-- Triggers structure for table "TRAM_LIJN"
-- ----------------------------
CREATE OR REPLACE TRIGGER "TRAM_LIJN_FCTG_BI" BEFORE INSERT ON "TRAM_LIJN" REFERENCING OLD AS "OLD" NEW AS "NEW" FOR EACH ROW ENABLE WHEN (new."TL_ID" IS NULL)
BEGIN
  SELECT TRAM_LIJN_FCSEQ.NEXTVAL INTO :new."TL_ID" FROM dual;
END;
/
-- ----------------------------
-- Checks structure for table "TRAM_LIJN"
-- ----------------------------
ALTER TABLE "TRAM_LIJN" ADD CHECK ("TL_ID" IS NOT NULL);
ALTER TABLE "TRAM_LIJN" ADD CHECK ("Tram_ID" IS NOT NULL);
ALTER TABLE "TRAM_LIJN" ADD CHECK ("Gebonden" IS NOT NULL);

-- ----------------------------
-- Primary Key structure for table "TRAM_LIJN"
-- ----------------------------
ALTER TABLE "TRAM_LIJN" ADD PRIMARY KEY ("TL_ID");

-- ----------------------------
-- Indexes structure for table TRAM_ONDERHOUD
-- ----------------------------
CREATE INDEX "Medewerker_ID"
ON "TRAM_ONDERHOUD" ("Medewerker_ID" ASC)
LOGGING
VISIBLE;

-- ----------------------------
-- Triggers structure for table "TRAM_ONDERHOUD"
-- ----------------------------
CREATE OR REPLACE TRIGGER "TRAM_ONDERHOUD_FCTG_BI" BEFORE INSERT ON "TRAM_ONDERHOUD" REFERENCING OLD AS "OLD" NEW AS "NEW" FOR EACH ROW ENABLE WHEN (new."ID" IS NULL)
BEGIN
  SELECT TRAM_ONDERHOUD_FCSEQ.NEXTVAL INTO :new."ID" FROM dual;
END;
/
-- ----------------------------
-- Checks structure for table "TRAM_ONDERHOUD"
-- ----------------------------
ALTER TABLE "TRAM_ONDERHOUD" ADD CHECK ("ID" IS NOT NULL);

-- ----------------------------
-- Primary Key structure for table "TRAM_ONDERHOUD"
-- ----------------------------
ALTER TABLE "TRAM_ONDERHOUD" ADD PRIMARY KEY ("ID");

-- ----------------------------
-- Indexes structure for table TRAMTYPE
-- ----------------------------

-- ----------------------------
-- Triggers structure for table "TRAMTYPE"
-- ----------------------------
CREATE OR REPLACE TRIGGER "TRAMTYPE_FCTG_BI" BEFORE INSERT ON "TRAMTYPE" REFERENCING OLD AS "OLD" NEW AS "NEW" FOR EACH ROW ENABLE WHEN (new."ID" IS NULL)
BEGIN
  SELECT TRAMTYPE_FCSEQ.NEXTVAL INTO :new."ID" FROM dual;
END;
/
-- ----------------------------
-- Checks structure for table "TRAMTYPE"
-- ----------------------------
ALTER TABLE "TRAMTYPE" ADD CHECK ("ID" IS NOT NULL);

-- ----------------------------
-- Primary Key structure for table "TRAMTYPE"
-- ----------------------------
ALTER TABLE "TRAMTYPE" ADD PRIMARY KEY ("ID");

-- ----------------------------
-- Indexes structure for table TRANSFER
-- ----------------------------

-- ----------------------------
-- Checks structure for table "TRANSFER"
-- ----------------------------
ALTER TABLE "TRANSFER" ADD CHECK ("Remise_ID_Van" IS NOT NULL);
ALTER TABLE "TRANSFER" ADD CHECK ("Remise_ID_Naar" IS NOT NULL);

-- ----------------------------
-- Primary Key structure for table "TRANSFER"
-- ----------------------------
ALTER TABLE "TRANSFER" ADD PRIMARY KEY ("Remise_ID_Van", "Remise_ID_Naar");

-- ----------------------------
-- Indexes structure for table VERBINDING
-- ----------------------------

-- ----------------------------
-- Triggers structure for table "VERBINDING"
-- ----------------------------
CREATE OR REPLACE TRIGGER "VERBINDING_FCTG_BI" BEFORE INSERT ON "VERBINDING" REFERENCING OLD AS "OLD" NEW AS "NEW" FOR EACH ROW ENABLE WHEN (new."ID" IS NULL)
BEGIN
  SELECT VERBINDING_FCSEQ.NEXTVAL INTO :new."ID" FROM dual;
END;
/
-- ----------------------------
-- Checks structure for table "VERBINDING"
-- ----------------------------
ALTER TABLE "VERBINDING" ADD CHECK ("ID" IS NOT NULL);

-- ----------------------------
-- Primary Key structure for table "VERBINDING"
-- ----------------------------
ALTER TABLE "VERBINDING" ADD PRIMARY KEY ("ID");

-- ----------------------------
-- Foreign Key structure for table "FUNCTIE_RECHT"
-- ----------------------------
ALTER TABLE "FUNCTIE_RECHT" ADD FOREIGN KEY ("Functie_ID") REFERENCES "FUNCTIE" ("ID");
ALTER TABLE "FUNCTIE_RECHT" ADD FOREIGN KEY ("Recht_ID") REFERENCES "RECHT" ("ID");

-- ----------------------------
-- Foreign Key structure for table "LIJN"
-- ----------------------------
ALTER TABLE "LIJN" ADD FOREIGN KEY ("Remise_ID") REFERENCES "REMISE" ("ID");

-- ----------------------------
-- Foreign Key structure for table "MEDEWERKER"
-- ----------------------------
ALTER TABLE "MEDEWERKER" ADD FOREIGN KEY ("Functie_ID") REFERENCES "FUNCTIE" ("ID");

-- ----------------------------
-- Foreign Key structure for table "RESERVERING"
-- ----------------------------
ALTER TABLE "RESERVERING" ADD FOREIGN KEY ("Spoor_ID") REFERENCES "SPOOR" ("ID");
ALTER TABLE "RESERVERING" ADD FOREIGN KEY ("Tram_ID") REFERENCES "TRAM" ("ID");

-- ----------------------------
-- Foreign Key structure for table "SECTOR"
-- ----------------------------
ALTER TABLE "SECTOR" ADD FOREIGN KEY ("Spoor_ID") REFERENCES "SPOOR" ("ID");

-- ----------------------------
-- Foreign Key structure for table "SPOOR"
-- ----------------------------
ALTER TABLE "SPOOR" ADD FOREIGN KEY ("Remise_ID") REFERENCES "REMISE" ("ID");

-- ----------------------------
-- Foreign Key structure for table "TRAM"
-- ----------------------------
ALTER TABLE "TRAM" ADD FOREIGN KEY ("Remise_ID_Standplaats") REFERENCES "REMISE" ("ID");
ALTER TABLE "TRAM" ADD FOREIGN KEY ("Tramtype_ID") REFERENCES "TRAMTYPE" ("ID");

-- ----------------------------
-- Foreign Key structure for table "TRAM_LIJN"
-- ----------------------------
ALTER TABLE "TRAM_LIJN" ADD FOREIGN KEY ("Lijn_ID") REFERENCES "LIJN" ("ID");
ALTER TABLE "TRAM_LIJN" ADD FOREIGN KEY ("Tram_ID") REFERENCES "TRAM" ("ID");

-- ----------------------------
-- Foreign Key structure for table "TRAM_ONDERHOUD"
-- ----------------------------
ALTER TABLE "TRAM_ONDERHOUD" ADD FOREIGN KEY ("Medewerker_ID") REFERENCES "MEDEWERKER" ("ID");
ALTER TABLE "TRAM_ONDERHOUD" ADD FOREIGN KEY ("Tram_ID") REFERENCES "TRAM" ("ID");

-- ----------------------------
-- Foreign Key structure for table "TRANSFER"
-- ----------------------------
ALTER TABLE "TRANSFER" ADD FOREIGN KEY ("Remise_ID_Van") REFERENCES "REMISE" ("ID");
ALTER TABLE "TRANSFER" ADD FOREIGN KEY ("Remise_ID_Naar") REFERENCES "REMISE" ("ID");

-- ----------------------------
-- Foreign Key structure for table "VERBINDING"
-- ----------------------------
ALTER TABLE "VERBINDING" ADD FOREIGN KEY ("Sector_ID_Van") REFERENCES "SECTOR" ("ID");
ALTER TABLE "VERBINDING" ADD FOREIGN KEY ("Sector_ID_Naar") REFERENCES "SECTOR" ("ID");
