CREATE VIEW AlcoholGDP_View AS
SELECT 
    Entity,
    Continent,
    Year,
    Total_alcohol_consumption_per_capita_liters_of_pure_alcohol_projected_estimates_15_years_of_age AS AlcoholConsumption,
    GDP_per_capita_PPP_constant_2017_international AS GDPPerCapita,
    Population_historical_estimates AS Population
FROM Alcohol_GDP
WHERE Year IS NOT NULL
  AND GDP_per_capita_PPP_constant_2017_international IS NOT NULL
  AND Total_alcohol_consumption_per_capita_liters_of_pure_alcohol_projected_estimates_15_years_of_age IS NOT NULL;