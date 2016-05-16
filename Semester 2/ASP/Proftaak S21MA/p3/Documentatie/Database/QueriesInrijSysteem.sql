-- normaal spoor
select SPOORNR, SECTORNR from(
  Select * from Sector
  
  Where STATUSSECTORNR = '3'
  AND (spoornr != '40' 
    AND spoornr != '37'
    AND spoornr != '42' 
    AND spoornr != '56' 
    AND spoornr != '54'
    AND spoornr != '35'
    AND spoornr != '33'
    AND spoornr != '30'
    AND spoornr != '57'
    AND spoornr not between '74' and '77' 
    AND spoornr not between '12' and '21')
  order by SECTORNR asc
  ) alles
Where ROWNUM = 1
;

-- tram 11g spoor
select SPOORNR, SECTORNR from(
  Select * from Sector
  
  Where STATUSSECTORNR = '3'
  AND( spoornr = '37'
    OR spoornr = '42' 
    OR spoornr = '56' 
    OR spoornr = '54')
  order by SECTORNR asc
  ) alles
Where ROWNUM = 1
;

-- tram 12g spoor
select SPOORNR, SECTORNR from(
  Select * from Sector
  
  Where STATUSSECTORNR = '3'
  AND( spoornr = '35'
    OR spoornr = '33' 
    OR spoornr = '30' 
    OR spoornr = '57')
  order by SECTORNR asc
  ) alles
Where ROWNUM = 1
;

-- Onderhoud spoor
select SPOORNR, SECTORNR from(
  Select * from Sector
  
  Where STATUSSECTORNR = '3'
  AND spoornr between '74' and '77'
  order by SECTORNR asc
  ) alles
Where ROWNUM = 1;



-- Schoonmaak spoor
select SPOORNR, SECTORNR from(
  Select * from Sector
  
  Where STATUSSECTORNR = '3'
  AND spoornr between '12' and '21'
  order by SECTORNR asc
  ) alles
Where ROWNUM = 1;

-- 11G tramtype
select BESCHRIJVING from TRAMTYPE
where TRAMTYPENR = (
select TRAMTYPENR from TRAM
where TRAMNR = :tramNr);