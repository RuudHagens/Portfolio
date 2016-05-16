CREATE OR REPLACE FUNCTION CheckInvoer (p_zoekfunctie IN VARCHAR2)
RETURN sys_refcursor
IS
  v_rc sys_refcursor;
  v_tt sys_refcursor;
  
BEGIN
  OPEN v_rc for 
  SELECT * FROM ITEM
  where Naam = p_zoekfunctie;
  
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

CREATE OR REPLACE PROCEDURE geef_like 
(
  p_accountID IN NUMBER,
  p_itemID IN NUMBER,
  p_ratingSoort IN VARCHAR2
)
IS
v_rating_value NUMBER(2);
BEGIN

  SELECT RatingValue
  INTO v_rating_value
  FROM RATING
  WHERE accountID = p_accountID
  AND productID = p_itemID;
  
  IF p_ratingSoort = 'Like'
    THEN
    INSERT INTO RATING(AccountID,ProductID,RatingValue) VALUES(p_accountID, p_itemID, 1);
    
    UPDATE ITEM
    SET LikeAantal = LikeAantal+1
    WHERE ID = p_itemID;
  END IF;
  
  IF p_ratingSoort = 'Dislike'
    THEN
    INSERT INTO RATING(AccountID,ProductID,RatingValue) VALUES(p_accountID, p_itemID, -1);
    UPDATE ITEM
    SET LikeAantal = LikeAantal -1
    WHERE ID = p_itemID;
  END IF;
  
  IF v_rating_value = 1 AND p_ratingSoort = 'Like'
    THEN
    DELETE FROM RATING
    WHERE AccountID= p_accountID AND ProductID= p_itemID; 
    
    UPDATE ITEM
    SET LikeAantal = LikeAantal -1
    WHERE ID = p_itemID;
  END IF;
  
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




