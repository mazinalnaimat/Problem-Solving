USE RetailOperations3NFDB;
GO
SET NOCOUNT ON;
GO

/* ============================================================
   Advanced-query extension for Challenges 51-100.
   This script is safe to run after 00_Base_All_In_One.sql.
   ============================================================ */

IF OBJECT_ID('dbo.OrderPromotions','U') IS NOT NULL DROP TABLE dbo.OrderPromotions;
IF OBJECT_ID('dbo.PromotionProducts','U') IS NOT NULL DROP TABLE dbo.PromotionProducts;
IF OBJECT_ID('dbo.Promotions','U') IS NOT NULL DROP TABLE dbo.Promotions;
IF OBJECT_ID('dbo.CustomerContactEvents','U') IS NOT NULL DROP TABLE dbo.CustomerContactEvents;
IF OBJECT_ID('dbo.ProductPriceHistory','U') IS NOT NULL DROP TABLE dbo.ProductPriceHistory;
IF OBJECT_ID('dbo.EmployeeMonthlyTargets','U') IS NOT NULL DROP TABLE dbo.EmployeeMonthlyTargets;
GO

CREATE TABLE dbo.EmployeeMonthlyTargets
(
    EmployeeMonthlyTargetID int IDENTITY(1,1) NOT NULL
        CONSTRAINT PK_EmployeeMonthlyTargets PRIMARY KEY,
    EmployeeID int NOT NULL,
    TargetMonth date NOT NULL,
    RevenueTarget decimal(14,2) NOT NULL,
    CONSTRAINT UQ_EmployeeMonthlyTargets UNIQUE(EmployeeID, TargetMonth),
    CONSTRAINT CK_EmployeeMonthlyTargets_Month
        CHECK (DAY(TargetMonth) = 1),
    CONSTRAINT CK_EmployeeMonthlyTargets_Value
        CHECK (RevenueTarget > 0),
    CONSTRAINT FK_EmployeeMonthlyTargets_Employees
        FOREIGN KEY (EmployeeID) REFERENCES dbo.Employees(EmployeeID)
);
GO

CREATE TABLE dbo.ProductPriceHistory
(
    ProductID int NOT NULL,
    EffectiveFrom date NOT NULL,
    StandardCost decimal(12,2) NOT NULL,
    ListPrice decimal(12,2) NOT NULL,
    CONSTRAINT PK_ProductPriceHistory PRIMARY KEY(ProductID, EffectiveFrom),
    CONSTRAINT CK_ProductPriceHistory_Prices
        CHECK (StandardCost > 0 AND ListPrice >= StandardCost),
    CONSTRAINT FK_ProductPriceHistory_Products
        FOREIGN KEY(ProductID) REFERENCES dbo.Products(ProductID)
);
GO

CREATE TABLE dbo.CustomerContactEvents
(
    ContactEventID bigint IDENTITY(1,1) NOT NULL
        CONSTRAINT PK_CustomerContactEvents PRIMARY KEY,
    CustomerID int NOT NULL,
    EmployeeID int NOT NULL,
    ContactAt datetime2(0) NOT NULL,
    ContactType varchar(20) NOT NULL,
    Outcome varchar(30) NOT NULL,
    Notes nvarchar(180) NULL,
    CONSTRAINT CK_CustomerContactEvents_Type
        CHECK (ContactType IN ('CALL','EMAIL','CHAT','MEETING')),
    CONSTRAINT CK_CustomerContactEvents_Outcome
        CHECK (Outcome IN ('NO_ANSWER','INTERESTED','FOLLOW_UP','RESOLVED','NOT_INTERESTED')),
    CONSTRAINT FK_CustomerContactEvents_Customers
        FOREIGN KEY(CustomerID) REFERENCES dbo.Customers(CustomerID),
    CONSTRAINT FK_CustomerContactEvents_Employees
        FOREIGN KEY(EmployeeID) REFERENCES dbo.Employees(EmployeeID)
);
GO

CREATE TABLE dbo.Promotions
(
    PromotionID int IDENTITY(1,1) NOT NULL CONSTRAINT PK_Promotions PRIMARY KEY,
    PromotionCode varchar(20) NOT NULL CONSTRAINT UQ_Promotions_Code UNIQUE,
    PromotionName nvarchar(120) NOT NULL,
    StartDate date NOT NULL,
    EndDate date NOT NULL,
    DiscountPercent decimal(5,2) NOT NULL,
    CONSTRAINT CK_Promotions_Dates CHECK (EndDate >= StartDate),
    CONSTRAINT CK_Promotions_Discount CHECK (DiscountPercent > 0 AND DiscountPercent <= 60)
);
GO

CREATE TABLE dbo.PromotionProducts
(
    PromotionID int NOT NULL,
    ProductID int NOT NULL,
    CONSTRAINT PK_PromotionProducts PRIMARY KEY(PromotionID, ProductID),
    CONSTRAINT FK_PromotionProducts_Promotions
        FOREIGN KEY(PromotionID) REFERENCES dbo.Promotions(PromotionID),
    CONSTRAINT FK_PromotionProducts_Products
        FOREIGN KEY(ProductID) REFERENCES dbo.Products(ProductID)
);
GO

CREATE TABLE dbo.OrderPromotions
(
    OrderID int NOT NULL,
    PromotionID int NOT NULL,
    CONSTRAINT PK_OrderPromotions PRIMARY KEY(OrderID, PromotionID),
    CONSTRAINT FK_OrderPromotions_Orders
        FOREIGN KEY(OrderID) REFERENCES dbo.SalesOrders(OrderID),
    CONSTRAINT FK_OrderPromotions_Promotions
        FOREIGN KEY(PromotionID) REFERENCES dbo.Promotions(PromotionID)
);
GO

/* Sales targets: employee 2-10, each month in 2024-2025. */
;WITH Months AS
(
    SELECT CONVERT(date,'2024-01-01') AS TargetMonth
    UNION ALL
    SELECT DATEADD(MONTH,1,TargetMonth)
    FROM Months
    WHERE TargetMonth < '2025-12-01'
),
SalesEmployees AS
(
    SELECT EmployeeID
    FROM dbo.Employees
    WHERE DepartmentID = 2
)
INSERT dbo.EmployeeMonthlyTargets(EmployeeID,TargetMonth,RevenueTarget)
SELECT
    e.EmployeeID,
    m.TargetMonth,
    CAST(
        12000
        + e.EmployeeID * 475
        + MONTH(m.TargetMonth) * 310
        + CASE WHEN MONTH(m.TargetMonth) IN (11,12) THEN 3500 ELSE 0 END
        + CASE WHEN YEAR(m.TargetMonth)=2025 THEN 1800 ELSE 0 END
        AS decimal(14,2)
    )
FROM SalesEmployees e
CROSS JOIN Months m
OPTION (MAXRECURSION 100);
GO

/* Four historical price points per product. */
INSERT dbo.ProductPriceHistory(ProductID,EffectiveFrom,StandardCost,ListPrice)
SELECT p.ProductID, v.EffectiveFrom,
       CAST(ROUND(p.StandardCost * v.CostFactor,2) AS decimal(12,2)),
       CAST(ROUND(p.ListPrice * v.PriceFactor,2) AS decimal(12,2))
FROM dbo.Products p
CROSS APPLY
(
    VALUES
      (CONVERT(date,'2023-07-01'), CAST(0.92 AS decimal(6,4)), CAST(0.94 AS decimal(6,4))),
      (CONVERT(date,'2024-01-01'), CAST(0.95 AS decimal(6,4)), CAST(0.97 AS decimal(6,4))),
      (CONVERT(date,'2024-07-01'), CAST(0.98 AS decimal(6,4)), CAST(0.99 AS decimal(6,4))),
      (CONVERT(date,'2025-01-01'), CAST(1.00 AS decimal(6,4)), CAST(1.00 AS decimal(6,4)))
) v(EffectiveFrom,CostFactor,PriceFactor);
GO

/* 1,280 deterministic contact events across 160 customers. */
;WITH N AS
(
    SELECT TOP (1280) ROW_NUMBER() OVER (ORDER BY (SELECT NULL)) AS n
    FROM sys.all_objects a CROSS JOIN sys.all_objects b
)
INSERT dbo.CustomerContactEvents(CustomerID,EmployeeID,ContactAt,ContactType,Outcome,Notes)
SELECT
    ((n * 37 - 1) % 160) + 1,
    CASE WHEN n % 3 = 0 THEN 24 + ((n * 5) % 6) ELSE 3 + ((n * 7) % 8) END,
    DATEADD(MINUTE, (n * 83) % 1200,
        DATEADD(DAY, (n * 29) % 720, CONVERT(datetime2(0),'2024-01-01'))),
    CHOOSE(((n * 3 - 1) % 4) + 1,'CALL','EMAIL','CHAT','MEETING'),
    CHOOSE(((n * 7 - 1) % 5) + 1,'NO_ANSWER','INTERESTED','FOLLOW_UP','RESOLVED','NOT_INTERESTED'),
    N'Generated interaction ' + CONVERT(nvarchar(10),n)
FROM N;
GO

INSERT dbo.Promotions(PromotionCode,PromotionName,StartDate,EndDate,DiscountPercent)
VALUES
('PROMO-01',N'Winter Kickoff','2024-01-10','2024-02-04',10),
('PROMO-02',N'Spring Office','2024-03-05','2024-03-30',12),
('PROMO-03',N'Ramadan Specials','2024-04-01','2024-04-28',15),
('PROMO-04',N'Summer Tech','2024-06-10','2024-07-07',18),
('PROMO-05',N'Back to Work','2024-09-01','2024-09-25',11),
('PROMO-06',N'Year End','2024-11-20','2024-12-31',20),
('PROMO-07',N'New Year','2025-01-08','2025-02-02',10),
('PROMO-08',N'Spring Upgrade','2025-03-12','2025-04-06',14),
('PROMO-09',N'Midyear Sale','2025-06-01','2025-06-28',16),
('PROMO-10',N'Summer Outdoor','2025-07-10','2025-08-03',13),
('PROMO-11',N'Autumn Business','2025-09-05','2025-09-30',12),
('PROMO-12',N'Holiday Mega Sale','2025-11-15','2025-12-31',22);
GO

/* Each promotion applies to 20 products, distributed across categories/brands. */
INSERT dbo.PromotionProducts(PromotionID,ProductID)
SELECT pr.PromotionID,p.ProductID
FROM dbo.Promotions pr
JOIN dbo.Products p
  ON (p.ProductID + pr.PromotionID * 3) % 5 = 0;
GO

/* Attach an eligible promotion to a deterministic subset of orders. */
INSERT dbo.OrderPromotions(OrderID,PromotionID)
SELECT o.OrderID, x.PromotionID
FROM dbo.SalesOrders o
CROSS APPLY
(
    SELECT TOP (1) pr.PromotionID
    FROM dbo.Promotions pr
    WHERE o.OrderDate BETWEEN pr.StartDate AND pr.EndDate
      AND EXISTS
      (
          SELECT 1
          FROM dbo.OrderItems oi
          JOIN dbo.PromotionProducts pp
            ON pp.ProductID = oi.ProductID
           AND pp.PromotionID = pr.PromotionID
          WHERE oi.OrderID = o.OrderID
      )
    ORDER BY pr.DiscountPercent DESC, pr.PromotionID
) x
WHERE o.OrderID % 3 <> 0;
GO

CREATE INDEX IX_EmployeeMonthlyTargets_Month_Employee
    ON dbo.EmployeeMonthlyTargets(TargetMonth,EmployeeID)
    INCLUDE(RevenueTarget);
CREATE INDEX IX_ProductPriceHistory_Product_Effective
    ON dbo.ProductPriceHistory(ProductID,EffectiveFrom DESC)
    INCLUDE(StandardCost,ListPrice);
CREATE INDEX IX_CustomerContactEvents_Customer_Date
    ON dbo.CustomerContactEvents(CustomerID,ContactAt)
    INCLUDE(EmployeeID,ContactType,Outcome);
CREATE INDEX IX_CustomerContactEvents_Employee_Date
    ON dbo.CustomerContactEvents(EmployeeID,ContactAt)
    INCLUDE(CustomerID,ContactType,Outcome);
CREATE INDEX IX_PromotionProducts_Product
    ON dbo.PromotionProducts(ProductID,PromotionID);
CREATE INDEX IX_OrderPromotions_Promotion
    ON dbo.OrderPromotions(PromotionID,OrderID);
GO
