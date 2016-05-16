--------------------------------------------------------------------------------
-- Hulp functies
--------------------------------------------------------------------------------

--Acteur
create or replace function checkOfActeur
(
    p_naam varchar2
    
    
)
  return sys_refcursor
AS
  v_refcursor sys_refcursor;   
    
BEGIN

  open v_refcursor
  for SELECT DISTINCT r.accountid as Accountid
    from rating r, account a
    where r.productid = (select productid
                      from Acteur
                      where naam = p_naam);
  return v_refcursor;
            
end;
/


--Auteur
create or replace function checkOfAuteur
(
    p_naam varchar2
)
  return sys_refcursor
AS
    v_refcursor sys_refcursor;
    
begin

  open v_refcursor
  for SELECT DISTINCT r.accountid as Accountid
    from rating r, account a
    where r.productid = (select productid
                      from Auteur
                      where naam = p_naam);
  return v_refcursor;
            
end;
/


--Acteur
create or replace function checkOfActeur
(
    p_naam varchar2
)
  return sys_refcursor
AS
    v_refcursor sys_refcursor;
    
begin

  open v_refcursor
  for SELECT DISTINCT r.accountid as Accountid
    from rating r, account a
    where r.productid = (select productid
                      from Acteur
                      where naam = p_naam);
  return v_refcursor;
            
end;
/

--Show
create or replace function checkOfShow
(
    p_naam varchar2
)
  return sys_refcursor
AS
    v_refcursor sys_refcursor;
    
begin

  open v_refcursor
  for SELECT DISTINCT r.accountid as Accountid
    from rating r, account a
    where r.productid = (select productid
                      from Show
                      where naam = p_naam);
  return v_refcursor;
            
end;
/

--Film
create or replace function checkOfFilm
(
    p_naam varchar2
)
  return sys_refcursor
AS
    v_refcursor sys_refcursor;
    
begin

  open v_refcursor
  for SELECT DISTINCT r.accountid as Accountid
    from rating r, account a
    where r.productid = (select productid
                      from Film
                      where naam = p_naam);
  return v_refcursor;
            
end;
/

--Game
create or replace function checkOfGame
(
    p_naam varchar2
)
  return sys_refcursor
AS
    v_refcursor sys_refcursor;
    
begin

  open v_refcursor
  for SELECT DISTINCT r.accountid as Accountid
    from rating r, account a
    where r.productid = (select productid
                      from Game
                      where naam = p_naam);
  return v_refcursor;
            
end;
/

--Muziek
create or replace function checkOfMuziek
(
    p_naam varchar2
)
  return sys_refcursor
AS
    v_refcursor sys_refcursor;
    
begin

  open v_refcursor
  for SELECT DISTINCT r.accountid as Accountid
    from rating r, account a
    where r.productid = (select productid
                      from Muziek
                      where naam = p_naam);
  return v_refcursor;
            
end;
/




--------------------------------------------------------------------------------
--Nieuwe db
--------------------------------------------------------------------------------
select accountid
from rating
where ratingvalue = 1
AND productid = (select id
                  from item
                  where naam = :naam);









