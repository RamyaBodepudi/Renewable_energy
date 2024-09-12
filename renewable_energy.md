# Renewable Energy Project: SQL and Power BI Analysis

## Introduction
This project involves analyzing renewable energy data, including variables such as Installed Capacity, Energy Production, GHG Emission Reduction, and more. The purpose of the analysis is to uncover insights about the types of renewable energy, their efficiency, cost-effectiveness, and their environmental impact.

## Tools Used
SQL Workbench**: For querying and analyzing data
Power BI**: For visualizing insights and creating dashboards
GitHub**: For version control and storing the project code

## Data Overview
The dataset includes the following columns:
- Type_of_Renewable_Energy
- Installed_Capacity_MW
- Energy_Production_MWh
- Energy_Consumption_MWh
- Energy_Storage_Capacity_MWh
- Storage_Efficiency_Percentage
- Grid_Integration_Level
- Initial_Investment_USD
- Funding_Sources
- Financial_Incentives_USD
- GHG_Emission_Reduction_tCO2e
- Air_Pollution_Reduction_Index
- Jobs_Created

## SQL Queries and Insights
### Data Cleaning:
Missing Values: The initial step involved checking for any missing values in critical columns such as Installed_Capacity_MW and handling them using removal or imputation techniques.
``` sql
select Type_of_Renewable_Energy, Installed_Capacity_MW, Energy_Production_MWh, Energy_Consumption_MWh,
Energy_Storage_Capacity_MWh, Storage_Efficiency_Percentage, Grid_Integration_Level, Initial_Investment_USD, 
Funding_Sources, Financial_Incentives_USD, GHG_Emission_Reduction_tCO2e, Air_Pollution_Reduction_Index,
Jobs_Created from renewable_energy
where Installed_Capacity_MW is null;
```
## Key Insights and Exploratory Data Analysis (EDA)
a. Most Common Types of Renewable Energy
```sql
-- What are the most common types of renewable energy used?
SELECT Type_of_Renewable_Energy, COUNT(*) AS Frequency
FROM renewable_energy
GROUP BY Type_of_Renewable_Energy
ORDER BY Frequency DESC;
```
b. Impact on Installed Capacity and GHG Emission Reduction
```sql
-- How does the type of renewable energy affect Installed Capacity and GHG Emission Reduction?
SELECT Type_of_Renewable_Energy, 
       AVG(Installed_Capacity_MW) AS Avg_Installation_Capacity,
       AVG(GHG_Emission_Reduction_tCO2e) AS Avg_GHG_Emission_Reduction
FROM renewable_energy
GROUP BY Type_of_Renewable_Energy;
```
c. Highest and Lowest Installed Capacity
```sql
-- Which projects have the highest and lowest installed capacity?
SELECT Type_of_Renewable_Energy,  
       MAX(Installed_Capacity_MW) AS Highest_Installation_Capacity,
       MIN(Installed_Capacity_MW) AS Lowest_Installation_Capacity
FROM renewable_energy
GROUP BY Type_of_Renewable_Energy;
```
d. Projects with Energy Consumption Exceeding Production
```sql
-- Are there any projects where energy consumption exceeds production?
SELECT *
FROM renewable_energy
WHERE Energy_Consumption_MWh > Energy_Production_MWh;
```
e. Highest and Lowest Storage Efficiency
```sql
-- Which projects have the highest and lowest storage efficiency?
SELECT Type_of_Renewable_Energy,  
       MAX(Energy_Storage_Capacity_MWh) AS Highest_Storage_Capacity,
       MIN(Energy_Storage_Capacity_MWh) AS Lowest_Storage_Capacity
FROM renewable_energy
GROUP BY Type_of_Renewable_Energy;
```
f. Storage Efficiency Correlation
```sql 
-- How does storage efficiency correlate with the type of renewable energy?
SELECT Type_of_Renewable_Energy, 
       AVG(Energy_Storage_Capacity_MWh) AS Avg_Storage_Capacity
FROM renewable_energy
GROUP BY Type_of_Renewable_Energy;
```
g. Common Levels of Grid Integration
```sql
-- What are the most common levels of grid integration?
SELECT Grid_Integration_Level, COUNT(*) AS Frequency
FROM renewable_energy
GROUP BY Grid_Integration_Level
ORDER BY Grid_Integration_Level DESC;
```
h. Average Initial Investment
```sql
-- What is the average initial investment for different types of renewable energy?
SELECT Type_of_Renewable_Energy, 
       ROUND(AVG(Initial_Investment_USD), 0) AS Avg_Initial_Investment
FROM renewable_energy
GROUP BY Type_of_Renewable_Energy;
```
i. Impact of Funding Sources
```sql
-- How do funding sources impact initial investment and financial incentives?
SELECT Funding_Sources, 
       AVG(Initial_Investment_USD) AS Avg_Initial_Investment,
       AVG(Financial_Incentives_USD) AS Avg_Financial_Incentives
FROM renewable_energy
GROUP BY Funding_Sources;
```
j. Financial Incentives by Renewable Energy Type
```sql
-- How do financial incentives vary across different types of renewable energy?
SELECT Type_of_Renewable_Energy, 
       AVG(Financial_Incentives_USD) AS Avg_Financial_Incentives
FROM renewable_energy
GROUP BY Type_of_Renewable_Energy;
```
k. Impact of Financial Incentives on GHG Emission Reduction
```sql
-- What is the impact of financial incentives on GHG emission reduction?
SELECT Financial_Incentives_USD, 
       GHG_Emission_Reduction_tCO2e
FROM renewable_energy
ORDER BY Financial_Incentives_USD;
```
l. Sum and Correlation Calculations
```sql
-- Summary calculations for various metrics
SELECT
    SUM(GHG_Emission_Reduction_tCO2e) AS Sum_Emission,
    SUM(Energy_Production_MWh) AS Sum_Production,
    SUM(Installed_Capacity_MW) AS Sum_Capacity,
    SUM(GHG_Emission_Reduction_tCO2e * Energy_Production_MWh) AS Sum_Emission_Production,
    SUM(GHG_Emission_Reduction_tCO2e * Installed_Capacity_MW) AS Sum_Emission_Capacity,
    SUM(POWER(GHG_Emission_Reduction_tCO2e, 2)) AS Sum_Emission_Squared,
    SUM(POWER(Energy_Production_MWh, 2)) AS Sum_Production_Squared,
    SUM(POWER(Installed_Capacity_MW, 2)) AS Sum_Capacity_Squared,
    COUNT(*) AS N
FROM renewable_energy;
```
m. Highest Air Pollution Reduction Index
```sql
-- Which projects have the highest air pollution reduction index?
SELECT Type_of_Renewable_Energy, 
       MAX(Air_Pollution_Reduction_Index) AS Highest_Air_Pollution_Reduction
FROM renewable_energy
GROUP BY Type_of_Renewable_Energy;
```
n. Cost-Effectiveness Ratio
```sql
-- Which type of renewable energy is most cost-effective in terms of initial investment versus GHG emission reduction?
SELECT Type_of_Renewable_Energy, 
       ROUND(SUM(Initial_Investment_USD)/SUM(GHG_Emission_Reduction_tCO2e)) AS Cost_Effectiveness_Ratio
FROM renewable_energy
GROUP BY Type_of_Renewable_Energy
ORDER BY Cost_Effectiveness_Ratio DESC;
```
o. Financial Incentives Influence
```sql
-- How do financial incentives influence the adoption of renewable energy technologies?
SELECT Type_of_Renewable_Energy, 
       SUM(Financial_Incentives_USD) AS Total_Financial_Incentives,
       COUNT(*) AS Number_of_Projects, 
       SUM(Installed_Capacity_MW) AS Total_Installed_Capacity
FROM renewable_energy
GROUP BY Type_of_Renewable_Energy
ORDER BY Total_Financial_Incentives DESC;
```
## Power BI Dashboard
### Visualizations Created
1. Distribution of Renewable Energy Types: This visualization shows the proportion of each type of renewable energy within the dataset.
2. Comparison of GHG Emission Reduction and Installed Capacity: This chart helps in understanding the relationship between GHG emission reduction and installed capacity across different renewable energy types.
3. Trends in Initial Investment and Financial Incentives: This visualization highlights trends in initial investment and financial incentives over time.

## Conclusion
The analysis reveals important insights into renewable energy efficiency, cost-effectiveness, and environmental impact. Solar and Wind energy are prevalent, with Wind energy showing high emission reduction potential.