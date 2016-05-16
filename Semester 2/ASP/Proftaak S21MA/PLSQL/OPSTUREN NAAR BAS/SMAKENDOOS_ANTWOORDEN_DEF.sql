--1A en 1B
-- Hier kijk ik in de database of de ingevoerde zoekterm bestaat, zo ja: haal alle gegevens van die item op.
CREATE OR REPLACE FUNCTION CheckInvoer (p_zoekfunctie IN VARCHAR2)
RETURN sys_refcursor
IS
  v_rc sys_refcursor;
  v_tt sys_refcursor;
  
BEGIN
  OPEN v_rc for 
  SELECT * FROM ITEM
  where Naam = p_zoekfunctie;

--1C
--als de cursor leeg is, dan worden de tien producten met de hoogste score opgehaald en terug gestuurd
  IF v_rc%notfound THEN
    OPEN v_tt FOR
      SELECT * FROM (SELECT *
      FROM ITEM
      ORDER BY LikeAantal DESC)A
      WHERE ROWNUM <11;
      RETURN v_tt;
  END IF;
  RETURN v_rc;
END;
/



--2A
-- Ik zoek alle accountID ( personen)die een ingegeven product hebben geliked
create or replace function CheckLikes
(
  p_input varchar2
)
  return sys_refcursor
AS
  v_rc sys_refcursor;
begin
  open v_rc
  for select accountid
      from rating
      where ratingvalue = 1
      AND productid IN (select id
                        from item
                        where naam = p_input);
  return v_rc;   
end;
/
--2B
-- De functies eerst, onderaan staat de procedure.
-- Ik heb alle accountID's, nu wil ik de producten zoeken die al deze account ID's geliked hebben.
create or replace function HaalProductenOP
(
  p_rcInput sys_refcursor
)
 return sys_refcursor
AS
  v_rc sys_refcursor;
  v_product varchar2(255);
begin
LOOP
  FETCH p_rcInput INTO v_product;
  EXIT WHEN p_rcInput%NOTFOUND;
  open v_rc
  for select productid
      from rating
      where accountid = v_product;
END LOOP;
return v_rc;
END;
/

create or replace function SortProducten
(
  p_rcInput sys_refcursor
)
 return sys_refcursor
AS
  v_rc sys_refcursor;
  v_product varchar2(255);
begin
LOOP
  FETCH p_rcInput INTO v_product;
  EXIT WHEN p_rcInput%NOTFOUND;
  open v_rc
  for select *
      from item
      where ID = v_product
      order by LikeAantal;
END LOOP;
return v_rc;
END;
/

--procedure die alle bovensstaande functies van 2B gebruikt

create or replace procedure ShowProducten
( 
  p_productnaam varchar2
)
as
 v_rc1 sys_refcursor;
 v_rc2 sys_refcursor;
 v_rc3 sys_refcursor;
 v_product varchar2(255);
begin
-- Eerst roep ik de functie aan die de accountid's die geliked hebben toevoegd aan een refcursor
  v_rc1 := CheckLikes(p_productnaam);
-- Met die accountIDs ga ik de producten ophalen die door deze accounts geliked zijn
  v_rc2 := HaalProductenOP(v_rc1);
-- Als ik de producten heb (alle productid's) wil ik alle producten orderen op hun LikeAantal
  v_rc3 := SortProducten(v_rc2);
  
-- nadat ik alle producten( met alle gegevens) in de laatste refcursor heb, wil ik ze een voor een laten zien.
  LOOP
    FETCH v_rc3 INTO v_product;
    EXIT WHEN v_rc3%NOTFOUND;
    dbms_output.put_line(v_product);
  END LOOP;
end;
/
  

--2C
-- Ik zoek alle accountID ( personen)die een ingegeven product hebben geliked binnen een bepaalde/ingegeven categorie
create or replace function CheckLikesCategorie
(
  p_input varchar2,
  p_categorie varchar2
)
  return sys_refcursor
AS
  v_rc sys_refcursor;
begin
  open v_rc
  for select accountid
      from rating
      where ratingvalue = 1
      AND productid IN (select id
                        from item
                        where naam = p_input
                        AND CategorieNaam = p_categorie );
  return v_rc;   
end;
/

create or replace procedure ShowProductenCategorie
( 
  p_productnaam varchar2,
  p_categorie varchar2
)
as
 v_rc1 sys_refcursor;
 v_rc2 sys_refcursor;
 v_rc3 sys_refcursor;
 v_product varchar2(255);
begin
-- Eerst roep ik de functie aan die de accountid's die geliked hebben toevoegd aan een refcursor
  v_rc1 := CheckLikesCategorie(p_productnaam,p_categorie);
-- Met die accountIDs ga ik de producten ophalen die door deze accounts geliked zijn
  v_rc2 := HaalProductenOP(v_rc1);
-- Als ik de producten heb (alle productid's) wil ik alle producten orderen op hun LikeAantal
  v_rc3 := SortProducten(v_rc2);
  
-- nadat ik alle producten( met alle gegevens) in de laatste refcursor heb, wil ik ze een voor een laten zien.
  LOOP
    FETCH v_rc3 INTO v_product;
    EXIT WHEN v_rc3%NOTFOUND;
    dbms_output.put_line(v_product);
  END LOOP;
end;
/

--3A
--Hier geef je je input op en wordt er een like aangemaakt doormiddel van een insert en update
CREATE OR REPLACE PROCEDURE geef_like (p_accountID IN NUMBER, p_itemID IN NUMBER, p_ratingSoort IN VARCHAR2)
IS
v_rating_value NUMBER(2);
BEGIN
  IF p_ratingSoort = 'Like'
    THEN
    INSERT INTO RATING(AccountID,ProductID,RatingValue) VALUES(p_accountID, p_itemID, 1);
    
    UPDATE ITEM
    SET LikeAantal = LikeAantal+1
    WHERE ID = p_itemID;
  END IF;
--3B
--Hier wordt een dislike toegevoegd aan de database doormiddel van een insert en update
  IF p_ratingSoort = 'Dislike'
    THEN
    INSERT INTO RATING(AccountID,ProductID,RatingValue) VALUES(p_accountID, p_itemID, -1);
    UPDATE ITEM
    SET LikeAantal = LikeAantal -1
    WHERE ID = p_itemID;
  END IF;

--3C
--Eerst kijk ik of dezelfde persoon al een rating heeft gegeven op hezelfde item
  SELECT RatingValue
  INTO v_rating_value
  FROM RATING
  WHERE accountID = p_accountID
  AND productID = p_itemID;

--Als een item voor de 2e keer wordt geliked, dan wordt de rating verwijderd en de score aangepast  
    IF v_rating_value = 1 AND p_ratingSoort = 'Like'
    THEN
    DELETE FROM RATING
    WHERE AccountID= p_accountID AND ProductID= p_itemID; 
    
    UPDATE ITEM
    SET LikeAantal = LikeAantal -1
    WHERE ID = p_itemID;
  END IF;

--Als een geliked item wordt gedisliked, dan veranderd de rating naar een dislike en wordt de score afgetrokken.  
    IF v_rating_value = 1 AND p_ratingSoort = 'DisLike'
    THEN
    UPDATE RATING
    SET RatingValue = -1
    WHERE accountID = p_accountID 
    AND ProductID= p_itemID; 
    
    UPDATE ITEM
    SET LikeAantal = LikeAantal -1
    WHERE ID = p_itemID;
  END IF;

--Als een gedisliked item wordt geliked, dan veranderd de rating naar een like en wordt de score opgetelt.   
    IF v_rating_value = -1 AND p_ratingSoort = 'Like'
    THEN
    UPDATE RATING
    SET RatingValue = 1
    WHERE accountID = p_accountID 
    AND ProductID= p_itemID; 
    
    UPDATE ITEM
    SET LikeAantal = LikeAantal +1
    WHERE ID = p_itemID;
  END IF;

--Als een item voor de 2e keer wordt gedisliked, dan wordt de rating verwijderd en de score aangepast      
    IF v_rating_value = -1 AND p_ratingSoort = 'Dislike'
    THEN
    DELETE FROM RATING
    WHERE AccountID= p_accountID AND ProductID= p_itemID; 
    
    UPDATE ITEM
    SET LikeAantal = LikeAantal +1
    WHERE ID = p_itemID;
  END IF;
  
END;
/


