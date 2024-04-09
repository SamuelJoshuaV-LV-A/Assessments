CREATE DATABASE intern;

USE intern;

-- Lab 1: CustomerInteractions
CREATE TABLE IF NOT EXISTS CustomerInteractions (
    CustomerID INT,
    Month VARCHAR(10),
    Year INT,
    CallDuration INT,
    MessageCount INT,
    DataUsed FLOAT,
    PRIMARY KEY (CustomerID, Month, Year)
);

-- Adjusted sample data for CustomerInteractions
INSERT INTO CustomerInteractions (CustomerID, Month, Year, CallDuration, MessageCount, DataUsed) VALUES
    (201, 'March', 2024, 500, 80, 3.5),
    (202, 'March', 2024, 320, 40, 2.0),
    (203, 'February', 2024, 450, 120, 1.5),
    (204, 'February', 2024, 300, 100, 2.8),
    (205, 'March', 2024, 400, 60, 4.2),
    (206, 'February', 2024, 100, 150, 1.0),
    (206, 'March', 2024, 200, 100, 2.0); -- Adjusted for increased call duration and data usage with reduced messages

-- Lab 2: QuarterlySales
CREATE TABLE QuarterlySales (
    SaleID INT PRIMARY KEY,
    ProductTypeID INT,
    Quarter VARCHAR(10),
    Year INT,
    TotalSalesAmount INT,
    UnitsSold INT
);

INSERT INTO QuarterlySales (SaleID, ProductTypeID, Quarter, Year, TotalSalesAmount, UnitsSold)
VALUES
    (1, 1, 'Q1', 2024, 20000, 400),
    (2, 2, 'Q1', 2024, 25000, 350),
    (3, 3, 'Q1', 2024, 15000, 300),
    (4, 1, 'Q2', 2024, 22000, 420),
    (5, 2, 'Q2', 2024, 26000, 360);

-- Lab 3: SectorEnergyConsumption
CREATE TABLE IF NOT EXISTS SectorEnergyConsumption (
    RecordID INT PRIMARY KEY,
    Sector VARCHAR(20),
    Region VARCHAR(20),
    Month VARCHAR(10),
    Year INT,
    EnergySource VARCHAR(20),
    ConsumptionKWh INT
);

-- Adjusted sample data for SectorEnergyConsumption
INSERT INTO SectorEnergyConsumption (RecordID, Sector, Region, Month, Year, EnergySource, ConsumptionKWh) VALUES
    (1, 'Residential', 'East', 'March', 2024, 'Solar', 100000),
    (2, 'Commercial', 'West', 'February', 2024, 'Wind', 200000),
    (3, 'Industrial', 'North', 'February', 2024, 'Fossil Fuels', 400000),
    (4, 'Residential', 'South', 'March', 2024, 'Wind', 120000),
    (5, 'Commercial', 'East', 'March', 2024, 'Solar', 150000),
    (6, 'Residential', 'North', 'February', 2024, 'Solar', 50000), -- Added for rising energy usage scenario
    (7, 'Residential', 'North', 'March', 2024, 'Solar', 80000); -- Added for rising energy usage scenario

-- Lab 4: InsuranceActivities
CREATE TABLE InsuranceActivities (
    PolicyID INT PRIMARY KEY,
    CustomerName VARCHAR(50),
    PolicyType VARCHAR(20),
    AnnualPremium INT,
    ClaimsCount INT,
    Investigation VARCHAR(3),
    FeedbackScore INT
);

INSERT INTO InsuranceActivities (PolicyID, CustomerName, PolicyType, AnnualPremium, ClaimsCount, Investigation, FeedbackScore)
VALUES
    (301, 'Bob Smith', 'Auto', 1000, 2, 'No', 7),
    (302, 'Alice Jones', 'Health', 1200, 0, 'No', 9),
    (303, 'Carol Brown', 'Home', 800, 3, 'Yes', 8),
    (304, 'Dan Wilson', 'Auto', 950, 1, 'No', 6),
    (305, 'Eve Davis', 'Health', 1100, 4, 'No', 10);


SELECT * FROM customerinteractions;



SELECT CustomerID, DataUsedGB FROM customerinteractions
WHERE Month = "March" AND DataUsedGB > (SELECT Avg(DataUsed) FROM customerinteractions);


SELECT * FROM customerinteractions;

SELECT CustomerID, CallDuration FROM customerinteractions
WHERE Month = "March" AND CallDuration>;

SELECT CustomerID, CallDuration FROM customerinteractions
WHERE Month = "February"
ORDER BY CallDuration DESC;

SELECT CustomerID, CallDuration FROM customerinteractions
WHERE Month = "March" 
ORDER BY CallDuration DESC;

SELECT CustomerID, CallDuration FROM customerinteractions
WHERE Month = "February" 
ORDER BY CallDuration DESC;

SELECT * FROM quarterlysales;


SELECT ProductTypeID, SUM(TotalSalesAmount) as total FROM quarterlysales
WHERE ProductTypeID = 1;

SELECT ProductTypeID, SUM(TotalSalesAmount) as total FROM quarterlysales
WHERE Quarter = 'Q1' AND Year = '2024'
GROUP BY ProductTypeID;

SELECT * FROM quarterlysales;

SELECT AVG(TotalSalesAmount) AS average FROM quarterlysales
WHERE ProductTypeID = 1 AND Quarter = 'Q2' AND Year = 2024;


SELECT AVG((TotalSalesAmount)/UnitsSold) AS average_unit FROM quarterlysales
WHERE ProductTypeID = 1 AND Quarter = 'Q2' AND Year = 2024;

WHERE ProductTypeID = 1 AND Quarter = 'Q2' AND Year = 2024;

SELECT * FROM sectorenergyconsumption;
SELECT Region FROM sectorenergyconsumption
WHERE Month = 'March' AND YEAR = '2024' AND ConsumptionKWh > 
(SELECT AVG(ConsumptionKWh) FROM sectorenergyconsumption);

SELECT * FROM sectorenergyconsumption;

SELECT Sector, Month, SUM(ConsumptionKWh) AS consumption FROM sectorenergyconsumption
GROUP BY Sector, Month;

SELECT * FROM sectorenergyconsumption;

SELECT EnergySource, ConsumptionKWh FROM sectorenergyconsumption
WHERE EnergySource = "Fossil Fuels";

SELECT EnergySource, ConsumptionKWh FROM sectorenergyconsumption
WHERE EnergySource <> "Fossil Fuels";

SELECT * FROM insuranceactivities;

SELECT CustomerName FROM insuranceactivities
WHERE FeedbackScore > (SELECT AVG(FeedbackScore) FROM insuranceactivities) OR Investigation = "No";

SELECT * FROM insuranceactivities;

SELECT SUM(AnnualPremium) , COUNT(*) FROM insuranceactivities, policy_id
WHERE Investigation = "NO" AND FeedbackScore > (SELECT AVG(FeedbackScore) FROM insuranceactivities)
Group by policy_id
HAVING count>1:

SELECT AVG(FeedbackScore) as average, PolicyType, ClaimsCount FROM insuranceactivities
GROUP BY PolicyType,ClaimsCount
CASE WHEN average > 8 THEN "Very good"
WHEN average = 8 THEN "OK"
WHEN average <8 THEN "To be consdiered"
END AS rating;