set serveroutput on;
/
CREATE OR REPLACE PROCEDURE fillcursor
(username IN VARCHAR2, password IN VARCHAR2, t out varchar2, t1 out varchar2, t2 out varchar2) 
IS
s varchar2(100) := '';
cursor r is 
select * from "ACCOUNT";
BEGIN 
   for r1 in r loop 
   if r1."gebruikersnaam" = username and r1."wachtwoord" = password then 
     s := r1."gebruikersnaam";
     t1 := r1."email";
     t2 := TO_CHAR(r1."gebruikersgroep_id");
     end if;
     end loop;
     t := s;
END fillcursor;
/

CREATE OR REPLACE PROCEDURE getFreeSpots("spotCursor" OUT SYS_REFCURSOR)
IS
BEGIN
  OPEN "spotCursor" FOR
  SELECT * FROM PLEK p
  WHERE p.ID NOT IN (
      SELECT "plek_id"
      FROM PLEK_RESERVERING);
END getFreeSpots;
/

CREATE OR REPLACE PROCEDURE getSpecs("specCursor" OUT SYS_REFCURSOR)
IS
BEGIN
  OPEN "specCursor" FOR
  SELECT "specificatie_id", "plek_id", "waarde" FROM "PLEK_SPECIFICATIE";
END getSpecs;
/

CREATE OR REPLACE PROCEDURE getAllUsers("userCursor" OUT SYS_REFCURSOR)
IS
BEGIN
  OPEN "userCursor" FOR
  SELECT "gebruikersnaam", "email", "gebruikersgroep_id" FROM "ACCOUNT";
END getAllUsers;
/

CREATE OR REPLACE PROCEDURE getPresentUsers("userCursor" OUT SYS_REFCURSOR)
IS
BEGIN
  OPEN "userCursor" FOR
  SELECT a."gebruikersnaam", a."email", a."gebruikersgroep_id"
  FROM ACCOUNT a, RESERVERING_POLSBANDJE rp
  WHERE a."ID" = rp."account_id"
  AND rp."aanwezig" = 1;
END getPresentUsers;
/

CREATE OR REPLACE PROCEDURE getUsersInReservation(userName IN VARCHAR2, "userCursor" OUT SYS_REFCURSOR)
IS
scannedUser   NUMBER(3);
reservationID NUMBER(3);

PROCEDURE getUser IS
BEGIN
  SELECT "ID"
  INTO scannedUser
  FROM ACCOUNT
  WHERE userName = "gebruikersnaam";
  
  SELECT "reservering_id"
  INTO reservationID
  FROM RESERVERING_POLSBANDJE
  WHERE scannedUser = "account_id";
END getUser;

BEGIN
getUser();
  OPEN "userCursor" FOR
  SELECT e."gebruikersnaam", e."email", e."gebruikersgroep_id"
  FROM "ACCOUNT" e, RESERVERING_POLSBANDJE rp
  WHERE e.ID = rp."account_id"
  AND rp."reservering_id" = reservationID;
END getUsersInReservation;
/

CREATE OR REPLACE PROCEDURE getProducts("productCursor" OUT SYS_REFCURSOR)
IS
BEGIN
  OPEN "productCursor" FOR
  SELECT "ID", "merk", "serie", "prijs" FROM "PRODUCT";
END;
/

CREATE OR REPLACE PROCEDURE getProductEditions("productCursor" OUT SYS_REFCURSOR)
IS
BEGIN
  OPEN "productCursor" FOR
  SELECT "ID", "product_id" FROM PRODUCTEXEMPLAAR 
  WHERE "ID" NOT IN (
    SELECT "productexemplaar_id" FROM VERHUUR);
END;
/

CREATE OR REPLACE PROCEDURE setPlekToReserved(reservationID IN NUMBER, plekID IN NUMBER)
IS
maxID NUMBER(3);

PROCEDURE setMaxID IS
BEGIN
  SELECT MAX(ID)
  INTO maxID
  FROM PLEK_RESERVERING;
maxID := maxID +1;
END setMaxID;

BEGIN
setMaxID();

INSERT INTO PLEK_RESERVERING("ID", "plek_id", "reservering_id") VALUES(maxID, plekID, reservationID);
END setPlekToReserved;
/

CREATE OR REPLACE PROCEDURE bookReservation(persoon_id IN NUMBER, plek_id IN NUMBER)
IS
maxReservationID NUMBER(3);
dateStart        DATE;
dateEnd          DATE;

PROCEDURE setMaxID IS
BEGIN
  SELECT MAX(ID)
  INTO maxReservationID
  FROM RESERVERING;
  maxReservationID := maxReservationID +1;
END setMaxID;

PROCEDURE setDates IS
BEGIN
  dateStart := TO_DATE('27-12-13', 'DD-MM-YY');
  dateEnd := TO_DATE('30-12-13', 'DD-MM-YY');
END setDates;

BEGIN
setMaxID();
setDates();

INSERT INTO RESERVERING("ID", "persoon_id", "datumStart", "datumEinde", "betaald") VALUES(maxReservationID, persoon_id, dateStart, dateEnd, 1);
ReservePlek(plek_id, maxReservationID);
END bookReservation;
/

CREATE OR REPLACE PROCEDURE insertIntoRes_Polsbandje(accountID IN NUMBER)
IS
rpID          NUMBER(3);
polsbandjeID  NUMBER(3);
reserveringID NUMBER(3);

PROCEDURE setRpID IS
BEGIN
  SELECT MAX(ID)
  INTO rpID
  FROM RESERVERING_POLSBANDJE;
rpID := rpID +1;
END setRpID;

PROCEDURE setPolsbandjeID IS
BEGIN
  SELECT MAX("polsbandje_id")
  INTO polsbandjeID
  FROM RESERVERING_POLSBANDJE;
polsbandjeID := polsbandjeID + 1;
END setPolsbandjeID;

PROCEDURE setReserveringID IS
BEGIN
  SELECT MAX(ID)
  INTO reserveringID
  FROM RESERVERING;
END setReserveringID;

BEGIN
setRpID();
setPolsbandjeID();
setReserveringID();

INSERT INTO RESERVERING_POLSBANDJE("ID", "reservering_id", "polsbandje_id", "account_id", "aanwezig") VALUES(rpID, reserveringID, polsbandjeID, accountID, 0);
END insertIntoRes_Polsbandje;
/

CREATE OR REPLACE PROCEDURE newPersoon(firstName IN VARCHAR2, insertion IN VARCHAR2, lastName IN VARCHAR2, street IN VARCHAR2, houseNr IN VARCHAR2, residency IN VARCHAR2, bankNr IN VARCHAR2)
IS
maxPersoonID   NUMBER(3);

PROCEDURE setMaxID IS
BEGIN
  SELECT MAX(ID)
  INTO maxPersoonID
  FROM PERSOON;
maxPersoonID := maxPersoonID +1;
END setMaxID;

BEGIN
setMaxID();

INSERT INTO PERSOON("ID", "voornaam", "tussenvoegsel", "achternaam", "straat", "huisnr", "woonplaats", "banknr") VALUES (maxPersoonID, firstName, insertion, lastName, street, houseNr, residency, bankNr);
END newPersoon;
/

CREATE OR REPLACE PROCEDURE CreatePersonAndReservation(plek_id IN NUMBER, firstName IN VARCHAR2, insertion IN VARCHAR2, lastName IN VARCHAR2, street IN VARCHAR2, houseNumber IN NUMBER, residency IN VARCHAR2, bankNr IN VARCHAR2)
IS
personID NUMBER(3);

PROCEDURE getPersonId IS
BEGIN
  SELECT MAX(ID)
  INTO personID
  FROM Persoon;
  personID := personID + 1;
END getPersonId;

BEGIN
getPersonId();
INSERT INTO PERSOON("ID", "voornaam", "tussenvoegsel", "achternaam", "straat", "huisnr", "woonplaats", "banknr") VALUES (personID, firstName, insertion, lastName, street, houseNumber, residency, bankNr);
bookReservation(personID, plek_id);

END CreatePersonAndReservation;
/

CREATE OR REPLACE PROCEDURE newAccount(userName IN VARCHAR2, email IN VARCHAR2)
IS
gebruikersGroepID NUMBER(1) DEFAULT 2;
wachtwoord        VARCHAR2(20);
accountID         NUMBER(3);
recordCount       NUMBER(3);

PROCEDURE setAccountID IS
BEGIN
  SELECT MAX(ID)
  INTO accountID
  FROM ACCOUNT;
  accountID := accountID +1;
END setAccountID;

BEGIN
setAccountID();
wachtwoord := userName || '123';
INSERT INTO ACCOUNT("ID", "gebruikersgroep_id", "gebruikersnaam", "wachtwoord", "email", "activatiehash", "geactiveerd") VALUES(accountID, gebruikersGroepID, userName, wachtwoord, email, 'unknown', 1);
insertIntoRes_Polsbandje(accountID);
END newAccount;
/

CREATE OR REPLACE PROCEDURE ReservePlek(plekID IN NUMBER, reserveringID IN NUMBER)
IS
plekReserveringID NUMBER(3);

PROCEDURE setPlekReserveringID IS
BEGIN
  SELECT MAX(ID)
  INTO plekReserveringID
  FROM PLEK_RESERVERING;
plekReserveringID := plekReserveringID + 1;
END setPlekReserveringID;

BEGIN
setPlekReserveringID();
INSERT INTO PLEK_RESERVERING("ID", "plek_id", "reservering_id") VALUES(plekReserveringID, plekID, reserveringID);
END ReservePlek;
/

CREATE OR REPLACE PROCEDURE ScanBarcode(barcode IN VARCHAR2, userName OUT VARCHAR2) IS
BEGIN
  SELECT a."gebruikersnaam"
  INTO userName
  FROM ACCOUNT a, POLSBANDJE p, RESERVERING_POLSBANDJE rp
  WHERE p.ID = rp."polsbandje_id"
  AND a.ID = rp."account_id"
  AND p."rfid" = barcode;

EXCEPTION
  WHEN NO_DATA_FOUND THEN
    raise_application_error(-20000, 'Geen account gevonden bij barcode');
END ScanBarcode;
/

CREATE OR REPLACE PROCEDURE CheckIfMainbooker(userName IN VARCHAR2, bookerCursor OUT SYS_REFCURSOR, email OUT VARCHAR2)
IS
v_accountID  NUMBER(3);
ex_noAccount EXCEPTION;
ex_noBooker  EXCEPTION;

PROCEDURE getAccount IS
BEGIN
  SELECT ID
  INTO v_accountID
  FROM ACCOUNT
  WHERE "gebruikersnaam" = userName;
  
  SELECT a."email"
  INTO email
  FROM ACCOUNT a
  WHERE v_accountID = a.ID;
  
EXCEPTION
  WHEN NO_DATA_FOUND THEN
    raise_application_error(-20000, 'Geen account gevonden bij gebruikersnaam');
END getAccount;
  
BEGIN
getAccount();

OPEN bookerCursor FOR
  SELECT p.*, a."email"
  FROM ACCOUNT a, RESERVERING_POLSBANDJE rp, RESERVERING r, PERSOON p
  WHERE v_accountID = rp."account_id"
  AND rp."reservering_id" = r.ID
  AND r."persoon_id" = p.ID;

EXCEPTION
  WHEN NO_DATA_FOUND THEN
    raise_application_error(-20000, 'Account is geen boeker.'); 
END CheckIfMainbooker;
/

CREATE OR REPLACE PROCEDURE UpdateAanwezigheid (userName IN VARCHAR2)
IS
  accountID NUMBER(3);
  v_aanwezig NUMBER(1);

PROCEDURE getAccountID IS
BEGIN
  SELECT a.ID
  INTO accountID
  FROM ACCOUNT a
  WHERE a."gebruikersnaam" = userName;

EXCEPTION
  WHEN NO_DATA_FOUND THEN
    raise_application_error('Geen account gevonden bij username.', accountID);
END getAccountID;

PROCEDURE aanwezig IS
BEGIN
  SELECT rp."aanwezig"
  INTO v_aanwezig
  FROM RESERVERING_POLSBANDJE rp, ACCOUNT a
  WHERE a.ID = rp."account_id"
  AND a."gebruikersnaam" = userName;
END aanwezig;

BEGIN
getAccountID();
aanwezig();
  IF v_aanwezig = 1 THEN
    UPDATE RESERVERING_POLSBANDJE
    SET "aanwezig" = 0
    WHERE "account_id" = accountID;
  ELSE
    UPDATE RESERVERING_POLSBANDJE
    SET "aanwezig" = 1
    WHERE "account_id" = accountID;
  END IF;
END UpdateAanwezigheid;
/

CREATE OR REPLACE PROCEDURE UpdatePassword(username IN VARCHAR2, wachtwoord IN VARCHAR2)
IS
  accountID number(3);
  
  PROCEDURE getUser IS
    BEGIN
    SELECT "ID"
    INTO accountID
    FROM ACCOUNT
    WHERE "gebruikersnaam" = username;
  END getUser;
  
  PROCEDURE updatewachtwoord IS
  BEGIN
    UPDATE ACCOUNT
    SET "wachtwoord" = wachtwoord
    WHERE accountID = "ID";
  END updatewachtwoord;
  
BEGIN
  getUser();
  updatewachtwoord();
END;
/

CREATE OR REPLACE PROCEDURE RentItem(itemEdition_id IN NUMBER, userName IN VARCHAR2)
IS
accountID NUMBER(3);
resPbID   NUMBER(3);
price     NUMBER(3,2);
productID NUMBER(3);
verhuurID NUMBER(3);
dateStart DATE := TO_DATE('27-12-13', 'DD-MM-YY');
dateEnd   DATE := TO_DATE('30-12-13', 'DD-MM-YY');

PROCEDURE setVerhuurID IS
BEGIN
  SELECT MAX(ID)
  INTO verhuurID
  FROM VERHUUR;
verhuurID := verhuurID + 1;
END setVerhuurID;

PROCEDURE getProductID IS
BEGIN
  SELECT p."ID"
  INTO productID
  FROM PRODUCT p, PRODUCTEXEMPLAAR pe
  WHERE pe."product_id" = p."ID";
END getProductID;

PROCEDURE getProductPrice IS
BEGIN
  SELECT "prijs"
  INTO price
  FROM PRODUCT
  WHERE productID = "ID";
END getProductPrice;

PROCEDURE getAccountID IS
BEGIN
  SELECT "ID"
  INTO accountID
  FROM ACCOUNT 
  WHERE userName = "gebruikersnaam";
END getAccountID;

PROCEDURE getResPbID IS
BEGIN
  SELECT "ID"
  INTO resPbID
  FROM RESERVERING_POLSBANDJE
  WHERE accountID = "ID";
END getResPbID;

BEGIN
setVerhuurID();
getAccountID();
getResPbID();
getProductID();
getProductPrice();

INSERT INTO VERHUUR("ID", "productexemplaar_id", "res_pb_id", "datumIn", "datumUit", "prijs", "betaald") VALUES(verhuurID, itemEdition_id, resPbID, dateStart, dateEnd, price, 0);
END RentItem;
/
CREATE OR REPLACE PROCEDURE getberichten("berichtcursor" OUT SYS_REFCURSOR)
IS
BEGIN
OPEN "berichtcursor" FOR
  SELECT be."titel", ac."gebruikersnaam" , be."inhoud", be."likes", be."ongewenst"
  FROM BERICHT be, ACCOUNT_BIJDRAGE ba, ACCOUNT ac, BIJDRAGE b
  WHERE be."bijdrage_id" = b.ID
  AND ba."bijdrage_id" = b.ID
  AND ba."account_id" = ac.ID;
END;
/
CREATE OR REPLACE PROCEDURE insertbericht(p_titel IN VARCHAR2, p_tekst IN VARCHAR2, p_gebruikersnaam IN VARCHAR2)
IS
v_bijdrage_id number;
v_accbijdrag_id number;
v_accID number;

PROCEDURE hoogste_bijdrage_id
is
begin
  select max (b.ID)
  into v_bijdrage_id
  from bijdrage b;
  
  v_bijdrage_id := v_bijdrage_id + 1;
end hoogste_bijdrage_id;

PROCEDURE hoogst_account_bijdrage_id
IS
BEGIN
  SELECT MAX (a.ID)
  INTO v_accbijdrag_id
  FROM account_bijdrage a;
  
  v_accbijdrag_id := v_accbijdrag_id + 1;
END hoogst_account_bijdrage_id;

PROCEDURE haalgebruikerop
IS
BEGIN
  SELECT a.ID
  INTO v_accID
  FROM ACCOUNT a
  WHERE a."gebruikersnaam" = p_gebruikersnaam;
END haalgebruikerop;
  
BEGIN
  haalgebruikerop();
  hoogste_bijdrage_id();
  hoogst_account_bijdrage_id();
  INSERT INTO BIJDRAGE("ID","account_id","datum","soort") VALUES(v_bijdrage_id,v_accID,SYSDATE,'Bericht');
  INSERT INTO BERICHT("bijdrage_id","bijdrage_id_over","titel","inhoud","likes","ongewenst") VALUES(v_bijdrage_id,null,p_titel,p_tekst,0,0);
  INSERT INTO ACCOUNT_BIJDRAGE("ID","account_id","bijdrage_id","like","ongewenst")VALUES(v_accbijdrag_id,v_accID,v_bijdrage_id,'0','0');
END insertbericht;
/

CREATE OR REPLACE PROCEDURE insertComment(p_bericht_id IN NUMBER, p_tekst IN VARCHAR2, p_gebruikersnaam IN VARCHAR2)
IS
v_bijdrage_id number;
v_accbijdrag_id number;
v_accID number;

PROCEDURE hoogste_bijdrage_id
is
begin
  select max (b.ID)
  into v_bijdrage_id
  from bijdrage b;
  
  v_bijdrage_id := v_bijdrage_id + 1;
end hoogste_bijdrage_id;

PROCEDURE hoogst_account_bijdrage_id
IS
BEGIN
  SELECT MAX (a.ID)
  INTO v_accbijdrag_id
  FROM account_bijdrage a;
  
  v_accbijdrag_id := v_accbijdrag_id + 1;
END hoogst_account_bijdrage_id;

PROCEDURE haalgebruikerop
IS
BEGIN
  SELECT a.ID
  INTO v_accID
  FROM ACCOUNT a
  WHERE a."gebruikersnaam" = p_gebruikersnaam;
END haalgebruikerop;
  
BEGIN
  haalgebruikerop();
  hoogste_bijdrage_id();
  hoogst_account_bijdrage_id();
  INSERT INTO BIJDRAGE("ID","account_id","datum","soort") VALUES(v_bijdrage_id,v_accID,SYSDATE,'Bericht');
  INSERT INTO BERICHT("bijdrage_id","bijdrage_id_over","titel","inhoud","likes","ongewenst") VALUES(v_bijdrage_id,p_bericht_id,p_gebruikersnaam,p_tekst,0,0);
  INSERT INTO ACCOUNT_BIJDRAGE("ID","account_id","bijdrage_id","like","ongewenst")VALUES(v_accbijdrag_id,v_accID,v_bijdrage_id,'0','0');
END insertComment;
/

CREATE OR REPLACE PROCEDURE getAllUserProducts(p_userName IN VARCHAR2, "gereserveerdeItems" OUT SYS_REFCURSOR)
IS
v_polsbandjeID NUMBER;
v_resPbID      NUMBER;

BEGIN
  OPEN "gereserveerdeItems" FOR
    select pe."product_id", pe."ID"
    from POLSBANDJE pb, RESERVERING_POLSBANDJE rp , PRODUCTEXEMPLAAR pe, VERHUUR v, PRODUCT p, ACCOUNT a
    where pb.ID = rp."polsbandje_id"
    and rp.ID = v."res_pb_id"
    and v."productexemplaar_id" = pe.ID
    and pe."product_id" = p.ID
    and rp."account_id" = a.ID
    and a."gebruikersnaam" = p_userName;
END getAllUserProducts;
/

CREATE OR REPLACE PROCEDURE handInProduct(p_exemplaarID IN NUMBER)
IS
BEGIN
  DELETE FROM VERHUUR
  WHERE "productexemplaar_id" = p_exemplaarID;
END handInProduct;
/

CREATE OR REPLACE PROCEDURE verhuurExemplaar(p_userName IN VARCHAR2, p_exemplaarId IN NUMBER)
IS
  v_prijs        NUMBER;
  v_ID           NUMBER;
  v_resPbId      NUMBER;
  v_productId    NUMBER;
  ex_geenProduct EXCEPTION;
  ex_geenAccount EXCEPTION;
  
  PROCEDURE hoogst_verhuurNummer IS
  BEGIN
    SELECT MAX (v.ID)
    INTO v_ID
    FROM VERHUUR v;
    v_ID := v_ID + 1;
  END hoogst_verhuurNummer;
  
  PROCEDURE getPrijs IS
  BEGIN
    SELECT pe."product_id"
    INTO v_productId
    FROM PRODUCTEXEMPLAAR pe
    WHERE p_exemplaarId = pe."ID";
    
    SELECT p."prijs"
    INTO  v_prijs
    FROM PRODUCT p
    WHERE v_productId = p."ID";
    
    EXCEPTION
    WHEN NO_DATA_FOUND THEN 
      RAISE ex_geenProduct;
  END getPrijs;
  
  PROCEDURE getResPbID IS
  BEGIN
    SELECT rp.ID
    INTO v_resPbId
    FROM RESERVERING_POLSBANDJE rp, ACCOUNT a
    WHERE a.ID = rp."account_id"
    AND a."gebruikersnaam" = p_userName;
  
  EXCEPTION
    WHEN NO_DATA_FOUND THEN
      RAISE ex_geenAccount;
  END getResPbID;
  
BEGIN
  hoogst_verhuurNummer();
  getPrijs();
  getResPbID();
  INSERT INTO VERHUUR("ID","productexemplaar_id","res_pb_id","datumIn","datumUit","prijs","betaald") VALUES(v_ID,p_exemplaarId,v_resPbId,SYSDATE,SYSDATE,v_prijs,0);
  
  EXCEPTION 
    WHEN ex_geenProduct THEN 
      RAISE_APPLICATION_ERROR(-20000,'Geen product gevonden');
    WHEN ex_geenAccount THEN
      RAISE_APPLICATION_ERROR(-20000, 'Geen account gevonden');
END verhuurExemplaar;
/

CREATE OR REPLACE PROCEDURE getPostIdTitle (p_titel IN VARCHAR2,  p_post_id OUT NUMBER)
IS
BEGIN
  SELECT b."bijdrage_id" 
  INTO p_post_id
  FROM bericht b
  WHERE b."titel" = p_titel;
END getPostIdTitle;

/

CREATE OR REPLACE PROCEDURE updateLikes (p_id IN NUMBER)
IS
BEGIN
  UPDATE BERICHT b
  SET b."likes" = b."likes" + 1
  WHERE b."bijdrage_id" = p_id;
END updateLikes;
/

CREATE OR REPLACE PROCEDURE updateOngewenst (p_id IN NUMBER)
IS
  v_aantalongewenst number(3);
  v_commentId number(3) DEFAULT 0;
  v_aantalComments number(3) DEFAULT 0;
BEGIN
  UPDATE BERICHT b
  SET b."ongewenst" = b."ongewenst" + 1
  WHERE b."bijdrage_id" = p_id;
  
  SELECT b."ongewenst"
  INTO v_aantalongewenst
  FROM BERICHT b
  WHERE b."bijdrage_id" = p_id;
  
  IF v_aantalongewenst > 5 THEN
    
    SELECT s."bijdrage_id"--selecteert comments
    INTO v_commentId
    FROM BERICHT s
    WHERE s."bijdrage_id_over" = p_id;
    
    IF v_commentId != 0 THEN
    
      SELECT COUNT (s."bijdrage_id")--tel comments
      INTO v_aantalComments
      FROM BERICHT s
      WHERE s."bijdrage_id_over" = p_id;
      
      DELETE FROM BERICHT b--verwijder comment bericht
      WHERE b."bijdrage_id" = v_commentId;
    
      DELETE FROM ACCOUNT_BIJDRAGE y--verwijder comment bijdrage
      WHERE y."bijdrage_id" = v_commentId;
    
      DELETE FROM BIJDRAGE x -- verwijder bijdrage
      WHERE x.ID = v_commentId;
    END IF;
    
    DELETE FROM BERICHT b
    WHERE b."bijdrage_id" = p_id;
    
    DELETE FROM ACCOUNT_BIJDRAGE y
    WHERE y."bijdrage_id" = p_id;
    
    DELETE FROM BIJDRAGE x
    WHERE x.ID = p_id;
    
  END IF;
END updateOngewenst;
/
CREATE OR REPLACE PROCEDURE ChangePassword (p_username IN VARCHAR2, p_newPassword IN VARCHAR2)
IS
BEGIN
  UPDATE ACCOUNT A
  SET A."wachtwoord" = p_newPassword
  WHERE A."gebruikersnaam" = p_username;
END ChangePassword;