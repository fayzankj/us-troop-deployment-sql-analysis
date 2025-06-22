-- create database troop_stats
-- Inspection phase 
SELECT 
    *
FROM
    troop_stats.troopdataeu;
SELECT 
    COUNT(*)
FROM
    troop_stats.troopdataeu;

-- Null Check
SELECT 
    COUNT(*) AS total_rows,
    SUM(CASE
        WHEN country IS NULL THEN 1
        ELSE 0
    END) AS null_country,
    SUM(CASE
        WHEN code IS NULL THEN 1
        ELSE 0
    END) AS null_code,
    SUM(CASE
        WHEN iso3c IS NULL THEN 1
        ELSE 0
    END) AS null_iso3c,
    SUM(CASE
        WHEN year IS NULL THEN 1
        ELSE 0
    END) AS null_year,
    SUM(CASE
        WHEN troops IS NULL THEN 1
        ELSE 0
    END) AS null_troops,
    SUM(CASE
        WHEN army IS NULL THEN 1
        ELSE 0
    END) AS null_army,
    SUM(CASE
        WHEN navy IS NULL THEN 1
        ELSE 0
    END) AS null_navy,
    SUM(CASE
        WHEN air IS NULL THEN 1
        ELSE 0
    END) AS null_air,
    SUM(CASE
        WHEN marine IS NULL THEN 1
        ELSE 0
    END) AS null_marine
FROM
    troop_stats.troopdataeu;

-- Duplicate Audit
SELECT 
    country, code, iso3c, year, COUNT(*)
FROM
    troop_stats.troopdataeu
GROUP BY country , code , iso3c , year
HAVING COUNT(*) > 1;
-- Logical Validation: Troops = Army + Navy + Air + Marine
SELECT 
    *
FROM
    troop_stats.troopdataeu
WHERE
    troops IS NOT NULL
        AND (army + navy + air + marine) != troops;
      
SELECT 
    country,
    year,
    troops,
    army,
    navy,
    air,
    marine,
    (army + navy + air + marine) AS sum_of_branches
FROM
    troop_stats.troopdataeu
WHERE
    troops IS NOT NULL
        AND (army + navy + air + marine) != troops;
  
UPDATE troop_stats.troopdataeu 
SET 
    troops = 8494
WHERE
    country = 'United Kingdom'
        AND year = 2014
        AND troops = 8495;







