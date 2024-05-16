SELECT *
FROM coronavirus.`corona virus dataset csv`
WHERE Province IS NULL OR
	  Country_Region IS NULL OR
      Latitude IS NULL OR
      Longitude IS NULL OR
      Date IS NULL OR
      Confirmed IS NULL OR
      Deaths IS NULL OR
      Recovered IS NULL ;
      
      UPDATE coronavirus.`corona virus dataset csv`
SET 
Province = COALESCE (Province, 'Not Available'),
Country_Region = COALESCE (Country_Region, 'Not Available'),
 Latitude  = COALESCE (Latitude, 0.0),
 Longitude = COALESCE (Longitude, 0.0),
 Date = COALESCE (Data, '1970-01-01', DATE),
  Confirmed = COALESCE ( Confirmed, 0 ),
  Deaths = COALESCE ( Deaths, 0 ),
  Recovered = COALESCE ( Recovered, 0 );
  
  SELECT COUNT( * ) AS total_rows
FROM `corona virus dataset csv`


SELECT MIN( Date ) AS start_date, MAX(Date) AS end_date,
FROM `corona virus dataset csv`

SELECT EXTRACT ( MONTH(date)) AS month_number, COUNT(*) as month_count
FROM coronavirus.`corona virus dataset csv`
GROUP BY month_number
ORDER BY month_number;

SELECT
EXTRACT( YEAR FROM DATE ) AS year_num,
EXTRACT( MONTH FROM DATE ) AS month_num,
ROUND(AVG(Confirmed),2) AS confirmed_avg,
ROUND(AVG(Deaths),2) AS deaths_avg,
ROUND(AVG(Recovered),2) AS recovered_avg
FROM coronavirus.`corona virus dataset csv`
GROUP BY year_num, month_num
ORDER BY year_num, month_num ASC;

WITH FrequentValues AS(
SELECT
EXTRACT( YEAR FROM DATE ) AS month_num,
EXTRACT( YEAR FROM DATE ) AS year_num,
Confirmed,
Deaths,
Recovered,
Rank() OVER (PARTITION BY EXTRACT (MONTH ( Date)),
EXTRACT( YEAR FROM DATE ) 
ORDER BY (COUNT(*) ) DESC AS rank 
FROM coronavirus.`corona virus dataset csv`
GROUP BY 
EXTRACT( MONTH FROM DATE ),EXTRACT( YEAR FROM DATE ), confirmed,Deaths, Recovered
)
SELECT
month_num,
year_num,
Confirmed,
Deaths,
Recovered
FROM
FrequentValues 
WHERE
rank=1
ORDER BY 
year_num, month_num ASC;

SELECT
EXTRACT( YEAR FROM Date ) AS year_num,
MAX(Confirmed)AS max_confirmed
MAX(Deaths)AS max_deaths,
MAX(Recoverd)AS max_recovered
FROM `corona virus dataset csv`
GROUP BY year_num
ORDER BY year_num ASC;

SELECT
EXTRACT( YEAR FROM Date ) AS year_num,
EXTRACT( MONTH FROM Date  ) AS month_num,
SUM (Confirmed) AS total_confirmed,
SUM (Deaths) AS total_deaths,
SUM (Recovered) AS total_recovered,
FROM `corona virus dataset csv`
GROUP BY year_num, month_num
ORDER BY year_num, month_num ASC;

SELECT
EXTRACT( YEAR FROM Date ) AS year_num,
EXTRACT( MONTH FROM Date ) AS month_num,
SUM (Confirmed) AS total_confirmed,
ROUND(AVG (Confirmed),2)AS avg_confirmed,
ROUND(VARIANCE (Confirmed),2)AS VARIANCE_confirmed,
ROUND(STDDEV (Confirmed),2)AS standard_dev_confirmed,
FROM `corona virus dataset csv`
GROUP BY year_num, month_num
ORDER BY year_num, month_num ASC;

SELECT
EXTRACT( YEAR FROM Date ) AS year_num,
EXTRACT( MONTH FROM Date ) AS month_num,
SUM (Deaths) AS total_Deaths,
ROUND(AVG (Deaths),2)AS avg_Deaths,
ROUND(VARIANCE (Deaths),2)AS VARIANCE_Deaths,
ROUND(STDDEV (Deaths),2)AS standard_dev_Deaths,
FROM `corona virus dataset csv`
GROUP BY year_num, month_num
ORDER BY year_num, month_num ASC;

SELECT
EXTRACT( YEAR FROM Date ) AS year_num,
EXTRACT( MONTH FROM Date ) AS month_num,
SUM (Recovered) AS total_Recovered,
ROUND(AVG (Recovered),2)AS avg_Recovered,
ROUND(VARIANCE (Recovered),2)AS VARIANCE_Recovered,
ROUND(STDDEV (Recovered),2)AS standard_dev_Recovered,
FROM `corona virus dataset csv`
GROUP BY year_num, month_num
ORDER BY year_num, month_num ASC;

SELECT
Country_Region,
SUM(Confirmed) AS total_confirmed_cases
FROM `corona virus dataset csv`
GROUP BY Country_Region
ORDER BY total_confirmed_cases DESC
LIMIT 1;

WITH rankingCountry AS(
 SELECT 
 Country_Region AS Country,
 SUM(Deaths) AS total_death_reported,
 RANK() OVER(ORDER by SUM(Deaths)ASC) AS rank_no
 FROM `corona virus dataset csv`
 GROUP BY
 Country
 )
 SELECT
 Country,
 total_death_reported
 FROM
 rankingCountry
 WHERE
 rank_no=1;
 
 SELECT
Country_Region,
SUM(Recovered) AS total_recovered_cases
FROM `corona virus dataset csv`
GROUP BY Country_Region
ORDER BY total_recovered_cases DESC
LIMIT 5;
 
 
 
 
 
 
 






























  

   
   
 
 





