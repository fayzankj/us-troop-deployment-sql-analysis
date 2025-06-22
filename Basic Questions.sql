-- 📍 Basic Questions
-- Total number of deployments (troops) by year
SELECT 
    year, SUM(troops) AS total_deployments
FROM
    troop_stats.troopdataeu
GROUP BY year;
-- Top 10 countries with most deployed troops
SELECT 
    country, SUM(troops) AS total_deployments
FROM
    troop_stats.troopdataeu
GROUP BY country
ORDER BY total_deployments DESC
LIMIT 10;
-- Year-wise trend of troops in a specific country
SELECT 
    country, year, troops
FROM
    troop_stats.troopdataeu
WHERE
    country = 'Germany'
ORDER BY year; 
-- Which countries had increasing deployment over the years?
select country, year, troops, lag(troops) over (PARTITION BY country ORDER BY year) from troop_stats.troopdataeu;