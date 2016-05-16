CREATE OR REPLACE FUNCTION CheckInvoer (p_zoekfunctie IN VARCHAR2)
RETURN sys_refcursor
IS
  v_rc sys_refcursor;
  
BEGIN
  OPEN v_rc for 
  SELECT * FROM ITEM
  where Naam = p_zoekfunctie;
  
  RETURN v_rc;
END;
/

--zoekt de producten in de database
/*
CREATE OR REPLACE FUNCTION ZOEK_PRODUCT(
p_invoer varchar2, p_zoekfunctie IN VARCHAR2)
return sys_refcursor
is 
v_uitvoer sys_refcursor;

begin 
--zoek alle producten met dezelfde naam, deze komen in de cursor.
  EXECUTE IMMEDIATE 'SELECT NAAM,LIKEAANTAL
  FROM '|| p_invoer ||'
  WHERE UPPER(Naam)= UPPER(p_zoekfunctie);'
  into v_uitvoer;
return v_uitvoer;
end;
*/

--Haal producten- op van zoekfunctie en controleer of hij bestaat of niet
/*
CREATE OR REPLACE FUNCTION CheckInvoer (p_zoekfunctie IN VARCHAR2)
RETURN sys_refcursor
IS
  v_rc sys_refcursor;
  
BEGIN
  v_rc := ZOEK_PRODUCT('Acteur',p_zoekfunctie);
  v_rc := v_rc || ZOEK_PRODUCT('Artiest',p_zoekfunctie);
  v_rc := v_rc || ZOEK_PRODUCT('Auteur',p_zoekfunctie);
  v_rc := v_rc || ZOEK_PRODUCT('Film',p_zoekfunctie);
  v_rc := v_rc || ZOEK_PRODUCT('Game',p_zoekfunctie);
  v_rc := v_rc || ZOEK_PRODUCT('Muziek',p_zoekfunctie);
  v_rc := v_rc || ZOEK_PRODUCT('Show',p_zoekfunctie);
  
  RETURN v_rc;
END;
*/




