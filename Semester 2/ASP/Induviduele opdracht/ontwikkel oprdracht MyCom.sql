DROP TABLE categorie CASCADE CONSTRAINTS;
DROP TABLE artikel CASCADE CONSTRAINTS;
DROP TABLE spec_groep CASCADE CONSTRAINTS;
DROP TABLE specificatie CASCADE CONSTRAINTS;
DROP TABLE artikel_spec CASCADE CONSTRAINTS;
DROP TABLE afbeelding CASCADE CONSTRAINTS;
DROP TABLE profiel CASCADE CONSTRAINTS;
DROP TABLE winkel CASCADE CONSTRAINTS;
DROP TABLE openingstijd CASCADE CONSTRAINTS;
DROP TABLE reperatie CASCADE CONSTRAINTS;
DROP TABLE bericht CASCADE CONSTRAINTS;
DROP TABLE review CASCADE CONSTRAINTS;
DROP TABLE orders CASCADE CONSTRAINTS;
DROP TABLE veiling CASCADE CONSTRAINTS;
DROP TABLE bieding CASCADE CONSTRAINTS;
DROP VIEW specificatie_gegevens;
DROP VIEW artikel_categorie;
DROP VIEW order_details;
DROP VIEW categorienamen;
DROP VIEW gewonnen_veilingen;
DROP VIEW zakelijke_aantal;
DROP VIEW verloren_veiling;
DROP VIEW winnende_socialmedia;

CREATE TABLE categorie(
cat_id number (3) PRIMARY KEY,
parent_cat_id number (3),
cat_naam varchar2 (255),
CONSTRAINT FK_CATID FOREIGN KEY (parent_cat_id) REFERENCES categorie (cat_id)
);

CREATE TABLE artikel(
artikelnr number (6) PRIMARY KEY,
naam varchar2 (255) NOT NULL,
prijs number (5,2) CHECK(prijs>0),
beschrijving varchar2 (255),
merk varchar2 (255) NOT NULL,
cat_id number (3),
CONSTRAINT FK_ARTIKEL FOREIGN KEY (cat_id) REFERENCES categorie (cat_id)
);

CREATE TABLE spec_groep (
groep_id number (3) PRIMARY KEY,
groep_naam varchar2 (255) NOT NULL
);

CREATE TABLE specificatie (
spec_id number (5) PRIMARY KEY,
spec_naam varchar2 (255) NOT NULL,
groep_id number (3),
CONSTRAINT FK_GROEPID FOREIGN KEY (groep_id) REFERENCES spec_groep (groep_id)
);

CREATE TABLE artikel_spec (
artikelnr number (6),
spec_id number (5),
waarde varchar2 (255) NOT NULL,
CONSTRAINT PK_ARTIKEL_SPEC PRIMARY KEY (artikelnr, spec_id),
CONSTRAINT FK_A_S_1 FOREIGN KEY (artikelnr) REFERENCES artikel (artikelnr),
CONSTRAINT FK_A_S_2 FOREIGN KEY (spec_id) REFERENCES specificatie (spec_id)
);

CREATE TABLE afbeelding (
afbeelding_id number (5) PRIMARY KEY,
afbeelding_url varchar2 (255) NOT NULL,
artikelnr number (6),
CONSTRAINT FK_AFBEELDING FOREIGN KEY (artikelnr) REFERENCES artikel (artikelnr)
);

CREATE TABLE profiel(
user_id number (6) PRIMARY KEY,
email varchar2 (255) NOT NULL,
gebruiker_naam varchar2 (255),
wachtwoord varchar2 (18),
telnr number (10),
geb_datum varchar2 (255),
adres varchar2 (255),
land varchar2 (255),
social_account varchar2 (255),
klant_soort varchar2 (255) CHECK (klant_soort IN('particulier','zakelijk')),
bedrijfsnaam varchar2 (255),
ondernemingsnr number (9),
btwnr varchar2 (14),
nickname varchar2 (255),
CONSTRAINT CHK_particulier CHECK ((klant_soort = 'particulier' AND ondernemingsnr = NULL AND btwnr = NULL AND bedrijfsnaam = NULL) OR 
(klant_soort = 'zakelijk' AND nickname = NULL))
);

CREATE TABLE winkel(
winkel_id number (3) PRIMARY KEY,
plaats varchar2 (255),
adres varchar2 (255),
postcode varchar2 (6),
nummer number (10),
email varchar2 (255)
);

CREATE TABLE openingstijd (
opening_id number (3),
dag varchar2 (15),
tijd varchar2 (255),
winkel_id number (3),
CONSTRAINT FK_OPENING FOREIGN KEY (winkel_id) REFERENCES winkel (winkel_id)
);

CREATE TABLE reperatie (
reperatienr number (6) PRIMARY KEY,
datum date,
status varchar2 (50),
user_id number (6),
winkel_id number (3),
CONSTRAINT FK_REPERATIE FOREIGN KEY (user_id) REFERENCES profiel (user_id),
CONSTRAINT FK_REPERATIE_2 FOREIGN KEY (winkel_id) REFERENCES winkel (winkel_id)
);

CREATE TABLE bericht (
bericht_id number (6) PRIMARY KEY,
gelezen varchar2 (3) CHECK ((gelezen = 'ja') OR (gelezen = 'nee')),
onderwerp varchar2 (255),
datumtijd date,
tekst varchar2 (255),
user_id number (6),
CONSTRAINT FK_BERICHT FOREIGN KEY (user_id) REFERENCES profiel (user_id)
);

CREATE TABLE review (
review_id number (6) PRIMARY KEY,
score number (2)CHECK (score >=1 AND score<=10),
profiel_naam varchar2 (255),
beschrijving varchar2 (255),
datum date,
artikelnr number (6),
user_id number (6),
CONSTRAINT FK_REVIEW_1 FOREIGN KEY (artikelnr) REFERENCES artikel (artikelnr),
CONSTRAINT FK_REVIEW_2 FOREIGN KEY (user_id) REFERENCES profiel (user_id)
);

CREATE TABLE orders (
ordernr number (7) PRIMARY KEY,
bestel_methode varchar2 (255),
aantal number (3),
betaald_bedrag number (5,2)CHECK (betaald_bedrag>=0),
status varchar2 (255),
datum date,
artikelnr number (6),
user_id number (6),
CONSTRAINT FK_ORDERS_1 FOREIGN KEY (artikelnr) REFERENCES artikel (artikelnr),
CONSTRAINT FK_ORDERS_2 FOREIGN KEY (user_id) REFERENCES profiel (user_id)
);

CREATE TABLE veiling (
veilingnr number (6) PRIMARY KEY,
begin_datumtijd date,
looptijd date,
startbod number (5,2),
product_staat varchar2 (255),
artikelnr number (6),
CONSTRAINT FK_VEILING FOREIGN KEY (artikelnr) REFERENCES artikel (artikelnr)
);

CREATE TABLE bieding (
biedingnr number (6) PRIMARY KEY,
uitslag varchar2 (255),
eigen_winnend_bod number (5,2) CHECK (eigen_winnend_bod>0),
status varchar2 (255),
winnend_bod number (5,2) CHECK (winnend_bod>0),
eigen_laatste_bod number (5,2) CHECK (eigen_laatste_bod>0),
user_id number (6),
veilingnr number (6),
CONSTRAINT FK_BIEDING_1 FOREIGN KEY (user_id) REFERENCES profiel (user_id),
CONSTRAINT FK_BIEDING_2 FOREIGN KEY (veilingnr) REFERENCES veiling (veilingnr),
CONSTRAINT CHK_GEWONNEN CHECK ((uitslag = 'gewonnen' AND winnend_bod = NULL AND eigen_laatste_bod = NULL) OR
(uitslag = 'verloren' AND eigen_winnend_bod = NULL AND status = NULL))
);

-- ----------------------------
-- Records of categorie
-- ----------------------------
INSERT INTO categorie
VALUES (1,null,'laptops');
INSERT INTO categorie
VALUES (2,1,'notebooks');
INSERT INTO categorie
VALUES (3,1,'chromebooks');
INSERT INTO categorie
VALUES (4,null,'Desktops en Randapparatuur');
INSERT INTO categorie
VALUES (5,4,'kabels');
INSERT INTO categorie
VALUES (6,5,'usb');

-- ----------------------------
-- Records of artikel
-- ----------------------------
INSERT INTO artikel
VALUES (821651,'Packard Bell Easynote LE69KB-1243NL',359.95,'Met een...draadloze verbinding.','Packard Bell', 2);
INSERT INTO artikel
VALUES (843147,'Asus X751MA-TY112H',419.00,null,'Asus', 2);
INSERT INTO artikel
VALUES (856327,'HP Chromebook 11-2000nd, wit',279.00,'Je opmerkelijk...mobiele apparaten.','HP', 3);
INSERT INTO artikel
VALUES (862743,'Belkin USB2.0 A - B Cable 1.8m ',5.99,null,'Belkin', 6);

-- ----------------------------
-- Records of spec_groep
-- ----------------------------
INSERT INTO spec_groep
VALUES (1,'Belangrijkste Specificaties');
INSERT INTO spec_groep
VALUES (2,'Design');
INSERT INTO spec_groep
VALUES (3,'Netwerk');
INSERT INTO spec_groep
VALUES (4,'Codes');

-- ----------------------------
-- Records of specificatie
-- ----------------------------
INSERT INTO specificatie
VALUES (1,'Beeldscherm',1);
INSERT INTO specificatie
VALUES (2,'Geheugen',1);
INSERT INTO specificatie
VALUES (3,'Kleur van het product',2);
INSERT INTO specificatie
VALUES (4,'Wi-Fi',3);
INSERT INTO specificatie
VALUES (5,'Barcodes',4);

-- ----------------------------
-- Records of artikel_spec
-- ----------------------------
INSERT INTO artikel_spec
VALUES (821651,1,'17.3" scherm (1600×900)');
INSERT INTO artikel_spec
VALUES (821651,2,'4GB DDR3 RAM');
INSERT INTO artikel_spec
VALUES (856327,3,'Silver, White');
INSERT INTO artikel_spec
VALUES (856327,4,'ja');

-- ----------------------------
-- Records of afbeelding
-- ----------------------------
INSERT INTO afbeelding
VALUES (1,'http://mycom.nl/images/400/400/0/530165.png',821651);
INSERT INTO afbeelding
VALUES (2,'http://mycom.nl/images/400/400/2/530165.png',821651);
INSERT INTO afbeelding
VALUES (3,'http://mycom.nl/images/400/400/1/574292.png',856327);
INSERT INTO afbeelding
VALUES (4,'http://mycom.nl/images/400/400/0/571869.png',843147);
INSERT INTO afbeelding
VALUES (5,'http://mycom.nl/images/400/400/0/577465.png',862743);

-- ----------------------------
-- Records of profiel
-- ----------------------------
INSERT INTO profiel
VALUES (1,'ruud.hagens@hotmail.com','Ruud Hagens','wachtwoord1',0682838645,'08-03-1996','boterbloemstraat 17','nederland',null,'particulier',null,null,null,'metalfiredemon');
INSERT INTO profiel
VALUES (2,'willy.keurig@bing.com','Koning Willykeurig','wachtwoord2',0695835376,'29-06-1963', 'beatrixlaan 420','nederland','@willykeurig','zakelijk','Willykeurig inc.',592756154,'NL483745683B38',null);
INSERT INTO profiel
VALUES (3,'harry.potter@hogwarts.com','Harry potter','wachtwoord3',0668361949,'17-11-1990','Privet Drive 4','Great-Britain','@PotterClub','particulier',null,null,null,'TheBoyWhoLived');
INSERT INTO profiel
VALUES (4,'monkey_D_luffy@marine.nl','Monkey D. Luffy','wachtwoord4',0610486736,'16-06-1997','Mt.Colubo 1','East-blue',null,'zakelijk','strawhat',58747283,'OP185637285B82',NULL);
INSERT INTO profiel
VALUES (5,'frodo.baggins@orcbay.com','Frodo Baggins','wachtwoord5',0618552857,'22-09-1986','Brandy Hall 54','Buckland','@Ringmaster','particulier',null,null,null,'Nine-fingered Frodo');

-- ----------------------------
-- Records of winkel
-- ----------------------------
INSERT INTO winkel
VALUES (1,'Eindhoven','Veldm. Montgomerylaan 331','5612BG',2962762,'Eindhoven@mycom.nl');
INSERT INTO winkel
VALUES (2,'Helmond','Zuid Koninginnewal 34','5701NT',767286,'Helmond@mycom.nl');
INSERT INTO winkel
VALUES (3,'Roosendaal','Nieuwe markt 38-40','4701AH',767530,'Roosendaal@mycom.nl');
INSERT INTO winkel
VALUES (4,'Lelystad','Stadhuisstraat 2','8232VC',767730,'Lelystad@mycom.nl');
INSERT INTO winkel
VALUES (5,'Tilburg','Schouwburgring 49','5038TK',7676278,'Tilburg@mycom.nl');

-- ----------------------------
-- Records of openingstijd
-- ----------------------------
INSERT INTO openingstijd
VALUES (1, 'maandag','13:00-18:00',4);
INSERT INTO openingstijd
VALUES (2, 'woensdag','13:00-18:00',5);
INSERT INTO openingstijd
VALUES (3, 'donderdag','09:30-21:00',1);
INSERT INTO openingstijd
VALUES (4, 'zaterdag','gesloten',5);
INSERT INTO openingstijd
VALUES (5, 'dinsdag','09:30-18:00',2);

-- ----------------------------
-- Records of reperatie
-- ----------------------------
INSERT INTO reperatie
VALUES (1,TO_DATE('2013-03-20','YYYY-MM-DD'),'Gerepareerd',1,2);
INSERT INTO reperatie
VALUES (2,TO_DATE('2014-10-17','YYYY-MM-DD'),'Wordt gerepareerd',5,3);
INSERT INTO reperatie
VALUES (3,TO_DATE('2014-10-23','YYYY-MM-DD'),'in wachtrij',3,1);
INSERT INTO reperatie
VALUES (4,TO_DATE('2011-05-03','YYYY-MM-DD'),'Gerepareerd',3,4);
INSERT INTO reperatie
VALUES (5,TO_DATE('2014-10-24','YYYY-MM-DD'),'in wachtrij',2,4);

-- ----------------------------
-- Records of bericht
-- ----------------------------
INSERT INTO bericht
VALUES (1,'ja','Welkom bij MyCom!',TO_DATE('2003-05-03 21:02:44','YYYY-MM-DD HH24:MI:SS'),' Beste klant...MyCom klantenservice',2);
INSERT INTO bericht
VALUES (2,'nee','U heeft een bestelling geplaatst bij MyCom Helmond',TO_DATE('2012-12-30 15:37:23','YYYY-MM-DD HH24:MI:SS'),' U heeft...te halen.',5);
INSERT INTO bericht
VALUES (3,'nee','Uw bestelling ligt klaar om afgehaald te worden',TO_DATE('2014-09-03 08:53:53','YYYY-MM-DD HH24:MI:SS'),'Onderstaande producten...uw aankoop.',4);
INSERT INTO bericht
VALUES (4,'ja','Gefeliciteerd! U hebt het hoogste bod uitgebracht',TO_DATE('2012-01-16 03:45:24','YYYY-MM-DD HH24:MI:SS'),' Het bod...MyCom Veiling!',4);
INSERT INTO bericht
VALUES (5,'ja','Helaas! Iemand anders heeft het hoogste bod uitgebracht',TO_DATE('2011-08-07 16:14:38','YYYY-MM-DD HH24:MI:SS'),' Het bod...MyCom Veiling!',1);

-- ----------------------------
-- Records of review
-- ----------------------------
INSERT INTO review
VALUES (1,10,'Ruud Hagens','Ik heb...gewoon programmas.',TO_DATE('2014-01-01', 'YYYY-MM-DD'),843147,1);
INSERT INTO review
VALUES (2,7,'Harry potter','Deze notebook...over klagen.',TO_DATE('2013-03-02', 'YYYY-MM-DD'),856327,3);
INSERT INTO review
VALUES (3,2,'Harry potter','Heb er...niet goed.',TO_DATE('2013-10-06', 'YYYY-MM-DD'),843147,3);
INSERT INTO review
VALUES (4,8,'Frodo Baggins','Product zelf...steviger maken.',TO_DATE('2013-06-25', 'YYYY-MM-DD'),856327,5);
INSERT INTO review
VALUES (5,4,'Monkey D. Luffy','Jammer maar...niet meer!',TO_DATE('2013-04-12', 'YYYY-MM-DD'),821651,4);

-- ----------------------------
-- Records of orders
-- ----------------------------
INSERT INTO orders
VALUES (3497545,'bezorgen',1,359.95,'afgerond',TO_DATE('2014-09-23','YYYY-MM-DD'),821651,1);
INSERT INTO orders
VALUES (3301690,'afhalen',3,0,'open',TO_DATE('2012-11-16','YYYY-MM-DD'),843147,4);
INSERT INTO orders
VALUES (2036005,'bezorgen',10,500,'afgerond',TO_DATE('2009-04-13','YYYY-MM-DD'),856327,5);
INSERT INTO orders
VALUES (3315648,'afhalen',1,0,'geanuleerd',TO_DATE('2010-07-05','YYYY-MM-DD'),821651,3);
INSERT INTO orders
VALUES (5343546,'bezorgen',25,0,'open',TO_DATE('2011-12-12','YYYY-MM-DD'),862743,2);

-- ----------------------------
-- Records of veiling
-- ----------------------------
INSERT INTO veiling
VALUES (1,TO_DATE('2011-08-07 18:23:13','YYYY-MM-DD HH24:MI:SS'),TO_DATE('16:00:00','HH24:MI:SS'),1.00,'demo product',821651);
INSERT INTO veiling
VALUES (2,TO_DATE('2014-11-28 02:59:02','YYYY-MM-DD HH24:MI:SS'),TO_DATE('00:05:30','HH24:MI:SS'),13.45,'nieuw product',856327);
INSERT INTO veiling
VALUES (3,TO_DATE('2013-09-21 13:00:00','YYYY-MM-DD HH24:MI:SS'),TO_DATE('00:00:00','HH24:MI:SS'),120.00,'verpakking beschadigd',862743);
INSERT INTO veiling
VALUES (4,TO_DATE('2014-01-01 7:15:51','YYYY-MM-DD HH24:MI:SS'),TO_DATE('10:00:00','HH24:MI:SS'),1.00,'demo product',856327);
INSERT INTO veiling
VALUES (5,TO_DATE('2012-05-11 22:22:22','YYYY-MM-DD HH24:MI:SS'),TO_DATE('2:50:03','HH24:MI:SS'),5.99,'nieuw product',843147);

-- ----------------------------
-- Records of bieding
-- ----------------------------
INSERT INTO bieding
VALUES (1,'verloren',NULL,NULL,15.00,3.00,4,1);
INSERT INTO bieding
VALUES (2,'gewonnen',15.00,'betaald',NULL,NULL,3,1);
INSERT INTO bieding
VALUES (3,'gewonnen',150.50,'open',NULL,NULL,1,3);
INSERT INTO bieding
VALUES (4,'verloren',NULL,NULL,21.30,5.00,5,4);
INSERT INTO bieding
VALUES (5,'gewonnen',830.99,'geanuleerd',NULL,NULL,2,5);

--geef de specifiactie met groep, naam en waarde per artikel aan en soorteer op artikel naam.
CREATE VIEW specificatie_gegevens AS
SELECT ar.naam, sg.groep_naam, sp.spec_naam, sa.waarde
FROM artikel ar, spec_groep sg, specificatie sp, artikel_spec sa
WHERE sg.groep_id = sp.groep_id
AND sp.spec_id = sa.spec_id
AND ar.artikelnr = sa.artikelnr
ORDER BY ar.naam
;

--geef aan welke artiken bij de categorie notebooks horen en sorteer de categorie op naam en waar de prijs niet hoger is dan 500.
CREATE VIEW artikel_categorie AS
SELECT ca.cat_naam, ar.artikelnr, ar.naam, ar.prijs, ar.merk
FROM categorie ca, artikel ar
WHERE ca.cat_id = ar.cat_id
AND ca.cat_naam = 'notebooks'
AND prijs <= 500
ORDER BY ca.cat_naam
;

--geef de details van het product en het bezorg addres van de gebruiker bij de orders weer
--geef ook het totaalbedrag weer bij het aantal
CREATE VIEW order_details AS
SELECT os.*, ar.naam, ar.prijs, pr.adres, ar.prijs * os.aantal AS totaal_bedrag
FROM orders os, artikel ar, profiel pr
WHERE ar.artikelnr = os.artikelnr
AND pr.user_id = os.user_id
;

--geef de namen van de parent categorieën weer met de namen van de child categorieën erbij
CREATE VIEW categorienamen AS
SELECT ca1.cat_naam AS parentcategorie, ca2.cat_naam AS childcategorie
FROM categorie ca1, categorie ca2
WHERE ca1.cat_id = ca2.parent_cat_id
;

--geef alle gewonnen veilingen aan die gewonnen en betaald zijn
CREATE VIEW gewonnen_veilingen AS
SELECT ar.naam, ve.veilingnr, bi.uitslag, bi.eigen_winnend_bod, bi.status
FROM bieding bi, artikel ar, veiling ve
WHERE ve.veilingnr = bi.veilingnr
AND ar.artikelnr = ve.artikelnr
AND uitslag = 'gewonnen'
AND status = 'betaald'
;

--geef alle zakelijke profielen met naam en zakelijke gegevens aan die meerdere aantal van een product hebben besteld
CREATE VIEW zakelijke_aantal AS
SELECT pr.gebruiker_naam, pr.klant_soort, pr.bedrijfsnaam, pr.ondernemingsnr, pr.btwnr, os.artikelnr ,os.aantal
FROM profiel pr, orders os
WHERE pr.user_id = os.user_id
AND pr.klant_soort = 'zakelijk'
AND os.aantal > 1
;

--geef alle verloren veiling waarbij het winnende bod meer dan het dubbele is dan je laatste bod
CREATE VIEW verloren_veiling AS
SELECT ar.naam, ve.veilingnr, bi.uitslag, bi.winnend_bod, bi.eigen_laatste_bod
FROM bieding bi, artikel ar, veiling ve
WHERE ve.veilingnr = bi.veilingnr
AND ar.artikelnr = ve.artikelnr
AND uitslag = 'verloren'
AND winnend_bod > eigen_laatste_bod*2
;

--kijk welke particuliere mensen die hun socialmedia account verbonden hebben en ook een veiling gewonnen hebben.
CREATE VIEW winnende_socialmedia AS
SELECT pr.gebruiker_naam, pr.social_account, pr.klant_soort, pr.nickname, bi.biedingnr, bi.uitslag, bi.eigen_winnend_bod, bi.status
FROM profiel pr, bieding bi
WHERE pr.user_id = bi.user_id
AND pr.klant_soort = 'particulier'
AND pr.social_account IS NOT NULL
AND bi.uitslag = 'gewonnen'
;

CREATE VIEW sub AS
SELECT cat_naam
FROM categorie 
WHERE parent_cat_id = (SELECT cat_id FROM categorie WHERE cat_naam = 'laptops');

CREATE VIEW merk AS
SELECT af.afbeelding_url, ar.naam, ar.prijs, ar.beschrijving, ar.merk 
FROM artikel ar, afbeelding af 
WHERE ar.artikelnr = af.artikelnr 
AND ar.Merk ='asus';

create or replace procedure Login(
p_email in varchar2,
p_password in varchar2,
p_result out number,
p_cID out number)
is
  e_invalid_email exception;
  
  procedure checkEmail
  is
    v_temp_email varchar2(255);
  begin
    select p.email
    into v_temp_email
    from Profiel p
    where p.email = p_email;
    
  exception
    when no_data_found then
      raise e_invalid_email;
  end checkEmail;
  
  procedure checkCredentials
  is
    v_temp_username varchar2(255);
    v_temp_password varchar2(255);
    v_temp_access   varchar2(255);
  begin
    select p.email, p.wachtwoord, p.user_id
    into v_temp_username, v_temp_password, p_cID
    from Profiel p
    where p.email = p_email;
    
    if v_temp_password = p_password then p_result := 1;
    else
      p_result := 0;
    end if;
  end checkCredentials;
begin
  checkEmail();
  checkCredentials();
exception
  when e_invalid_email then
    raise_application_error(-20000, 'ERROR: Dit e-mailadres wordt niet gebruikt.');
end Login;
/

create or replace procedure createUser(
p_email in varchar2,
p_gebruiker_naam in varchar2,
p_wachtwoord in varchar2,
p_telnr in number,
p_geb_datum in varchar2,
p_adres in varchar2,
p_land in varchar2,
p_social_account in varchar2,
p_klant_soort in varchar2,
p_bedrijfsnaam in varchar2,
p_ondernemingsnr in number,
p_btwnr in varchar2,
p_nickname in varchar2)
is
  v_ID number;
 
  procedure getHighestID
  is
  begin
    select max (p.user_id)
    into v_ID
    from Profiel p;
   
    v_ID := v_ID + 1;
  end getHighestID;
begin
  getHighestID();
 
  insert into Profiel(user_id, email, gebruiker_naam, wachtwoord,telnr, geb_datum, adres, land, social_account, klant_soort, bedrijfsnaam, ondernemingsnr, btwnr, nickname)
  values (v_ID, p_email, p_gebruiker_naam, p_wachtwoord,p_telnr, p_geb_datum, p_adres, p_land, p_social_account, p_klant_soort, p_bedrijfsnaam, p_ondernemingsnr, p_btwnr, p_nickname);
 
end createUser;
/