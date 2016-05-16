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

SELECT distinct M.naam, F.naam AS functie, R.Omschrijving AS recht
FROM TRAM_ONDERHOUD T_O, MEDEWERKER M, FUNCTIE F, FUNCTIE_RECHT F_R, RECHT R
WHERE M.ID = T_O.Medewerker_ID
AND F_R.Functie_ID = M.Functie_ID
AND F.ID = F_R.Functie_ID
AND R.ID = F_R.Recht_ID;