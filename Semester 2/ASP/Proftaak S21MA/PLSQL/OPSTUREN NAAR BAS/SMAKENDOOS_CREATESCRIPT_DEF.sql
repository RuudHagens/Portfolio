drop table ACCOUNT cascade constraints;
drop table ITEM cascade constraints;
drop table SHOW cascade constraints;
drop table AUTEUR cascade constraints;
drop table FILM cascade constraints;
drop table ARTIEST cascade constraints;
drop table GAME cascade constraints;
drop table ACTEUR cascade constraints;
drop table MUZIEK cascade constraints;
drop table RATING cascade constraints;

CREATE TABLE ACCOUNT
(AccountID number(10) primary key,
Email varchar2(50) not null,
Wachtwoord varchar2(50) not null,
Voornaam varchar2(50) not null,
Achternaam varchar2(50) not null
);

CREATE TABLE ITEM
(ID number(10) primary key,
Naam varchar2(255),
LikeAantal number(10),
WikipediaLink varchar2(255),
Videolink varchar2(255),
CategorieNaam varchar2(50),

CONSTRAINT CHK_ITEM_CategorieNaam CHECK (UPPER(CategorieNaam) IN ('ACTEUR','ARTIEST','AUTEUR','FILM','GAME','MUZIEK','SHOW'))
);

CREATE TABLE SHOW
(ProductID number(10) primary key,
Regisseur varchar2(50),
DatumUitgave date not null,

CONSTRAINT fk_ProductIDShow foreign key (ProductID) REFERENCES SHOW(ProductID)on delete cascade
);

CREATE TABLE AUTEUR
(ProductID number(10) primary key,
GeboorteDatum date not null,

CONSTRAINT fk_ProductIDAuteur foreign key (ProductID) REFERENCES AUTEUR(ProductID)on delete cascade
);

CREATE TABLE FILM
(ProductID number(10) primary key,
Regisseur varchar2(50),
ActeurNaam varchar2(50),
DatumUitgave date not null,

CONSTRAINT fk_ProductIDFilm foreign key (ProductID) REFERENCES FILM(ProductID)on delete cascade
);

CREATE TABLE ARTIEST
(ProductID number(10) primary key,
Geboortedatum date not null,

CONSTRAINT fk_ProductIDArtiest foreign key (ProductID) REFERENCES ARTIEST(ProductID)on delete cascade
);

CREATE TABLE GAME
(ProductID number(10) primary key,
Platform varchar2(50),
DatumUitgave date not null,

CONSTRAINT fk_ProductIDGame foreign key (ProductID) REFERENCES GAME(ProductID)on delete cascade
);

CREATE TABLE MUZIEK
(ProductID number(10) primary key,
ArtiestNaam varchar2(50),
DatumUitgave date not null,

CONSTRAINT fk_ProductIDMuziek foreign key (ProductID) REFERENCES MUZIEK(ProductID)on delete cascade
);

CREATE TABLE ACTEUR
(ProductID number(10) primary key,
Geboortedatum date not null,

CONSTRAINT fk_ProductIDActeur foreign key (ProductID) REFERENCES ACTEUR(ProductID)on delete cascade
);

CREATE TABLE RATING
( AccountID number(10) not null,
ProductID number(10) not null,
RatingValue number(2) not null,

CONSTRAINT pk_Rating PRIMARY KEY (AccountID,ProductID)
);


--------------------------------------------------------------------------------
-- Inserts
--------------------------------------------------------------------------------

--ACCOUNT
INSERT INTO ACCOUNT(AccountID, Email, Wachtwoord, Voornaam, Achternaam)
VALUES (1, 'kenneth@fontys.nl', 'kenneth', 'Kenneth', 'Reijnders');
INSERT INTO ACCOUNT(AccountID, Email, Wachtwoord, Voornaam, Achternaam)
VALUES (2, 'ruud@fontys.nl', 'ruud', 'Ruud', 'Hagens');
INSERT INTO ACCOUNT(AccountID, Email, Wachtwoord, Voornaam, Achternaam)
VALUES (3, 'mick@fontys.nl', 'mick', 'Mick', 'Vranken');
INSERT INTO ACCOUNT (AccountID, Email, Wachtwoord, Voornaam, Achternaam) 
VALUES (4,'sociis.natoque.penatibus@gravidasagittis.net','Vivamus','Zena','Ochoa');
INSERT INTO ACCOUNT (AccountID,Email,Wachtwoord,Voornaam,Achternaam) 
VALUES (5,'mollis@aenimSuspendisse.co.uk','Donec','Ray','Frazier');
INSERT INTO ACCOUNT (AccountID,Email,Wachtwoord,Voornaam,Achternaam) 
VALUES (6,'eget.lacus.Mauris@tristique.edu','nunc','Avram','Gonzales');
INSERT INTO ACCOUNT (AccountID,Email,Wachtwoord,Voornaam,Achternaam) 
VALUES (7,'non.leo@ProinultricesDuis.net','ornare.','Allistair','England');
INSERT INTO ACCOUNT (AccountID,Email,Wachtwoord,Voornaam,Achternaam) 
VALUES (8,'facilisis.eget@utquamvel.edu','varius','Vera','Farmer');
INSERT INTO ACCOUNT (AccountID,Email,Wachtwoord,Voornaam,Achternaam) 
VALUES (9,'neque.Nullam.ut@tinciduntnunc.edu','risus.','Chastity','Hunt');
INSERT INTO ACCOUNT (AccountID,Email,Wachtwoord,Voornaam,Achternaam) 
VALUES (10,'tellus.imperdiet.non@Donecegestas.org','risus','Hamish','Nguyen');
INSERT INTO ACCOUNT (AccountID,Email,Wachtwoord,Voornaam,Achternaam) 
VALUES (11,'orci.sem@Donec.net','fringilla','Brian','Brock');
INSERT INTO ACCOUNT (AccountID,Email,Wachtwoord,Voornaam,Achternaam) 
VALUES (12,'nunc.sit@Quisque.co.uk','enim','Ruby','Cook');
INSERT INTO ACCOUNT (AccountID,Email,Wachtwoord,Voornaam,Achternaam) 
VALUES (13,'quis@molestie.ca','Fusce','Sebastian','Curtis');
INSERT INTO ACCOUNT (AccountID,Email,Wachtwoord,Voornaam,Achternaam) 
VALUES (14,'mattis.ornare.lectus@odioPhasellusat.com','mauris','Mary','Morrison');
INSERT INTO ACCOUNT (AccountID,Email,Wachtwoord,Voornaam,Achternaam) 
VALUES (15,'arcu.Vestibulum.ante@facilisismagnatellus.com','semper','Justine','Foreman');
INSERT INTO ACCOUNT (AccountID,Email,Wachtwoord,Voornaam,Achternaam) 
VALUES (16,'eleifend.nunc.risus@Donecnon.edu','tempus','Jocelyn','Lang');
INSERT INTO ACCOUNT (AccountID,Email,Wachtwoord,Voornaam,Achternaam) 
VALUES (17,'mollis@lectuspede.com','Sed','Adara','Guthrie');
INSERT INTO ACCOUNT (AccountID,Email,Wachtwoord,Voornaam,Achternaam) 
VALUES (18,'malesuada.vel.convallis@Proinvelnisl.co.uk','ac','Garrison','King');
INSERT INTO ACCOUNT (AccountID,Email,Wachtwoord,Voornaam,Achternaam) 
VALUES (19,'luctus.aliquet.odio@Quisque.com','ipsum','Karen','Barlow');
INSERT INTO ACCOUNT (AccountID,Email,Wachtwoord,Voornaam,Achternaam) 
VALUES (20,'magna@egestas.co.uk','risus,','Harlan','Maxwell');
INSERT INTO ACCOUNT (AccountID,Email,Wachtwoord,Voornaam,Achternaam) 
VALUES (21,'Curabitur@consequat.ca','libero','Daria','Hammond');
INSERT INTO ACCOUNT (AccountID,Email,Wachtwoord,Voornaam,Achternaam) 
VALUES (22,'ac@dignissim.com','euismod','Stephen','Campbell');
INSERT INTO ACCOUNT (AccountID,Email,Wachtwoord,Voornaam,Achternaam) 
VALUES (23,'tempor.arcu@sempercursus.org','vehicula.','Hyacinth','Christensen');
INSERT INTO ACCOUNT (AccountID,Email,Wachtwoord,Voornaam,Achternaam) 
VALUES (24,'a@tortorInteger.net','purus','Orla','Gonzalez');
INSERT INTO ACCOUNT (AccountID,Email,Wachtwoord,Voornaam,Achternaam) 
VALUES (25,'Integer.id@Fusce.co.uk','magna.','Yoshi','Bauer');
INSERT INTO ACCOUNT (AccountID,Email,Wachtwoord,Voornaam,Achternaam) 
VALUES (26,'Donec@eu.co.uk','lacinia','Chantale','Baldwin');
INSERT INTO ACCOUNT (AccountID,Email,Wachtwoord,Voornaam,Achternaam) 
VALUES (27,'gravida.sagittis.Duis@pretiumet.edu','risus,','Kristen','Jefferson');
INSERT INTO ACCOUNT (AccountID,Email,Wachtwoord,Voornaam,Achternaam) 
VALUES (28,'netus@blandit.co.uk','lobortis.','Dorian','Mayer');
INSERT INTO ACCOUNT (AccountID,Email,Wachtwoord,Voornaam,Achternaam) 
VALUES (29,'sed@aliquam.co.uk','dictum','Kevyn','Hyde');
INSERT INTO ACCOUNT (AccountID,Email,Wachtwoord,Voornaam,Achternaam) 
VALUES (30,'sit.amet.metus@Maurisvestibulum.org','venenatis','Wang','Palmer');
INSERT INTO ACCOUNT (AccountID,Email,Wachtwoord,Voornaam,Achternaam) 
VALUES (31,'Phasellus@ornare.com','tellus','Kellie','Rose');
INSERT INTO ACCOUNT (AccountID,Email,Wachtwoord,Voornaam,Achternaam) 
VALUES (32,'enim@nec.org','Aenean','Mira','Bond');
INSERT INTO ACCOUNT (AccountID,Email,Wachtwoord,Voornaam,Achternaam) 
VALUES (33,'Duis.volutpat.nunc@tortorat.ca','mauris','Ifeoma','Jackson');
INSERT INTO ACCOUNT (AccountID,Email,Wachtwoord,Voornaam,Achternaam)
VALUES (34,'vel@mi.com','elit,','Joy','Hill');
INSERT INTO ACCOUNT (AccountID,Email,Wachtwoord,Voornaam,Achternaam) 
VALUES (35,'elit.pharetra@Suspendissedui.edu','arcu.','Richard','Horne');
INSERT INTO ACCOUNT (AccountID,Email,Wachtwoord,Voornaam,Achternaam) 
VALUES (36,'sollicitudin@facilisisegetipsum.edu','nisi.','Nichole','Patrick');
INSERT INTO ACCOUNT (AccountID,Email,Wachtwoord,Voornaam,Achternaam) 
VALUES (37,'cursus@dolor.net','est,','Hamish','Ortega');
INSERT INTO ACCOUNT (AccountID,Email,Wachtwoord,Voornaam,Achternaam) 
VALUES (38,'sagittis.felis@commodoauctor.edu','massa.','Xyla','Reese');
INSERT INTO ACCOUNT (AccountID,Email,Wachtwoord,Voornaam,Achternaam) 
VALUES (39,'facilisis@nuncsedlibero.org','cursus','Fulton','Love');
INSERT INTO ACCOUNT (AccountID,Email,Wachtwoord,Voornaam,Achternaam) 
VALUES (40,'Morbi.non.sapien@ultricies.co.uk','ipsum','Pamela','Sharp');
INSERT INTO ACCOUNT (AccountID,Email,Wachtwoord,Voornaam,Achternaam) 
VALUES (41,'elit.fermentum@orci.com','hendrerit','Kuame','Cooper');
INSERT INTO ACCOUNT (AccountID,Email,Wachtwoord,Voornaam,Achternaam) 
VALUES (42,'nisi.dictum.augue@faucibuslectusa.org','enim','Rajah','Palmer');
INSERT INTO ACCOUNT (AccountID,Email,Wachtwoord,Voornaam,Achternaam) 
VALUES (43,'nonummy.ipsum.non@utpharetrased.com','Quisque','Danielle','Cooper');
INSERT INTO ACCOUNT (AccountID,Email,Wachtwoord,Voornaam,Achternaam) 
VALUES (44,'Maecenas@posuere.net','accumsan','Rylee','Valentine');
INSERT INTO ACCOUNT (AccountID,Email,Wachtwoord,Voornaam,Achternaam) 
VALUES (45,'mus.Aenean@maurisanunc.com','vitae','Maile','Copeland');
INSERT INTO ACCOUNT (AccountID,Email,Wachtwoord,Voornaam,Achternaam) 
VALUES (46,'nulla@etmagnisdis.co.uk','ipsum','Gretchen','Rodriquez');
INSERT INTO ACCOUNT (AccountID,Email,Wachtwoord,Voornaam,Achternaam) 
VALUES (47,'neque.Nullam.ut@famesacturpis.com','accumsan','Hu','Vasquez');
INSERT INTO ACCOUNT (AccountID,Email,Wachtwoord,Voornaam,Achternaam) 
VALUES (48,'congue.turpis.In@ligulatortordictum.ca','orci','Amal','Witt');
INSERT INTO ACCOUNT (AccountID,Email,Wachtwoord,Voornaam,Achternaam) 
VALUES (49,'enim.Suspendisse.aliquet@eget.org','et,','Hunter','Farmer');
INSERT INTO ACCOUNT (AccountID,Email,Wachtwoord,Voornaam,Achternaam) 
VALUES (50,'non@placeratvelitQuisque.ca','blandit.','Mohammad','Spears');
INSERT INTO ACCOUNT (AccountID,Email,Wachtwoord,Voornaam,Achternaam) 
VALUES (51,'ac.feugiat.non@purus.ca','diam','Lane','Roth');
INSERT INTO ACCOUNT (AccountID,Email,Wachtwoord,Voornaam,Achternaam) 
VALUES (52,'et.magnis.dis@urnasuscipitnonummy.edu','egestas.','Wayne','Bishop');
INSERT INTO ACCOUNT (AccountID,Email,Wachtwoord,Voornaam,Achternaam) 
VALUES (53,'tempor.est@porttitorscelerisque.net','faucibus.','Oren','Cannon');
INSERT INTO ACCOUNT (AccountID,Email,Wachtwoord,Voornaam,Achternaam) 
VALUES (54,'Proin.ultrices.Duis@viverraMaecenasiaculis.net','vulputate,','Emmanuel','Goff');
INSERT INTO ACCOUNT (AccountID,Email,Wachtwoord,Voornaam,Achternaam) 
VALUES (55,'porttitor.interdum@atlacus.com','amet','William','Lane');
INSERT INTO ACCOUNT (AccountID,Email,Wachtwoord,Voornaam,Achternaam) 
VALUES (56,'Duis.at@tellusfaucibus.net','magna','Tatum','Padilla');
INSERT INTO ACCOUNT (AccountID,Email,Wachtwoord,Voornaam,Achternaam) 
VALUES (57,'elit.fermentum.risus@lacuspedesagittis.co.uk','id','Jack','Gibbs');
INSERT INTO ACCOUNT (AccountID,Email,Wachtwoord,Voornaam,Achternaam) 
VALUES (58,'nulla@odiosempercursus.co.uk','nulla.','Adele','Cervantes');
INSERT INTO ACCOUNT (AccountID,Email,Wachtwoord,Voornaam,Achternaam) 
VALUES (59,'eu.nulla@duinec.ca','velit.','Pandora','Hutchinson');
INSERT INTO ACCOUNT (AccountID,Email,Wachtwoord,Voornaam,Achternaam)
VALUES (60,'neque.et.nunc@Nulla.net','arcu','Harriet','Spencer');
INSERT INTO ACCOUNT (AccountID,Email,Wachtwoord,Voornaam,Achternaam) 
VALUES (61,'luctus@Duiselementum.com','sodales','Gretchen','Monroe');
INSERT INTO ACCOUNT (AccountID,Email,Wachtwoord,Voornaam,Achternaam) 
VALUES (62,'dui.semper@tortor.org','Aliquam','Leandra','Luna');
INSERT INTO ACCOUNT (AccountID,Email,Wachtwoord,Voornaam,Achternaam) 
VALUES (63,'lacinia.orci@Curabiturmassa.edu','tortor.','Basil','Barrera');
INSERT INTO ACCOUNT (AccountID,Email,Wachtwoord,Voornaam,Achternaam) 
VALUES (64,'ante@variusultricesmauris.edu','Phasellus','Kylan','Vazquez');
INSERT INTO ACCOUNT (AccountID,Email,Wachtwoord,Voornaam,Achternaam) 
VALUES (65,'tortor@liberomauris.ca','vestibulum.','Damian','Pittman');
INSERT INTO ACCOUNT (AccountID,Email,Wachtwoord,Voornaam,Achternaam) 
VALUES (66,'odio.Etiam@odio.ca','ligula.','Willa','Levy');
INSERT INTO ACCOUNT (AccountID,Email,Wachtwoord,Voornaam,Achternaam) 
VALUES (67,'mus@arcuVivamus.co.uk','pede','Dillon','Acosta');
INSERT INTO ACCOUNT (AccountID,Email,Wachtwoord,Voornaam,Achternaam) 
VALUES (68,'magna.Cras.convallis@acfermentum.com','mauris,','Bertha','Joseph');
INSERT INTO ACCOUNT (AccountID,Email,Wachtwoord,Voornaam,Achternaam)
VALUES (69,'libero.Morbi@sollicitudinamalesuada.edu','accumsan','Duncan','Flowers');
INSERT INTO ACCOUNT (AccountID,Email,Wachtwoord,Voornaam,Achternaam) 
VALUES (70,'scelerisque@lacusQuisqueimperdiet.org','malesuada.','Charlotte','Oneal');
INSERT INTO ACCOUNT (AccountID,Email,Wachtwoord,Voornaam,Achternaam) 
VALUES (71,'odio.Aliquam@eleifendegestas.net','luctus.','Leslie','Ryan');
INSERT INTO ACCOUNT (AccountID,Email,Wachtwoord,Voornaam,Achternaam)
VALUES (72,'luctus.et.ultrices@tristiquenequevenenatis.ca','ligula','Inga','Shields');
INSERT INTO ACCOUNT (AccountID,Email,Wachtwoord,Voornaam,Achternaam) 
VALUES (73,'dapibus.quam@felisorciadipiscing.com','fringilla','Myles','Curry');
INSERT INTO ACCOUNT (AccountID,Email,Wachtwoord,Voornaam,Achternaam) 
VALUES (74,'scelerisque.dui.Suspendisse@maurissapiencursus.ca','in','Stuart','Calhoun');
INSERT INTO ACCOUNT (AccountID,Email,Wachtwoord,Voornaam,Achternaam) 
VALUES (75,'gravida.sit@orciPhasellus.net','Nulla','Hilda','Montgomery');
INSERT INTO ACCOUNT (AccountID,Email,Wachtwoord,Voornaam,Achternaam) 
VALUES (76,'in.dolor@Cras.ca','sed','Georgia','Austin');
INSERT INTO ACCOUNT (AccountID,Email,Wachtwoord,Voornaam,Achternaam) 
VALUES (77,'scelerisque.dui.Suspendisse@nibhlacinia.ca','sapien.','Jameson','Welch');
INSERT INTO ACCOUNT (AccountID,Email,Wachtwoord,Voornaam,Achternaam) 
VALUES (78,'metus.sit.amet@Quisque.ca','Phasellus','Uriah','Davidson');
INSERT INTO ACCOUNT (AccountID,Email,Wachtwoord,Voornaam,Achternaam) 
VALUES (79,'eu.tempor@magnis.ca','in','Hashim','Mccall');
INSERT INTO ACCOUNT (AccountID,Email,Wachtwoord,Voornaam,Achternaam) 
VALUES (80,'adipiscing@luctusvulputatenisi.com','dictum','Yvette','Whitney');
INSERT INTO ACCOUNT (AccountID,Email,Wachtwoord,Voornaam,Achternaam) 
VALUES (81,'massa@loremsemperauctor.net','at,','Gabriel','Haney');
INSERT INTO ACCOUNT (AccountID,Email,Wachtwoord,Voornaam,Achternaam) 
VALUES (82,'in.felis.Nulla@vulputatelacus.org','lacus.','Baker','Dalton');
INSERT INTO ACCOUNT (AccountID,Email,Wachtwoord,Voornaam,Achternaam) 
VALUES (83,'elit.Nulla.facilisi@velitSedmalesuada.ca','ad','Olympia','Roberson');
INSERT INTO ACCOUNT (AccountID,Email,Wachtwoord,Voornaam,Achternaam) 
VALUES (84,'eu.turpis.Nulla@euplacerateget.com','Nunc','Paul','Hamilton');
INSERT INTO ACCOUNT (AccountID,Email,Wachtwoord,Voornaam,Achternaam) 
VALUES (85,'sociis@diameu.net','rhoncus.','Felix','Richardson');
INSERT INTO ACCOUNT (AccountID,Email,Wachtwoord,Voornaam,Achternaam) 
VALUES (86,'lobortis.quis.pede@pedenecante.edu','sit','Naida','Woodard');
INSERT INTO ACCOUNT (AccountID,Email,Wachtwoord,Voornaam,Achternaam) 
VALUES (87,'hendrerit.Donec.porttitor@rutrum.co.uk','nec,','Craig','Patterson');
INSERT INTO ACCOUNT (AccountID,Email,Wachtwoord,Voornaam,Achternaam) 
VALUES (88,'Duis@magnisdis.com','magna.','Jermaine','Wagner');
INSERT INTO ACCOUNT (AccountID,Email,Wachtwoord,Voornaam,Achternaam) 
VALUES (89,'In.scelerisque@sapiengravida.co.uk','felis','Ariana','Haney');
INSERT INTO ACCOUNT (AccountID,Email,Wachtwoord,Voornaam,Achternaam) 
VALUES (90,'a.auctor.non@Cumsociis.net','Duis','Gail','West');
INSERT INTO ACCOUNT (AccountID,Email,Wachtwoord,Voornaam,Achternaam) 
VALUES (91,'scelerisque@sedorcilobortis.net','tempor','Denton','Coffey');
INSERT INTO ACCOUNT (AccountID,Email,Wachtwoord,Voornaam,Achternaam) 
VALUES (92,'arcu.Vestibulum@enimMaurisquis.com','justo','Charles','Barlow');
INSERT INTO ACCOUNT (AccountID,Email,Wachtwoord,Voornaam,Achternaam) 
VALUES (93,'Aliquam.ornare@aliquamarcu.edu','neque','Elliott','Gibson');
INSERT INTO ACCOUNT (AccountID,Email,Wachtwoord,Voornaam,Achternaam) 
VALUES (94,'lacus@aliquet.edu','eget,','Ivor','Mcgowan');
INSERT INTO ACCOUNT (AccountID,Email,Wachtwoord,Voornaam,Achternaam) 
VALUES (95,'Donec@enimSed.co.uk','et,','Aubrey','Alvarado');
INSERT INTO ACCOUNT (AccountID,Email,Wachtwoord,Voornaam,Achternaam) 
VALUES (96,'ornare.facilisis@antebibendum.edu','quis','Melvin','Cabrera');
INSERT INTO ACCOUNT (AccountID,Email,Wachtwoord,Voornaam,Achternaam) 
VALUES (97,'sapien.cursus.in@molestiesodalesMauris.edu','dapibus','Pascale','Stafford');
INSERT INTO ACCOUNT (AccountID,Email,Wachtwoord,Voornaam,Achternaam) 
VALUES (98,'enim.Curabitur@adipiscingenimmi.edu','dolor','Josiah','Cross');
INSERT INTO ACCOUNT (AccountID,Email,Wachtwoord,Voornaam,Achternaam) 
VALUES (99,'metus.urna.convallis@nuncQuisque.edu','Sed','Oscar','Mitchell');
INSERT INTO ACCOUNT (AccountID,Email,Wachtwoord,Voornaam,Achternaam) 
VALUES (100,'leo@faucibusleo.org','velit.','Hayes','Day');

--Product
INSERT INTO ITEM(Id, Naam, LikeAantal, WikipediaLink, Videolink, CategorieNaam)
VALUES(1,'Vikings', 100, 'http://nl.wikipedia.org/wiki/Vikings_%28televisieserie%29', 'https://www.youtube.com/watch?v=xdm7Z3TQhDg','GAME');
INSERT INTO ITEM(Id, Naam, LikeAantal, WikipediaLink, Videolink, CategorieNaam)
VALUES(2,'Game of Thrones', 255, 'http://nl.wikipedia.org/wiki/Game_of_Thrones', 'https://www.youtube.com/watch?v=8ixEWrTLiZg','ACTEUR');
INSERT INTO ITEM(Id, Naam, LikeAantal, WikipediaLink, Videolink, CategorieNaam)
VALUES(3,'J.K. Rowlling', 6, 'http://nl.wikipedia.org/wiki/J.K._Rowling', 'https://www.youtube.com/watch?v=Uv1O6JJMC5o','ARTIEST');
INSERT INTO ITEM(Id, Naam, LikeAantal, WikipediaLink, Videolink, CategorieNaam)
VALUES(4,'Ad van Gils', 12, 'http://nl.wikipedia.org/wiki/Ad_van_Gils', 'https://www.youtube.com/watch?v=Uv1O6JJMC5o','SHOW');
INSERT INTO ITEM(Id, Naam, LikeAantal, WikipediaLink, Videolink, CategorieNaam)
VALUES(5,'The Avengers: Age of Ultron', 500, 'http://nl.wikipedia.org/wiki/Avengers:_Age_of_Ultron', 'https://www.youtube.com/watch?v=tmeOjFno6Do','ACTEUR');
INSERT INTO ITEM(Id, Naam, LikeAantal, WikipediaLink, Videolink, CategorieNaam)
VALUES(6,'American Sniper', 122, 'http://nl.wikipedia.org/wiki/American_Sniper', 'https://www.youtube.com/watch?v=99k3u9ay1gs','GAME');
INSERT INTO ITEM(Id, Naam, LikeAantal, WikipediaLink, Videolink, CategorieNaam)
VALUES(7,'Guus Meeuwis', 231, 'http://nl.wikipedia.org/wiki/Guus_Meeuwis', 'https://www.youtube.com/user/GuusmeeuwisVEVO','FILM');
INSERT INTO ITEM(Id, Naam, LikeAantal, WikipediaLink, Videolink, CategorieNaam)
VALUES(8,'Andre Hazes', 700, 'http://nl.wikipedia.org/wiki/Andr%C3%A9_Hazes', 'https://www.youtube.com/channel/UCfhB4EZDcsKtMIfs3cgNCag','MUZIEK');
INSERT INTO ITEM(Id, Naam, LikeAantal, WikipediaLink, Videolink, CategorieNaam)
VALUES(9,'CallOfDuty',92, 'http://en.wikipedia.org/wiki/Call_of_Duty','https://www.youtube.com/watch?v=HQd0Rcs_7h8','ARTIEST');
INSERT INTO ITEM(Id, Naam, LikeAantal, WikipediaLink, Videolink, CategorieNaam)
VALUES(10,'Fifa 15',124, 'http://en.wikipedia.org/wiki/FIFA_15','https://www.youtube.com/watch?v=8bN9jcFAyD8','AUTEUR');
INSERT INTO ITEM(Id, Naam, LikeAantal, WikipediaLink, Videolink, CategorieNaam)
VALUES(11,'Iron Maiden',35, 'http://en.wikipedia.org/wiki/Iron_Maiden','https://www.youtube.com/watch?v=Nba3Tr_GLZU','GAME');
INSERT INTO ITEM(Id, Naam, LikeAantal, WikipediaLink, Videolink, CategorieNaam)
VALUES(12,'Metallica',42, 'http://en.wikipedia.org/wiki/Metallica','https://www.youtube.com/watch?v=eEgYUMWqzTQ','FILM');
INSERT INTO ITEM(Id, Naam, LikeAantal, WikipediaLink, Videolink, CategorieNaam)
VALUES(13,'Liam Neeson',12, 'http://en.wikipedia.org/wiki/Liam_Neeson','https://www.youtube.com/watch?v=bbeuvSuGwk8','AUTEUR');
INSERT INTO ITEM(Id, Naam, LikeAantal, WikipediaLink, Videolink, CategorieNaam)
VALUES(14,'Vin Diesel',22, 'http://en.wikipedia.org/wiki/Vin_Diesel','https://www.youtube.com/watch?v=Pi7P9GnR1e8','ARTIEST');
INSERT INTO ITEM(Id, Naam, LikeAantal, WikipediaLink, Videolink, CategorieNaam)
VALUES(15,'Gotham', 703, 'http://en.wikipedia.org/wiki/Gotham_%28TV_series%29', 'https://www.youtube.com/watch?v=VwOPA2upeCA','ACTEUR');
INSERT INTO ITEM(Id, Naam, LikeAantal, WikipediaLink, Videolink, CategorieNaam)
VALUES(16,'Da Vincis Demons', 395, 'http://en.wikipedia.org/wiki/Da_Vinci%27s_Demons', 'https://www.youtube.com/watch?v=vgg9nnALFGA','MUZIEK');
INSERT INTO ITEM(Id, Naam, LikeAantal, WikipediaLink, Videolink, CategorieNaam)
VALUES(17,'Philip Larkin', 18, 'http://en.wikipedia.org/wiki/Philip_Larkin', 'https://www.youtube.com/watch?v=dqa6L22m0rY','SHOW');
INSERT INTO ITEM(Id, Naam, LikeAantal, WikipediaLink, Videolink, CategorieNaam)
VALUES(18,'Langston Hughes', 69, 'http://en.wikipedia.org/wiki/Langston_Hughes', 'https://www.youtube.com/watch?v=uM7HSOwJw20','GAME');
INSERT INTO ITEM(Id, Naam, LikeAantal, WikipediaLink, Videolink, CategorieNaam)
VALUES(19,'Guardians Of The Galaxy', 3537, 'https://en.wikipedia.org/wiki/Guardians_of_the_Galaxy_%28film%29', 'https://www.youtube.com/watch?v=d96cjJhvlMA','SHOW');
INSERT INTO ITEM(Id, Naam, LikeAantal, WikipediaLink, Videolink, CategorieNaam)
VALUES(20,'Gothika', 160, 'http://en.wikipedia.org/wiki/Gothika', 'https://www.youtube.com/watch?v=ETaTp6uquEc','AUTEUR');
INSERT INTO ITEM(Id, Naam, LikeAantal, WikipediaLink, Videolink, CategorieNaam)
VALUES(21,'Dries Roelvink', 23, 'http://en.wikipedia.org/wiki/Dries_Roelvink', 'https://www.youtube.com/watch?v=nQyLxlZDMZY','ARTIEST');
INSERT INTO ITEM(Id, Naam, LikeAantal, WikipediaLink, Videolink, CategorieNaam)
VALUES(22,'Trijntje Oosterhuis', 428, 'http://en.wikipedia.org/wiki/Trijntje_Oosterhuis', 'https://www.youtube.com/watch?v=cjSRZRMwvH0','MUZIEK');
INSERT INTO ITEM(Id, Naam, LikeAantal, WikipediaLink, Videolink, CategorieNaam)
VALUES(23,'Banjo-Tooie',586, 'http://en.wikipedia.org/wiki/Banjo-Tooie','https://www.youtube.com/watch?v=ags1qktdKco','ACTEUR');
INSERT INTO ITEM(Id, Naam, LikeAantal, WikipediaLink, Videolink, CategorieNaam)
VALUES(24,'Minecraft',728, 'http://en.wikipedia.org/wiki/Minecraft','https://www.youtube.com/watch?v=1qEEd7J3DBo','AUTEUR');
INSERT INTO ITEM(Id, Naam, LikeAantal, WikipediaLink, Videolink, CategorieNaam)
VALUES(25,'The beatles',357, 'http://en.wikipedia.org/wiki/The_Beatles','https://www.youtube.com/watch?v=4ez99s0862c','FILM');
INSERT INTO ITEM(Id, Naam, LikeAantal, WikipediaLink, Videolink, CategorieNaam)
VALUES(26,'Queen',42, 'http://en.wikipedia.org/wiki/Queen_%28band%29','https://www.youtube.com/watch?v=EPHJFnob8p8','MUZIEK');
INSERT INTO ITEM(Id, Naam, LikeAantal, WikipediaLink, Videolink, CategorieNaam)
VALUES(27,'Seth Rogan',23, 'http://en.wikipedia.org/wiki/Seth_Rogen','https://www.youtube.com/watch?v=8E0UJBCrTgA','SHOW');
INSERT INTO ITEM(Id, Naam, LikeAantal, WikipediaLink, Videolink, CategorieNaam)
VALUES(28,'Jason Statham',28, 'http://en.wikipedia.org/wiki/Jason_Statham','https://www.youtube.com/watch?v=7fJGbTfFPkM','FILM');


--Show
INSERT INTO SHOW(Productid, Regisseur, DatumUitgave)
VALUES(1,'Ken Girotti', TO_DATE('03-03-2013', 'dd-mm-yyyy'));
INSERT INTO SHOW(Productid, Regisseur, DatumUitgave)
VALUES(2,'David Benioff', TO_DATE('17-04-2011', 'dd-mm-yyyy'));
INSERT INTO SHOW(Productid, Regisseur, DatumUitgave)
VALUES(15,'Bruno Heller', TO_DATE('22-09-2014', 'dd-mm-yyyy'));
INSERT INTO SHOW(Productid, Regisseur, DatumUitgave)
VALUES(16,'David S. Goyer', TO_DATE('12-04-2013', 'dd-mm-yyyy'));

--Auteur
INSERT INTO AUTEUR(Productid, Geboortedatum)
VALUES(3,TO_DATE('01-01-1965', 'dd-mm-yyyy'));
INSERT INTO AUTEUR(Productid, Geboortedatum)
VALUES(4,TO_DATE('01-01-1961', 'dd-mm-yyyy'));
INSERT INTO AUTEUR(Productid, Geboortedatum)
VALUES(17,TO_DATE('09-08-1922', 'dd-mm-yyyy'));
INSERT INTO AUTEUR(Productid, Geboortedatum)
VALUES(18,TO_DATE('01-02-1902', 'dd-mm-yyyy'));

--Film
INSERT INTO FILM(Productid, Regisseur, Acteurnaam, DatumUitgave)
VALUES(5,'Joss Whedon' , 'Robert Downey Jr.', TO_DATE('01-05-2015', 'dd-mm-yyyy'));
INSERT INTO FILM(Productid, Regisseur, Acteurnaam, DatumUitgave)
VALUES(6,'Clint Eastwood' , 'Bradley Cooper', TO_DATE('11-11-2014', 'dd-mm-yyyy'));
INSERT INTO FILM(Productid, Regisseur, Acteurnaam, DatumUitgave)
VALUES(19,'James Gunn' , 'Chris Pratt', TO_DATE('21-08-2014', 'dd-mm-yyyy'));
INSERT INTO FILM(Productid, Regisseur, Acteurnaam, DatumUitgave)
VALUES(20,'Mathieu Kassovitz' , 'Halle Berry', TO_DATE('21-11-2003', 'dd-mm-yyyy'));

--Artiest
INSERT INTO ARTIEST(Productid, Geboortedatum)
VALUES(7,TO_DATE('01-01-1972', 'dd-mm-yyyy'));
INSERT INTO ARTIEST(Productid, Geboortedatum)
VALUES(8,TO_DATE('01-01-1951', 'dd-mm-yyyy'));
INSERT INTO ARTIEST(Productid, Geboortedatum)
VALUES(21,TO_DATE('01-01-1959', 'dd-mm-yyyy'));
INSERT INTO ARTIEST(Productid, Geboortedatum)
VALUES(22,TO_DATE('05-02-1973', 'dd-mm-yyyy'));

--Game
INSERT INTO GAME(ProductID, Platform, DatumUitgave)
VALUES (9,'ALL',TO_DATE('2015','YYYY'));
INSERT INTO GAME(ProductID, Platform, DatumUitgave)
VALUES (10,'ALL',TO_DATE('2015','YYYY'));
INSERT INTO GAME(ProductID, Platform, DatumUitgave)
VALUES (23,'Nintendo 64',TO_DATE('2015','YYYY'));
INSERT INTO GAME(ProductID, Platform, DatumUitgave)
VALUES (24,'ALL',TO_DATE('2000','YYYY'));

--Muziek
INSERT INTO MUZIEK(ProductID, ArtiestNaam, DatumUitgave)
VALUES (11,'Iron Maiden',TO_DATE('1975','YYYY'));
INSERT INTO MUZIEK(ProductID, ArtiestNaam, DatumUitgave)
VALUES (12,'Metallica',TO_DATE('1981','YYYY'));
INSERT INTO MUZIEK(ProductID, ArtiestNaam, DatumUitgave)
VALUES (25,'Beatles',TO_DATE('1960','YYYY'));
INSERT INTO MUZIEK(ProductID, ArtiestNaam, DatumUitgave)
VALUES (26,'Queen',TO_DATE('1970','YYYY'));

--Acteur
INSERT INTO ACTEUR(ProductID, Geboortedatum)
VALUES (13,TO_DATE('07-06-1952','DD-MM-YYYY'));
INSERT INTO ACTEUR(ProductID, Geboortedatum)
VALUES (14,TO_DATE('18-07-1967','DD-MM-YYYY'));
INSERT INTO ACTEUR(ProductID, Geboortedatum)
VALUES (27,TO_DATE('15-04-1982','DD-MM-YYYY'));
INSERT INTO ACTEUR(ProductID, Geboortedatum)
VALUES (28,TO_DATE('26-07-1967','DD-MM-YYYY'));

--Rating
INSERT INTO RATING (AccountID,ProductID,RatingValue) VALUES (83,6,1);
INSERT INTO RATING (AccountID,ProductID,RatingValue) VALUES (50,19,1);
INSERT INTO RATING (AccountID,ProductID,RatingValue) VALUES (72,10,1);
INSERT INTO RATING (AccountID,ProductID,RatingValue) VALUES (29,17,-1);
INSERT INTO RATING (AccountID,ProductID,RatingValue) VALUES (40,5,1);
INSERT INTO RATING (AccountID,ProductID,RatingValue) VALUES (29,19,1);
INSERT INTO RATING (AccountID,ProductID,RatingValue) VALUES (10,7,-1);
INSERT INTO RATING (AccountID,ProductID,RatingValue) VALUES (79,25,-1);
INSERT INTO RATING (AccountID,ProductID,RatingValue) VALUES (27,11,-1);
INSERT INTO RATING (AccountID,ProductID,RatingValue) VALUES (98,22,-1);
INSERT INTO RATING (AccountID,ProductID,RatingValue) VALUES (8,14,1);
INSERT INTO RATING (AccountID,ProductID,RatingValue) VALUES (14,21,1);
INSERT INTO RATING (AccountID,ProductID,RatingValue) VALUES (62,7,1);
INSERT INTO RATING (AccountID,ProductID,RatingValue) VALUES (37,1,1);
INSERT INTO RATING (AccountID,ProductID,RatingValue) VALUES (61,20,1);
INSERT INTO RATING (AccountID,ProductID,RatingValue) VALUES (55,18,-1);
INSERT INTO RATING (AccountID,ProductID,RatingValue) VALUES (34,23,1);
INSERT INTO RATING (AccountID,ProductID,RatingValue) VALUES (17,15,1);
INSERT INTO RATING (AccountID,ProductID,RatingValue) VALUES (79,4,-1);
INSERT INTO RATING (AccountID,ProductID,RatingValue) VALUES (7,26,1);
INSERT INTO RATING (AccountID,ProductID,RatingValue) VALUES (27,14,-1);
INSERT INTO RATING (AccountID,ProductID,RatingValue) VALUES (100,21,-1);
INSERT INTO RATING (AccountID,ProductID,RatingValue) VALUES (20,25,1);
INSERT INTO RATING (AccountID,ProductID,RatingValue) VALUES (83,20,1);
INSERT INTO RATING (AccountID,ProductID,RatingValue) VALUES (43,10,1);
INSERT INTO RATING (AccountID,ProductID,RatingValue) VALUES (100,6,1);
INSERT INTO RATING (AccountID,ProductID,RatingValue) VALUES (29,3,-1);
INSERT INTO RATING (AccountID,ProductID,RatingValue) VALUES (96,8,-1);
INSERT INTO RATING (AccountID,ProductID,RatingValue) VALUES (72,18,1);
INSERT INTO RATING (AccountID,ProductID,RatingValue) VALUES (62,24,1);
INSERT INTO RATING (AccountID,ProductID,RatingValue) VALUES (48,5,-1);
INSERT INTO RATING (AccountID,ProductID,RatingValue) VALUES (66,12,1);
INSERT INTO RATING (AccountID,ProductID,RatingValue) VALUES (86,8,1);
INSERT INTO RATING (AccountID,ProductID,RatingValue) VALUES (44,5,1);
INSERT INTO RATING (AccountID,ProductID,RatingValue) VALUES (27,19,1);
INSERT INTO RATING (AccountID,ProductID,RatingValue) VALUES (14,13,1);
INSERT INTO RATING (AccountID,ProductID,RatingValue) VALUES (41,7,-1);
INSERT INTO RATING (AccountID,ProductID,RatingValue) VALUES (2,3,-1);
INSERT INTO RATING (AccountID,ProductID,RatingValue) VALUES (31,7,1);
INSERT INTO RATING (AccountID,ProductID,RatingValue) VALUES (85,18,-1);
INSERT INTO RATING (AccountID,ProductID,RatingValue) VALUES (52,28,-1);
INSERT INTO RATING (AccountID,ProductID,RatingValue) VALUES (72,24,-1);
INSERT INTO RATING (AccountID,ProductID,RatingValue) VALUES (52,20,1);
INSERT INTO RATING (AccountID,ProductID,RatingValue) VALUES (61,21,1);
INSERT INTO RATING (AccountID,ProductID,RatingValue) VALUES (2,8,-1);
INSERT INTO RATING (AccountID,ProductID,RatingValue) VALUES (88,11,1);
INSERT INTO RATING (AccountID,ProductID,RatingValue) VALUES (67,14,1);
INSERT INTO RATING (AccountID,ProductID,RatingValue) VALUES (20,8,1);
INSERT INTO RATING (AccountID,ProductID,RatingValue) VALUES (91,6,-1);
INSERT INTO RATING (AccountID,ProductID,RatingValue) VALUES (26,1,-1);
INSERT INTO RATING (AccountID,ProductID,RatingValue) VALUES (84,26,1);
INSERT INTO RATING (AccountID,ProductID,RatingValue) VALUES (31,20,1);
INSERT INTO RATING (AccountID,ProductID,RatingValue) VALUES (92,18,1);
INSERT INTO RATING (AccountID,ProductID,RatingValue) VALUES (11,16,-1);
INSERT INTO RATING (AccountID,ProductID,RatingValue) VALUES (18,9,-1);
INSERT INTO RATING (AccountID,ProductID,RatingValue) VALUES (97,2,1);
INSERT INTO RATING (AccountID,ProductID,RatingValue) VALUES (26,9,1);
INSERT INTO RATING (AccountID,ProductID,RatingValue) VALUES (46,19,1);
INSERT INTO RATING (AccountID,ProductID,RatingValue) VALUES (57,24,-1);
INSERT INTO RATING (AccountID,ProductID,RatingValue) VALUES (77,26,-1);
INSERT INTO RATING (AccountID,ProductID,RatingValue) VALUES (70,23,1);
INSERT INTO RATING (AccountID,ProductID,RatingValue) VALUES (53,24,1);
INSERT INTO RATING (AccountID,ProductID,RatingValue) VALUES (10,21,1);
INSERT INTO RATING (AccountID,ProductID,RatingValue) VALUES (38,28,1);
INSERT INTO RATING (AccountID,ProductID,RatingValue) VALUES (65,23,-1);
INSERT INTO RATING (AccountID,ProductID,RatingValue) VALUES (41,27,1);
INSERT INTO RATING (AccountID,ProductID,RatingValue) VALUES (30,16,1);
INSERT INTO RATING (AccountID,ProductID,RatingValue) VALUES (99,17,1);
INSERT INTO RATING (AccountID,ProductID,RatingValue) VALUES (62,11,-1);
INSERT INTO RATING (AccountID,ProductID,RatingValue) VALUES (93,23,1);
INSERT INTO RATING (AccountID,ProductID,RatingValue) VALUES (61,17,-1);
INSERT INTO RATING (AccountID,ProductID,RatingValue) VALUES (61,27,-1);
INSERT INTO RATING (AccountID,ProductID,RatingValue) VALUES (78,10,-1);
INSERT INTO RATING (AccountID,ProductID,RatingValue) VALUES (19,6,1);
INSERT INTO RATING (AccountID,ProductID,RatingValue) VALUES (53,25,1);
INSERT INTO RATING (AccountID,ProductID,RatingValue) VALUES (23,17,1);
INSERT INTO RATING (AccountID,ProductID,RatingValue) VALUES (40,8,1);
INSERT INTO RATING (AccountID,ProductID,RatingValue) VALUES (20,27,-1);
INSERT INTO RATING (AccountID,ProductID,RatingValue) VALUES (22,23,-1);
INSERT INTO RATING (AccountID,ProductID,RatingValue) VALUES (32,9,-1);
INSERT INTO RATING (AccountID,ProductID,RatingValue) VALUES (100,25,-1);
INSERT INTO RATING (AccountID,ProductID,RatingValue) VALUES (46,18,1);
INSERT INTO RATING (AccountID,ProductID,RatingValue) VALUES (65,9,1);
INSERT INTO RATING (AccountID,ProductID,RatingValue) VALUES (81,10,1);
INSERT INTO RATING (AccountID,ProductID,RatingValue) VALUES (19,11,1);
INSERT INTO RATING (AccountID,ProductID,RatingValue) VALUES (32,2,1);
INSERT INTO RATING (AccountID,ProductID,RatingValue) VALUES (2,17,-1);
INSERT INTO RATING (AccountID,ProductID,RatingValue) VALUES (41,10,-1);
INSERT INTO RATING (AccountID,ProductID,RatingValue) VALUES (51,13,1);
INSERT INTO RATING (AccountID,ProductID,RatingValue) VALUES (82,13,-1);
INSERT INTO RATING (AccountID,ProductID,RatingValue) VALUES (11,14,-1);
INSERT INTO RATING (AccountID,ProductID,RatingValue) VALUES (38,20,-1);
INSERT INTO RATING (AccountID,ProductID,RatingValue) VALUES (77,4,-1);
INSERT INTO RATING (AccountID,ProductID,RatingValue) VALUES (88,26,1);
INSERT INTO RATING (AccountID,ProductID,RatingValue) VALUES (63,16,1);
INSERT INTO RATING (AccountID,ProductID,RatingValue) VALUES (37,7,-1);
INSERT INTO RATING (AccountID,ProductID,RatingValue) VALUES (95,15,-1);
INSERT INTO RATING (AccountID,ProductID,RatingValue) VALUES (76,25,-1);
INSERT INTO RATING (AccountID,ProductID,RatingValue) VALUES (39,21,-1);
INSERT INTO RATING (AccountID,ProductID,RatingValue) VALUES (70,10,-1);
INSERT INTO RATING (AccountID,ProductID,RatingValue) VALUES (70,8,-1);
INSERT INTO RATING (AccountID,ProductID,RatingValue) VALUES (2,11,-1);
INSERT INTO RATING (AccountID,ProductID,RatingValue) VALUES (35,4,1);
INSERT INTO RATING (AccountID,ProductID,RatingValue) VALUES (98,13,-1);
INSERT INTO RATING (AccountID,ProductID,RatingValue) VALUES (96,2,-1);
INSERT INTO RATING (AccountID,ProductID,RatingValue) VALUES (4,11,1);
INSERT INTO RATING (AccountID,ProductID,RatingValue) VALUES (93,20,1);
INSERT INTO RATING (AccountID,ProductID,RatingValue) VALUES (93,19,-1);
INSERT INTO RATING (AccountID,ProductID,RatingValue) VALUES (82,26,1);
INSERT INTO RATING (AccountID,ProductID,RatingValue) VALUES (18,5,1);
INSERT INTO RATING (AccountID,ProductID,RatingValue) VALUES (41,13,1);
INSERT INTO RATING (AccountID,ProductID,RatingValue) VALUES (69,21,-1);
INSERT INTO RATING (AccountID,ProductID,RatingValue) VALUES (59,19,-1);
INSERT INTO RATING (AccountID,ProductID,RatingValue) VALUES (41,8,-1);
INSERT INTO RATING (AccountID,ProductID,RatingValue) VALUES (21,14,1);
INSERT INTO RATING (AccountID,ProductID,RatingValue) VALUES (61,14,-1);
INSERT INTO RATING (AccountID,ProductID,RatingValue) VALUES (80,9,1);
INSERT INTO RATING (AccountID,ProductID,RatingValue) VALUES (32,27,-1);
INSERT INTO RATING (AccountID,ProductID,RatingValue) VALUES (3,13,1);
INSERT INTO RATING (AccountID,ProductID,RatingValue) VALUES (75,1,1);
INSERT INTO RATING (AccountID,ProductID,RatingValue) VALUES (58,23,-1);
INSERT INTO RATING (AccountID,ProductID,RatingValue) VALUES (13,23,1);
INSERT INTO RATING (AccountID,ProductID,RatingValue) VALUES (67,16,-1);
INSERT INTO RATING (AccountID,ProductID,RatingValue) VALUES (58,26,1);
INSERT INTO RATING (AccountID,ProductID,RatingValue) VALUES (47,8,-1);
INSERT INTO RATING (AccountID,ProductID,RatingValue) VALUES (32,23,1);
INSERT INTO RATING (AccountID,ProductID,RatingValue) VALUES (69,18,1);
INSERT INTO RATING (AccountID,ProductID,RatingValue) VALUES (46,5,1);
INSERT INTO RATING (AccountID,ProductID,RatingValue) VALUES (58,16,1);
INSERT INTO RATING (AccountID,ProductID,RatingValue) VALUES (52,11,1);
INSERT INTO RATING (AccountID,ProductID,RatingValue) VALUES (85,12,1);
INSERT INTO RATING (AccountID,ProductID,RatingValue) VALUES (48,24,-1);
INSERT INTO RATING (AccountID,ProductID,RatingValue) VALUES (17,6,-1);
INSERT INTO RATING (AccountID,ProductID,RatingValue) VALUES (22,27,-1);
INSERT INTO RATING (AccountID,ProductID,RatingValue) VALUES (22,11,1);
INSERT INTO RATING (AccountID,ProductID,RatingValue) VALUES (39,23,1);
INSERT INTO RATING (AccountID,ProductID,RatingValue) VALUES (70,2,1);
INSERT INTO RATING (AccountID,ProductID,RatingValue) VALUES (99,14,1);
INSERT INTO RATING (AccountID,ProductID,RatingValue) VALUES (43,26,1);
INSERT INTO RATING (AccountID,ProductID,RatingValue) VALUES (30,23,1);
INSERT INTO RATING (AccountID,ProductID,RatingValue) VALUES (18,28,-1);
INSERT INTO RATING (AccountID,ProductID,RatingValue) VALUES (65,5,1);
INSERT INTO RATING (AccountID,ProductID,RatingValue) VALUES (15,20,-1);
INSERT INTO RATING (AccountID,ProductID,RatingValue) VALUES (10,4,1);
INSERT INTO RATING (AccountID,ProductID,RatingValue) VALUES (19,16,-1);
INSERT INTO RATING (AccountID,ProductID,RatingValue) VALUES (7,1,1);
INSERT INTO RATING (AccountID,ProductID,RatingValue) VALUES (32,14,1);
INSERT INTO RATING (AccountID,ProductID,RatingValue) VALUES (91,25,-1);
INSERT INTO RATING (AccountID,ProductID,RatingValue) VALUES (25,13,1);
INSERT INTO RATING (AccountID,ProductID,RatingValue) VALUES (9,15,-1);
INSERT INTO RATING (AccountID,ProductID,RatingValue) VALUES (69,14,1);
INSERT INTO RATING (AccountID,ProductID,RatingValue) VALUES (13,3,1);
INSERT INTO RATING (AccountID,ProductID,RatingValue) VALUES (11,8,1);
INSERT INTO RATING (AccountID,ProductID,RatingValue) VALUES (58,12,-1);
INSERT INTO RATING (AccountID,ProductID,RatingValue) VALUES (35,11,1);
INSERT INTO RATING (AccountID,ProductID,RatingValue) VALUES (54,8,-1);
INSERT INTO RATING (AccountID,ProductID,RatingValue) VALUES (74,10,-1);
INSERT INTO RATING (AccountID,ProductID,RatingValue) VALUES (65,15,1);
INSERT INTO RATING (AccountID,ProductID,RatingValue) VALUES (19,1,1);
INSERT INTO RATING (AccountID,ProductID,RatingValue) VALUES (2,23,-1);
INSERT INTO RATING (AccountID,ProductID,RatingValue) VALUES (92,13,-1);
INSERT INTO RATING (AccountID,ProductID,RatingValue) VALUES (52,24,1);
INSERT INTO RATING (AccountID,ProductID,RatingValue) VALUES (1,7,1);
INSERT INTO RATING (AccountID,ProductID,RatingValue) VALUES (7,22,1);
INSERT INTO RATING (AccountID,ProductID,RatingValue) VALUES (60,12,-1);
INSERT INTO RATING (AccountID,ProductID,RatingValue) VALUES (49,7,1);
INSERT INTO RATING (AccountID,ProductID,RatingValue) VALUES (55,24,-1);
INSERT INTO RATING (AccountID,ProductID,RatingValue) VALUES (69,9,-1);
INSERT INTO RATING (AccountID,ProductID,RatingValue) VALUES (91,1,-1);
INSERT INTO RATING (AccountID,ProductID,RatingValue) VALUES (81,3,1);
INSERT INTO RATING (AccountID,ProductID,RatingValue) VALUES (31,13,1);
INSERT INTO RATING (AccountID,ProductID,RatingValue) VALUES (93,22,1);
INSERT INTO RATING (AccountID,ProductID,RatingValue) VALUES (46,25,-1);
INSERT INTO RATING (AccountID,ProductID,RatingValue) VALUES (8,2,-1);
INSERT INTO RATING (AccountID,ProductID,RatingValue) VALUES (82,23,1);
INSERT INTO RATING (AccountID,ProductID,RatingValue) VALUES (31,19,1);
INSERT INTO RATING (AccountID,ProductID,RatingValue) VALUES (57,19,1);
INSERT INTO RATING (AccountID,ProductID,RatingValue) VALUES (30,14,-1);
INSERT INTO RATING (AccountID,ProductID,RatingValue) VALUES (98,9,1);
INSERT INTO RATING (AccountID,ProductID,RatingValue) VALUES (23,6,-1);
INSERT INTO RATING (AccountID,ProductID,RatingValue) VALUES (41,12,1);
INSERT INTO RATING (AccountID,ProductID,RatingValue) VALUES (55,22,1);
INSERT INTO RATING (AccountID,ProductID,RatingValue) VALUES (16,5,1);
INSERT INTO RATING (AccountID,ProductID,RatingValue) VALUES (15,14,1);
INSERT INTO RATING (AccountID,ProductID,RatingValue) VALUES (85,7,1);
INSERT INTO RATING (AccountID,ProductID,RatingValue) VALUES (4,17,1);
INSERT INTO RATING (AccountID,ProductID,RatingValue) VALUES (38,26,1);
INSERT INTO RATING (AccountID,ProductID,RatingValue) VALUES (32,6,1);
INSERT INTO RATING (AccountID,ProductID,RatingValue) VALUES (21,24,-1);
INSERT INTO RATING (AccountID,ProductID,RatingValue) VALUES (84,9,1);
INSERT INTO RATING (AccountID,ProductID,RatingValue) VALUES (89,11,1);
INSERT INTO RATING (AccountID,ProductID,RatingValue) VALUES (57,6,1);
INSERT INTO RATING (AccountID,ProductID,RatingValue) VALUES (69,1,1);
INSERT INTO RATING (AccountID,ProductID,RatingValue) VALUES (65,1,-1);