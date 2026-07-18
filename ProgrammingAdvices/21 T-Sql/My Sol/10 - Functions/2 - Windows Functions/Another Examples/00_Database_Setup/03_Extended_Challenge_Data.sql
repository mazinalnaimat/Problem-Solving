USE WindowFunctionsTrainingDB;
GO

/*
Extended practice data for the refactored challenges.
Run this file after 01_AllInOne_Create_Database.sql.
All DDL and DML needed by the new challenges is kept here.
*/

DROP TABLE IF EXISTS dbo.UtilityReadings;
DROP TABLE IF EXISTS dbo.WebsiteTraffic;
DROP TABLE IF EXISTS dbo.RaceResults;
DROP TABLE IF EXISTS dbo.SubscriptionPayments;
DROP TABLE IF EXISTS dbo.InventorySnapshots;
DROP TABLE IF EXISTS dbo.SupportTickets;
DROP TABLE IF EXISTS dbo.DeliveryTrips;
DROP TABLE IF EXISTS dbo.MachineReadings;
GO

CREATE TABLE dbo.MachineReadings
(
    ReadingID INT IDENTITY(1,1) PRIMARY KEY,
    MachineCode NVARCHAR(20) NOT NULL,
    ProductionLine NVARCHAR(30) NOT NULL,
    ReadingTime DATETIME2(0) NOT NULL,
    TemperatureC DECIMAL(6,2) NOT NULL,
    VibrationMmS DECIMAL(6,2) NOT NULL,
    OutputUnits INT NOT NULL,
    DefectCount INT NOT NULL
);

CREATE TABLE dbo.DeliveryTrips
(
    TripID INT IDENTITY(1,1) PRIMARY KEY,
    DriverName NVARCHAR(60) NOT NULL,
    Depot NVARCHAR(30) NOT NULL,
    RouteCode NVARCHAR(20) NOT NULL,
    DeliveryDate DATE NOT NULL,
    DistanceKm DECIMAL(8,2) NOT NULL,
    FuelLiters DECIMAL(8,2) NOT NULL,
    PackagesDelivered INT NOT NULL,
    DelayMinutes INT NOT NULL
);

CREATE TABLE dbo.SupportTickets
(
    TicketID INT IDENTITY(1,1) PRIMARY KEY,
    TicketTitle NVARCHAR(100) NOT NULL,
    AgentName NVARCHAR(60) NOT NULL,
    TeamName NVARCHAR(30) NOT NULL,
    Priority NVARCHAR(10) NOT NULL,
    OpenedAt DATETIME2(0) NOT NULL,
    ClosedAt DATETIME2(0) NULL,
    ResolutionMinutes INT NULL,
    SatisfactionScore INT NULL
);

CREATE TABLE dbo.InventorySnapshots
(
    SnapshotID INT IDENTITY(1,1) PRIMARY KEY,
    WarehouseName NVARCHAR(30) NOT NULL,
    ProductName NVARCHAR(60) NOT NULL,
    Category NVARCHAR(30) NOT NULL,
    SnapshotDate DATE NOT NULL,
    QuantityOnHand INT NOT NULL,
    UnitCost DECIMAL(10,2) NOT NULL
);

CREATE TABLE dbo.SubscriptionPayments
(
    PaymentID INT IDENTITY(1,1) PRIMARY KEY,
    CustomerName NVARCHAR(60) NOT NULL,
    PlanName NVARCHAR(30) NOT NULL,
    Country NVARCHAR(30) NOT NULL,
    PaymentDate DATE NOT NULL,
    Amount DECIMAL(10,2) NOT NULL,
    Seats INT NOT NULL,
    PaymentStatus NVARCHAR(15) NOT NULL
);

CREATE TABLE dbo.RaceResults
(
    ResultID INT IDENTITY(1,1) PRIMARY KEY,
    EventName NVARCHAR(50) NOT NULL,
    AthleteName NVARCHAR(60) NOT NULL,
    TeamName NVARCHAR(30) NOT NULL,
    RaceDate DATE NOT NULL,
    FinishSeconds DECIMAL(8,2) NOT NULL,
    Points INT NOT NULL
);

CREATE TABLE dbo.WebsiteTraffic
(
    TrafficID INT IDENTITY(1,1) PRIMARY KEY,
    SiteName NVARCHAR(40) NOT NULL,
    Channel NVARCHAR(30) NOT NULL,
    VisitDate DATE NOT NULL,
    Sessions INT NOT NULL,
    Conversions INT NOT NULL,
    Revenue DECIMAL(10,2) NOT NULL
);

CREATE TABLE dbo.UtilityReadings
(
    UtilityReadingID INT IDENTITY(1,1) PRIMARY KEY,
    BuildingName NVARCHAR(40) NOT NULL,
    MeterType NVARCHAR(20) NOT NULL,
    ReadingDate DATE NOT NULL,
    Consumption DECIMAL(10,2) NOT NULL,
    Cost DECIMAL(10,2) NOT NULL
);
GO

INSERT INTO dbo.MachineReadings
    (MachineCode, ProductionLine, ReadingTime, TemperatureC, VibrationMmS, OutputUnits, DefectCount)
VALUES
('MX-01','Line A','2026-01-01T08:00:00',71.20,2.10,120,3),
('MX-01','Line A','2026-01-01T12:00:00',73.80,2.40,128,2),
('MX-01','Line A','2026-01-01T16:00:00',76.10,3.20,115,5),
('MX-01','Line A','2026-01-02T08:00:00',72.90,2.30,132,1),
('MX-02','Line A','2026-01-01T08:00:00',68.50,1.90,140,1),
('MX-02','Line A','2026-01-01T12:00:00',69.70,2.20,138,2),
('MX-02','Line A','2026-01-01T16:00:00',70.40,2.70,135,3),
('MX-02','Line A','2026-01-02T08:00:00',71.60,2.50,142,1),
('PK-01','Line B','2026-01-01T08:00:00',61.30,1.40,98,2),
('PK-01','Line B','2026-01-01T12:00:00',63.20,1.60,105,1),
('PK-01','Line B','2026-01-01T16:00:00',65.10,2.00,101,4),
('PK-01','Line B','2026-01-02T08:00:00',62.70,1.50,110,1),
('PK-02','Line B','2026-01-01T08:00:00',59.90,1.20,115,0),
('PK-02','Line B','2026-01-01T12:00:00',60.80,1.30,118,1),
('PK-02','Line B','2026-01-01T16:00:00',64.40,2.10,104,5),
('PK-02','Line B','2026-01-02T08:00:00',61.90,1.70,121,2);

INSERT INTO dbo.DeliveryTrips
    (DriverName, Depot, RouteCode, DeliveryDate, DistanceKm, FuelLiters, PackagesDelivered, DelayMinutes)
VALUES
('Rami','Central','C-10','2026-02-01',82.0,10.5,74,12),
('Rami','Central','C-11','2026-02-03',96.0,12.2,81,5),
('Rami','Central','C-10','2026-02-05',78.0,9.8,69,20),
('Rami','Central','C-12','2026-02-07',110.0,13.7,92,8),
('Dana','Central','C-11','2026-02-01',90.0,11.0,77,0),
('Dana','Central','C-12','2026-02-04',118.0,14.3,96,14),
('Dana','Central','C-10','2026-02-06',80.0,10.1,72,7),
('Dana','Central','C-11','2026-02-08',94.0,11.6,84,18),
('Sami','North','N-20','2026-02-02',65.0,8.1,58,25),
('Sami','North','N-21','2026-02-04',72.0,8.8,63,9),
('Sami','North','N-20','2026-02-06',68.0,8.4,61,4),
('Sami','North','N-22','2026-02-08',88.0,10.9,75,16),
('Laila','North','N-21','2026-02-01',70.0,8.5,66,3),
('Laila','North','N-22','2026-02-03',91.0,11.4,79,11),
('Laila','North','N-20','2026-02-05',64.0,7.9,57,6),
('Laila','North','N-21','2026-02-07',74.0,9.0,68,2);

INSERT INTO dbo.SupportTickets
    (TicketTitle, AgentName, TeamName, Priority, OpenedAt, ClosedAt, ResolutionMinutes, SatisfactionScore)
VALUES
('Login timeout','Noor','Platform','High','2026-03-01T08:00:00','2026-03-01T09:20:00',80,5),
('API rate limit','Noor','Platform','Medium','2026-03-01T10:00:00','2026-03-01T12:10:00',130,4),
('Database connection','Noor','Platform','Critical','2026-03-02T08:30:00','2026-03-02T09:15:00',45,5),
('Cache mismatch','Noor','Platform','Low','2026-03-03T11:00:00',NULL,NULL,NULL),
('Invoice total wrong','Hana','Billing','High','2026-03-01T08:15:00','2026-03-01T11:15:00',180,3),
('Refund pending','Hana','Billing','Medium','2026-03-01T12:00:00','2026-03-01T13:10:00',70,4),
('Tax rule missing','Hana','Billing','Critical','2026-03-02T09:00:00','2026-03-02T10:40:00',100,4),
('Receipt email','Hana','Billing','Low','2026-03-03T13:00:00',NULL,NULL,NULL),
('Mobile layout','Omar','Frontend','Medium','2026-03-01T09:00:00','2026-03-01T10:30:00',90,4),
('Button disabled','Omar','Frontend','High','2026-03-02T08:00:00','2026-03-02T09:50:00',110,3),
('Dark mode contrast','Omar','Frontend','Low','2026-03-02T12:00:00','2026-03-02T12:40:00',40,5),
('Chart not loading','Omar','Frontend','Critical','2026-03-03T08:10:00','2026-03-03T10:40:00',150,2),
('Password reset','Maya','Identity','High','2026-03-01T07:40:00','2026-03-01T08:10:00',30,5),
('MFA code delayed','Maya','Identity','Medium','2026-03-01T11:20:00','2026-03-01T12:10:00',50,4),
('Account locked','Maya','Identity','Critical','2026-03-02T07:50:00','2026-03-02T08:15:00',25,5),
('Profile name update','Maya','Identity','Low','2026-03-03T15:00:00',NULL,NULL,NULL);

INSERT INTO dbo.InventorySnapshots
    (WarehouseName, ProductName, Category, SnapshotDate, QuantityOnHand, UnitCost)
VALUES
('Amman','Router X','Network','2026-04-01',45,62.00),
('Amman','Router X','Network','2026-04-08',38,62.00),
('Amman','Switch 8P','Network','2026-04-01',70,38.00),
('Amman','Switch 8P','Network','2026-04-08',58,38.00),
('Amman','Keyboard Pro','Accessories','2026-04-01',90,24.00),
('Amman','Keyboard Pro','Accessories','2026-04-08',76,24.00),
('Amman','Mouse Air','Accessories','2026-04-01',110,18.00),
('Amman','Mouse Air','Accessories','2026-04-08',96,18.00),
('Zarqa','Router X','Network','2026-04-01',32,63.50),
('Zarqa','Router X','Network','2026-04-08',29,63.50),
('Zarqa','Switch 8P','Network','2026-04-01',52,39.00),
('Zarqa','Switch 8P','Network','2026-04-08',47,39.00),
('Zarqa','Keyboard Pro','Accessories','2026-04-01',64,25.00),
('Zarqa','Keyboard Pro','Accessories','2026-04-08',55,25.00),
('Zarqa','Mouse Air','Accessories','2026-04-01',85,18.50),
('Zarqa','Mouse Air','Accessories','2026-04-08',73,18.50);

INSERT INTO dbo.SubscriptionPayments
    (CustomerName, PlanName, Country, PaymentDate, Amount, Seats, PaymentStatus)
VALUES
('Apex Co','Team','Jordan','2026-05-01',120.00,8,'Paid'),
('Apex Co','Team','Jordan','2026-06-01',120.00,8,'Paid'),
('Blue Lab','Starter','Jordan','2026-05-03',35.00,2,'Paid'),
('Blue Lab','Starter','Jordan','2026-06-03',35.00,2,'Failed'),
('Core Systems','Business','Jordan','2026-05-05',260.00,18,'Paid'),
('Core Systems','Business','Jordan','2026-06-05',280.00,20,'Paid'),
('Delta Works','Team','UAE','2026-05-02',140.00,10,'Paid'),
('Delta Works','Team','UAE','2026-06-02',140.00,10,'Paid'),
('Edge Media','Starter','UAE','2026-05-04',40.00,3,'Pending'),
('Edge Media','Starter','UAE','2026-06-04',40.00,3,'Paid'),
('Future Tech','Business','UAE','2026-05-06',300.00,22,'Paid'),
('Future Tech','Business','UAE','2026-06-06',300.00,22,'Failed'),
('Green Hub','Team','Saudi Arabia','2026-05-01',150.00,11,'Paid'),
('Green Hub','Team','Saudi Arabia','2026-06-01',150.00,11,'Paid'),
('High Point','Business','Saudi Arabia','2026-05-07',320.00,24,'Paid'),
('High Point','Business','Saudi Arabia','2026-06-07',340.00,26,'Paid');

INSERT INTO dbo.RaceResults
    (EventName, AthleteName, TeamName, RaceDate, FinishSeconds, Points)
VALUES
('City 5K','Adam','Falcons','2026-06-10',1012.40,18),
('City 5K','Basil','Falcons','2026-06-10',1035.20,14),
('City 5K','Carmen','Lions','2026-06-10',998.80,20),
('City 5K','Dalia','Lions','2026-06-10',1048.50,12),
('River Run','Adam','Falcons','2026-06-17',1090.10,16),
('River Run','Basil','Falcons','2026-06-17',1112.70,13),
('River Run','Carmen','Lions','2026-06-17',1075.60,19),
('River Run','Dalia','Lions','2026-06-17',1130.90,11),
('Hill Sprint','Adam','Falcons','2026-06-24',620.30,20),
('Hill Sprint','Basil','Falcons','2026-06-24',646.80,15),
('Hill Sprint','Carmen','Lions','2026-06-24',628.20,18),
('Hill Sprint','Dalia','Lions','2026-06-24',659.40,12),
('Night Track','Adam','Falcons','2026-07-01',880.20,17),
('Night Track','Basil','Falcons','2026-07-01',902.40,14),
('Night Track','Carmen','Lions','2026-07-01',871.60,20),
('Night Track','Dalia','Lions','2026-07-01',915.30,10);

INSERT INTO dbo.WebsiteTraffic
    (SiteName, Channel, VisitDate, Sessions, Conversions, Revenue)
VALUES
('ShopNow','Organic','2026-01-01',420,21,1260.00),
('ShopNow','Organic','2026-01-02',460,24,1440.00),
('ShopNow','Organic','2026-01-03',390,17,1020.00),
('ShopNow','Organic','2026-01-04',510,29,1740.00),
('ShopNow','Paid','2026-01-01',300,18,1350.00),
('ShopNow','Paid','2026-01-02',340,20,1500.00),
('ShopNow','Paid','2026-01-03',280,13,975.00),
('ShopNow','Paid','2026-01-04',360,23,1725.00),
('LearnHub','Organic','2026-01-01',250,15,900.00),
('LearnHub','Organic','2026-01-02',275,18,1080.00),
('LearnHub','Organic','2026-01-03',310,22,1320.00),
('LearnHub','Organic','2026-01-04',295,19,1140.00),
('LearnHub','Referral','2026-01-01',160,8,480.00),
('LearnHub','Referral','2026-01-02',180,11,660.00),
('LearnHub','Referral','2026-01-03',150,7,420.00),
('LearnHub','Referral','2026-01-04',205,14,840.00);

INSERT INTO dbo.UtilityReadings
    (BuildingName, MeterType, ReadingDate, Consumption, Cost)
VALUES
('Tower A','Electricity','2026-01-01',820.0,147.60),
('Tower A','Electricity','2026-01-02',860.0,154.80),
('Tower A','Electricity','2026-01-03',790.0,142.20),
('Tower A','Electricity','2026-01-04',910.0,163.80),
('Tower A','Water','2026-01-01',48.0,28.80),
('Tower A','Water','2026-01-02',52.0,31.20),
('Tower A','Water','2026-01-03',45.0,27.00),
('Tower A','Water','2026-01-04',55.0,33.00),
('Campus B','Electricity','2026-01-01',610.0,109.80),
('Campus B','Electricity','2026-01-02',640.0,115.20),
('Campus B','Electricity','2026-01-03',625.0,112.50),
('Campus B','Electricity','2026-01-04',670.0,120.60),
('Campus B','Water','2026-01-01',36.0,21.60),
('Campus B','Water','2026-01-02',39.0,23.40),
('Campus B','Water','2026-01-03',35.0,21.00),
('Campus B','Water','2026-01-04',42.0,25.20);
GO

CREATE INDEX IX_MachineReadings_Machine_Time
    ON dbo.MachineReadings(MachineCode, ReadingTime);
CREATE INDEX IX_DeliveryTrips_Driver_Date
    ON dbo.DeliveryTrips(DriverName, DeliveryDate);
CREATE INDEX IX_SupportTickets_Team_Opened
    ON dbo.SupportTickets(TeamName, OpenedAt);
CREATE INDEX IX_InventorySnapshots_Warehouse_Product_Date
    ON dbo.InventorySnapshots(WarehouseName, ProductName, SnapshotDate);
CREATE INDEX IX_SubscriptionPayments_Customer_Date
    ON dbo.SubscriptionPayments(CustomerName, PaymentDate);
CREATE INDEX IX_RaceResults_Athlete_Date
    ON dbo.RaceResults(AthleteName, RaceDate);
CREATE INDEX IX_WebsiteTraffic_Site_Channel_Date
    ON dbo.WebsiteTraffic(SiteName, Channel, VisitDate);
CREATE INDEX IX_UtilityReadings_Building_Meter_Date
    ON dbo.UtilityReadings(BuildingName, MeterType, ReadingDate);
GO

SELECT 'Extended challenge data created successfully.' AS Message;
