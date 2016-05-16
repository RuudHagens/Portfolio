--Haal producten op van zoekfunctie en controleer of hij bestaat of niet
CREATE OR REPLACE FUNCTION CheckInvoer (p_zoekfunctie IN VARCHAR2, p_resultaat OUT VARCHAR2)
RETURN VARCHAR2
IS
  v_resultaat VARCHAR2(100) :='';
  p_resultaat VARCHAR2(255) :='';
BEGIN
  DECLARE
    CURSOR naam_acteur_cursor IS 
		SELECT Naam 
    FROM ACTEUR AC
		WHERE  AC.NAAM = P_zoekfunctie;
  BEGIN
      FOR v_resultaat IN naam_acteur_cursor LOOP
      p_resultaat := p_resultaat + v_resultaat;
    END LOOP;
  END;
  
  DECLARE
    CURSOR naam_artiest_cursor IS 
		SELECT Naam 
    FROM ARTIEST AR
		WHERE  AR.NAAM = P_zoekfunctie;
  BEGIN
      FOR v_resultaat IN naam_artiest_cursor LOOP
      p_resultaat := p_resultaat + v_resultaat;
    END LOOP;
  END;
  
  DECLARE
    CURSOR naam_auteur_cursor IS 
		SELECT Naam 
    FROM AUTEUR AU
		WHERE  AU.NAAM = P_zoekfunctie;
  BEGIN
      FOR v_resultaat IN naam_auteur_cursor LOOP
      p_resultaat := p_resultaat + v_resultaat;
    END LOOP;
  END;
  
  DECLARE
    CURSOR naam_film_cursor IS 
		SELECT Naam 
    FROM FILM F
		WHERE  F.NAAM = P_zoekfunctie;
  BEGIN
      FOR v_resultaat IN naam_film_cursor LOOP
      p_resultaat := p_resultaat + v_resultaat;
    END LOOP;
  END;
  
  DECLARE
    CURSOR naam_game_cursor IS 
		SELECT Naam 
    FROM GAME G
		WHERE  G.NAAM = P_zoekfunctie;
  BEGIN
      FOR v_resultaat IN naam_game_cursor LOOP
      p_resultaat := p_resultaat + v_resultaat;
    END LOOP;
  END;
  
  DECLARE
    CURSOR naam_muziek_cursor IS 
		SELECT Naam 
    FROM MUZIEK M
		WHERE  M.NAAM = P_zoekfunctie;
  BEGIN
      FOR v_resultaat IN naam_muziek_cursor LOOP
      p_resultaat := p_resultaat + v_resultaat;
    END LOOP;
  END;
  
  DECLARE
    CURSOR naam_show_cursor IS 
		SELECT Naam 
    FROM SHOW S
		WHERE  S.NAAM = P_zoekfunctie;
  BEGIN
      FOR v_resultaat IN naam_show_cursor LOOP
      p_resultaat := p_resultaat + v_resultaat;
    END LOOP;
  END;
  
  RETURN p_resultaat;
END;