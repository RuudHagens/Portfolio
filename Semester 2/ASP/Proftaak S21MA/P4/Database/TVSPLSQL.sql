CREATE OR REPLACE PROCEDURE AantalOnderhoudPerJaar(OnderhoudAantalJaarCursor OUT SYS_REFCURSOR)
IS
BEGIN
  OPEN OnderhoudAantalJaarCursor FOR
  SELECT GroteServiceBeurtenPerJaar,KleineServiceBeurtenPerJaar,GroteSchoonmaakBeurtenPerJaar,KleineSchoonmaakBeurtenPerJaar 
  FROM ONDERHOUD;
END AantalOnderhoudPerJaar;
/

CREATE OR REPLACE PROCEDURE AantalOnderhoudPerDag(OnderhoudAantalDagCursor OUT SYS_REFCURSOR)
IS
BEGIN
  OPEN OnderhoudAantalDagCursor FOR
  SELECT GroteServiceBeurtenPerDag, KleineServiceBeurtenPerDag, GroteSchoonmaakBeurtenPerDag, KleineSchoonmaakBeurtenPerDag 
  FROM REMISE
  WHERE Naam = 'Remise Havenstraat';
END AantalOnderhoudPerDag;
/






create or replace PROCEDURE TramInOnderhoud(p_SoortBeurt IN VARCHAR2, p_persoon IN VARCHAR2, p_tramnr IN NUMBER, p_beschrijving IN VARCHAR2)
IS
  v_onderhoudID           NUMBER(4);
  v_persoonID             NUMBER(4);
  v_tramID                NUMBER(4);
  v_aantalbeurten         NUMBER(4);
  v_soortdagBeurt         VARCHAR2 (255);
  v_aatalSoortdagBeurt    NUMBER(4);
  v_begindatum            DATE;
  
  PROCEDURE VolgendID IS
    BEGIN
      SELECT MAX(ID)
      INTO v_onderhoudID
      FROM TRAM_ONDERHOUD;
  END VolgendID;
  
  PROCEDURE PersoonIdBijNaam IS
    BEGIN
      SELECT ID
      INTO v_persoonID
      FROM Medewerker
      WHERE naam = p_persoon;
  END PersoonIdBijNaam;

  PROCEDURE TramIdBijNummer IS
    BEGIN
      SELECT ID
      INTO v_tramID
      FROM Tram
      WHERE nummer = p_tramnr;
  END TramIdBijNummer;
  
  PROCEDURE TelBeurtenOp IS
    BEGIN
      SELECT COUNT(ID)
      INTO v_aantalbeurten
      FROM Tram_Onderhoud
      WHERE TypeOnderhoud = p_SoortBeurt
      AND trunc(DatumTijdstip) = trunc(v_begindatum); 
  END;
  
  PROCEDURE TelBeurtenPerDag IS
    BEGIN
      IF p_SoortBeurt = 'KleineServiceBeurt'
      THEN
        SELECT KleineServiceBeurtenPerDag
        INTO v_aatalSoortdagBeurt
        FROM Remise
        WHERE Naam = 'Remise Havenstraat';
      ELSIF p_SoortBeurt = 'GroteServiceBeurt'
      THEN
        SELECT GroteServiceBeurtenPerDag
        INTO v_aatalSoortdagBeurt
        FROM Remise
        WHERE Naam = 'Remise Havenstraat';
      ELSIF p_SoortBeurt = 'KleineSchoonmaakBeurt'
      THEN
        SELECT KleineSchoonmaakBeurtenPerDag
        INTO v_aatalSoortdagBeurt
        FROM Remise
        WHERE Naam = 'Remise Havenstraat';
      ELSIF p_SoortBeurt = 'GroteSchoonmaakBeurt'
      THEN
        SELECT GroteSchoonmaakBeurtenPerDag
        INTO v_aatalSoortdagBeurt
        FROM Remise
        WHERE Naam = 'Remise Havenstraat';        
      END IF;
  END;

BEGIN
v_begindatum := SYSDATE;
DBMS_OUTPUT.PUT_LINE(v_begindatum);
TelBeurtenOp();
TelBeurtenPerDag();
WHILE v_aantalbeurten >= v_aatalSoortdagBeurt
  LOOP
    v_begindatum := v_begindatum + interval '1' day;
    TelBeurtenOp();
  END LOOP;
  VolgendID();
  PersoonIdBijNaam();
  TramIdBijNummer();
  v_onderhoudID := v_onderhoudID+1;
  Insert into TRAM_ONDERHOUD(ID,Medewerker_ID,Tram_ID,DatumTijdstip,BeschikbaarDatum,EindDatum,TypeOnderhoud,Beschrijving) 
  Values (v_onderhoudID,v_persoonID,v_tramID,v_begindatum,TO_DATE('01-01-0001','DD-MM-YYYY'),TO_DATE('01-01-0001','DD-MM-YYYY'),p_SoortBeurt,p_beschrijving);
END;
/

SELECT SYSDATE FROM DUAL;

      SELECT *
      FROM Tram_Onderhoud
      WHERE TypeOnderhoud = 'GroteSchoonmaakBeurt'
      AND trunc(DatumTijdstip) = trunc(SYSDATE);
      
select naam
from medewerker
where functie_id = 5;