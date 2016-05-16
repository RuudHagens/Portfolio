DROP TABLE PROFIEL CASCADE CONSTRAINTS;
DROP TABLE TOPIC CASCADE CONSTRAINTS;
DROP TABLE POST CASCADE CONSTRAINTS;
DROP TABLE COMMENTAAR CASCADE CONSTRAINTS;
DROP TABLE BLOKKADE CASCADE CONSTRAINTS;
DROP TABLE ABONNEMENT CASCADE CONSTRAINTS;
DROP TABLE PROFIEL_ABONNEMENT CASCADE CONSTRAINTS;
DROP TABLE TOPIC_ABONNEMENT CASCADE CONSTRAINTS;

CREATE TABLE PROFIEL(
Profielnr NUMBER (6) PRIMARY KEY,
Naam VARCHAR2 (255) NOT NULL UNIQUE,
Email VARCHAR2 (255) NOT NULL UNIQUE,
Wachtwoord VARCHAR2 (20) NOT NULL,
Soort_Gebruiker VARCHAR2 (15) CHECK (Soort_Gebruiker IN ('Admin', 'Gebruiker'))
);

CREATE TABLE TOPIC(
Topicnr NUMBER (8) PRIMARY KEY,
Profielnr NUMBER (6) NOT NULL,
Naam VARCHAR2 (255) NOT NULL UNIQUE,
Aanmaak_Datum DATE NOT NULL,
Aantal_bekeken NUMBER (8) NULL,
CONSTRAINT FK_TOPIC_PROFIELNR FOREIGN KEY (Profielnr) REFERENCES PROFIEL (Profielnr)
);

CREATE TABLE POST(
Postnr NUMBER (10) PRIMARY KEY,
Profielnr NUMBER (6) NOT NULL,
Topicnr NUMBER (8) NOT NULL,
Datum DATE NOT NULL,
Tekst CLOB NOT NULL,
Filelink VARCHAR2 (4000) NULL,
CONSTRAINT FK_POST_PROFIELNR FOREIGN KEY (Profielnr) REFERENCES PROFIEL (Profielnr),
CONSTRAINT FK_POST_TOPICNR FOREIGN KEY (Topicnr) REFERENCES TOPIC (Topicnr)
);

CREATE TABLE COMMENTAAR(
Commentnr NUMBER (10) PRIMARY KEY,
CommentGevernr NUMBER (10) NOT NULL,
CommentNemernr NUMBER (10) NOT NULL,
Datum DATE NOT NULL,
Tekst CLOB NOT NULL,
CONSTRAINT FK_COMMENTAAR_COMMENTGEVERNR FOREIGN KEY (CommentGevernr) REFERENCES PROFIEL (Profielnr),
CONSTRAINT FK_COMMENTAAR_COMMENTNEMERNR FOREIGN KEY (CommentNemernr) REFERENCES PROFIEL (Profielnr)
);

CREATE TABLE BLOKKADE(
Blokkadenr NUMBER (10) PRIMARY KEY,
Geblokkeerde NUMBER (10) NOT NULL,
Blokkeerder NUMBER (10) NOT NULL,
Datum DATE NOT NULL,
Tijdsduur VARCHAR2 (50) NOT NULL,
CONSTRAINT FK_BGG FOREIGN KEY (Geblokkeerde) REFERENCES PROFIEL (Profielnr),
CONSTRAINT FK_BBA FOREIGN KEY (Blokkeerder) REFERENCES PROFIEL (Profielnr)
);

CREATE TABLE ABONNEMENT(
Abonnementnr NUMBER (10) PRIMARY KEY,
Abonnement_soort VARCHAR2 (10) CHECK (Abonnement_soort IN ('Profiel','Topic')),
Profielnr NUMBER (10) NOT NULL,
CONSTRAINT FK_AP FOREIGN KEY (Profielnr) REFERENCES PROFIEL (Profielnr)
);

CREATE TABLE PROFIEL_ABONNEMENT(
Abonnementnr NUMBER (10) NOT NULL,
Geabonneerd_Profielnr NUMBER (10) NOT NULL,
CONSTRAINT PK_PA PRIMARY KEY (Abonnementnr, Geabonneerd_Profielnr),
CONSTRAINT FK_PAA FOREIGN KEY (Abonnementnr) REFERENCES ABONNEMENT (Abonnementnr),
CONSTRAINT FK_PAGP FOREIGN KEY (Geabonneerd_Profielnr) REFERENCES PROFIEL (Profielnr)
);

CREATE TABLE TOPIC_ABONNEMENT(
Abonnementnr NUMBER (10) NOT NULL,
Geabonneerd_Topicnr NUMBER (10) NOT NULL,
CONSTRAINT PK_TA PRIMARY KEY (Abonnementnr, Geabonneerd_Topicnr),
CONSTRAINT FK_TAA FOREIGN KEY (Abonnementnr) REFERENCES ABONNEMENT (Abonnementnr),
CONSTRAINT FK_TAGP FOREIGN KEY (Geabonneerd_Topicnr) REFERENCES TOPIC (Topicnr)
);

-- ----------------------------
-- Records of PROFIEL
-- ----------------------------
INSERT INTO PROFIEL (Profielnr,Naam,Email,Wachtwoord,Soort_Gebruiker) VALUES (1,'Hans Otjes','hans@otjes.com','hans','Gebruiker');
INSERT INTO PROFIEL (Profielnr,Naam,Email,Wachtwoord,Soort_Gebruiker) VALUES (2,'Ray Kelley','sem.vitae.aliquam@rhoncus.ca','ad','Gebruiker');
INSERT INTO PROFIEL (Profielnr,Naam,Email,Wachtwoord,Soort_Gebruiker) VALUES (3,'Shelly Peterson','amet@enimsit.co.uk','nibh','Gebruiker');
INSERT INTO PROFIEL (Profielnr,Naam,Email,Wachtwoord,Soort_Gebruiker) VALUES (4,'Summer Johns','lectus.rutrum@malesuadaiderat.com','scelerisque','Gebruiker');
INSERT INTO PROFIEL (Profielnr,Naam,Email,Wachtwoord,Soort_Gebruiker) VALUES (5,'Alden Savage','Nam.ac.nulla@rutrumFusce.org','ipsum','Admin');
INSERT INTO PROFIEL (Profielnr,Naam,Email,Wachtwoord,Soort_Gebruiker) VALUES (6,'Ima Obrien','consequat.auctor.nunc@nuncestmollis.com','sapien,','Admin');
INSERT INTO PROFIEL (Profielnr,Naam,Email,Wachtwoord,Soort_Gebruiker) VALUES (7,'Alden Delacruz','natoque.penatibus@ultrices.co.uk','Etiam','Gebruiker');
INSERT INTO PROFIEL (Profielnr,Naam,Email,Wachtwoord,Soort_Gebruiker) VALUES (8,'Basia Mccormick','odio.Aliquam@turpisNulla.com','enim.','Gebruiker');
INSERT INTO PROFIEL (Profielnr,Naam,Email,Wachtwoord,Soort_Gebruiker) VALUES (9,'Cassidy Richard','tempor.arcu@inaliquetlobortis.co.uk','Donec','Admin');
INSERT INTO PROFIEL (Profielnr,Naam,Email,Wachtwoord,Soort_Gebruiker) VALUES (10,'Oliver Wooten','sem.egestas.blandit@placeratCrasdictum.net','orci','Gebruiker');
INSERT INTO PROFIEL (Profielnr,Naam,Email,Wachtwoord,Soort_Gebruiker) VALUES (11,'Hakeem Kennedy','nec.euismod@tincidunt.net','Sed','Admin');
INSERT INTO PROFIEL (Profielnr,Naam,Email,Wachtwoord,Soort_Gebruiker) VALUES (12,'Ila Watkins','est@tinciduntpede.edu','adipiscing,','Admin');
INSERT INTO PROFIEL (Profielnr,Naam,Email,Wachtwoord,Soort_Gebruiker) VALUES (13,'Jin Small','Curabitur@ullamcorper.net','quis','Gebruiker');
INSERT INTO PROFIEL (Profielnr,Naam,Email,Wachtwoord,Soort_Gebruiker) VALUES (14,'Kessie Franco','vulputate.eu@ornaretortorat.org','dolor','Gebruiker');
INSERT INTO PROFIEL (Profielnr,Naam,Email,Wachtwoord,Soort_Gebruiker) VALUES (15,'Ian Osborn','pellentesque.a.facilisis@augueut.org','fringilla','Gebruiker');
INSERT INTO PROFIEL (Profielnr,Naam,Email,Wachtwoord,Soort_Gebruiker) VALUES (16,'Lamar Snider','elit.Curabitur@nislelementum.net','tellus,','Gebruiker');
INSERT INTO PROFIEL (Profielnr,Naam,Email,Wachtwoord,Soort_Gebruiker) VALUES (17,'Lysandra Terry','mi.eleifend@rutrum.co.uk','id','Admin');
INSERT INTO PROFIEL (Profielnr,Naam,Email,Wachtwoord,Soort_Gebruiker) VALUES (18,'Remedios Allison','a.aliquet.vel@luctussitamet.co.uk','augue','Gebruiker');
INSERT INTO PROFIEL (Profielnr,Naam,Email,Wachtwoord,Soort_Gebruiker) VALUES (19,'Xanthus Jarvis','Suspendisse.tristique@dictum.edu','sit','Gebruiker');
INSERT INTO PROFIEL (Profielnr,Naam,Email,Wachtwoord,Soort_Gebruiker) VALUES (20,'Rebecca Browning','lacus.vestibulum.lorem@nuncQuisque.org','vulputate,','Gebruiker');
INSERT INTO PROFIEL (Profielnr,Naam,Email,Wachtwoord,Soort_Gebruiker) VALUES (21,'Alfonso Pate','purus@inconsequat.ca','magna.','Admin');
INSERT INTO PROFIEL (Profielnr,Naam,Email,Wachtwoord,Soort_Gebruiker) VALUES (22,'Lacota Marshall','ligula.Aenean.gravida@felis.co.uk','quam','Gebruiker');
INSERT INTO PROFIEL (Profielnr,Naam,Email,Wachtwoord,Soort_Gebruiker) VALUES (23,'Samuel Herman','ultrices.iaculis@nequeNullamnisl.org','non','Gebruiker');
INSERT INTO PROFIEL (Profielnr,Naam,Email,Wachtwoord,Soort_Gebruiker) VALUES (24,'Hayley Alvarado','parturient.montes.nascetur@tellusAenean.com','nec','Gebruiker');
INSERT INTO PROFIEL (Profielnr,Naam,Email,Wachtwoord,Soort_Gebruiker) VALUES (25,'Ayanna Walker','ac.ipsum@erat.ca','nibh.','Gebruiker');
INSERT INTO PROFIEL (Profielnr,Naam,Email,Wachtwoord,Soort_Gebruiker) VALUES (26,'Kenneth Campos','et.eros@egestas.com','semper,','Admin');
INSERT INTO PROFIEL (Profielnr,Naam,Email,Wachtwoord,Soort_Gebruiker) VALUES (27,'Anika Downs','adipiscing.lobortis@utipsum.co.uk','eu','Gebruiker');
INSERT INTO PROFIEL (Profielnr,Naam,Email,Wachtwoord,Soort_Gebruiker) VALUES (28,'Kim Rush','Etiam.gravida.molestie@lobortis.co.uk','est.','Gebruiker');
INSERT INTO PROFIEL (Profielnr,Naam,Email,Wachtwoord,Soort_Gebruiker) VALUES (29,'Janna Wilkerson','turpis.Nulla@euismodindolor.net','venenatis','Gebruiker');
INSERT INTO PROFIEL (Profielnr,Naam,Email,Wachtwoord,Soort_Gebruiker) VALUES (30,'James Trujillo','odio@pharetrased.edu','Praesent','Gebruiker');
INSERT INTO PROFIEL (Profielnr,Naam,Email,Wachtwoord,Soort_Gebruiker) VALUES (31,'Dustin Randall','molestie.Sed.id@a.ca','ipsum','Admin');
INSERT INTO PROFIEL (Profielnr,Naam,Email,Wachtwoord,Soort_Gebruiker) VALUES (32,'Maisie Livingston','In@sitametornare.co.uk','natoque','Gebruiker');
INSERT INTO PROFIEL (Profielnr,Naam,Email,Wachtwoord,Soort_Gebruiker) VALUES (33,'Martena Elliott','varius.ultrices@sit.net','iaculis','Admin');
INSERT INTO PROFIEL (Profielnr,Naam,Email,Wachtwoord,Soort_Gebruiker) VALUES (34,'Dai Gross','Nunc.mauris.sapien@amalesuada.org','at,','Gebruiker');
INSERT INTO PROFIEL (Profielnr,Naam,Email,Wachtwoord,Soort_Gebruiker) VALUES (35,'Chester Barr','a@eleifendnuncrisus.net','accumsan','Gebruiker');
INSERT INTO PROFIEL (Profielnr,Naam,Email,Wachtwoord,Soort_Gebruiker) VALUES (36,'Geoffrey Cole','tincidunt.dui.augue@Namporttitorscelerisque.ca','ullamcorper,','Admin');
INSERT INTO PROFIEL (Profielnr,Naam,Email,Wachtwoord,Soort_Gebruiker) VALUES (37,'Keaton Hamilton','Lorem@velquamdignissim.com','at','Admin');
INSERT INTO PROFIEL (Profielnr,Naam,Email,Wachtwoord,Soort_Gebruiker) VALUES (38,'Barrett Marks','metus.eu.erat@laciniavitae.com','conubia','Gebruiker');
INSERT INTO PROFIEL (Profielnr,Naam,Email,Wachtwoord,Soort_Gebruiker) VALUES (39,'Christopher Herring','non.lobortis@dictum.ca','pede,','Gebruiker');
INSERT INTO PROFIEL (Profielnr,Naam,Email,Wachtwoord,Soort_Gebruiker) VALUES (40,'Olympia Monroe','ipsum.non@Utsagittislobortis.net','fringilla.','Gebruiker');
INSERT INTO PROFIEL (Profielnr,Naam,Email,Wachtwoord,Soort_Gebruiker) VALUES (41,'Iona Oliver','neque@lacinia.org','diam','Gebruiker');
INSERT INTO PROFIEL (Profielnr,Naam,Email,Wachtwoord,Soort_Gebruiker) VALUES (42,'Maite Compton','sem.ut@augueeutellus.org','feugiat.','Gebruiker');
INSERT INTO PROFIEL (Profielnr,Naam,Email,Wachtwoord,Soort_Gebruiker) VALUES (43,'Cora Garrett','eros.Proin@Pellentesquehabitant.edu','tincidunt','Admin');
INSERT INTO PROFIEL (Profielnr,Naam,Email,Wachtwoord,Soort_Gebruiker) VALUES (44,'Ulla Fletcher','nibh.dolor.nonummy@lobortisauguescelerisque.com','Quisque','Admin');
INSERT INTO PROFIEL (Profielnr,Naam,Email,Wachtwoord,Soort_Gebruiker) VALUES (45,'Steel Crane','in.faucibus.orci@porttitor.edu','nonummy.','Gebruiker');
INSERT INTO PROFIEL (Profielnr,Naam,Email,Wachtwoord,Soort_Gebruiker) VALUES (46,'Ariana Schneider','pharetra.sed@atvelitPellentesque.com','Donec','Gebruiker');
INSERT INTO PROFIEL (Profielnr,Naam,Email,Wachtwoord,Soort_Gebruiker) VALUES (47,'Barclay Schneider','adipiscing@et.com','ligula','Gebruiker');
INSERT INTO PROFIEL (Profielnr,Naam,Email,Wachtwoord,Soort_Gebruiker) VALUES (48,'Rhoda Terrell','arcu.et@sociisnatoquepenatibus.edu','ut','Gebruiker');
INSERT INTO PROFIEL (Profielnr,Naam,Email,Wachtwoord,Soort_Gebruiker) VALUES (49,'Justin Schwartz','ut.quam@Nullafacilisi.ca','fermentum','Admin');
INSERT INTO PROFIEL (Profielnr,Naam,Email,Wachtwoord,Soort_Gebruiker) VALUES (50,'Kitra Cooke','id.risus@sem.edu','Etiam','Gebruiker');
INSERT INTO PROFIEL (Profielnr,Naam,Email,Wachtwoord,Soort_Gebruiker) VALUES (51,'Nasim Downs','Sed.eget@Maurisblanditenim.edu','iaculis','Gebruiker');
INSERT INTO PROFIEL (Profielnr,Naam,Email,Wachtwoord,Soort_Gebruiker) VALUES (52,'Stewart Kane','Morbi.metus.Vivamus@quam.net','et','Admin');
INSERT INTO PROFIEL (Profielnr,Naam,Email,Wachtwoord,Soort_Gebruiker) VALUES (53,'Isabelle Pate','Duis@seddictumeleifend.com','a','Admin');
INSERT INTO PROFIEL (Profielnr,Naam,Email,Wachtwoord,Soort_Gebruiker) VALUES (54,'Montana Hill','leo.Morbi@ac.co.uk','a,','Admin');
INSERT INTO PROFIEL (Profielnr,Naam,Email,Wachtwoord,Soort_Gebruiker) VALUES (55,'Margaret Good','mauris.elit@laciniaorci.co.uk','tristique','Admin');
INSERT INTO PROFIEL (Profielnr,Naam,Email,Wachtwoord,Soort_Gebruiker) VALUES (56,'Mohammad Mccall','pharetra.felis.eget@Aliquam.com','et,','Gebruiker');
INSERT INTO PROFIEL (Profielnr,Naam,Email,Wachtwoord,Soort_Gebruiker) VALUES (57,'Richard Cortez','molestie@diameudolor.ca','volutpat','Gebruiker');
INSERT INTO PROFIEL (Profielnr,Naam,Email,Wachtwoord,Soort_Gebruiker) VALUES (58,'Hammett Dunlap','mattis.velit@uteros.org','lobortis,','Gebruiker');
INSERT INTO PROFIEL (Profielnr,Naam,Email,Wachtwoord,Soort_Gebruiker) VALUES (59,'Kirk Campos','fames.ac@bibendum.net','taciti','Admin');
INSERT INTO PROFIEL (Profielnr,Naam,Email,Wachtwoord,Soort_Gebruiker) VALUES (60,'Hayley Soto','sit@blandit.edu','nec,','Gebruiker');
INSERT INTO PROFIEL (Profielnr,Naam,Email,Wachtwoord,Soort_Gebruiker) VALUES (61,'Molly Fernandez','aliquet.molestie.tellus@Proin.org','morbi','Gebruiker');
INSERT INTO PROFIEL (Profielnr,Naam,Email,Wachtwoord,Soort_Gebruiker) VALUES (62,'Kirestin Lamb','mauris.ut.mi@sagittisNullamvitae.net','ad','Gebruiker');
INSERT INTO PROFIEL (Profielnr,Naam,Email,Wachtwoord,Soort_Gebruiker) VALUES (63,'Chester Schneider','Phasellus.nulla@atauctorullamcorper.com','tincidunt','Admin');
INSERT INTO PROFIEL (Profielnr,Naam,Email,Wachtwoord,Soort_Gebruiker) VALUES (64,'Kirestin Levy','Proin.vel.nisl@convallis.com','congue.','Gebruiker');
INSERT INTO PROFIEL (Profielnr,Naam,Email,Wachtwoord,Soort_Gebruiker) VALUES (65,'Owen Edwards','venenatis@rhoncusDonecest.edu','Vivamus','Admin');
INSERT INTO PROFIEL (Profielnr,Naam,Email,Wachtwoord,Soort_Gebruiker) VALUES (66,'Amos Berry','non.enim@etarcuimperdiet.co.uk','at','Admin');
INSERT INTO PROFIEL (Profielnr,Naam,Email,Wachtwoord,Soort_Gebruiker) VALUES (67,'Avye Nunez','scelerisque.sed.sapien@Crasdictum.edu','tellus.','Gebruiker');
INSERT INTO PROFIEL (Profielnr,Naam,Email,Wachtwoord,Soort_Gebruiker) VALUES (68,'Lucas Moran','quis.pede.Praesent@Vestibulumut.edu','Nam','Gebruiker');
INSERT INTO PROFIEL (Profielnr,Naam,Email,Wachtwoord,Soort_Gebruiker) VALUES (69,'Sharon Lane','nec.ligula.consectetuer@Nuncquis.ca','eros','Gebruiker');
INSERT INTO PROFIEL (Profielnr,Naam,Email,Wachtwoord,Soort_Gebruiker) VALUES (70,'Violet Byers','semper@lacusAliquamrutrum.org','luctus','Gebruiker');
INSERT INTO PROFIEL (Profielnr,Naam,Email,Wachtwoord,Soort_Gebruiker) VALUES (71,'Lyle Hendricks','sollicitudin@egetipsumDonec.org','nec,','Admin');
INSERT INTO PROFIEL (Profielnr,Naam,Email,Wachtwoord,Soort_Gebruiker) VALUES (72,'Amaya Workman','Praesent.luctus.Curabitur@lobortisauguescelerisque.ca','ut','Gebruiker');
INSERT INTO PROFIEL (Profielnr,Naam,Email,Wachtwoord,Soort_Gebruiker) VALUES (73,'Shay Kelley','at.egestas.a@utcursusluctus.ca','vitae,','Gebruiker');
INSERT INTO PROFIEL (Profielnr,Naam,Email,Wachtwoord,Soort_Gebruiker) VALUES (74,'Stella Dalton','dictum@esttempor.edu','id','Gebruiker');
INSERT INTO PROFIEL (Profielnr,Naam,Email,Wachtwoord,Soort_Gebruiker) VALUES (75,'Ezekiel Justice','interdum@quis.net','pede.','Gebruiker');
INSERT INTO PROFIEL (Profielnr,Naam,Email,Wachtwoord,Soort_Gebruiker) VALUES (76,'Neil Hoover','massa.Quisque.porttitor@Loremipsum.net','luctus','Admin');
INSERT INTO PROFIEL (Profielnr,Naam,Email,Wachtwoord,Soort_Gebruiker) VALUES (77,'Shaine Hurst','molestie.tellus.Aenean@nequeet.net','et','Gebruiker');
INSERT INTO PROFIEL (Profielnr,Naam,Email,Wachtwoord,Soort_Gebruiker) VALUES (78,'Gray Rich','pede.Cras.vulputate@nonummyac.edu','vitae','Gebruiker');
INSERT INTO PROFIEL (Profielnr,Naam,Email,Wachtwoord,Soort_Gebruiker) VALUES (79,'Rae Wiley','arcu.et@Morbi.net','non,','Admin');
INSERT INTO PROFIEL (Profielnr,Naam,Email,Wachtwoord,Soort_Gebruiker) VALUES (80,'Summer Hensley','facilisis@maurisMorbi.co.uk','egestas.','Gebruiker');
INSERT INTO PROFIEL (Profielnr,Naam,Email,Wachtwoord,Soort_Gebruiker) VALUES (81,'Kim Knowles','sodales.nisi.magna@Proin.co.uk','adipiscing','Admin');
INSERT INTO PROFIEL (Profielnr,Naam,Email,Wachtwoord,Soort_Gebruiker) VALUES (82,'Caryn Harvey','Nullam.scelerisque@ligulaAeneaneuismod.com','pede.','Admin');
INSERT INTO PROFIEL (Profielnr,Naam,Email,Wachtwoord,Soort_Gebruiker) VALUES (83,'Mollie Wolfe','Class.aptent.taciti@eleifendCrassed.co.uk','In','Admin');
INSERT INTO PROFIEL (Profielnr,Naam,Email,Wachtwoord,Soort_Gebruiker) VALUES (84,'Eaton Hull','venenatis@lacusNulla.net','non,','Gebruiker');
INSERT INTO PROFIEL (Profielnr,Naam,Email,Wachtwoord,Soort_Gebruiker) VALUES (85,'Rhona Morin','risus@magnaSuspendissetristique.co.uk','consectetuer','Admin');
INSERT INTO PROFIEL (Profielnr,Naam,Email,Wachtwoord,Soort_Gebruiker) VALUES (86,'Winifred Fields','Nulla.facilisis@Craspellentesque.co.uk','egestas','Admin');
INSERT INTO PROFIEL (Profielnr,Naam,Email,Wachtwoord,Soort_Gebruiker) VALUES (87,'Zane Conner','aliquet@egestas.org','in,','Admin');
INSERT INTO PROFIEL (Profielnr,Naam,Email,Wachtwoord,Soort_Gebruiker) VALUES (88,'Bree Flores','mauris@infaucibus.edu','pede,','Gebruiker');
INSERT INTO PROFIEL (Profielnr,Naam,Email,Wachtwoord,Soort_Gebruiker) VALUES (89,'Xerxes Odom','ligula.tortor.dictum@semPellentesque.edu','nec','Admin');
INSERT INTO PROFIEL (Profielnr,Naam,Email,Wachtwoord,Soort_Gebruiker) VALUES (90,'Dustin Stevens','Pellentesque.tincidunt.tempus@tellusSuspendissesed.ca','sollicitudin','Admin');
INSERT INTO PROFIEL (Profielnr,Naam,Email,Wachtwoord,Soort_Gebruiker) VALUES (91,'Jillian Weeks','ornare.egestas.ligula@blandit.edu','molestie.','Gebruiker');
INSERT INTO PROFIEL (Profielnr,Naam,Email,Wachtwoord,Soort_Gebruiker) VALUES (92,'Travis Yang','Etiam.vestibulum.massa@non.ca','scelerisque','Gebruiker');
INSERT INTO PROFIEL (Profielnr,Naam,Email,Wachtwoord,Soort_Gebruiker) VALUES (93,'Quinn Perkins','luctus@Phasellusataugue.org','tempor','Gebruiker');
INSERT INTO PROFIEL (Profielnr,Naam,Email,Wachtwoord,Soort_Gebruiker) VALUES (94,'Brendan Duncan','sit@dictumsapien.org','rhoncus','Gebruiker');
INSERT INTO PROFIEL (Profielnr,Naam,Email,Wachtwoord,Soort_Gebruiker) VALUES (95,'Stella Burgess','et@necligulaconsectetuer.org','a','Gebruiker');
INSERT INTO PROFIEL (Profielnr,Naam,Email,Wachtwoord,Soort_Gebruiker) VALUES (96,'Cherokee Hester','Integer@orciDonec.net','orci,','Gebruiker');
INSERT INTO PROFIEL (Profielnr,Naam,Email,Wachtwoord,Soort_Gebruiker) VALUES (97,'Mercedes Powell','Donec.consectetuer@sodalesMaurisblandit.edu','elit','Admin');
INSERT INTO PROFIEL (Profielnr,Naam,Email,Wachtwoord,Soort_Gebruiker) VALUES (98,'Adena Ayers','tempus.non.lacinia@sociosqu.co.uk','libero.','Gebruiker');
INSERT INTO PROFIEL (Profielnr,Naam,Email,Wachtwoord,Soort_Gebruiker) VALUES (99,'Arthur Ruiz','feugiat.tellus@inconsectetueripsum.co.uk','vulputate,','Gebruiker');
INSERT INTO PROFIEL (Profielnr,Naam,Email,Wachtwoord,Soort_Gebruiker) VALUES (100,'Bianca Parrish','amet.massa.Quisque@odiovelest.co.uk','condimentum','Gebruiker');

-- ----------------------------
-- Records of TOPIC
-- ----------------------------
INSERT INTO TOPIC (Topicnr,Profielnr,Naam,Aanmaak_Datum,Aantal_bekeken) VALUES (1,61,'congue.',TO_DATE('27-06-2007','DD-MM-YYYY'),275);
INSERT INTO TOPIC (Topicnr,Profielnr,Naam,Aanmaak_Datum,Aantal_bekeken) VALUES (2,12,'vestibulum',TO_DATE('23-04-1997','DD-MM-YYYY'),918);
INSERT INTO TOPIC (Topicnr,Profielnr,Naam,Aanmaak_Datum,Aantal_bekeken) VALUES (3,52,'facilisis',TO_DATE('23-03-2008','DD-MM-YYYY'),933);
INSERT INTO TOPIC (Topicnr,Profielnr,Naam,Aanmaak_Datum,Aantal_bekeken) VALUES (4,100,'augue',TO_DATE('23-10-1998','DD-MM-YYYY'),319);
INSERT INTO TOPIC (Topicnr,Profielnr,Naam,Aanmaak_Datum,Aantal_bekeken) VALUES (5,58,'tempus',TO_DATE('04-06-1911','DD-MM-YYYY'),441);
INSERT INTO TOPIC (Topicnr,Profielnr,Naam,Aanmaak_Datum,Aantal_bekeken) VALUES (6,46,'fringilla.',TO_DATE('09-07-2010','DD-MM-YYYY'),654);
INSERT INTO TOPIC (Topicnr,Profielnr,Naam,Aanmaak_Datum,Aantal_bekeken) VALUES (7,26,'et',TO_DATE('29-10-2012','DD-MM-YYYY'),573);
INSERT INTO TOPIC (Topicnr,Profielnr,Naam,Aanmaak_Datum,Aantal_bekeken) VALUES (8,31,'non,',TO_DATE('23-10-2006','DD-MM-YYYY'),621);
INSERT INTO TOPIC (Topicnr,Profielnr,Naam,Aanmaak_Datum,Aantal_bekeken) VALUES (9,71,'lacus.',TO_DATE('09-12-2014','DD-MM-YYYY'),956);
INSERT INTO TOPIC (Topicnr,Profielnr,Naam,Aanmaak_Datum,Aantal_bekeken) VALUES (10,76,'venenatis',TO_DATE('02-02-2002','DD-MM-YYYY'),58);
INSERT INTO TOPIC (Topicnr,Profielnr,Naam,Aanmaak_Datum,Aantal_bekeken) VALUES (11,74,'ipsum',TO_DATE('11-08-1999','DD-MM-YYYY'),698);
INSERT INTO TOPIC (Topicnr,Profielnr,Naam,Aanmaak_Datum,Aantal_bekeken) VALUES (12,83,'In',TO_DATE('24-09-2014','DD-MM-YYYY'),159);
INSERT INTO TOPIC (Topicnr,Profielnr,Naam,Aanmaak_Datum,Aantal_bekeken) VALUES (13,54,'libero',TO_DATE('19-02-2008','DD-MM-YYYY'),651);
INSERT INTO TOPIC (Topicnr,Profielnr,Naam,Aanmaak_Datum,Aantal_bekeken) VALUES (14,23,'dictum',TO_DATE('25-02-1998','DD-MM-YYYY'),104);
INSERT INTO TOPIC (Topicnr,Profielnr,Naam,Aanmaak_Datum,Aantal_bekeken) VALUES (15,8,'auctor',TO_DATE('18-12-2013','DD-MM-YYYY'),198);
INSERT INTO TOPIC (Topicnr,Profielnr,Naam,Aanmaak_Datum,Aantal_bekeken) VALUES (16,59,'aptent',TO_DATE('08-11-2013','DD-MM-YYYY'),329);
INSERT INTO TOPIC (Topicnr,Profielnr,Naam,Aanmaak_Datum,Aantal_bekeken) VALUES (17,38,'in',TO_DATE('11-08-2005','DD-MM-YYYY'),487);
INSERT INTO TOPIC (Topicnr,Profielnr,Naam,Aanmaak_Datum,Aantal_bekeken) VALUES (18,27,'metus.',TO_DATE('07-10-2013','DD-MM-YYYY'),199);
INSERT INTO TOPIC (Topicnr,Profielnr,Naam,Aanmaak_Datum,Aantal_bekeken) VALUES (19,9,'ac',TO_DATE('10-01-1996','DD-MM-YYYY'),306);
INSERT INTO TOPIC (Topicnr,Profielnr,Naam,Aanmaak_Datum,Aantal_bekeken) VALUES (20,5,'lacinia',TO_DATE('08-07-1996','DD-MM-YYYY'),190);
INSERT INTO TOPIC (Topicnr,Profielnr,Naam,Aanmaak_Datum,Aantal_bekeken) VALUES (21,95,'cursus',TO_DATE('04-06-2003','DD-MM-YYYY'),913);
INSERT INTO TOPIC (Topicnr,Profielnr,Naam,Aanmaak_Datum,Aantal_bekeken) VALUES (22,15,'magna.',TO_DATE('13-12-2013','DD-MM-YYYY'),502);
INSERT INTO TOPIC (Topicnr,Profielnr,Naam,Aanmaak_Datum,Aantal_bekeken) VALUES (23,17,'erat',TO_DATE('05-10-2002','DD-MM-YYYY'),635);
INSERT INTO TOPIC (Topicnr,Profielnr,Naam,Aanmaak_Datum,Aantal_bekeken) VALUES (24,35,'vulputate,',TO_DATE('10-03-2005','DD-MM-YYYY'),967);
INSERT INTO TOPIC (Topicnr,Profielnr,Naam,Aanmaak_Datum,Aantal_bekeken) VALUES (25,32,'auctore',TO_DATE('04-06-2009','DD-MM-YYYY'),931);
INSERT INTO TOPIC (Topicnr,Profielnr,Naam,Aanmaak_Datum,Aantal_bekeken) VALUES (26,100,'tristique',TO_DATE('24-01-1999','DD-MM-YYYY'),560);
INSERT INTO TOPIC (Topicnr,Profielnr,Naam,Aanmaak_Datum,Aantal_bekeken) VALUES (27,53,'volutpat.',TO_DATE('12-06-2002','DD-MM-YYYY'),383);
INSERT INTO TOPIC (Topicnr,Profielnr,Naam,Aanmaak_Datum,Aantal_bekeken) VALUES (28,45,'lorem',TO_DATE('26-04-2013','DD-MM-YYYY'),47);
INSERT INTO TOPIC (Topicnr,Profielnr,Naam,Aanmaak_Datum,Aantal_bekeken) VALUES (29,9,'eget',TO_DATE('29-08-1998','DD-MM-YYYY'),960);
INSERT INTO TOPIC (Topicnr,Profielnr,Naam,Aanmaak_Datum,Aantal_bekeken) VALUES (30,56,'nunc',TO_DATE('16-04-2014','DD-MM-YYYY'),614);
INSERT INTO TOPIC (Topicnr,Profielnr,Naam,Aanmaak_Datum,Aantal_bekeken) VALUES (31,51,'nibh.',TO_DATE('14-02-2002','DD-MM-YYYY'),319);
INSERT INTO TOPIC (Topicnr,Profielnr,Naam,Aanmaak_Datum,Aantal_bekeken) VALUES (32,77,'cursuse',TO_DATE('10-08-1997','DD-MM-YYYY'),188);
INSERT INTO TOPIC (Topicnr,Profielnr,Naam,Aanmaak_Datum,Aantal_bekeken) VALUES (33,86,'eu',TO_DATE('24-06-2004','DD-MM-YYYY'),389);
INSERT INTO TOPIC (Topicnr,Profielnr,Naam,Aanmaak_Datum,Aantal_bekeken) VALUES (34,2,'Cras',TO_DATE('16-05-2004','DD-MM-YYYY'),350);
INSERT INTO TOPIC (Topicnr,Profielnr,Naam,Aanmaak_Datum,Aantal_bekeken) VALUES (35,74,'nostra,',TO_DATE('03-11-1999','DD-MM-YYYY'),488);
INSERT INTO TOPIC (Topicnr,Profielnr,Naam,Aanmaak_Datum,Aantal_bekeken) VALUES (36,5,'eu,',TO_DATE('29-09-1999','DD-MM-YYYY'),6);
INSERT INTO TOPIC (Topicnr,Profielnr,Naam,Aanmaak_Datum,Aantal_bekeken) VALUES (37,26,'risus.',TO_DATE('15-01-1996','DD-MM-YYYY'),692);
INSERT INTO TOPIC (Topicnr,Profielnr,Naam,Aanmaak_Datum,Aantal_bekeken) VALUES (38,79,'dui',TO_DATE('20-12-1998','DD-MM-YYYY'),872);
INSERT INTO TOPIC (Topicnr,Profielnr,Naam,Aanmaak_Datum,Aantal_bekeken) VALUES (39,33,'ut',TO_DATE('24-05-2003','DD-MM-YYYY'),586);
INSERT INTO TOPIC (Topicnr,Profielnr,Naam,Aanmaak_Datum,Aantal_bekeken) VALUES (40,91,'in,',TO_DATE('02-01-2008','DD-MM-YYYY'),900);
INSERT INTO TOPIC (Topicnr,Profielnr,Naam,Aanmaak_Datum,Aantal_bekeken) VALUES (41,62,'nibh',TO_DATE('20-02-2013','DD-MM-YYYY'),209);
INSERT INTO TOPIC (Topicnr,Profielnr,Naam,Aanmaak_Datum,Aantal_bekeken) VALUES (42,97,'velit',TO_DATE('18-01-2003','DD-MM-YYYY'),861);
INSERT INTO TOPIC (Topicnr,Profielnr,Naam,Aanmaak_Datum,Aantal_bekeken) VALUES (43,37,'dolor.',TO_DATE('07-01-1996','DD-MM-YYYY'),63);
INSERT INTO TOPIC (Topicnr,Profielnr,Naam,Aanmaak_Datum,Aantal_bekeken) VALUES (44,84,'a,',TO_DATE('03-11-2005','DD-MM-YYYY'),748);
INSERT INTO TOPIC (Topicnr,Profielnr,Naam,Aanmaak_Datum,Aantal_bekeken) VALUES (45,63,'liberoe',TO_DATE('04-08-2014','DD-MM-YYYY'),149);
INSERT INTO TOPIC (Topicnr,Profielnr,Naam,Aanmaak_Datum,Aantal_bekeken) VALUES (46,23,'pretium',TO_DATE('04-09-1999','DD-MM-YYYY'),846);
INSERT INTO TOPIC (Topicnr,Profielnr,Naam,Aanmaak_Datum,Aantal_bekeken) VALUES (47,98,'mauris',TO_DATE('11-11-1997','DD-MM-YYYY'),894);
INSERT INTO TOPIC (Topicnr,Profielnr,Naam,Aanmaak_Datum,Aantal_bekeken) VALUES (48,2,'ace',TO_DATE('20-02-2009','DD-MM-YYYY'),544);
INSERT INTO TOPIC (Topicnr,Profielnr,Naam,Aanmaak_Datum,Aantal_bekeken) VALUES (49,99,'Aenean',TO_DATE('08-09-2012','DD-MM-YYYY'),373);
INSERT INTO TOPIC (Topicnr,Profielnr,Naam,Aanmaak_Datum,Aantal_bekeken) VALUES (50,83,'diam.',TO_DATE('29-03-2000','DD-MM-YYYY'),734);
INSERT INTO TOPIC (Topicnr,Profielnr,Naam,Aanmaak_Datum,Aantal_bekeken) VALUES (51,52,'at',TO_DATE('29-01-2012','DD-MM-YYYY'),705);
INSERT INTO TOPIC (Topicnr,Profielnr,Naam,Aanmaak_Datum,Aantal_bekeken) VALUES (52,42,'aliquam',TO_DATE('01-11-2004','DD-MM-YYYY'),500);
INSERT INTO TOPIC (Topicnr,Profielnr,Naam,Aanmaak_Datum,Aantal_bekeken) VALUES (53,56,'Donec',TO_DATE('05-10-2005','DD-MM-YYYY'),951);
INSERT INTO TOPIC (Topicnr,Profielnr,Naam,Aanmaak_Datum,Aantal_bekeken) VALUES (54,15,'nibhe',TO_DATE('17-02-2011','DD-MM-YYYY'),561);
INSERT INTO TOPIC (Topicnr,Profielnr,Naam,Aanmaak_Datum,Aantal_bekeken) VALUES (55,64,'imperdiet',TO_DATE('31-08-1996','DD-MM-YYYY'),656);
INSERT INTO TOPIC (Topicnr,Profielnr,Naam,Aanmaak_Datum,Aantal_bekeken) VALUES (56,94,'lacuse.',TO_DATE('25-06-2010','DD-MM-YYYY'),250);
INSERT INTO TOPIC (Topicnr,Profielnr,Naam,Aanmaak_Datum,Aantal_bekeken) VALUES (57,37,'semper',TO_DATE('20-04-2015','DD-MM-YYYY'),300);
INSERT INTO TOPIC (Topicnr,Profielnr,Naam,Aanmaak_Datum,Aantal_bekeken) VALUES (58,34,'Suspendisse',TO_DATE('30-06-2014','DD-MM-YYYY'),278);
INSERT INTO TOPIC (Topicnr,Profielnr,Naam,Aanmaak_Datum,Aantal_bekeken) VALUES (59,60,'Curabitur',TO_DATE('26-07-2007','DD-MM-YYYY'),8);
INSERT INTO TOPIC (Topicnr,Profielnr,Naam,Aanmaak_Datum,Aantal_bekeken) VALUES (60,59,'ipsume',TO_DATE('30-01-2008','DD-MM-YYYY'),558);
INSERT INTO TOPIC (Topicnr,Profielnr,Naam,Aanmaak_Datum,Aantal_bekeken) VALUES (61,35,'mus.',TO_DATE('24-08-1997','DD-MM-YYYY'),963);
INSERT INTO TOPIC (Topicnr,Profielnr,Naam,Aanmaak_Datum,Aantal_bekeken) VALUES (62,70,'arcu',TO_DATE('20-08-2011','DD-MM-YYYY'),607);
INSERT INTO TOPIC (Topicnr,Profielnr,Naam,Aanmaak_Datum,Aantal_bekeken) VALUES (63,47,'eue',TO_DATE('10-04-2002','DD-MM-YYYY'),935);
INSERT INTO TOPIC (Topicnr,Profielnr,Naam,Aanmaak_Datum,Aantal_bekeken) VALUES (64,50,'Curabiture',TO_DATE('11-12-2003','DD-MM-YYYY'),957);
INSERT INTO TOPIC (Topicnr,Profielnr,Naam,Aanmaak_Datum,Aantal_bekeken) VALUES (65,97,'sem.',TO_DATE('11-02-2013','DD-MM-YYYY'),108);
INSERT INTO TOPIC (Topicnr,Profielnr,Naam,Aanmaak_Datum,Aantal_bekeken) VALUES (66,30,'vulputate',TO_DATE('16-08-2001','DD-MM-YYYY'),271);
INSERT INTO TOPIC (Topicnr,Profielnr,Naam,Aanmaak_Datum,Aantal_bekeken) VALUES (67,77,'ine,',TO_DATE('19-09-2003','DD-MM-YYYY'),700);
INSERT INTO TOPIC (Topicnr,Profielnr,Naam,Aanmaak_Datum,Aantal_bekeken) VALUES (68,93,'ut,',TO_DATE('20-04-2012','DD-MM-YYYY'),266);
INSERT INTO TOPIC (Topicnr,Profielnr,Naam,Aanmaak_Datum,Aantal_bekeken) VALUES (69,13,'lacusea.',TO_DATE('04-04-1998','DD-MM-YYYY'),834);
INSERT INTO TOPIC (Topicnr,Profielnr,Naam,Aanmaak_Datum,Aantal_bekeken) VALUES (70,55,'neque.',TO_DATE('24-11-2000','DD-MM-YYYY'),112);
INSERT INTO TOPIC (Topicnr,Profielnr,Naam,Aanmaak_Datum,Aantal_bekeken) VALUES (71,56,'parturient',TO_DATE('21-01-1997','DD-MM-YYYY'),868);
INSERT INTO TOPIC (Topicnr,Profielnr,Naam,Aanmaak_Datum,Aantal_bekeken) VALUES (72,74,'ipsumea',TO_DATE('20-02-2006','DD-MM-YYYY'),503);
INSERT INTO TOPIC (Topicnr,Profielnr,Naam,Aanmaak_Datum,Aantal_bekeken) VALUES (73,60,'ultricies',TO_DATE('24-02-2015','DD-MM-YYYY'),466);
INSERT INTO TOPIC (Topicnr,Profielnr,Naam,Aanmaak_Datum,Aantal_bekeken) VALUES (74,39,'per',TO_DATE('11-09-2009','DD-MM-YYYY'),830);
INSERT INTO TOPIC (Topicnr,Profielnr,Naam,Aanmaak_Datum,Aantal_bekeken) VALUES (75,57,'neque',TO_DATE('25-02-2008','DD-MM-YYYY'),925);
INSERT INTO TOPIC (Topicnr,Profielnr,Naam,Aanmaak_Datum,Aantal_bekeken) VALUES (76,24,'arcu.',TO_DATE('22-05-2015','DD-MM-YYYY'),707);
INSERT INTO TOPIC (Topicnr,Profielnr,Naam,Aanmaak_Datum,Aantal_bekeken) VALUES (77,98,'faucibus',TO_DATE('24-08-1996','DD-MM-YYYY'),831);
INSERT INTO TOPIC (Topicnr,Profielnr,Naam,Aanmaak_Datum,Aantal_bekeken) VALUES (78,98,'egestas',TO_DATE('12-05-2002','DD-MM-YYYY'),285);
INSERT INTO TOPIC (Topicnr,Profielnr,Naam,Aanmaak_Datum,Aantal_bekeken) VALUES (79,2,'nibhea',TO_DATE('22-12-2006','DD-MM-YYYY'),140);
INSERT INTO TOPIC (Topicnr,Profielnr,Naam,Aanmaak_Datum,Aantal_bekeken) VALUES (80,27,'quam,',TO_DATE('19-11-2006','DD-MM-YYYY'),40);
INSERT INTO TOPIC (Topicnr,Profielnr,Naam,Aanmaak_Datum,Aantal_bekeken) VALUES (81,78,'nunc,',TO_DATE('19-07-2004','DD-MM-YYYY'),597);
INSERT INTO TOPIC (Topicnr,Profielnr,Naam,Aanmaak_Datum,Aantal_bekeken) VALUES (82,78,'elit,',TO_DATE('21-10-2007','DD-MM-YYYY'),12);
INSERT INTO TOPIC (Topicnr,Profielnr,Naam,Aanmaak_Datum,Aantal_bekeken) VALUES (83,66,'hymenaeos.',TO_DATE('21-12-2009','DD-MM-YYYY'),999);
INSERT INTO TOPIC (Topicnr,Profielnr,Naam,Aanmaak_Datum,Aantal_bekeken) VALUES (84,44,'mauris.',TO_DATE('21-02-1997','DD-MM-YYYY'),286);
INSERT INTO TOPIC (Topicnr,Profielnr,Naam,Aanmaak_Datum,Aantal_bekeken) VALUES (85,31,'Phasellus',TO_DATE('08-06-2004','DD-MM-YYYY'),918);
INSERT INTO TOPIC (Topicnr,Profielnr,Naam,Aanmaak_Datum,Aantal_bekeken) VALUES (86,63,'porttitor',TO_DATE('17-05-2009','DD-MM-YYYY'),300);
INSERT INTO TOPIC (Topicnr,Profielnr,Naam,Aanmaak_Datum,Aantal_bekeken) VALUES (87,12,'cursusea',TO_DATE('21-09-2003','DD-MM-YYYY'),431);
INSERT INTO TOPIC (Topicnr,Profielnr,Naam,Aanmaak_Datum,Aantal_bekeken) VALUES (88,40,'none,',TO_DATE('31-01-2004','DD-MM-YYYY'),920);
INSERT INTO TOPIC (Topicnr,Profielnr,Naam,Aanmaak_Datum,Aantal_bekeken) VALUES (89,61,'Aliquam',TO_DATE('18-02-2008','DD-MM-YYYY'),697);
INSERT INTO TOPIC (Topicnr,Profielnr,Naam,Aanmaak_Datum,Aantal_bekeken) VALUES (90,16,'ete',TO_DATE('16-02-2001','DD-MM-YYYY'),744);
INSERT INTO TOPIC (Topicnr,Profielnr,Naam,Aanmaak_Datum,Aantal_bekeken) VALUES (91,95,'magnae.',TO_DATE('15-04-2005','DD-MM-YYYY'),816);
INSERT INTO TOPIC (Topicnr,Profielnr,Naam,Aanmaak_Datum,Aantal_bekeken) VALUES (92,73,'primis',TO_DATE('15-07-2007','DD-MM-YYYY'),895);
INSERT INTO TOPIC (Topicnr,Profielnr,Naam,Aanmaak_Datum,Aantal_bekeken) VALUES (93,90,'Donecea',TO_DATE('09-11-2013','DD-MM-YYYY'),976);
INSERT INTO TOPIC (Topicnr,Profielnr,Naam,Aanmaak_Datum,Aantal_bekeken) VALUES (94,16,'feugiat',TO_DATE('10-04-2011','DD-MM-YYYY'),575);
INSERT INTO TOPIC (Topicnr,Profielnr,Naam,Aanmaak_Datum,Aantal_bekeken) VALUES (95,6,'Mauris',TO_DATE('04-12-2006','DD-MM-YYYY'),773);
INSERT INTO TOPIC (Topicnr,Profielnr,Naam,Aanmaak_Datum,Aantal_bekeken) VALUES (96,64,'dignissim.',TO_DATE('12-12-2001','DD-MM-YYYY'),370);
INSERT INTO TOPIC (Topicnr,Profielnr,Naam,Aanmaak_Datum,Aantal_bekeken) VALUES (97,77,'est',TO_DATE('04-01-1997','DD-MM-YYYY'),455);
INSERT INTO TOPIC (Topicnr,Profielnr,Naam,Aanmaak_Datum,Aantal_bekeken) VALUES (98,5,'malesuada',TO_DATE('06-09-2002','DD-MM-YYYY'),502);
INSERT INTO TOPIC (Topicnr,Profielnr,Naam,Aanmaak_Datum,Aantal_bekeken) VALUES (99,35,'sapien.',TO_DATE('17-12-2004','DD-MM-YYYY'),538);
INSERT INTO TOPIC (Topicnr,Profielnr,Naam,Aanmaak_Datum,Aantal_bekeken) VALUES (100,87,'mauriseae',TO_DATE('04-12-2005','DD-MM-YYYY'),141);

-- ----------------------------
-- Records of POST
-- ----------------------------
INSERT INTO POST (Postnr,Profielnr,Topicnr,Datum,Tekst,Filelink) VALUES (1,65,44,TO_DATE('04-07-2001','DD-MM-YYYY'),'Suspendisse',null);
INSERT INTO POST (Postnr,Profielnr,Topicnr,Datum,Tekst,Filelink) VALUES (2,45,86,TO_DATE('22-11-2003','DD-MM-YYYY'),'tincidunt pede ac urna.','http://i.imgur.com/DQ9wT.jpg');
INSERT INTO POST (Postnr,Profielnr,Topicnr,Datum,Tekst,Filelink) VALUES (3,92,49,TO_DATE('28-05-2004','DD-MM-YYYY'),'ipsum. Suspendisse non','http://screenshots.nl.sftcdn.net/nl/scrn/189000/189271/minecraft-12-700x393.jpg');
INSERT INTO POST (Postnr,Profielnr,Topicnr,Datum,Tekst,Filelink) VALUES (4,86,98,TO_DATE('19-06-2000','DD-MM-YYYY'),'metus. Vivamus euismod urna. Nullam',null);
INSERT INTO POST (Postnr,Profielnr,Topicnr,Datum,Tekst,Filelink) VALUES (5,41,77,TO_DATE('14-05-2002','DD-MM-YYYY'),'molestie','http://i.imgur.com/DQ9wT.jpg');
INSERT INTO POST (Postnr,Profielnr,Topicnr,Datum,Tekst,Filelink) VALUES (6,85,25,TO_DATE('17-09-2007','DD-MM-YYYY'),'sit','http://i.imgur.com/DQ9wT.jpg');
INSERT INTO POST (Postnr,Profielnr,Topicnr,Datum,Tekst,Filelink) VALUES (7,31,21,TO_DATE('27-08-2008','DD-MM-YYYY'),'vel','http://minecraftbuildinginc.com/wp-content/uploads/2014/01/Ancient-Castle-Ruins-minecraft-building-ideas-7.jpg');
INSERT INTO POST (Postnr,Profielnr,Topicnr,Datum,Tekst,Filelink) VALUES (8,10,77,TO_DATE('10-11-2010','DD-MM-YYYY'),'pede','http://minecraftbuildinginc.com/wp-content/uploads/2014/01/Ancient-Castle-Ruins-minecraft-building-ideas-7.jpg');
INSERT INTO POST (Postnr,Profielnr,Topicnr,Datum,Tekst,Filelink) VALUES (9,76,51,TO_DATE('18-11-2004','DD-MM-YYYY'),'rutrum, justo. Praesent','http://i.imgur.com/DQ9wT.jpg');
INSERT INTO POST (Postnr,Profielnr,Topicnr,Datum,Tekst,Filelink) VALUES (10,75,47,TO_DATE('06-03-2005','DD-MM-YYYY'),'elit elit','http://minecraftbuildinginc.com/wp-content/uploads/2014/01/Ancient-Castle-Ruins-minecraft-building-ideas-7.jpg');
INSERT INTO POST (Postnr,Profielnr,Topicnr,Datum,Tekst,Filelink) VALUES (11,48,67,TO_DATE('29-12-2014','DD-MM-YYYY'),'turpis.','http://i.imgur.com/DQ9wT.jpg');
INSERT INTO POST (Postnr,Profielnr,Topicnr,Datum,Tekst,Filelink) VALUES (12,21,82,TO_DATE('21-11-2001','DD-MM-YYYY'),'Nullam ut nisi','http://minecraftbuildinginc.com/wp-content/uploads/2014/01/Ancient-Castle-Ruins-minecraft-building-ideas-7.jpg');
INSERT INTO POST (Postnr,Profielnr,Topicnr,Datum,Tekst,Filelink) VALUES (13,77,6,TO_DATE('12-06-2002','DD-MM-YYYY'),'montes,','http://minecraftbuildinginc.com/wp-content/uploads/2014/01/Ancient-Castle-Ruins-minecraft-building-ideas-7.jpg');
INSERT INTO POST (Postnr,Profielnr,Topicnr,Datum,Tekst,Filelink) VALUES (14,43,38,TO_DATE('21-11-2013','DD-MM-YYYY'),'Pellentesque ut','http://screenshots.nl.sftcdn.net/nl/scrn/189000/189271/minecraft-12-700x393.jpg');
INSERT INTO POST (Postnr,Profielnr,Topicnr,Datum,Tekst,Filelink) VALUES (15,48,43,TO_DATE('15-04-2006','DD-MM-YYYY'),'magna. Suspendisse tristique neque venenatis','http://i.kinja-img.com/gawker-media/image/upload/s--2L8b3fNZ--/c_fit,fl_progressive,q_80,w_636/mvyk18fejloxyejposih.png');
INSERT INTO POST (Postnr,Profielnr,Topicnr,Datum,Tekst,Filelink) VALUES (16,97,70,TO_DATE('21-05-2004','DD-MM-YYYY'),'dapibus ligula.','http://minecraftbuildinginc.com/wp-content/uploads/2014/01/Ancient-Castle-Ruins-minecraft-building-ideas-7.jpg');
INSERT INTO POST (Postnr,Profielnr,Topicnr,Datum,Tekst,Filelink) VALUES (17,85,12,TO_DATE('20-03-2002','DD-MM-YYYY'),'felis, adipiscing fringilla,','http://screenshots.nl.sftcdn.net/nl/scrn/189000/189271/minecraft-12-700x393.jpg');
INSERT INTO POST (Postnr,Profielnr,Topicnr,Datum,Tekst,Filelink) VALUES (18,70,77,TO_DATE('23-11-2012','DD-MM-YYYY'),'vulputate dui, nec tempus','http://i.imgur.com/DQ9wT.jpg');
INSERT INTO POST (Postnr,Profielnr,Topicnr,Datum,Tekst,Filelink) VALUES (19,6,78,TO_DATE('01-04-2003','DD-MM-YYYY'),'augue.','http://minecraftbuildinginc.com/wp-content/uploads/2014/01/Ancient-Castle-Ruins-minecraft-building-ideas-7.jpg');
INSERT INTO POST (Postnr,Profielnr,Topicnr,Datum,Tekst,Filelink) VALUES (20,69,66,TO_DATE('28-08-2002','DD-MM-YYYY'),'vestibulum, neque sed dictum eleifend,','http://i.imgur.com/DQ9wT.jpg');
INSERT INTO POST (Postnr,Profielnr,Topicnr,Datum,Tekst,Filelink) VALUES (21,45,99,TO_DATE('17-02-2016','DD-MM-YYYY'),'ipsum cursus vestibulum. Mauris magna.','http://screenshots.nl.sftcdn.net/nl/scrn/189000/189271/minecraft-12-700x393.jpg');
INSERT INTO POST (Postnr,Profielnr,Topicnr,Datum,Tekst,Filelink) VALUES (22,3,93,TO_DATE('13-01-2014','DD-MM-YYYY'),'Donec tincidunt. Donec','http://screenshots.nl.sftcdn.net/nl/scrn/189000/189271/minecraft-12-700x393.jpg');
INSERT INTO POST (Postnr,Profielnr,Topicnr,Datum,Tekst,Filelink) VALUES (23,6,46,TO_DATE('19-11-2003','DD-MM-YYYY'),'dis','http://i.imgur.com/DQ9wT.jpg');
INSERT INTO POST (Postnr,Profielnr,Topicnr,Datum,Tekst,Filelink) VALUES (24,50,19,TO_DATE('26-12-2002','DD-MM-YYYY'),'aliquet diam. Sed diam','http://screenshots.nl.sftcdn.net/nl/scrn/189000/189271/minecraft-12-700x393.jpg');
INSERT INTO POST (Postnr,Profielnr,Topicnr,Datum,Tekst,Filelink) VALUES (25,38,4,TO_DATE('01-04-2015','DD-MM-YYYY'),'Proin','http://screenshots.nl.sftcdn.net/nl/scrn/189000/189271/minecraft-12-700x393.jpg');
INSERT INTO POST (Postnr,Profielnr,Topicnr,Datum,Tekst,Filelink) VALUES (26,3,26,TO_DATE('05-10-2008','DD-MM-YYYY'),'dui','http://screenshots.nl.sftcdn.net/nl/scrn/189000/189271/minecraft-12-700x393.jpg');
INSERT INTO POST (Postnr,Profielnr,Topicnr,Datum,Tekst,Filelink) VALUES (27,16,87,TO_DATE('01-08-2000','DD-MM-YYYY'),'egestas.','http://screenshots.nl.sftcdn.net/nl/scrn/189000/189271/minecraft-12-700x393.jpg');
INSERT INTO POST (Postnr,Profielnr,Topicnr,Datum,Tekst,Filelink) VALUES (28,44,52,TO_DATE('14-03-2011','DD-MM-YYYY'),'laoreet, libero et','http://i.kinja-img.com/gawker-media/image/upload/s--2L8b3fNZ--/c_fit,fl_progressive,q_80,w_636/mvyk18fejloxyejposih.png');
INSERT INTO POST (Postnr,Profielnr,Topicnr,Datum,Tekst,Filelink) VALUES (29,55,21,TO_DATE('05-08-2000','DD-MM-YYYY'),'diam nunc, ullamcorper eu, euismod','http://screenshots.nl.sftcdn.net/nl/scrn/189000/189271/minecraft-12-700x393.jpg');
INSERT INTO POST (Postnr,Profielnr,Topicnr,Datum,Tekst,Filelink) VALUES (30,78,23,TO_DATE('16-02-2003','DD-MM-YYYY'),'magna sed dui. Fusce aliquam,','http://i.kinja-img.com/gawker-media/image/upload/s--2L8b3fNZ--/c_fit,fl_progressive,q_80,w_636/mvyk18fejloxyejposih.png');
INSERT INTO POST (Postnr,Profielnr,Topicnr,Datum,Tekst,Filelink) VALUES (31,91,41,TO_DATE('03-09-2015','DD-MM-YYYY'),'felis ullamcorper viverra. Maecenas','http://minecraftbuildinginc.com/wp-content/uploads/2014/01/Ancient-Castle-Ruins-minecraft-building-ideas-7.jpg');
INSERT INTO POST (Postnr,Profielnr,Topicnr,Datum,Tekst,Filelink) VALUES (32,48,68,TO_DATE('27-02-2012','DD-MM-YYYY'),'enim','http://screenshots.nl.sftcdn.net/nl/scrn/189000/189271/minecraft-12-700x393.jpg');
INSERT INTO POST (Postnr,Profielnr,Topicnr,Datum,Tekst,Filelink) VALUES (33,38,5,TO_DATE('06-09-2008','DD-MM-YYYY'),'Morbi metus. Vivamus euismod urna.','http://i.kinja-img.com/gawker-media/image/upload/s--2L8b3fNZ--/c_fit,fl_progressive,q_80,w_636/mvyk18fejloxyejposih.png');
INSERT INTO POST (Postnr,Profielnr,Topicnr,Datum,Tekst,Filelink) VALUES (34,24,1,TO_DATE('11-12-2007','DD-MM-YYYY'),'risus.','http://screenshots.nl.sftcdn.net/nl/scrn/189000/189271/minecraft-12-700x393.jpg');
INSERT INTO POST (Postnr,Profielnr,Topicnr,Datum,Tekst,Filelink) VALUES (35,82,62,TO_DATE('02-10-2015','DD-MM-YYYY'),'Quisque tincidunt pede ac urna.','http://i.imgur.com/DQ9wT.jpg');
INSERT INTO POST (Postnr,Profielnr,Topicnr,Datum,Tekst,Filelink) VALUES (36,38,55,TO_DATE('28-09-2015','DD-MM-YYYY'),'et arcu imperdiet','http://minecraftbuildinginc.com/wp-content/uploads/2014/01/Ancient-Castle-Ruins-minecraft-building-ideas-7.jpg');
INSERT INTO POST (Postnr,Profielnr,Topicnr,Datum,Tekst,Filelink) VALUES (37,52,68,TO_DATE('04-06-2009','DD-MM-YYYY'),'vulputate,','http://i.kinja-img.com/gawker-media/image/upload/s--2L8b3fNZ--/c_fit,fl_progressive,q_80,w_636/mvyk18fejloxyejposih.png');
INSERT INTO POST (Postnr,Profielnr,Topicnr,Datum,Tekst,Filelink) VALUES (38,79,13,TO_DATE('05-10-2010','DD-MM-YYYY'),'auctor vitae, aliquet nec, imperdiet','http://i.kinja-img.com/gawker-media/image/upload/s--2L8b3fNZ--/c_fit,fl_progressive,q_80,w_636/mvyk18fejloxyejposih.png');
INSERT INTO POST (Postnr,Profielnr,Topicnr,Datum,Tekst,Filelink) VALUES (39,62,83,TO_DATE('03-02-2011','DD-MM-YYYY'),'nulla. Integer urna. Vivamus molestie','http://i.kinja-img.com/gawker-media/image/upload/s--2L8b3fNZ--/c_fit,fl_progressive,q_80,w_636/mvyk18fejloxyejposih.png');
INSERT INTO POST (Postnr,Profielnr,Topicnr,Datum,Tekst,Filelink) VALUES (40,98,19,TO_DATE('07-09-2010','DD-MM-YYYY'),'diam. Duis mi enim, condimentum','http://i.imgur.com/DQ9wT.jpg');
INSERT INTO POST (Postnr,Profielnr,Topicnr,Datum,Tekst,Filelink) VALUES (41,44,96,TO_DATE('25-11-2001','DD-MM-YYYY'),'dignissim magna','http://i.kinja-img.com/gawker-media/image/upload/s--2L8b3fNZ--/c_fit,fl_progressive,q_80,w_636/mvyk18fejloxyejposih.png');
INSERT INTO POST (Postnr,Profielnr,Topicnr,Datum,Tekst,Filelink) VALUES (42,12,26,TO_DATE('08-06-2008','DD-MM-YYYY'),'ultricies sem magna nec quam.','http://screenshots.nl.sftcdn.net/nl/scrn/189000/189271/minecraft-12-700x393.jpg');
INSERT INTO POST (Postnr,Profielnr,Topicnr,Datum,Tekst,Filelink) VALUES (43,58,45,TO_DATE('13-04-2016','DD-MM-YYYY'),'Donec tempus, lorem fringilla ornare','http://i.kinja-img.com/gawker-media/image/upload/s--2L8b3fNZ--/c_fit,fl_progressive,q_80,w_636/mvyk18fejloxyejposih.png');
INSERT INTO POST (Postnr,Profielnr,Topicnr,Datum,Tekst,Filelink) VALUES (44,20,95,TO_DATE('21-07-2008','DD-MM-YYYY'),'eget odio. Aliquam vulputate','http://i.kinja-img.com/gawker-media/image/upload/s--2L8b3fNZ--/c_fit,fl_progressive,q_80,w_636/mvyk18fejloxyejposih.png');
INSERT INTO POST (Postnr,Profielnr,Topicnr,Datum,Tekst,Filelink) VALUES (45,2,45,TO_DATE('17-08-2008','DD-MM-YYYY'),'odio. Aliquam','http://screenshots.nl.sftcdn.net/nl/scrn/189000/189271/minecraft-12-700x393.jpg');
INSERT INTO POST (Postnr,Profielnr,Topicnr,Datum,Tekst,Filelink) VALUES (46,37,29,TO_DATE('01-03-2006','DD-MM-YYYY'),'iaculis, lacus pede','http://screenshots.nl.sftcdn.net/nl/scrn/189000/189271/minecraft-12-700x393.jpg');
INSERT INTO POST (Postnr,Profielnr,Topicnr,Datum,Tekst,Filelink) VALUES (47,30,73,TO_DATE('20-10-2012','DD-MM-YYYY'),'arcu. Aliquam ultrices iaculis odio.','http://minecraftbuildinginc.com/wp-content/uploads/2014/01/Ancient-Castle-Ruins-minecraft-building-ideas-7.jpg');
INSERT INTO POST (Postnr,Profielnr,Topicnr,Datum,Tekst,Filelink) VALUES (48,46,37,TO_DATE('03-03-2010','DD-MM-YYYY'),'et, euismod et, commodo at,','http://screenshots.nl.sftcdn.net/nl/scrn/189000/189271/minecraft-12-700x393.jpg');
INSERT INTO POST (Postnr,Profielnr,Topicnr,Datum,Tekst,Filelink) VALUES (49,6,73,TO_DATE('08-03-2015','DD-MM-YYYY'),'aliquet odio.','http://i.kinja-img.com/gawker-media/image/upload/s--2L8b3fNZ--/c_fit,fl_progressive,q_80,w_636/mvyk18fejloxyejposih.png');
INSERT INTO POST (Postnr,Profielnr,Topicnr,Datum,Tekst,Filelink) VALUES (50,49,42,TO_DATE('23-05-2006','DD-MM-YYYY'),'sit amet, consectetuer adipiscing','http://i.imgur.com/DQ9wT.jpg');
INSERT INTO POST (Postnr,Profielnr,Topicnr,Datum,Tekst,Filelink) VALUES (51,62,18,TO_DATE('05-04-2009','DD-MM-YYYY'),'ullamcorper, nisl arcu iaculis','http://i.kinja-img.com/gawker-media/image/upload/s--2L8b3fNZ--/c_fit,fl_progressive,q_80,w_636/mvyk18fejloxyejposih.png');
INSERT INTO POST (Postnr,Profielnr,Topicnr,Datum,Tekst,Filelink) VALUES (52,3,4,TO_DATE('22-06-2005','DD-MM-YYYY'),'Vivamus','http://minecraftbuildinginc.com/wp-content/uploads/2014/01/Ancient-Castle-Ruins-minecraft-building-ideas-7.jpg');
INSERT INTO POST (Postnr,Profielnr,Topicnr,Datum,Tekst,Filelink) VALUES (53,9,35,TO_DATE('15-04-2014','DD-MM-YYYY'),'sapien imperdiet ornare. In faucibus.','http://i.imgur.com/DQ9wT.jpg');
INSERT INTO POST (Postnr,Profielnr,Topicnr,Datum,Tekst,Filelink) VALUES (54,60,13,TO_DATE('28-03-2012','DD-MM-YYYY'),'porta elit,','http://i.kinja-img.com/gawker-media/image/upload/s--2L8b3fNZ--/c_fit,fl_progressive,q_80,w_636/mvyk18fejloxyejposih.png');
INSERT INTO POST (Postnr,Profielnr,Topicnr,Datum,Tekst,Filelink) VALUES (55,43,27,TO_DATE('18-04-2003','DD-MM-YYYY'),'Duis risus odio, auctor','http://i.imgur.com/DQ9wT.jpg');
INSERT INTO POST (Postnr,Profielnr,Topicnr,Datum,Tekst,Filelink) VALUES (56,96,73,TO_DATE('08-11-2002','DD-MM-YYYY'),'ante. Maecenas mi felis,','http://minecraftbuildinginc.com/wp-content/uploads/2014/01/Ancient-Castle-Ruins-minecraft-building-ideas-7.jpg');
INSERT INTO POST (Postnr,Profielnr,Topicnr,Datum,Tekst,Filelink) VALUES (57,71,77,TO_DATE('17-02-2006','DD-MM-YYYY'),'Quisque fringilla euismod','http://i.imgur.com/DQ9wT.jpg');
INSERT INTO POST (Postnr,Profielnr,Topicnr,Datum,Tekst,Filelink) VALUES (58,62,72,TO_DATE('15-12-2007','DD-MM-YYYY'),'lorem fringilla ornare placerat,','http://minecraftbuildinginc.com/wp-content/uploads/2014/01/Ancient-Castle-Ruins-minecraft-building-ideas-7.jpg');
INSERT INTO POST (Postnr,Profielnr,Topicnr,Datum,Tekst,Filelink) VALUES (59,19,59,TO_DATE('18-01-2000','DD-MM-YYYY'),'lorem. Donec elementum, lorem','http://i.imgur.com/DQ9wT.jpg');
INSERT INTO POST (Postnr,Profielnr,Topicnr,Datum,Tekst,Filelink) VALUES (60,49,10,TO_DATE('25-11-2015','DD-MM-YYYY'),'vitae, sodales at,','http://i.imgur.com/DQ9wT.jpg');
INSERT INTO POST (Postnr,Profielnr,Topicnr,Datum,Tekst,Filelink) VALUES (61,68,90,TO_DATE('08-06-2008','DD-MM-YYYY'),'nibh. Quisque nonummy','http://i.imgur.com/DQ9wT.jpg');
INSERT INTO POST (Postnr,Profielnr,Topicnr,Datum,Tekst,Filelink) VALUES (62,12,11,TO_DATE('27-09-2003','DD-MM-YYYY'),'enim nec tempus','http://screenshots.nl.sftcdn.net/nl/scrn/189000/189271/minecraft-12-700x393.jpg');
INSERT INTO POST (Postnr,Profielnr,Topicnr,Datum,Tekst,Filelink) VALUES (63,86,52,TO_DATE('01-11-2002','DD-MM-YYYY'),'habitant morbi tristique senectus','http://minecraftbuildinginc.com/wp-content/uploads/2014/01/Ancient-Castle-Ruins-minecraft-building-ideas-7.jpg');
INSERT INTO POST (Postnr,Profielnr,Topicnr,Datum,Tekst,Filelink) VALUES (64,58,63,TO_DATE('06-09-2014','DD-MM-YYYY'),'inceptos','http://i.kinja-img.com/gawker-media/image/upload/s--2L8b3fNZ--/c_fit,fl_progressive,q_80,w_636/mvyk18fejloxyejposih.png');
INSERT INTO POST (Postnr,Profielnr,Topicnr,Datum,Tekst,Filelink) VALUES (65,55,40,TO_DATE('12-05-2014','DD-MM-YYYY'),'Aliquam','http://i.kinja-img.com/gawker-media/image/upload/s--2L8b3fNZ--/c_fit,fl_progressive,q_80,w_636/mvyk18fejloxyejposih.png');
INSERT INTO POST (Postnr,Profielnr,Topicnr,Datum,Tekst,Filelink) VALUES (66,22,33,TO_DATE('04-03-2003','DD-MM-YYYY'),'vel','http://i.kinja-img.com/gawker-media/image/upload/s--2L8b3fNZ--/c_fit,fl_progressive,q_80,w_636/mvyk18fejloxyejposih.png');
INSERT INTO POST (Postnr,Profielnr,Topicnr,Datum,Tekst,Filelink) VALUES (67,26,93,TO_DATE('04-03-2016','DD-MM-YYYY'),'Fusce feugiat. Lorem ipsum dolor','http://screenshots.nl.sftcdn.net/nl/scrn/189000/189271/minecraft-12-700x393.jpg');
INSERT INTO POST (Postnr,Profielnr,Topicnr,Datum,Tekst,Filelink) VALUES (68,33,14,TO_DATE('16-06-2002','DD-MM-YYYY'),'orci lobortis augue scelerisque','http://i.imgur.com/DQ9wT.jpg');
INSERT INTO POST (Postnr,Profielnr,Topicnr,Datum,Tekst,Filelink) VALUES (69,58,3,TO_DATE('19-08-2002','DD-MM-YYYY'),'Duis sit amet diam','http://minecraftbuildinginc.com/wp-content/uploads/2014/01/Ancient-Castle-Ruins-minecraft-building-ideas-7.jpg');
INSERT INTO POST (Postnr,Profielnr,Topicnr,Datum,Tekst,Filelink) VALUES (70,76,78,TO_DATE('17-09-2009','DD-MM-YYYY'),'tempor','http://i.imgur.com/DQ9wT.jpg');
INSERT INTO POST (Postnr,Profielnr,Topicnr,Datum,Tekst,Filelink) VALUES (71,1,94,TO_DATE('24-11-2014','DD-MM-YYYY'),'Curabitur ut odio vel','http://i.kinja-img.com/gawker-media/image/upload/s--2L8b3fNZ--/c_fit,fl_progressive,q_80,w_636/mvyk18fejloxyejposih.png');
INSERT INTO POST (Postnr,Profielnr,Topicnr,Datum,Tekst,Filelink) VALUES (72,75,16,TO_DATE('05-01-2009','DD-MM-YYYY'),'litora','http://screenshots.nl.sftcdn.net/nl/scrn/189000/189271/minecraft-12-700x393.jpg');
INSERT INTO POST (Postnr,Profielnr,Topicnr,Datum,Tekst,Filelink) VALUES (73,94,29,TO_DATE('10-01-2012','DD-MM-YYYY'),'Donec egestas. Duis ac arcu.','http://i.kinja-img.com/gawker-media/image/upload/s--2L8b3fNZ--/c_fit,fl_progressive,q_80,w_636/mvyk18fejloxyejposih.png');
INSERT INTO POST (Postnr,Profielnr,Topicnr,Datum,Tekst,Filelink) VALUES (74,7,54,TO_DATE('25-09-2007','DD-MM-YYYY'),'est. Nunc','http://i.kinja-img.com/gawker-media/image/upload/s--2L8b3fNZ--/c_fit,fl_progressive,q_80,w_636/mvyk18fejloxyejposih.png');
INSERT INTO POST (Postnr,Profielnr,Topicnr,Datum,Tekst,Filelink) VALUES (75,85,46,TO_DATE('27-05-2006','DD-MM-YYYY'),'nascetur ridiculus mus.','http://screenshots.nl.sftcdn.net/nl/scrn/189000/189271/minecraft-12-700x393.jpg');
INSERT INTO POST (Postnr,Profielnr,Topicnr,Datum,Tekst,Filelink) VALUES (76,45,73,TO_DATE('22-06-2015','DD-MM-YYYY'),'Curabitur dictum. Phasellus in','http://screenshots.nl.sftcdn.net/nl/scrn/189000/189271/minecraft-12-700x393.jpg');
INSERT INTO POST (Postnr,Profielnr,Topicnr,Datum,Tekst,Filelink) VALUES (77,21,22,TO_DATE('02-01-2012','DD-MM-YYYY'),'pretium','http://i.kinja-img.com/gawker-media/image/upload/s--2L8b3fNZ--/c_fit,fl_progressive,q_80,w_636/mvyk18fejloxyejposih.png');
INSERT INTO POST (Postnr,Profielnr,Topicnr,Datum,Tekst,Filelink) VALUES (78,5,99,TO_DATE('02-09-2012','DD-MM-YYYY'),'Donec','http://i.imgur.com/DQ9wT.jpg');
INSERT INTO POST (Postnr,Profielnr,Topicnr,Datum,Tekst,Filelink) VALUES (79,68,72,TO_DATE('24-06-2011','DD-MM-YYYY'),'risus odio, auctor vitae,','http://i.imgur.com/DQ9wT.jpg');
INSERT INTO POST (Postnr,Profielnr,Topicnr,Datum,Tekst,Filelink) VALUES (80,84,78,TO_DATE('04-06-2003','DD-MM-YYYY'),'Mauris','http://screenshots.nl.sftcdn.net/nl/scrn/189000/189271/minecraft-12-700x393.jpg');
INSERT INTO POST (Postnr,Profielnr,Topicnr,Datum,Tekst,Filelink) VALUES (81,12,34,TO_DATE('17-07-2008','DD-MM-YYYY'),'Sed congue, elit sed','http://minecraftbuildinginc.com/wp-content/uploads/2014/01/Ancient-Castle-Ruins-minecraft-building-ideas-7.jpg');
INSERT INTO POST (Postnr,Profielnr,Topicnr,Datum,Tekst,Filelink) VALUES (82,58,74,TO_DATE('31-01-2009','DD-MM-YYYY'),'sit','http://screenshots.nl.sftcdn.net/nl/scrn/189000/189271/minecraft-12-700x393.jpg');
INSERT INTO POST (Postnr,Profielnr,Topicnr,Datum,Tekst,Filelink) VALUES (83,53,68,TO_DATE('27-02-2002','DD-MM-YYYY'),'amet ultricies sem magna','http://i.imgur.com/DQ9wT.jpg');
INSERT INTO POST (Postnr,Profielnr,Topicnr,Datum,Tekst,Filelink) VALUES (84,56,98,TO_DATE('04-04-2003','DD-MM-YYYY'),'eget tincidunt','http://minecraftbuildinginc.com/wp-content/uploads/2014/01/Ancient-Castle-Ruins-minecraft-building-ideas-7.jpg');
INSERT INTO POST (Postnr,Profielnr,Topicnr,Datum,Tekst,Filelink) VALUES (85,35,89,TO_DATE('31-05-2006','DD-MM-YYYY'),'Nulla','http://i.kinja-img.com/gawker-media/image/upload/s--2L8b3fNZ--/c_fit,fl_progressive,q_80,w_636/mvyk18fejloxyejposih.png');
INSERT INTO POST (Postnr,Profielnr,Topicnr,Datum,Tekst,Filelink) VALUES (86,25,22,TO_DATE('22-03-2012','DD-MM-YYYY'),'a feugiat tellus','http://i.imgur.com/DQ9wT.jpg');
INSERT INTO POST (Postnr,Profielnr,Topicnr,Datum,Tekst,Filelink) VALUES (87,66,35,TO_DATE('17-06-2002','DD-MM-YYYY'),'leo elementum sem,','http://minecraftbuildinginc.com/wp-content/uploads/2014/01/Ancient-Castle-Ruins-minecraft-building-ideas-7.jpg');
INSERT INTO POST (Postnr,Profielnr,Topicnr,Datum,Tekst,Filelink) VALUES (88,78,10,TO_DATE('29-10-2008','DD-MM-YYYY'),'ornare, facilisis eget, ipsum. Donec','http://screenshots.nl.sftcdn.net/nl/scrn/189000/189271/minecraft-12-700x393.jpg');
INSERT INTO POST (Postnr,Profielnr,Topicnr,Datum,Tekst,Filelink) VALUES (89,26,71,TO_DATE('06-05-2005','DD-MM-YYYY'),'libero. Proin sed turpis','http://screenshots.nl.sftcdn.net/nl/scrn/189000/189271/minecraft-12-700x393.jpg');
INSERT INTO POST (Postnr,Profielnr,Topicnr,Datum,Tekst,Filelink) VALUES (90,83,94,TO_DATE('20-03-2011','DD-MM-YYYY'),'cursus, diam at pretium aliquet,','http://i.imgur.com/DQ9wT.jpg');
INSERT INTO POST (Postnr,Profielnr,Topicnr,Datum,Tekst,Filelink) VALUES (91,36,97,TO_DATE('02-07-2015','DD-MM-YYYY'),'ac sem ut dolor dapibus','http://i.kinja-img.com/gawker-media/image/upload/s--2L8b3fNZ--/c_fit,fl_progressive,q_80,w_636/mvyk18fejloxyejposih.png');
INSERT INTO POST (Postnr,Profielnr,Topicnr,Datum,Tekst,Filelink) VALUES (92,79,86,TO_DATE('10-06-2000','DD-MM-YYYY'),'erat','http://screenshots.nl.sftcdn.net/nl/scrn/189000/189271/minecraft-12-700x393.jpg');
INSERT INTO POST (Postnr,Profielnr,Topicnr,Datum,Tekst,Filelink) VALUES (93,59,66,TO_DATE('14-05-2009','DD-MM-YYYY'),'ut cursus','http://i.kinja-img.com/gawker-media/image/upload/s--2L8b3fNZ--/c_fit,fl_progressive,q_80,w_636/mvyk18fejloxyejposih.png');
INSERT INTO POST (Postnr,Profielnr,Topicnr,Datum,Tekst,Filelink) VALUES (94,56,91,TO_DATE('26-07-2009','DD-MM-YYYY'),'Phasellus dapibus quam','http://screenshots.nl.sftcdn.net/nl/scrn/189000/189271/minecraft-12-700x393.jpg');
INSERT INTO POST (Postnr,Profielnr,Topicnr,Datum,Tekst,Filelink) VALUES (95,78,98,TO_DATE('11-11-2002','DD-MM-YYYY'),'Pellentesque','http://i.kinja-img.com/gawker-media/image/upload/s--2L8b3fNZ--/c_fit,fl_progressive,q_80,w_636/mvyk18fejloxyejposih.png');
INSERT INTO POST (Postnr,Profielnr,Topicnr,Datum,Tekst,Filelink) VALUES (96,19,90,TO_DATE('17-02-2004','DD-MM-YYYY'),'urna convallis','http://minecraftbuildinginc.com/wp-content/uploads/2014/01/Ancient-Castle-Ruins-minecraft-building-ideas-7.jpg');
INSERT INTO POST (Postnr,Profielnr,Topicnr,Datum,Tekst,Filelink) VALUES (97,95,78,TO_DATE('05-01-2016','DD-MM-YYYY'),'tellus lorem eu metus.adfsrgxthc','http://minecraftbuildinginc.com/wp-content/uploads/2014/01/Ancient-Castle-Ruins-minecraft-building-ideas-7.jpg');
INSERT INTO POST (Postnr,Profielnr,Topicnr,Datum,Tekst,Filelink) VALUES (98,31,39,TO_DATE('17-01-2005','DD-MM-YYYY'),'lacus. Mauris non','http://i.kinja-img.com/gawker-media/image/upload/s--2L8b3fNZ--/c_fit,fl_progressive,q_80,w_636/mvyk18fejloxyejposih.png');
INSERT INTO POST (Postnr,Profielnr,Topicnr,Datum,Tekst,Filelink) VALUES (99,65,18,TO_DATE('19-12-2013','DD-MM-YYYY'),'Nunc mauris elit,','http://i.imgur.com/DQ9wT.jpg');
INSERT INTO POST (Postnr,Profielnr,Topicnr,Datum,Tekst,Filelink) VALUES (100,94,9,TO_DATE('07-05-2003','DD-MM-YYYY'),'Vestibulum','http://i.imgur.com/DQ9wT.jpg');

-- ----------------------------
-- Records of COMMENTAAR
-- ----------------------------
INSERT INTO COMMENTAAR (Commentnr,CommentGevernr,CommentNemernr,Datum,Tekst) VALUES (1,58,1,TO_DATE('14-10-2009','DD-MM-YYYY'),'Nam nulla');
INSERT INTO COMMENTAAR (Commentnr,CommentGevernr,CommentNemernr,Datum,Tekst) VALUES (2,59,62,TO_DATE('19-12-2001','DD-MM-YYYY'),'laoreet posuere, enim nisl elementum');
INSERT INTO COMMENTAAR (Commentnr,CommentGevernr,CommentNemernr,Datum,Tekst) VALUES (3,29,59,TO_DATE('11-07-2003','DD-MM-YYYY'),'amet');
INSERT INTO COMMENTAAR (Commentnr,CommentGevernr,CommentNemernr,Datum,Tekst) VALUES (4,71,59,TO_DATE('20-01-2015','DD-MM-YYYY'),'massa.');
INSERT INTO COMMENTAAR (Commentnr,CommentGevernr,CommentNemernr,Datum,Tekst) VALUES (5,5,26,TO_DATE('17-12-2004','DD-MM-YYYY'),'lectus. Cum sociis natoque penatibus');
INSERT INTO COMMENTAAR (Commentnr,CommentGevernr,CommentNemernr,Datum,Tekst) VALUES (6,83,47,TO_DATE('07-04-2009','DD-MM-YYYY'),'augue malesuada');
INSERT INTO COMMENTAAR (Commentnr,CommentGevernr,CommentNemernr,Datum,Tekst) VALUES (7,6,76,TO_DATE('26-07-2007','DD-MM-YYYY'),'faucibus');
INSERT INTO COMMENTAAR (Commentnr,CommentGevernr,CommentNemernr,Datum,Tekst) VALUES (8,62,14,TO_DATE('28-11-2010','DD-MM-YYYY'),'adipiscing');
INSERT INTO COMMENTAAR (Commentnr,CommentGevernr,CommentNemernr,Datum,Tekst) VALUES (9,15,98,TO_DATE('22-04-2006','DD-MM-YYYY'),'felis. Nulla tempor augue');
INSERT INTO COMMENTAAR (Commentnr,CommentGevernr,CommentNemernr,Datum,Tekst) VALUES (10,95,52,TO_DATE('06-09-2015','DD-MM-YYYY'),'vitae');
INSERT INTO COMMENTAAR (Commentnr,CommentGevernr,CommentNemernr,Datum,Tekst) VALUES (11,69,15,TO_DATE('04-10-2000','DD-MM-YYYY'),'eget, volutpat');
INSERT INTO COMMENTAAR (Commentnr,CommentGevernr,CommentNemernr,Datum,Tekst) VALUES (12,82,28,TO_DATE('15-06-2010','DD-MM-YYYY'),'mi, ac mattis velit justo');
INSERT INTO COMMENTAAR (Commentnr,CommentGevernr,CommentNemernr,Datum,Tekst) VALUES (13,40,30,TO_DATE('09-12-2011','DD-MM-YYYY'),'porttitor');
INSERT INTO COMMENTAAR (Commentnr,CommentGevernr,CommentNemernr,Datum,Tekst) VALUES (14,91,51,TO_DATE('29-03-2013','DD-MM-YYYY'),'mi, ac mattis velit justo');
INSERT INTO COMMENTAAR (Commentnr,CommentGevernr,CommentNemernr,Datum,Tekst) VALUES (15,23,23,TO_DATE('14-03-2001','DD-MM-YYYY'),'vel, mauris. Integer');
INSERT INTO COMMENTAAR (Commentnr,CommentGevernr,CommentNemernr,Datum,Tekst) VALUES (16,22,50,TO_DATE('23-03-2013','DD-MM-YYYY'),'facilisis facilisis, magna tellus');
INSERT INTO COMMENTAAR (Commentnr,CommentGevernr,CommentNemernr,Datum,Tekst) VALUES (17,45,35,TO_DATE('04-05-2011','DD-MM-YYYY'),'faucibus leo, in lobortis');
INSERT INTO COMMENTAAR (Commentnr,CommentGevernr,CommentNemernr,Datum,Tekst) VALUES (18,60,43,TO_DATE('24-02-2001','DD-MM-YYYY'),'erat. Sed nunc');
INSERT INTO COMMENTAAR (Commentnr,CommentGevernr,CommentNemernr,Datum,Tekst) VALUES (19,42,21,TO_DATE('02-07-2004','DD-MM-YYYY'),'consectetuer euismod est');
INSERT INTO COMMENTAAR (Commentnr,CommentGevernr,CommentNemernr,Datum,Tekst) VALUES (20,94,69,TO_DATE('20-03-2001','DD-MM-YYYY'),'euismod in, dolor. Fusce feugiat.');
INSERT INTO COMMENTAAR (Commentnr,CommentGevernr,CommentNemernr,Datum,Tekst) VALUES (21,82,12,TO_DATE('07-01-2013','DD-MM-YYYY'),'Phasellus nulla. Integer vulputate, risus');
INSERT INTO COMMENTAAR (Commentnr,CommentGevernr,CommentNemernr,Datum,Tekst) VALUES (22,39,61,TO_DATE('28-04-2015','DD-MM-YYYY'),'ligula elit,');
INSERT INTO COMMENTAAR (Commentnr,CommentGevernr,CommentNemernr,Datum,Tekst) VALUES (23,28,68,TO_DATE('08-02-2013','DD-MM-YYYY'),'odio vel');
INSERT INTO COMMENTAAR (Commentnr,CommentGevernr,CommentNemernr,Datum,Tekst) VALUES (24,38,24,TO_DATE('09-04-2002','DD-MM-YYYY'),'arcu ac orci. Ut semper');
INSERT INTO COMMENTAAR (Commentnr,CommentGevernr,CommentNemernr,Datum,Tekst) VALUES (25,95,62,TO_DATE('04-12-2005','DD-MM-YYYY'),'magna,');
INSERT INTO COMMENTAAR (Commentnr,CommentGevernr,CommentNemernr,Datum,Tekst) VALUES (26,40,77,TO_DATE('03-06-2014','DD-MM-YYYY'),'et magnis dis');
INSERT INTO COMMENTAAR (Commentnr,CommentGevernr,CommentNemernr,Datum,Tekst) VALUES (27,79,78,TO_DATE('05-12-2015','DD-MM-YYYY'),'magna. Phasellus');
INSERT INTO COMMENTAAR (Commentnr,CommentGevernr,CommentNemernr,Datum,Tekst) VALUES (28,87,73,TO_DATE('08-10-2004','DD-MM-YYYY'),'sem. Pellentesque ut ipsum ac');
INSERT INTO COMMENTAAR (Commentnr,CommentGevernr,CommentNemernr,Datum,Tekst) VALUES (29,2,78,TO_DATE('15-04-2005','DD-MM-YYYY'),'mauris sagittis placerat. Cras');
INSERT INTO COMMENTAAR (Commentnr,CommentGevernr,CommentNemernr,Datum,Tekst) VALUES (30,90,31,TO_DATE('02-12-2006','DD-MM-YYYY'),'augue, eu tempor erat');
INSERT INTO COMMENTAAR (Commentnr,CommentGevernr,CommentNemernr,Datum,Tekst) VALUES (31,22,19,TO_DATE('19-01-2006','DD-MM-YYYY'),'sem eget');
INSERT INTO COMMENTAAR (Commentnr,CommentGevernr,CommentNemernr,Datum,Tekst) VALUES (32,93,52,TO_DATE('29-10-2005','DD-MM-YYYY'),'mollis');
INSERT INTO COMMENTAAR (Commentnr,CommentGevernr,CommentNemernr,Datum,Tekst) VALUES (33,77,28,TO_DATE('06-11-2006','DD-MM-YYYY'),'amet ultricies');
INSERT INTO COMMENTAAR (Commentnr,CommentGevernr,CommentNemernr,Datum,Tekst) VALUES (34,40,15,TO_DATE('26-12-2008','DD-MM-YYYY'),'Curabitur egestas nunc sed libero.');
INSERT INTO COMMENTAAR (Commentnr,CommentGevernr,CommentNemernr,Datum,Tekst) VALUES (35,89,77,TO_DATE('01-06-2007','DD-MM-YYYY'),'nibh. Aliquam ornare, libero');
INSERT INTO COMMENTAAR (Commentnr,CommentGevernr,CommentNemernr,Datum,Tekst) VALUES (36,37,33,TO_DATE('01-07-2015','DD-MM-YYYY'),'turpis. In condimentum. Donec at');
INSERT INTO COMMENTAAR (Commentnr,CommentGevernr,CommentNemernr,Datum,Tekst) VALUES (37,89,19,TO_DATE('16-09-2003','DD-MM-YYYY'),'luctus vulputate,');
INSERT INTO COMMENTAAR (Commentnr,CommentGevernr,CommentNemernr,Datum,Tekst) VALUES (38,77,6,TO_DATE('02-06-2007','DD-MM-YYYY'),'ante. Nunc mauris sapien,');
INSERT INTO COMMENTAAR (Commentnr,CommentGevernr,CommentNemernr,Datum,Tekst) VALUES (39,31,53,TO_DATE('09-07-2012','DD-MM-YYYY'),'laoreet,');
INSERT INTO COMMENTAAR (Commentnr,CommentGevernr,CommentNemernr,Datum,Tekst) VALUES (40,77,36,TO_DATE('18-07-2011','DD-MM-YYYY'),'ac tellus. Suspendisse sed');
INSERT INTO COMMENTAAR (Commentnr,CommentGevernr,CommentNemernr,Datum,Tekst) VALUES (41,32,57,TO_DATE('18-06-2002','DD-MM-YYYY'),'dolor egestas rhoncus. Proin');
INSERT INTO COMMENTAAR (Commentnr,CommentGevernr,CommentNemernr,Datum,Tekst) VALUES (42,98,40,TO_DATE('31-03-2008','DD-MM-YYYY'),'quam');
INSERT INTO COMMENTAAR (Commentnr,CommentGevernr,CommentNemernr,Datum,Tekst) VALUES (43,69,93,TO_DATE('20-06-2011','DD-MM-YYYY'),'adipiscing');
INSERT INTO COMMENTAAR (Commentnr,CommentGevernr,CommentNemernr,Datum,Tekst) VALUES (44,78,93,TO_DATE('12-01-2008','DD-MM-YYYY'),'enim mi');
INSERT INTO COMMENTAAR (Commentnr,CommentGevernr,CommentNemernr,Datum,Tekst) VALUES (45,44,53,TO_DATE('07-03-2014','DD-MM-YYYY'),'Sed');
INSERT INTO COMMENTAAR (Commentnr,CommentGevernr,CommentNemernr,Datum,Tekst) VALUES (46,30,33,TO_DATE('22-06-2009','DD-MM-YYYY'),'nunc ac');
INSERT INTO COMMENTAAR (Commentnr,CommentGevernr,CommentNemernr,Datum,Tekst) VALUES (47,14,73,TO_DATE('30-11-2015','DD-MM-YYYY'),'morbi');
INSERT INTO COMMENTAAR (Commentnr,CommentGevernr,CommentNemernr,Datum,Tekst) VALUES (48,4,60,TO_DATE('12-10-2002','DD-MM-YYYY'),'ridiculus mus. Donec');
INSERT INTO COMMENTAAR (Commentnr,CommentGevernr,CommentNemernr,Datum,Tekst) VALUES (49,22,82,TO_DATE('21-06-2005','DD-MM-YYYY'),'enim. Etiam imperdiet dictum');
INSERT INTO COMMENTAAR (Commentnr,CommentGevernr,CommentNemernr,Datum,Tekst) VALUES (50,15,63,TO_DATE('15-05-2002','DD-MM-YYYY'),'quis, pede.');
INSERT INTO COMMENTAAR (Commentnr,CommentGevernr,CommentNemernr,Datum,Tekst) VALUES (51,22,11,TO_DATE('10-09-2007','DD-MM-YYYY'),'imperdiet dictum magna. Ut tincidunt');
INSERT INTO COMMENTAAR (Commentnr,CommentGevernr,CommentNemernr,Datum,Tekst) VALUES (52,82,56,TO_DATE('26-12-2001','DD-MM-YYYY'),'non magna. Nam');
INSERT INTO COMMENTAAR (Commentnr,CommentGevernr,CommentNemernr,Datum,Tekst) VALUES (53,36,23,TO_DATE('21-08-2005','DD-MM-YYYY'),'diam at pretium aliquet, metus');
INSERT INTO COMMENTAAR (Commentnr,CommentGevernr,CommentNemernr,Datum,Tekst) VALUES (54,17,48,TO_DATE('06-01-2008','DD-MM-YYYY'),'magna, malesuada vel, convallis');
INSERT INTO COMMENTAAR (Commentnr,CommentGevernr,CommentNemernr,Datum,Tekst) VALUES (55,18,15,TO_DATE('26-08-2002','DD-MM-YYYY'),'ornare,');
INSERT INTO COMMENTAAR (Commentnr,CommentGevernr,CommentNemernr,Datum,Tekst) VALUES (56,68,56,TO_DATE('02-12-2012','DD-MM-YYYY'),'Donec');
INSERT INTO COMMENTAAR (Commentnr,CommentGevernr,CommentNemernr,Datum,Tekst) VALUES (57,67,33,TO_DATE('18-08-2013','DD-MM-YYYY'),'tristique senectus et netus et');
INSERT INTO COMMENTAAR (Commentnr,CommentGevernr,CommentNemernr,Datum,Tekst) VALUES (58,60,50,TO_DATE('05-01-2008','DD-MM-YYYY'),'porttitor eros');
INSERT INTO COMMENTAAR (Commentnr,CommentGevernr,CommentNemernr,Datum,Tekst) VALUES (59,19,13,TO_DATE('21-10-2007','DD-MM-YYYY'),'diam');
INSERT INTO COMMENTAAR (Commentnr,CommentGevernr,CommentNemernr,Datum,Tekst) VALUES (60,44,70,TO_DATE('18-09-2012','DD-MM-YYYY'),'In');
INSERT INTO COMMENTAAR (Commentnr,CommentGevernr,CommentNemernr,Datum,Tekst) VALUES (61,23,1,TO_DATE('12-11-2005','DD-MM-YYYY'),'Donec felis orci,');
INSERT INTO COMMENTAAR (Commentnr,CommentGevernr,CommentNemernr,Datum,Tekst) VALUES (62,80,48,TO_DATE('28-03-2006','DD-MM-YYYY'),'per inceptos hymenaeos.');
INSERT INTO COMMENTAAR (Commentnr,CommentGevernr,CommentNemernr,Datum,Tekst) VALUES (63,2,20,TO_DATE('11-08-2003','DD-MM-YYYY'),'nascetur');
INSERT INTO COMMENTAAR (Commentnr,CommentGevernr,CommentNemernr,Datum,Tekst) VALUES (64,41,33,TO_DATE('23-11-2007','DD-MM-YYYY'),'nunc');
INSERT INTO COMMENTAAR (Commentnr,CommentGevernr,CommentNemernr,Datum,Tekst) VALUES (65,85,10,TO_DATE('29-12-2006','DD-MM-YYYY'),'imperdiet non,');
INSERT INTO COMMENTAAR (Commentnr,CommentGevernr,CommentNemernr,Datum,Tekst) VALUES (66,57,93,TO_DATE('15-01-2001','DD-MM-YYYY'),'Nulla');
INSERT INTO COMMENTAAR (Commentnr,CommentGevernr,CommentNemernr,Datum,Tekst) VALUES (67,98,74,TO_DATE('24-06-2007','DD-MM-YYYY'),'at, velit.');
INSERT INTO COMMENTAAR (Commentnr,CommentGevernr,CommentNemernr,Datum,Tekst) VALUES (68,55,62,TO_DATE('07-09-2004','DD-MM-YYYY'),'feugiat. Lorem ipsum dolor sit');
INSERT INTO COMMENTAAR (Commentnr,CommentGevernr,CommentNemernr,Datum,Tekst) VALUES (69,51,39,TO_DATE('12-05-2010','DD-MM-YYYY'),'porttitor vulputate, posuere vulputate, lacus.');
INSERT INTO COMMENTAAR (Commentnr,CommentGevernr,CommentNemernr,Datum,Tekst) VALUES (70,70,53,TO_DATE('31-01-2001','DD-MM-YYYY'),'Nam tempor diam');
INSERT INTO COMMENTAAR (Commentnr,CommentGevernr,CommentNemernr,Datum,Tekst) VALUES (71,40,88,TO_DATE('05-08-2012','DD-MM-YYYY'),'magna tellus faucibus leo, in');
INSERT INTO COMMENTAAR (Commentnr,CommentGevernr,CommentNemernr,Datum,Tekst) VALUES (72,41,2,TO_DATE('24-07-2015','DD-MM-YYYY'),'ridiculus');
INSERT INTO COMMENTAAR (Commentnr,CommentGevernr,CommentNemernr,Datum,Tekst) VALUES (73,86,75,TO_DATE('20-02-2008','DD-MM-YYYY'),'iaculis');
INSERT INTO COMMENTAAR (Commentnr,CommentGevernr,CommentNemernr,Datum,Tekst) VALUES (74,9,64,TO_DATE('29-07-2002','DD-MM-YYYY'),'fringilla mi lacinia mattis.');
INSERT INTO COMMENTAAR (Commentnr,CommentGevernr,CommentNemernr,Datum,Tekst) VALUES (75,67,40,TO_DATE('02-12-2010','DD-MM-YYYY'),'quam a felis');
INSERT INTO COMMENTAAR (Commentnr,CommentGevernr,CommentNemernr,Datum,Tekst) VALUES (76,12,96,TO_DATE('18-06-2011','DD-MM-YYYY'),'Ut sagittis lobortis');
INSERT INTO COMMENTAAR (Commentnr,CommentGevernr,CommentNemernr,Datum,Tekst) VALUES (77,20,97,TO_DATE('14-10-2002','DD-MM-YYYY'),'mauris ut');
INSERT INTO COMMENTAAR (Commentnr,CommentGevernr,CommentNemernr,Datum,Tekst) VALUES (78,100,12,TO_DATE('19-07-2003','DD-MM-YYYY'),'eu lacus. Quisque');
INSERT INTO COMMENTAAR (Commentnr,CommentGevernr,CommentNemernr,Datum,Tekst) VALUES (79,66,8,TO_DATE('31-07-2015','DD-MM-YYYY'),'tincidunt, neque');
INSERT INTO COMMENTAAR (Commentnr,CommentGevernr,CommentNemernr,Datum,Tekst) VALUES (80,74,63,TO_DATE('13-12-2009','DD-MM-YYYY'),'eu augue porttitor interdum.');
INSERT INTO COMMENTAAR (Commentnr,CommentGevernr,CommentNemernr,Datum,Tekst) VALUES (81,83,29,TO_DATE('17-11-2013','DD-MM-YYYY'),'lacus pede sagittis augue, eu');
INSERT INTO COMMENTAAR (Commentnr,CommentGevernr,CommentNemernr,Datum,Tekst) VALUES (82,50,12,TO_DATE('19-11-2013','DD-MM-YYYY'),'risus quis diam luctus');
INSERT INTO COMMENTAAR (Commentnr,CommentGevernr,CommentNemernr,Datum,Tekst) VALUES (83,16,15,TO_DATE('26-06-2015','DD-MM-YYYY'),'aliquet vel, vulputate eu, odio.');
INSERT INTO COMMENTAAR (Commentnr,CommentGevernr,CommentNemernr,Datum,Tekst) VALUES (84,2,62,TO_DATE('10-07-2002','DD-MM-YYYY'),'et,');
INSERT INTO COMMENTAAR (Commentnr,CommentGevernr,CommentNemernr,Datum,Tekst) VALUES (85,87,96,TO_DATE('26-09-2014','DD-MM-YYYY'),'felis,');
INSERT INTO COMMENTAAR (Commentnr,CommentGevernr,CommentNemernr,Datum,Tekst) VALUES (86,44,78,TO_DATE('10-06-2003','DD-MM-YYYY'),'Curabitur');
INSERT INTO COMMENTAAR (Commentnr,CommentGevernr,CommentNemernr,Datum,Tekst) VALUES (87,93,60,TO_DATE('24-06-2014','DD-MM-YYYY'),'adipiscing, enim mi tempor lorem,');
INSERT INTO COMMENTAAR (Commentnr,CommentGevernr,CommentNemernr,Datum,Tekst) VALUES (88,49,86,TO_DATE('03-02-2012','DD-MM-YYYY'),'rutrum eu, ultrices sit');
INSERT INTO COMMENTAAR (Commentnr,CommentGevernr,CommentNemernr,Datum,Tekst) VALUES (89,32,32,TO_DATE('18-01-2003','DD-MM-YYYY'),'diam. Duis mi enim, condimentum');
INSERT INTO COMMENTAAR (Commentnr,CommentGevernr,CommentNemernr,Datum,Tekst) VALUES (90,70,28,TO_DATE('25-02-2013','DD-MM-YYYY'),'metus vitae velit egestas lacinia.');
INSERT INTO COMMENTAAR (Commentnr,CommentGevernr,CommentNemernr,Datum,Tekst) VALUES (91,89,65,TO_DATE('24-04-2000','DD-MM-YYYY'),'id magna et ipsum cursus');
INSERT INTO COMMENTAAR (Commentnr,CommentGevernr,CommentNemernr,Datum,Tekst) VALUES (92,78,61,TO_DATE('11-09-2010','DD-MM-YYYY'),'libero mauris, aliquam eu, accumsan');
INSERT INTO COMMENTAAR (Commentnr,CommentGevernr,CommentNemernr,Datum,Tekst) VALUES (93,56,65,TO_DATE('24-09-2002','DD-MM-YYYY'),'est tempor bibendum.');
INSERT INTO COMMENTAAR (Commentnr,CommentGevernr,CommentNemernr,Datum,Tekst) VALUES (94,74,84,TO_DATE('19-08-2001','DD-MM-YYYY'),'cursus. Nunc mauris elit, dictum');
INSERT INTO COMMENTAAR (Commentnr,CommentGevernr,CommentNemernr,Datum,Tekst) VALUES (95,70,26,TO_DATE('09-10-2013','DD-MM-YYYY'),'Mauris molestie pharetra nibh.');
INSERT INTO COMMENTAAR (Commentnr,CommentGevernr,CommentNemernr,Datum,Tekst) VALUES (96,17,42,TO_DATE('19-04-2007','DD-MM-YYYY'),'ut odio');
INSERT INTO COMMENTAAR (Commentnr,CommentGevernr,CommentNemernr,Datum,Tekst) VALUES (97,99,49,TO_DATE('01-11-2006','DD-MM-YYYY'),'ac, fermentum vel, mauris.');
INSERT INTO COMMENTAAR (Commentnr,CommentGevernr,CommentNemernr,Datum,Tekst) VALUES (98,30,38,TO_DATE('01-09-2004','DD-MM-YYYY'),'vel nisl. Quisque fringilla euismod');
INSERT INTO COMMENTAAR (Commentnr,CommentGevernr,CommentNemernr,Datum,Tekst) VALUES (99,40,90,TO_DATE('15-08-2001','DD-MM-YYYY'),'enim,');
INSERT INTO COMMENTAAR (Commentnr,CommentGevernr,CommentNemernr,Datum,Tekst) VALUES (100,41,87,TO_DATE('09-06-2007','DD-MM-YYYY'),'diam. Pellentesque habitant morbi');
-- ----------------------------
-- Records of BLOKKADE
-- ----------------------------
INSERT INTO BLOKKADE (Blokkadenr,Geblokkeerde,Blokkeerder,Datum,Tijdsduur) VALUES (1,79,52,TO_DATE('16-12-2002','DD-MM-YYYY'),'19:00');
INSERT INTO BLOKKADE (Blokkadenr,Geblokkeerde,Blokkeerder,Datum,Tijdsduur) VALUES (2,94,12,TO_DATE('22-02-2006','DD-MM-YYYY'),'8:00');
INSERT INTO BLOKKADE (Blokkadenr,Geblokkeerde,Blokkeerder,Datum,Tijdsduur) VALUES (3,53,79,TO_DATE('04-11-2012','DD-MM-YYYY'),'1:00');
INSERT INTO BLOKKADE (Blokkadenr,Geblokkeerde,Blokkeerder,Datum,Tijdsduur) VALUES (4,26,40,TO_DATE('05-04-2002','DD-MM-YYYY'),'6:00');
INSERT INTO BLOKKADE (Blokkadenr,Geblokkeerde,Blokkeerder,Datum,Tijdsduur) VALUES (5,48,80,TO_DATE('01-08-2007','DD-MM-YYYY'),'21:00');
INSERT INTO BLOKKADE (Blokkadenr,Geblokkeerde,Blokkeerder,Datum,Tijdsduur) VALUES (6,59,14,TO_DATE('04-02-2012','DD-MM-YYYY'),'2:00');
INSERT INTO BLOKKADE (Blokkadenr,Geblokkeerde,Blokkeerder,Datum,Tijdsduur) VALUES (7,88,37,TO_DATE('11-12-2006','DD-MM-YYYY'),'6:00');
INSERT INTO BLOKKADE (Blokkadenr,Geblokkeerde,Blokkeerder,Datum,Tijdsduur) VALUES (8,100,49,TO_DATE('04-08-2004','DD-MM-YYYY'),'6:00');
INSERT INTO BLOKKADE (Blokkadenr,Geblokkeerde,Blokkeerder,Datum,Tijdsduur) VALUES (9,4,24,TO_DATE('24-09-2007','DD-MM-YYYY'),'4:00');
INSERT INTO BLOKKADE (Blokkadenr,Geblokkeerde,Blokkeerder,Datum,Tijdsduur) VALUES (10,75,73,TO_DATE('04-08-2009','DD-MM-YYYY'),'5:00');
INSERT INTO BLOKKADE (Blokkadenr,Geblokkeerde,Blokkeerder,Datum,Tijdsduur) VALUES (11,97,35,TO_DATE('13-01-2011','DD-MM-YYYY'),'2:00');
INSERT INTO BLOKKADE (Blokkadenr,Geblokkeerde,Blokkeerder,Datum,Tijdsduur) VALUES (12,66,54,TO_DATE('22-06-2011','DD-MM-YYYY'),'19:00');
INSERT INTO BLOKKADE (Blokkadenr,Geblokkeerde,Blokkeerder,Datum,Tijdsduur) VALUES (13,58,78,TO_DATE('09-03-2004','DD-MM-YYYY'),'22:00');
INSERT INTO BLOKKADE (Blokkadenr,Geblokkeerde,Blokkeerder,Datum,Tijdsduur) VALUES (14,17,48,TO_DATE('27-03-2007','DD-MM-YYYY'),'9:00');
INSERT INTO BLOKKADE (Blokkadenr,Geblokkeerde,Blokkeerder,Datum,Tijdsduur) VALUES (15,26,1,TO_DATE('17-05-2011','DD-MM-YYYY'),'19:00');

-- ----------------------------
-- Records of ABONNEMENT
-- ----------------------------
INSERT INTO ABONNEMENT (Abonnementnr,Abonnement_soort,Profielnr) VALUES (1,'Profiel',6);
INSERT INTO ABONNEMENT (Abonnementnr,Abonnement_soort,Profielnr) VALUES (2,'Profiel',73);
INSERT INTO ABONNEMENT (Abonnementnr,Abonnement_soort,Profielnr) VALUES (3,'Profiel',52);
INSERT INTO ABONNEMENT (Abonnementnr,Abonnement_soort,Profielnr) VALUES (4,'Topic',41);
INSERT INTO ABONNEMENT (Abonnementnr,Abonnement_soort,Profielnr) VALUES (5,'Topic',89);
INSERT INTO ABONNEMENT (Abonnementnr,Abonnement_soort,Profielnr) VALUES (6,'Profiel',19);
INSERT INTO ABONNEMENT (Abonnementnr,Abonnement_soort,Profielnr) VALUES (7,'Topic',88);
INSERT INTO ABONNEMENT (Abonnementnr,Abonnement_soort,Profielnr) VALUES (8,'Topic',62);
INSERT INTO ABONNEMENT (Abonnementnr,Abonnement_soort,Profielnr) VALUES (9,'Topic',7);
INSERT INTO ABONNEMENT (Abonnementnr,Abonnement_soort,Profielnr) VALUES (10,'Profiel',91);
INSERT INTO ABONNEMENT (Abonnementnr,Abonnement_soort,Profielnr) VALUES (11,'Profiel',17);
INSERT INTO ABONNEMENT (Abonnementnr,Abonnement_soort,Profielnr) VALUES (12,'Profiel',59);
INSERT INTO ABONNEMENT (Abonnementnr,Abonnement_soort,Profielnr) VALUES (13,'Profiel',10);
INSERT INTO ABONNEMENT (Abonnementnr,Abonnement_soort,Profielnr) VALUES (14,'Topic',25);
INSERT INTO ABONNEMENT (Abonnementnr,Abonnement_soort,Profielnr) VALUES (15,'Profiel',71);
INSERT INTO ABONNEMENT (Abonnementnr,Abonnement_soort,Profielnr) VALUES (16,'Topic',7);
INSERT INTO ABONNEMENT (Abonnementnr,Abonnement_soort,Profielnr) VALUES (17,'Topic',46);
INSERT INTO ABONNEMENT (Abonnementnr,Abonnement_soort,Profielnr) VALUES (18,'Topic',57);
INSERT INTO ABONNEMENT (Abonnementnr,Abonnement_soort,Profielnr) VALUES (19,'Profiel',32);
INSERT INTO ABONNEMENT (Abonnementnr,Abonnement_soort,Profielnr) VALUES (20,'Profiel',44);

-- ----------------------------
-- Records of PROFIEL_ABONNEMENT
-- ----------------------------
INSERT INTO PROFIEL_ABONNEMENT (Abonnementnr,Geabonneerd_Profielnr) VALUES (1,23);
INSERT INTO PROFIEL_ABONNEMENT (Abonnementnr,Geabonneerd_Profielnr) VALUES (2,68);
INSERT INTO PROFIEL_ABONNEMENT (Abonnementnr,Geabonneerd_Profielnr) VALUES (3,44);
INSERT INTO PROFIEL_ABONNEMENT (Abonnementnr,Geabonneerd_Profielnr) VALUES (6,13);
INSERT INTO PROFIEL_ABONNEMENT (Abonnementnr,Geabonneerd_Profielnr) VALUES (10,84);
INSERT INTO PROFIEL_ABONNEMENT (Abonnementnr,Geabonneerd_Profielnr) VALUES (11,94);
INSERT INTO PROFIEL_ABONNEMENT (Abonnementnr,Geabonneerd_Profielnr) VALUES (12,35);
INSERT INTO PROFIEL_ABONNEMENT (Abonnementnr,Geabonneerd_Profielnr) VALUES (13,95);
INSERT INTO PROFIEL_ABONNEMENT (Abonnementnr,Geabonneerd_Profielnr) VALUES (15,39);
INSERT INTO PROFIEL_ABONNEMENT (Abonnementnr,Geabonneerd_Profielnr) VALUES (19,85);
INSERT INTO PROFIEL_ABONNEMENT (Abonnementnr,Geabonneerd_Profielnr) VALUES (20,73);

-- ----------------------------
-- Records of TOPIC_ABONNEMENT
-- ----------------------------
INSERT INTO PROFIEL_ABONNEMENT (Abonnementnr,Geabonneerd_Profielnr) VALUES (4,85);
INSERT INTO PROFIEL_ABONNEMENT (Abonnementnr,Geabonneerd_Profielnr) VALUES (5,64);
INSERT INTO PROFIEL_ABONNEMENT (Abonnementnr,Geabonneerd_Profielnr) VALUES (7,36);
INSERT INTO PROFIEL_ABONNEMENT (Abonnementnr,Geabonneerd_Profielnr) VALUES (8,62);
INSERT INTO PROFIEL_ABONNEMENT (Abonnementnr,Geabonneerd_Profielnr) VALUES (9,59);
INSERT INTO PROFIEL_ABONNEMENT (Abonnementnr,Geabonneerd_Profielnr) VALUES (14,4);
INSERT INTO PROFIEL_ABONNEMENT (Abonnementnr,Geabonneerd_Profielnr) VALUES (16,93);
INSERT INTO PROFIEL_ABONNEMENT (Abonnementnr,Geabonneerd_Profielnr) VALUES (17,29);
INSERT INTO PROFIEL_ABONNEMENT (Abonnementnr,Geabonneerd_Profielnr) VALUES (18,18);

SELECT po.datum, po.tekst, po.filelink, pr.profielnr, pr.naam, pr.email, pr.soort_gebruiker
FROM Post po, profiel pr
WHERE po.Profielnr = pr.Profielnr
ORDER BY po.datum DESC;

INSERT INTO PROFIEL (Profielnr,Naam,Email,Wachtwoord,Soort_Gebruiker)
values ((SELECT MAX(Profielnr)+1 FROM PROFIEL), 'poep', 'poep@poep.com', 'poep', 'Gebruiker');

SELECT po.postnr, po.datum, po.tekst, po.filelink, pr.profielnr, pr.naam, pr.email, pr.soort_gebruiker
FROM Post po, profiel pr
WHERE po.Profielnr = pr.Profielnr
AND po.Topicnr = (SELECT topicnr FROM topic WHERE naam = 'congue.')
ORDER BY po.datum DESC;

SELECT t.topicnr, COUNT(p.topicnr)AS aantalposts
FROM POST p, TOPIC t
WHERE t.topicnr = p.topicnr
GROUP BY t.topicnr
ORDER BY t.topicnr;

SELECT COUNT(p.topicnr)AS aantalposts
FROM POST p, TOPIC t
WHERE t.topicnr = p.topicnr
AND t.naam = 'vestibulum'
GROUP BY t.topicnr
ORDER BY t.aanmaak_datum;

UPDATE TOPIC
SET Aantal_bekeken = Aantal_bekeken+1
WHERE naam = 'congue.';

SELECT Naam
FROM profiel
WHERE naam LIKE '%Hans%';

SELECT po.postnr, po.datum, po.tekst, po.filelink, pr.profielnr, pr.naam, pr.email, pr.soort_gebruiker
FROM Post po, profiel pr
WHERE po.profielnr = pr.profielnr
AND po.profielnr = (SELECT profielnr FROM profiel WHERE naam = 'Hans Otjes')
ORDER BY po.datum DESC;