-- Which branch (army/navy/etc.) had highest average deployment over all years?
SELECT 
    COUNT(*) AS total_rows,
    ROUND(SUM(army) / COUNT(*), 2) AS avg_army,
    ROUND(SUM(navy) / COUNT(*), 2) AS avg_navy,
    ROUND(SUM(air) / COUNT(*), 2) AS avg_air,
    ROUND(SUM(marine) / COUNT(*), 2) AS avg_marine
FROM
    troop_stats.troopdataeu;
-- Compare number of deployments in years (2006–2010) vs (2011–2015)
select 
case
	when year between 2006 and 2010 then '2006-2010'
    when year between 2011 and 2015 then '2011-2015'
    end as period,
    sum(troops) as total_deployment,
    round(avg(troops),2) as avg_deployement_per_year
    from troop_stats.troopdataeu where year between 2006 and 2015 group by period;

-- What was the proportion % of each branch to total troops per year?
WITH yearly_totals AS (
  SELECT 
    year,
    SUM(troops) AS total_troops,
    SUM(army) AS total_army,
    SUM(navy) AS total_navy,
    SUM(air) AS total_air,
    SUM(marine) AS total_marine
  FROM troop_stats.troopdataeu
  GROUP BY year
)
SELECT 
  year,
  total_troops,
  ROUND((total_army / total_troops) * 100, 2) AS army_percent,
  ROUND((total_navy / total_troops) * 100, 2) AS navy_percent,
  ROUND((total_air / total_troops) * 100, 2) AS air_percent,
  ROUND((total_marine / total_troops) * 100, 2) AS marine_percent
FROM yearly_totals
ORDER BY year;

-- Flag countries where navy > air + army (unusual deployment patterns)
SELECT 
  country, year, navy,  army, air,
  (navy - (army + air)) AS navy_surplus
FROM troop_stats.troopdataeu
WHERE navy > (army + air);