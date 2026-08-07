USE RetailOperations3NFDB;
GO
SET NOCOUNT ON;
GO

SET IDENTITY_INSERT dbo.Regions ON;
INSERT dbo.Regions (RegionID, RegionCode, RegionName) VALUES
(1, 'MEA', N'Middle East and Africa'),
(2, 'EUR', N'Europe'),
(3, 'NAM', N'North America'),
(4, 'APAC', N'Asia Pacific');
SET IDENTITY_INSERT dbo.Regions OFF;

SET IDENTITY_INSERT dbo.Countries ON;
INSERT dbo.Countries (CountryID, RegionID, CountryCode, CountryName) VALUES
(1, 1, 'JO', N'Jordan'),
(2, 1, 'AE', N'United Arab Emirates'),
(3, 2, 'GB', N'United Kingdom'),
(4, 2, 'DE', N'Germany'),
(5, 3, 'US', N'United States'),
(6, 3, 'CA', N'Canada'),
(7, 4, 'IN', N'India'),
(8, 4, 'SG', N'Singapore');
SET IDENTITY_INSERT dbo.Countries OFF;

SET IDENTITY_INSERT dbo.Cities ON;
INSERT dbo.Cities (CityID, CountryID, CityName) VALUES
(1,1,N'Amman'), (2,1,N'Irbid'),
(3,2,N'Dubai'), (4,2,N'Abu Dhabi'),
(5,3,N'London'), (6,3,N'Manchester'),
(7,4,N'Berlin'), (8,4,N'Munich'),
(9,5,N'New York'), (10,5,N'Chicago'),
(11,6,N'Toronto'), (12,6,N'Vancouver'),
(13,7,N'Bengaluru'), (14,7,N'Mumbai'),
(15,8,N'Singapore Central'), (16,8,N'Jurong');
SET IDENTITY_INSERT dbo.Cities OFF;

SET IDENTITY_INSERT dbo.CustomerSegments ON;
INSERT dbo.CustomerSegments (SegmentID, SegmentName) VALUES
(1,N'Consumer'), (2,N'Small Business'), (3,N'Enterprise'), (4,N'Government');
SET IDENTITY_INSERT dbo.CustomerSegments OFF;

SET IDENTITY_INSERT dbo.Departments ON;
INSERT dbo.Departments (DepartmentID, DepartmentName) VALUES
(1,N'Executive'), (2,N'Sales'), (3,N'Operations'),
(4,N'Procurement'), (5,N'Customer Support'), (6,N'Finance');
SET IDENTITY_INSERT dbo.Departments OFF;

SET IDENTITY_INSERT dbo.Employees ON;
INSERT dbo.Employees
(EmployeeID, EmployeeNumber, FullName, DepartmentID, ManagerID, HireDate, BaseSalary, IsActive)
VALUES
(1,'EMP-001',N'Emma Carter',1,NULL,'2016-01-15',150000,1),
(2,'EMP-002',N'Noah Bennett',2,1,'2017-03-01',95000,1),
(3,'EMP-003',N'Liam Turner',2,2,'2019-04-11',62000,1),
(4,'EMP-004',N'Olivia Harris',2,2,'2020-02-17',61000,1),
(5,'EMP-005',N'Ethan Walker',2,3,'2021-06-05',59000,1),
(6,'EMP-006',N'Ava Robinson',2,3,'2018-09-20',64000,1),
(7,'EMP-007',N'Mason Clark',2,3,'2022-01-08',56000,1),
(8,'EMP-008',N'Sophia Lewis',2,4,'2020-11-13',60000,1),
(9,'EMP-009',N'Lucas Hall',2,4,'2021-08-25',58000,1),
(10,'EMP-010',N'Mia Young',2,4,'2019-12-02',63000,1),
(11,'EMP-011',N'James King',3,1,'2017-05-14',92000,1),
(12,'EMP-012',N'Isabella Wright',3,11,'2019-07-09',65000,1),
(13,'EMP-013',N'Benjamin Scott',3,11,'2020-10-19',63000,1),
(14,'EMP-014',N'Charlotte Green',3,11,'2018-04-21',67000,1),
(15,'EMP-015',N'Henry Adams',3,11,'2021-03-07',60000,1),
(16,'EMP-016',N'Amelia Baker',3,11,'2022-05-16',58000,1),
(17,'EMP-017',N'Alexander Nelson',3,11,'2019-01-12',66000,1),
(18,'EMP-018',N'Harper Hill',4,1,'2018-08-18',90000,1),
(19,'EMP-019',N'Daniel Campbell',4,18,'2020-06-23',61000,1),
(20,'EMP-020',N'Evelyn Mitchell',4,18,'2021-02-01',60000,1),
(21,'EMP-021',N'Michael Roberts',4,18,'2019-10-10',63000,1),
(22,'EMP-022',N'Abigail Carter',4,18,'2022-07-04',57000,1),
(23,'EMP-023',N'Sebastian Phillips',5,1,'2018-03-03',88000,1),
(24,'EMP-024',N'Emily Evans',5,23,'2020-05-12',50000,1),
(25,'EMP-025',N'Jack Edwards',5,23,'2021-01-18',49000,1),
(26,'EMP-026',N'Ella Collins',5,23,'2019-09-06',52000,1),
(27,'EMP-027',N'William Stewart',5,23,'2022-03-28',47000,1),
(28,'EMP-028',N'Grace Sanchez',5,23,'2020-12-11',50000,1),
(29,'EMP-029',N'Leo Morris',5,23,'2021-11-02',48000,1),
(30,'EMP-030',N'Chloe Rogers',6,1,'2017-12-01',90000,1),
(31,'EMP-031',N'Joseph Reed',6,30,'2020-03-15',59000,1),
(32,'EMP-032',N'Lily Cook',6,30,'2021-04-22',57000,1),
(33,'EMP-033',N'Samuel Morgan',6,30,'2019-06-08',61000,1);
SET IDENTITY_INSERT dbo.Employees OFF;

SET IDENTITY_INSERT dbo.SalesChannels ON;
INSERT dbo.SalesChannels (SalesChannelID, ChannelName) VALUES
(1,N'Web Store'), (2,N'Mobile App'), (3,N'Inside Sales'), (4,N'Marketplace');
SET IDENTITY_INSERT dbo.SalesChannels OFF;

SET IDENTITY_INSERT dbo.OrderStatuses ON;
INSERT dbo.OrderStatuses (OrderStatusID, StatusName) VALUES
(1,N'Pending'), (2,N'Confirmed'), (3,N'Processing'), (4,N'Shipped'),
(5,N'Delivered'), (6,N'Cancelled'), (7,N'Returned');
SET IDENTITY_INSERT dbo.OrderStatuses OFF;

SET IDENTITY_INSERT dbo.Categories ON;
INSERT dbo.Categories (CategoryID, ParentCategoryID, CategoryName) VALUES
(1,NULL,N'Electronics'), (2,NULL,N'Office'), (3,NULL,N'Home'), (4,NULL,N'Sports'),
(5,1,N'Computers'), (6,1,N'Mobile Devices'), (7,1,N'Accessories'),
(8,2,N'Furniture'), (9,2,N'Stationery'), (10,3,N'Kitchen'),
(11,3,N'Cleaning'), (12,4,N'Fitness'), (13,4,N'Outdoor'),
(14,1,N'Networking'), (15,1,N'Storage');
SET IDENTITY_INSERT dbo.Categories OFF;

SET IDENTITY_INSERT dbo.Brands ON;
INSERT dbo.Brands (BrandID, BrandName) VALUES
(1,N'Northstar'), (2,N'BluePeak'), (3,N'Vertex'), (4,N'UrbanWorks'),
(5,N'NovaLine'), (6,N'GreenField'), (7,N'AtlasPro'), (8,N'CoreEdge'),
(9,N'PrimeWave'), (10,N'SummitOne');
SET IDENTITY_INSERT dbo.Brands OFF;

SET IDENTITY_INSERT dbo.PaymentMethods ON;
INSERT dbo.PaymentMethods (PaymentMethodID, MethodName) VALUES
(1,N'Card'), (2,N'Bank Transfer'), (3,N'Cash on Delivery'), (4,N'Digital Wallet');
SET IDENTITY_INSERT dbo.PaymentMethods OFF;

SET IDENTITY_INSERT dbo.PaymentStatuses ON;
INSERT dbo.PaymentStatuses (PaymentStatusID, StatusName) VALUES
(1,N'Pending'), (2,N'Completed'), (3,N'Failed'), (4,N'Refunded'), (5,N'Partially Refunded');
SET IDENTITY_INSERT dbo.PaymentStatuses OFF;

SET IDENTITY_INSERT dbo.ShipmentStatuses ON;
INSERT dbo.ShipmentStatuses (ShipmentStatusID, StatusName) VALUES
(1,N'Preparing'), (2,N'In Transit'), (3,N'Delivered'), (4,N'Delayed');
SET IDENTITY_INSERT dbo.ShipmentStatuses OFF;

SET IDENTITY_INSERT dbo.InventoryTransactionTypes ON;
INSERT dbo.InventoryTransactionTypes
(InventoryTransactionTypeID, TypeCode, TypeName) VALUES
(1,'OPENING',N'Opening Balance'),
(2,'PURCHASE_RECEIPT',N'Purchase Receipt'),
(3,'SALE_ISSUE',N'Sale Issue'),
(4,'CUSTOMER_RETURN',N'Customer Return'),
(5,'ADJUSTMENT',N'Inventory Adjustment'),
(6,'TRANSFER_IN',N'Transfer In'),
(7,'TRANSFER_OUT',N'Transfer Out');
SET IDENTITY_INSERT dbo.InventoryTransactionTypes OFF;

SET IDENTITY_INSERT dbo.PurchaseOrderStatuses ON;
INSERT dbo.PurchaseOrderStatuses (PurchaseOrderStatusID, StatusName) VALUES
(1,N'Draft'), (2,N'Submitted'), (3,N'Partially Received'),
(4,N'Received'), (5,N'Cancelled');
SET IDENTITY_INSERT dbo.PurchaseOrderStatuses OFF;

SET IDENTITY_INSERT dbo.SupportPriorities ON;
INSERT dbo.SupportPriorities
(PriorityID, PriorityName, TargetResolutionHours) VALUES
(1,N'Low',72), (2,N'Medium',48), (3,N'High',24), (4,N'Critical',8);
SET IDENTITY_INSERT dbo.SupportPriorities OFF;

SET IDENTITY_INSERT dbo.SupportTicketStatuses ON;
INSERT dbo.SupportTicketStatuses (SupportTicketStatusID, StatusName) VALUES
(1,N'Open'), (2,N'Assigned'), (3,N'Waiting for Customer'),
(4,N'Resolved'), (5,N'Closed'), (6,N'Reopened');
SET IDENTITY_INSERT dbo.SupportTicketStatuses OFF;

SET IDENTITY_INSERT dbo.ReturnReasons ON;
INSERT dbo.ReturnReasons (ReturnReasonID, ReasonName) VALUES
(1,N'Damaged in transit'), (2,N'Wrong item'), (3,N'Not as described'),
(4,N'Changed mind'), (5,N'Defective product');
SET IDENTITY_INSERT dbo.ReturnReasons OFF;

SET IDENTITY_INSERT dbo.ReturnStatuses ON;
INSERT dbo.ReturnStatuses (ReturnStatusID, StatusName) VALUES
(1,N'Requested'), (2,N'Approved'), (3,N'Completed'), (4,N'Rejected');
SET IDENTITY_INSERT dbo.ReturnStatuses OFF;

SELECT TOP (12000)
    ROW_NUMBER() OVER (ORDER BY (SELECT NULL)) AS n
INTO #Numbers
FROM sys.all_objects AS a
CROSS JOIN sys.all_objects AS b;

INSERT dbo.Customers
(CustomerNumber, FullName, Email, CityID, SegmentID, RegistrationDate, IsActive)
SELECT
    'CUS-' + RIGHT('00000' + CONVERT(varchar(5), n), 5),
    N'Customer ' + RIGHT('000' + CONVERT(nvarchar(3), n), 3),
    'customer' + CONVERT(varchar(5), n) + '@example.test',
    ((n * 7 - 1) % 16) + 1,
    ((n * 5 - 1) % 4) + 1,
    DATEADD(DAY, (n * 17) % 900, CONVERT(date,'2022-01-01')),
    CASE WHEN n % 19 = 0 THEN 0 ELSE 1 END
FROM #Numbers
WHERE n <= 160;

INSERT dbo.Products
(SKU, ProductName, CategoryID, BrandID, StandardCost, ListPrice, ReorderLevel, IsActive)
SELECT
    'SKU-' + RIGHT('0000' + CONVERT(varchar(4), n), 4),
    N'Product ' + RIGHT('000' + CONVERT(nvarchar(3), n), 3),
    5 + ((n - 1) % 11),
    1 + ((n * 3 - 1) % 10),
    CAST(15 + ((n * 19) % 280) + ((n % 4) * 0.25) AS decimal(12,2)),
    CAST(ROUND((15 + ((n * 19) % 280) + ((n % 4) * 0.25))
         * (1.25 + ((n % 6) * 0.08)), 2) AS decimal(12,2)),
    10 + ((n * 7) % 45),
    CASE WHEN n % 31 = 0 THEN 0 ELSE 1 END
FROM #Numbers
WHERE n <= 100;

INSERT dbo.Suppliers
(SupplierCode, SupplierName, CityID, Rating, IsActive)
SELECT
    'SUP-' + RIGHT('000' + CONVERT(varchar(3), n), 3),
    N'Supplier ' + RIGHT('00' + CONVERT(nvarchar(2), n), 2),
    ((n * 5 - 1) % 16) + 1,
    CAST(3.00 + ((n * 17) % 20) / 10.0 AS decimal(3,2)),
    CASE WHEN n = 20 THEN 0 ELSE 1 END
FROM #Numbers
WHERE n <= 20;

INSERT dbo.ProductSuppliers
(ProductID, SupplierID, SupplierProductCode, UnitCost, LeadTimeDays, IsPreferred)
SELECT
    p.n,
    ((p.n + s.n * 6 - 1) % 20) + 1,
    'SP-' + RIGHT('0000' + CONVERT(varchar(4), p.n),4) + '-' + CONVERT(varchar(2), s.n),
    CAST(ROUND(pr.StandardCost * (0.88 + s.n * 0.04 + ((p.n + s.n) % 3) * 0.015), 2) AS decimal(12,2)),
    3 + ((p.n * s.n * 5) % 25),
    CASE WHEN s.n = 1 THEN 1 ELSE 0 END
FROM #Numbers p
CROSS JOIN #Numbers s
JOIN dbo.Products pr ON pr.ProductID = p.n
WHERE p.n <= 100 AND s.n <= 3;

SET IDENTITY_INSERT dbo.Warehouses ON;
INSERT dbo.Warehouses (WarehouseID, WarehouseCode, WarehouseName, CityID) VALUES
(1,'WH-AMM',N'Amman Fulfillment Center',1),
(2,'WH-DXB',N'Dubai Fulfillment Center',3),
(3,'WH-LON',N'London Fulfillment Center',5),
(4,'WH-BER',N'Berlin Fulfillment Center',7),
(5,'WH-NYC',N'New York Fulfillment Center',9),
(6,'WH-SGP',N'Singapore Fulfillment Center',15);
SET IDENTITY_INSERT dbo.Warehouses OFF;

INSERT dbo.SalesOrders
(OrderNumber, CustomerID, SalesEmployeeID, SalesChannelID, OrderStatusID,
 OrderDate, RequiredDate, OrderDiscount)
SELECT
    'ORD-' + RIGHT('000000' + CONVERT(varchar(6), n), 6),
    ((n * 7 - 1) % 160) + 1,
    3 + ((n * 5 - 1) % 8),
    1 + ((n * 3 - 1) % 4),
    CASE
        WHEN n % 20 = 0 THEN 6
        WHEN n % 20 = 1 THEN 1
        WHEN n % 20 = 2 THEN 2
        WHEN n % 20 = 3 THEN 3
        WHEN n % 20 IN (4,5) THEN 4
        WHEN n % 20 = 6 THEN 7
        ELSE 5
    END,
    DATEADD(DAY, (n * 13) % 730, CONVERT(date,'2024-01-01')),
    DATEADD(DAY, 4 + (n % 8), DATEADD(DAY, (n * 13) % 730, CONVERT(date,'2024-01-01'))),
    CAST(CASE n % 7 WHEN 0 THEN 50 WHEN 1 THEN 25 WHEN 2 THEN 10 ELSE 0 END AS decimal(12,2))
FROM #Numbers
WHERE n <= 900;

-- Create realistic same-day repeat orders for a subset of customers.
UPDATE targetOrder
SET
    targetOrder.CustomerID = previousOrder.CustomerID,
    targetOrder.OrderDate = previousOrder.OrderDate,
    targetOrder.RequiredDate = DATEADD(DAY, 4 + (targetOrder.OrderID % 8), previousOrder.OrderDate)
FROM dbo.SalesOrders targetOrder
JOIN dbo.SalesOrders previousOrder
  ON previousOrder.OrderID = targetOrder.OrderID - 1
WHERE targetOrder.OrderID % 30 = 0;

INSERT dbo.OrderItems
(OrderID, ProductID, Quantity, UnitPrice, DiscountPercent)
SELECT
    o.OrderID,
    p.ProductID,
    1 + ((o.OrderID + i.n * 3) % 6),
    CAST(ROUND(p.ListPrice * (0.80 + ((o.OrderID + i.n) % 4) * 0.10), 2) AS decimal(12,2)),
    CAST(CASE (o.OrderID + i.n) % 9
        WHEN 0 THEN 15
        WHEN 1 THEN 10
        WHEN 2 THEN 5
        ELSE 0
    END AS decimal(5,2))
FROM dbo.SalesOrders o
CROSS JOIN #Numbers i
JOIN dbo.Products p
  ON p.ProductID = ((o.OrderID * 11 + i.n * 17 - 1) % 100) + 1
WHERE i.n <= 4;

INSERT dbo.OrderStatusHistory
(OrderID, OrderStatusID, ChangedAt, ChangedByEmployeeID)
SELECT OrderID, 1, DATEADD(HOUR, 8, CAST(OrderDate AS datetime2(0))), SalesEmployeeID
FROM dbo.SalesOrders;

INSERT dbo.OrderStatusHistory
(OrderID, OrderStatusID, ChangedAt, ChangedByEmployeeID)
SELECT OrderID, 2, DATEADD(HOUR, 12 + (OrderID % 8), CAST(OrderDate AS datetime2(0))), SalesEmployeeID
FROM dbo.SalesOrders
WHERE OrderStatusID NOT IN (1,6);

INSERT dbo.OrderStatusHistory
(OrderID, OrderStatusID, ChangedAt, ChangedByEmployeeID)
SELECT OrderID, 3, DATEADD(DAY, 1 + (OrderID % 3), CAST(OrderDate AS datetime2(0))), 11 + ((OrderID - 1) % 6)
FROM dbo.SalesOrders
WHERE OrderStatusID IN (3,4,5,7);

INSERT dbo.OrderStatusHistory
(OrderID, OrderStatusID, ChangedAt, ChangedByEmployeeID)
SELECT OrderID, 4, DATEADD(DAY, 2 + (OrderID % 5), CAST(OrderDate AS datetime2(0))), 11 + ((OrderID - 1) % 6)
FROM dbo.SalesOrders
WHERE OrderStatusID IN (4,5,7);

INSERT dbo.OrderStatusHistory
(OrderID, OrderStatusID, ChangedAt, ChangedByEmployeeID)
SELECT OrderID, 5, DATEADD(DAY, 4 + (OrderID % 7), CAST(OrderDate AS datetime2(0))), 11 + ((OrderID - 1) % 6)
FROM dbo.SalesOrders
WHERE OrderStatusID IN (5,7);

INSERT dbo.OrderStatusHistory
(OrderID, OrderStatusID, ChangedAt, ChangedByEmployeeID)
SELECT OrderID, 6, DATEADD(HOUR, 15 + (OrderID % 12), CAST(OrderDate AS datetime2(0))), SalesEmployeeID
FROM dbo.SalesOrders
WHERE OrderStatusID = 6;

INSERT dbo.OrderStatusHistory
(OrderID, OrderStatusID, ChangedAt, ChangedByEmployeeID)
SELECT OrderID, 7, DATEADD(DAY, 10 + (OrderID % 10), CAST(OrderDate AS datetime2(0))), 24 + ((OrderID - 1) % 6)
FROM dbo.SalesOrders
WHERE OrderStatusID = 7;

;WITH OrderTotals AS
(
    SELECT
        o.OrderID,
        o.OrderDate,
        o.OrderStatusID,
        o.OrderDiscount,
        CAST(SUM(oi.Quantity * oi.UnitPrice * (1 - oi.DiscountPercent / 100.0))
             - o.OrderDiscount AS decimal(12,2)) AS OrderTotal
    FROM dbo.SalesOrders o
    JOIN dbo.OrderItems oi ON oi.OrderID = o.OrderID
    GROUP BY o.OrderID, o.OrderDate, o.OrderStatusID, o.OrderDiscount
)
INSERT dbo.Payments
(OrderID, PaymentMethodID, PaymentStatusID, PaymentDate, Amount, TransactionCode)
SELECT
    OrderID,
    1 + ((OrderID * 3 - 1) % 4),
    3,
    DATEADD(HOUR, 10, DATEADD(DAY,1,CAST(OrderDate AS datetime2(0)))),
    CASE WHEN OrderTotal <= 0 THEN 1 ELSE OrderTotal END,
    'TX-F-' + RIGHT('000000' + CONVERT(varchar(6),OrderID),6)
FROM OrderTotals
WHERE OrderStatusID NOT IN (1,6)
  AND OrderID % 13 = 0;

;WITH OrderTotals AS
(
    SELECT
        o.OrderID,
        o.OrderDate,
        o.OrderStatusID,
        o.OrderDiscount,
        CAST(SUM(oi.Quantity * oi.UnitPrice * (1 - oi.DiscountPercent / 100.0))
             - o.OrderDiscount AS decimal(12,2)) AS OrderTotal
    FROM dbo.SalesOrders o
    JOIN dbo.OrderItems oi ON oi.OrderID = o.OrderID
    GROUP BY o.OrderID, o.OrderDate, o.OrderStatusID, o.OrderDiscount
)
INSERT dbo.Payments
(OrderID, PaymentMethodID, PaymentStatusID, PaymentDate, Amount, TransactionCode)
SELECT
    OrderID,
    1 + ((OrderID * 3 - 1) % 4),
    2,
    DATEADD(HOUR, 11, DATEADD(DAY,CASE WHEN OrderID % 13 = 0 THEN 2 ELSE 1 END,
        CAST(OrderDate AS datetime2(0)))),
    CASE WHEN OrderTotal <= 0 THEN 1 ELSE OrderTotal END,
    'TX-C-' + RIGHT('000000' + CONVERT(varchar(6),OrderID),6)
FROM OrderTotals
WHERE OrderStatusID NOT IN (1,6)
  AND OrderID % 9 <> 0;

;WITH OrderTotals AS
(
    SELECT
        o.OrderID,
        o.OrderDate,
        o.OrderStatusID,
        o.OrderDiscount,
        CAST(SUM(oi.Quantity * oi.UnitPrice * (1 - oi.DiscountPercent / 100.0))
             - o.OrderDiscount AS decimal(12,2)) AS OrderTotal
    FROM dbo.SalesOrders o
    JOIN dbo.OrderItems oi ON oi.OrderID = o.OrderID
    GROUP BY o.OrderID, o.OrderDate, o.OrderStatusID, o.OrderDiscount
)
INSERT dbo.Payments
(OrderID, PaymentMethodID, PaymentStatusID, PaymentDate, Amount, TransactionCode)
SELECT
    OrderID,
    1 + ((OrderID * 3 - 1) % 4),
    2,
    DATEADD(HOUR, 9, DATEADD(DAY,1,CAST(OrderDate AS datetime2(0)))),
    CASE WHEN OrderTotal <= 2 THEN 1 ELSE CAST(OrderTotal / 2.0 AS decimal(12,2)) END,
    'TX-S1-' + RIGHT('000000' + CONVERT(varchar(6),OrderID),6)
FROM OrderTotals
WHERE OrderStatusID NOT IN (1,6)
  AND OrderID % 9 = 0;

;WITH OrderTotals AS
(
    SELECT
        o.OrderID,
        o.OrderDate,
        o.OrderStatusID,
        o.OrderDiscount,
        CAST(SUM(oi.Quantity * oi.UnitPrice * (1 - oi.DiscountPercent / 100.0))
             - o.OrderDiscount AS decimal(12,2)) AS OrderTotal
    FROM dbo.SalesOrders o
    JOIN dbo.OrderItems oi ON oi.OrderID = o.OrderID
    GROUP BY o.OrderID, o.OrderDate, o.OrderStatusID, o.OrderDiscount
)
INSERT dbo.Payments
(OrderID, PaymentMethodID, PaymentStatusID, PaymentDate, Amount, TransactionCode)
SELECT
    OrderID,
    1 + ((OrderID * 3) % 4),
    2,
    DATEADD(HOUR, 14, DATEADD(DAY,2,CAST(OrderDate AS datetime2(0)))),
    CASE WHEN OrderTotal <= 2 THEN 1 ELSE OrderTotal - CAST(OrderTotal / 2.0 AS decimal(12,2)) END,
    'TX-S2-' + RIGHT('000000' + CONVERT(varchar(6),OrderID),6)
FROM OrderTotals
WHERE OrderStatusID NOT IN (1,6)
  AND OrderID % 9 = 0;

;WITH OrderTotals AS
(
    SELECT
        o.OrderID,
        o.OrderDate,
        o.OrderStatusID,
        o.OrderDiscount,
        CAST(SUM(oi.Quantity * oi.UnitPrice * (1 - oi.DiscountPercent / 100.0))
             - o.OrderDiscount AS decimal(12,2)) AS OrderTotal
    FROM dbo.SalesOrders o
    JOIN dbo.OrderItems oi ON oi.OrderID = o.OrderID
    GROUP BY o.OrderID, o.OrderDate, o.OrderStatusID, o.OrderDiscount
)
INSERT dbo.Payments
(OrderID, PaymentMethodID, PaymentStatusID, PaymentDate, Amount, TransactionCode)
SELECT
    OrderID,
    1 + ((OrderID * 3 - 1) % 4),
    CASE WHEN OrderID % 4 = 0 THEN 5 ELSE 4 END,
    DATEADD(DAY, 12 + (OrderID % 8), CAST(OrderDate AS datetime2(0))),
    CASE
        WHEN OrderID % 4 = 0
            THEN CASE WHEN OrderTotal <= 2 THEN 1 ELSE CAST(OrderTotal * 0.40 AS decimal(12,2)) END
        ELSE CASE WHEN OrderTotal <= 0 THEN 1 ELSE OrderTotal END
    END,
    'TX-R-' + RIGHT('000000' + CONVERT(varchar(6),OrderID),6)
FROM OrderTotals
WHERE OrderStatusID = 7;

INSERT dbo.Shipments
(ShipmentNumber, OrderID, WarehouseID, ShipmentStatusID, ShippedAt, DeliveredAt, ShippingCost)
SELECT
    'SHP-' + RIGHT('000000' + CONVERT(varchar(6),OrderID),6) + '-1',
    OrderID,
    1 + ((OrderID * 3 - 1) % 6),
    CASE
        WHEN OrderStatusID = 4 AND OrderID % 5 = 0 THEN 4
        WHEN OrderStatusID = 4 THEN 2
        ELSE 3
    END,
    DATEADD(HOUR, 8, DATEADD(DAY, 2 + (OrderID % 5), CAST(OrderDate AS datetime2(0)))),
    CASE WHEN OrderStatusID = 4 THEN NULL
         ELSE DATEADD(HOUR, 16, DATEADD(DAY, 4 + (OrderID % 7), CAST(OrderDate AS datetime2(0))))
    END,
    CAST(8 + (OrderID % 35) + CASE WHEN OrderID % 41 = 0 THEN 65 ELSE 0 END AS decimal(12,2))
FROM dbo.SalesOrders
WHERE OrderStatusID IN (4,5,7);

INSERT dbo.Shipments
(ShipmentNumber, OrderID, WarehouseID, ShipmentStatusID, ShippedAt, DeliveredAt, ShippingCost)
SELECT
    'SHP-' + RIGHT('000000' + CONVERT(varchar(6),OrderID),6) + '-2',
    OrderID,
    1 + ((OrderID * 3 - 1) % 6),
    CASE WHEN OrderStatusID = 4 THEN 2 ELSE 3 END,
    DATEADD(HOUR, 10, DATEADD(DAY, 3 + (OrderID % 5), CAST(OrderDate AS datetime2(0)))),
    CASE WHEN OrderStatusID = 4 THEN NULL
         ELSE DATEADD(HOUR, 18, DATEADD(DAY, 5 + (OrderID % 8), CAST(OrderDate AS datetime2(0))))
    END,
    CAST(6 + (OrderID % 23) AS decimal(12,2))
FROM dbo.SalesOrders
WHERE OrderStatusID IN (4,5,7)
  AND OrderID % 6 = 0;

;WITH ShipmentRanks AS
(
    SELECT
        s.ShipmentID,
        s.OrderID,
        ROW_NUMBER() OVER (PARTITION BY s.OrderID ORDER BY s.ShipmentID) AS ShipmentRank,
        COUNT(*) OVER (PARTITION BY s.OrderID) AS ShipmentCount
    FROM dbo.Shipments s
),
ItemRanks AS
(
    SELECT
        oi.OrderItemID,
        oi.OrderID,
        oi.Quantity,
        ROW_NUMBER() OVER (PARTITION BY oi.OrderID ORDER BY oi.OrderItemID) AS ItemRank
    FROM dbo.OrderItems oi
)
INSERT dbo.ShipmentItems (ShipmentID, OrderItemID, QuantityShipped)
SELECT
    sr.ShipmentID,
    ir.OrderItemID,
    ir.Quantity
FROM ShipmentRanks sr
JOIN ItemRanks ir ON ir.OrderID = sr.OrderID
WHERE sr.ShipmentCount = 1
   OR (sr.ShipmentCount = 2
       AND sr.ShipmentRank = CASE WHEN ir.ItemRank % 2 = 1 THEN 1 ELSE 2 END);

INSERT dbo.InventoryTransactions
(WarehouseID, ProductID, InventoryTransactionTypeID, TransactionDate,
 QuantityChange, UnitCost, DocumentNumber)
SELECT
    w.n,
    p.n,
    1,
    '2023-12-31T08:00:00',
    35 + ((w.n * p.n * 7) % 90),
    pr.StandardCost,
    'OPEN-' + CONVERT(varchar(2),w.n) + '-' + RIGHT('0000' + CONVERT(varchar(4),p.n),4)
FROM #Numbers w
CROSS JOIN #Numbers p
JOIN dbo.Products pr ON pr.ProductID = p.n
WHERE w.n <= 6 AND p.n <= 100;

INSERT dbo.InventoryTransactions
(WarehouseID, ProductID, InventoryTransactionTypeID, TransactionDate,
 QuantityChange, UnitCost, DocumentNumber)
SELECT
    1 + ((n * 7 - 1) % 6),
    1 + ((n * 17 - 1) % 100),
    CASE n % 10
        WHEN 0 THEN 2
        WHEN 1 THEN 2
        WHEN 2 THEN 4
        WHEN 3 THEN 5
        WHEN 4 THEN 6
        WHEN 5 THEN 7
        ELSE 3
    END,
    DATEADD(HOUR, n % 20,
        DATEADD(DAY, (n * 11) % 730, CAST('2024-01-01' AS datetime2(0)))),
    CASE n % 10
        WHEN 0 THEN 35 + (n % 70)
        WHEN 1 THEN 20 + (n % 55)
        WHEN 2 THEN 2 + (n % 15)
        WHEN 3 THEN CASE WHEN n % 2 = 0 THEN 8 + (n % 22) ELSE -(5 + (n % 18)) END
        WHEN 4 THEN 12 + (n % 28)
        WHEN 5 THEN -(12 + (n % 28))
        ELSE -(12 + (n % 55))
    END,
    p.StandardCost,
    'INV-' + RIGHT('000000' + CONVERT(varchar(6),n),6)
FROM #Numbers
JOIN dbo.Products p
  ON p.ProductID = 1 + ((n * 17 - 1) % 100)
WHERE n <= 7200;

INSERT dbo.PurchaseOrders
(PurchaseOrderNumber, SupplierID, WarehouseID, BuyerEmployeeID,
 PurchaseOrderStatusID, OrderDate, ExpectedDate, ReceivedDate)
SELECT
    'PO-' + RIGHT('00000' + CONVERT(varchar(5),n),5),
    1 + ((n * 7 - 1) % 20),
    1 + ((n * 5 - 1) % 6),
    19 + ((n * 3 - 1) % 4),
    CASE n % 12
        WHEN 0 THEN 5
        WHEN 1 THEN 1
        WHEN 2 THEN 2
        WHEN 3 THEN 3
        ELSE 4
    END,
    DATEADD(DAY, (n * 9) % 700, CONVERT(date,'2024-01-01')),
    DATEADD(DAY, 8 + (n % 20), DATEADD(DAY, (n * 9) % 700, CONVERT(date,'2024-01-01'))),
    CASE WHEN n % 12 IN (0,1,2) THEN NULL
         WHEN n % 12 = 3
              THEN DATEADD(DAY, 6 + (n % 25), DATEADD(DAY, (n * 9) % 700, CONVERT(date,'2024-01-01')))
         ELSE DATEADD(DAY, 7 + (n % 22), DATEADD(DAY, (n * 9) % 700, CONVERT(date,'2024-01-01')))
    END
FROM #Numbers
WHERE n <= 240;

;WITH CandidatePurchaseLines AS
(
    SELECT
        po.PurchaseOrderID,
        po.PurchaseOrderStatusID,
        ps.ProductID,
        ps.UnitCost,
        ROW_NUMBER() OVER
        (
            PARTITION BY po.PurchaseOrderID
            ORDER BY
                ABS(ps.ProductID - (1 + ((po.PurchaseOrderID * 13 - 1) % 100))),
                ps.ProductID
        ) AS LineNumber
    FROM dbo.PurchaseOrders po
    JOIN dbo.ProductSuppliers ps ON ps.SupplierID = po.SupplierID
),
SelectedPurchaseLines AS
(
    SELECT
        cpl.*,
        30 + ((cpl.PurchaseOrderID * cpl.LineNumber * 7) % 170) AS QuantityOrdered
    FROM CandidatePurchaseLines cpl
    WHERE cpl.LineNumber <= 3
)
INSERT dbo.PurchaseOrderItems
(PurchaseOrderID, ProductID, QuantityOrdered, UnitCost, QuantityReceived)
SELECT
    spl.PurchaseOrderID,
    spl.ProductID,
    spl.QuantityOrdered,
    spl.UnitCost,
    CASE spl.PurchaseOrderStatusID
        WHEN 4 THEN spl.QuantityOrdered
        WHEN 3 THEN CAST(spl.QuantityOrdered * (0.35 + spl.LineNumber * 0.12) AS int)
        ELSE 0
    END
FROM SelectedPurchaseLines spl;
INSERT dbo.SupportTickets
(TicketNumber, CustomerID, OrderID, AssignedEmployeeID, PriorityID,
 CurrentStatusID, CreatedAt, ResolvedAt, Subject)
SELECT
    'TKT-' + RIGHT('00000' + CONVERT(varchar(5),n),5),
    o.CustomerID,
    o.OrderID,
    24 + ((n * 5 - 1) % 6),
    1 + ((n * 3 - 1) % 4),
    CASE n % 10
        WHEN 0 THEN 1
        WHEN 1 THEN 2
        WHEN 2 THEN 3
        WHEN 3 THEN 6
        WHEN 4 THEN 4
        ELSE 5
    END,
    DATEADD(HOUR, 9 + (n % 9),
        DATEADD(DAY, 1 + (n % 18), CAST(o.OrderDate AS datetime2(0)))),
    CASE WHEN n % 10 IN (0,1,2)
         THEN NULL
         ELSE DATEADD(HOUR, 4 + (n % 70),
              DATEADD(HOUR, 9 + (n % 9),
                  DATEADD(DAY, 1 + (n % 18), CAST(o.OrderDate AS datetime2(0)))))
    END,
    CASE n % 5
        WHEN 0 THEN N'Delivery arrived later than expected'
        WHEN 1 THEN N'Payment confirmation question'
        WHEN 2 THEN N'Product setup assistance'
        WHEN 3 THEN N'Return and refund request'
        ELSE N'Order status clarification'
    END
FROM #Numbers n
JOIN dbo.SalesOrders o ON o.OrderID = 1 + ((n.n * 19 - 1) % 900)
WHERE n.n <= 320;

INSERT dbo.TicketStatusHistory (TicketID, SupportTicketStatusID, ChangedAt)
SELECT TicketID, 1, CreatedAt
FROM dbo.SupportTickets;

INSERT dbo.TicketStatusHistory (TicketID, SupportTicketStatusID, ChangedAt)
SELECT TicketID, 2, DATEADD(HOUR, 1 + (TicketID % 6), CreatedAt)
FROM dbo.SupportTickets
WHERE CurrentStatusID <> 1;

INSERT dbo.TicketStatusHistory (TicketID, SupportTicketStatusID, ChangedAt)
SELECT TicketID, 3, DATEADD(HOUR, 5 + (TicketID % 12), CreatedAt)
FROM dbo.SupportTickets
WHERE TicketID % 7 = 0;

INSERT dbo.TicketStatusHistory (TicketID, SupportTicketStatusID, ChangedAt)
SELECT TicketID, 4,
       DATEADD(HOUR, 10 + (TicketID % 60), CreatedAt)
FROM dbo.SupportTickets
WHERE CurrentStatusID IN (4,5,6);

INSERT dbo.TicketStatusHistory (TicketID, SupportTicketStatusID, ChangedAt)
SELECT TicketID, 6,
       DATEADD(HOUR, 80 + (TicketID % 24), CreatedAt)
FROM dbo.SupportTickets
WHERE CurrentStatusID = 6;


INSERT dbo.TicketStatusHistory (TicketID, SupportTicketStatusID, ChangedAt)
SELECT TicketID, 5,
       CASE WHEN ResolvedAt IS NULL
            THEN DATEADD(HOUR, 25 + (TicketID % 96), CreatedAt)
            ELSE DATEADD(HOUR, 2, ResolvedAt)
       END
FROM dbo.SupportTickets
WHERE CurrentStatusID = 5;

INSERT dbo.Returns
(ReturnNumber, OrderID, ReturnReasonID, ReturnStatusID, ApprovedByEmployeeID, ReturnDate)
SELECT
    'RET-' + RIGHT('00000' + CONVERT(varchar(5),ROW_NUMBER() OVER (ORDER BY o.OrderID)),5),
    o.OrderID,
    1 + ((o.OrderID * 3 - 1) % 5),
    CASE WHEN o.OrderStatusID = 7 THEN 3
         WHEN o.OrderID % 3 = 0 THEN 2
         ELSE 4
    END,
    CASE WHEN o.OrderID % 3 = 1 THEN NULL ELSE 24 + ((o.OrderID - 1) % 6) END,
    DATEADD(DAY, 8 + (o.OrderID % 20), o.OrderDate)
FROM dbo.SalesOrders o
WHERE o.OrderStatusID = 7
   OR (o.OrderStatusID = 5 AND o.OrderID % 17 = 0);

INSERT dbo.ReturnItems
(ReturnID, OrderItemID, QuantityReturned, RefundAmount)
SELECT
    r.ReturnID,
    oi.OrderItemID,
    CASE WHEN oi.Quantity > 1 AND r.ReturnID % 2 = 0 THEN 2 ELSE 1 END,
    CAST(ROUND(
        (CASE WHEN oi.Quantity > 1 AND r.ReturnID % 2 = 0 THEN 2 ELSE 1 END)
        * oi.UnitPrice * (1 - oi.DiscountPercent / 100.0), 2) AS decimal(12,2))
FROM dbo.Returns r
JOIN
(
    SELECT
        oi.*,
        ROW_NUMBER() OVER (PARTITION BY oi.OrderID ORDER BY oi.OrderItemID) AS ItemSequence
    FROM dbo.OrderItems oi
) oi ON oi.OrderID = r.OrderID
WHERE oi.ItemSequence <= CASE WHEN r.ReturnID % 4 = 0 THEN 2 ELSE 1 END;

DROP TABLE #Numbers;
GO
