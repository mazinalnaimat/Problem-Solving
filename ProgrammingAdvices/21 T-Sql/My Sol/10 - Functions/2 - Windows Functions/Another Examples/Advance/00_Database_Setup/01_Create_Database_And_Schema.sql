USE master;
GO

IF DB_ID(N'RetailOperations3NFDB') IS NOT NULL
BEGIN
    ALTER DATABASE RetailOperations3NFDB SET SINGLE_USER WITH ROLLBACK IMMEDIATE;
    DROP DATABASE RetailOperations3NFDB;
END;
GO

CREATE DATABASE RetailOperations3NFDB;
GO

ALTER DATABASE RetailOperations3NFDB SET RECOVERY SIMPLE;
GO

USE RetailOperations3NFDB;
GO

SET ANSI_NULLS ON;
SET QUOTED_IDENTIFIER ON;
SET NOCOUNT ON;
GO

CREATE TABLE dbo.Regions
(
    RegionID       int IDENTITY(1,1) NOT NULL CONSTRAINT PK_Regions PRIMARY KEY,
    RegionCode     varchar(10) NOT NULL CONSTRAINT UQ_Regions_RegionCode UNIQUE,
    RegionName     nvarchar(80) NOT NULL CONSTRAINT UQ_Regions_RegionName UNIQUE
);
GO

CREATE TABLE dbo.Countries
(
    CountryID      int IDENTITY(1,1) NOT NULL CONSTRAINT PK_Countries PRIMARY KEY,
    RegionID       int NOT NULL,
    CountryCode    char(2) NOT NULL CONSTRAINT UQ_Countries_CountryCode UNIQUE,
    CountryName    nvarchar(80) NOT NULL CONSTRAINT UQ_Countries_CountryName UNIQUE,
    CONSTRAINT FK_Countries_Regions
        FOREIGN KEY (RegionID) REFERENCES dbo.Regions(RegionID)
);
GO

CREATE TABLE dbo.Cities
(
    CityID         int IDENTITY(1,1) NOT NULL CONSTRAINT PK_Cities PRIMARY KEY,
    CountryID      int NOT NULL,
    CityName       nvarchar(100) NOT NULL,
    CONSTRAINT UQ_Cities_Country_City UNIQUE (CountryID, CityName),
    CONSTRAINT FK_Cities_Countries
        FOREIGN KEY (CountryID) REFERENCES dbo.Countries(CountryID)
);
GO

CREATE TABLE dbo.CustomerSegments
(
    SegmentID      int IDENTITY(1,1) NOT NULL CONSTRAINT PK_CustomerSegments PRIMARY KEY,
    SegmentName    nvarchar(60) NOT NULL CONSTRAINT UQ_CustomerSegments_SegmentName UNIQUE
);
GO

CREATE TABLE dbo.Customers
(
    CustomerID       int IDENTITY(1,1) NOT NULL CONSTRAINT PK_Customers PRIMARY KEY,
    CustomerNumber   varchar(20) NOT NULL CONSTRAINT UQ_Customers_CustomerNumber UNIQUE,
    FullName         nvarchar(120) NOT NULL,
    Email            varchar(160) NOT NULL CONSTRAINT UQ_Customers_Email UNIQUE,
    CityID           int NOT NULL,
    SegmentID        int NOT NULL,
    RegistrationDate date NOT NULL,
    IsActive         bit NOT NULL CONSTRAINT DF_Customers_IsActive DEFAULT (1),
    CONSTRAINT FK_Customers_Cities
        FOREIGN KEY (CityID) REFERENCES dbo.Cities(CityID),
    CONSTRAINT FK_Customers_Segments
        FOREIGN KEY (SegmentID) REFERENCES dbo.CustomerSegments(SegmentID)
);
GO

CREATE TABLE dbo.Departments
(
    DepartmentID   int IDENTITY(1,1) NOT NULL CONSTRAINT PK_Departments PRIMARY KEY,
    DepartmentName nvarchar(80) NOT NULL CONSTRAINT UQ_Departments_DepartmentName UNIQUE
);
GO

CREATE TABLE dbo.Employees
(
    EmployeeID       int IDENTITY(1,1) NOT NULL CONSTRAINT PK_Employees PRIMARY KEY,
    EmployeeNumber   varchar(20) NOT NULL CONSTRAINT UQ_Employees_EmployeeNumber UNIQUE,
    FullName         nvarchar(120) NOT NULL,
    DepartmentID     int NOT NULL,
    ManagerID         int NULL,
    HireDate          date NOT NULL,
    BaseSalary        decimal(12,2) NOT NULL,
    IsActive          bit NOT NULL CONSTRAINT DF_Employees_IsActive DEFAULT (1),
    CONSTRAINT CK_Employees_BaseSalary CHECK (BaseSalary > 0),
    CONSTRAINT FK_Employees_Departments
        FOREIGN KEY (DepartmentID) REFERENCES dbo.Departments(DepartmentID),
    CONSTRAINT FK_Employees_Manager
        FOREIGN KEY (ManagerID) REFERENCES dbo.Employees(EmployeeID)
);
GO

CREATE TABLE dbo.SalesChannels
(
    SalesChannelID int IDENTITY(1,1) NOT NULL CONSTRAINT PK_SalesChannels PRIMARY KEY,
    ChannelName    nvarchar(60) NOT NULL CONSTRAINT UQ_SalesChannels_ChannelName UNIQUE
);
GO

CREATE TABLE dbo.OrderStatuses
(
    OrderStatusID int IDENTITY(1,1) NOT NULL CONSTRAINT PK_OrderStatuses PRIMARY KEY,
    StatusName    nvarchar(60) NOT NULL CONSTRAINT UQ_OrderStatuses_StatusName UNIQUE
);
GO

CREATE TABLE dbo.Categories
(
    CategoryID       int IDENTITY(1,1) NOT NULL CONSTRAINT PK_Categories PRIMARY KEY,
    ParentCategoryID int NULL,
    CategoryName     nvarchar(100) NOT NULL CONSTRAINT UQ_Categories_CategoryName UNIQUE,
    CONSTRAINT FK_Categories_Parent
        FOREIGN KEY (ParentCategoryID) REFERENCES dbo.Categories(CategoryID)
);
GO

CREATE TABLE dbo.Brands
(
    BrandID       int IDENTITY(1,1) NOT NULL CONSTRAINT PK_Brands PRIMARY KEY,
    BrandName     nvarchar(100) NOT NULL CONSTRAINT UQ_Brands_BrandName UNIQUE
);
GO

CREATE TABLE dbo.Products
(
    ProductID     int IDENTITY(1,1) NOT NULL CONSTRAINT PK_Products PRIMARY KEY,
    SKU           varchar(30) NOT NULL CONSTRAINT UQ_Products_SKU UNIQUE,
    ProductName   nvarchar(150) NOT NULL,
    CategoryID    int NOT NULL,
    BrandID       int NOT NULL,
    StandardCost  decimal(12,2) NOT NULL,
    ListPrice     decimal(12,2) NOT NULL,
    ReorderLevel  int NOT NULL,
    IsActive      bit NOT NULL CONSTRAINT DF_Products_IsActive DEFAULT (1),
    CONSTRAINT CK_Products_Prices CHECK (StandardCost > 0 AND ListPrice > 0 AND ListPrice >= StandardCost),
    CONSTRAINT CK_Products_ReorderLevel CHECK (ReorderLevel >= 0),
    CONSTRAINT FK_Products_Categories
        FOREIGN KEY (CategoryID) REFERENCES dbo.Categories(CategoryID),
    CONSTRAINT FK_Products_Brands
        FOREIGN KEY (BrandID) REFERENCES dbo.Brands(BrandID)
);
GO

CREATE TABLE dbo.Suppliers
(
    SupplierID     int IDENTITY(1,1) NOT NULL CONSTRAINT PK_Suppliers PRIMARY KEY,
    SupplierCode   varchar(20) NOT NULL CONSTRAINT UQ_Suppliers_SupplierCode UNIQUE,
    SupplierName   nvarchar(140) NOT NULL,
    CityID         int NOT NULL,
    Rating         decimal(3,2) NOT NULL,
    IsActive       bit NOT NULL CONSTRAINT DF_Suppliers_IsActive DEFAULT (1),
    CONSTRAINT CK_Suppliers_Rating CHECK (Rating BETWEEN 1.00 AND 5.00),
    CONSTRAINT FK_Suppliers_Cities
        FOREIGN KEY (CityID) REFERENCES dbo.Cities(CityID)
);
GO

CREATE TABLE dbo.ProductSuppliers
(
    ProductID           int NOT NULL,
    SupplierID          int NOT NULL,
    SupplierProductCode varchar(40) NOT NULL,
    UnitCost            decimal(12,2) NOT NULL,
    LeadTimeDays        int NOT NULL,
    IsPreferred         bit NOT NULL,
    CONSTRAINT PK_ProductSuppliers PRIMARY KEY (ProductID, SupplierID),
    CONSTRAINT CK_ProductSuppliers_Values CHECK (UnitCost > 0 AND LeadTimeDays > 0),
    CONSTRAINT FK_ProductSuppliers_Products
        FOREIGN KEY (ProductID) REFERENCES dbo.Products(ProductID),
    CONSTRAINT FK_ProductSuppliers_Suppliers
        FOREIGN KEY (SupplierID) REFERENCES dbo.Suppliers(SupplierID)
);
GO

CREATE TABLE dbo.SalesOrders
(
    OrderID          int IDENTITY(1,1) NOT NULL CONSTRAINT PK_SalesOrders PRIMARY KEY,
    OrderNumber      varchar(25) NOT NULL CONSTRAINT UQ_SalesOrders_OrderNumber UNIQUE,
    CustomerID       int NOT NULL,
    SalesEmployeeID  int NOT NULL,
    SalesChannelID   int NOT NULL,
    OrderStatusID    int NOT NULL,
    OrderDate        date NOT NULL,
    RequiredDate     date NOT NULL,
    OrderDiscount    decimal(12,2) NOT NULL CONSTRAINT DF_SalesOrders_OrderDiscount DEFAULT (0),
    CONSTRAINT CK_SalesOrders_Dates CHECK (RequiredDate >= OrderDate),
    CONSTRAINT CK_SalesOrders_Discount CHECK (OrderDiscount >= 0),
    CONSTRAINT FK_SalesOrders_Customers
        FOREIGN KEY (CustomerID) REFERENCES dbo.Customers(CustomerID),
    CONSTRAINT FK_SalesOrders_Employees
        FOREIGN KEY (SalesEmployeeID) REFERENCES dbo.Employees(EmployeeID),
    CONSTRAINT FK_SalesOrders_Channels
        FOREIGN KEY (SalesChannelID) REFERENCES dbo.SalesChannels(SalesChannelID),
    CONSTRAINT FK_SalesOrders_Statuses
        FOREIGN KEY (OrderStatusID) REFERENCES dbo.OrderStatuses(OrderStatusID)
);
GO

CREATE TABLE dbo.OrderItems
(
    OrderItemID      int IDENTITY(1,1) NOT NULL CONSTRAINT PK_OrderItems PRIMARY KEY,
    OrderID          int NOT NULL,
    ProductID        int NOT NULL,
    Quantity         int NOT NULL,
    UnitPrice        decimal(12,2) NOT NULL,
    DiscountPercent  decimal(5,2) NOT NULL CONSTRAINT DF_OrderItems_Discount DEFAULT (0),
    CONSTRAINT UQ_OrderItems_Order_Product UNIQUE (OrderID, ProductID),
    CONSTRAINT CK_OrderItems_Values CHECK
        (Quantity > 0 AND UnitPrice > 0 AND DiscountPercent BETWEEN 0 AND 100),
    CONSTRAINT FK_OrderItems_Orders
        FOREIGN KEY (OrderID) REFERENCES dbo.SalesOrders(OrderID),
    CONSTRAINT FK_OrderItems_Products
        FOREIGN KEY (ProductID) REFERENCES dbo.Products(ProductID)
);
GO

CREATE TABLE dbo.OrderStatusHistory
(
    OrderStatusHistoryID bigint IDENTITY(1,1) NOT NULL CONSTRAINT PK_OrderStatusHistory PRIMARY KEY,
    OrderID               int NOT NULL,
    OrderStatusID         int NOT NULL,
    ChangedAt             datetime2(0) NOT NULL,
    ChangedByEmployeeID   int NOT NULL,
    CONSTRAINT UQ_OrderStatusHistory UNIQUE (OrderID, ChangedAt, OrderStatusID),
    CONSTRAINT FK_OrderStatusHistory_Orders
        FOREIGN KEY (OrderID) REFERENCES dbo.SalesOrders(OrderID),
    CONSTRAINT FK_OrderStatusHistory_Statuses
        FOREIGN KEY (OrderStatusID) REFERENCES dbo.OrderStatuses(OrderStatusID),
    CONSTRAINT FK_OrderStatusHistory_Employees
        FOREIGN KEY (ChangedByEmployeeID) REFERENCES dbo.Employees(EmployeeID)
);
GO

CREATE TABLE dbo.PaymentMethods
(
    PaymentMethodID int IDENTITY(1,1) NOT NULL CONSTRAINT PK_PaymentMethods PRIMARY KEY,
    MethodName      nvarchar(60) NOT NULL CONSTRAINT UQ_PaymentMethods_MethodName UNIQUE
);
GO

CREATE TABLE dbo.PaymentStatuses
(
    PaymentStatusID int IDENTITY(1,1) NOT NULL CONSTRAINT PK_PaymentStatuses PRIMARY KEY,
    StatusName      nvarchar(60) NOT NULL CONSTRAINT UQ_PaymentStatuses_StatusName UNIQUE
);
GO

CREATE TABLE dbo.Payments
(
    PaymentID       bigint IDENTITY(1,1) NOT NULL CONSTRAINT PK_Payments PRIMARY KEY,
    OrderID         int NOT NULL,
    PaymentMethodID int NOT NULL,
    PaymentStatusID int NOT NULL,
    PaymentDate     datetime2(0) NOT NULL,
    Amount          decimal(12,2) NOT NULL,
    TransactionCode varchar(40) NOT NULL CONSTRAINT UQ_Payments_TransactionCode UNIQUE,
    CONSTRAINT CK_Payments_Amount CHECK (Amount > 0),
    CONSTRAINT FK_Payments_Orders
        FOREIGN KEY (OrderID) REFERENCES dbo.SalesOrders(OrderID),
    CONSTRAINT FK_Payments_Methods
        FOREIGN KEY (PaymentMethodID) REFERENCES dbo.PaymentMethods(PaymentMethodID),
    CONSTRAINT FK_Payments_Statuses
        FOREIGN KEY (PaymentStatusID) REFERENCES dbo.PaymentStatuses(PaymentStatusID)
);
GO

CREATE TABLE dbo.Warehouses
(
    WarehouseID    int IDENTITY(1,1) NOT NULL CONSTRAINT PK_Warehouses PRIMARY KEY,
    WarehouseCode  varchar(20) NOT NULL CONSTRAINT UQ_Warehouses_WarehouseCode UNIQUE,
    WarehouseName  nvarchar(120) NOT NULL,
    CityID         int NOT NULL,
    CONSTRAINT FK_Warehouses_Cities
        FOREIGN KEY (CityID) REFERENCES dbo.Cities(CityID)
);
GO

CREATE TABLE dbo.ShipmentStatuses
(
    ShipmentStatusID int IDENTITY(1,1) NOT NULL CONSTRAINT PK_ShipmentStatuses PRIMARY KEY,
    StatusName       nvarchar(60) NOT NULL CONSTRAINT UQ_ShipmentStatuses_StatusName UNIQUE
);
GO

CREATE TABLE dbo.Shipments
(
    ShipmentID        bigint IDENTITY(1,1) NOT NULL CONSTRAINT PK_Shipments PRIMARY KEY,
    ShipmentNumber    varchar(30) NOT NULL CONSTRAINT UQ_Shipments_ShipmentNumber UNIQUE,
    OrderID           int NOT NULL,
    WarehouseID       int NOT NULL,
    ShipmentStatusID  int NOT NULL,
    ShippedAt         datetime2(0) NOT NULL,
    DeliveredAt       datetime2(0) NULL,
    ShippingCost      decimal(12,2) NOT NULL,
    CONSTRAINT CK_Shipments_Dates CHECK (DeliveredAt IS NULL OR DeliveredAt >= ShippedAt),
    CONSTRAINT CK_Shipments_Cost CHECK (ShippingCost >= 0),
    CONSTRAINT FK_Shipments_Orders
        FOREIGN KEY (OrderID) REFERENCES dbo.SalesOrders(OrderID),
    CONSTRAINT FK_Shipments_Warehouses
        FOREIGN KEY (WarehouseID) REFERENCES dbo.Warehouses(WarehouseID),
    CONSTRAINT FK_Shipments_Statuses
        FOREIGN KEY (ShipmentStatusID) REFERENCES dbo.ShipmentStatuses(ShipmentStatusID)
);
GO

CREATE TABLE dbo.ShipmentItems
(
    ShipmentID     bigint NOT NULL,
    OrderItemID    int NOT NULL,
    QuantityShipped int NOT NULL,
    CONSTRAINT PK_ShipmentItems PRIMARY KEY (ShipmentID, OrderItemID),
    CONSTRAINT CK_ShipmentItems_Quantity CHECK (QuantityShipped > 0),
    CONSTRAINT FK_ShipmentItems_Shipments
        FOREIGN KEY (ShipmentID) REFERENCES dbo.Shipments(ShipmentID),
    CONSTRAINT FK_ShipmentItems_OrderItems
        FOREIGN KEY (OrderItemID) REFERENCES dbo.OrderItems(OrderItemID)
);
GO

CREATE TABLE dbo.InventoryTransactionTypes
(
    InventoryTransactionTypeID int IDENTITY(1,1) NOT NULL CONSTRAINT PK_InventoryTransactionTypes PRIMARY KEY,
    TypeCode                    varchar(30) NOT NULL CONSTRAINT UQ_InventoryTransactionTypes_TypeCode UNIQUE,
    TypeName                    nvarchar(80) NOT NULL CONSTRAINT UQ_InventoryTransactionTypes_TypeName UNIQUE
);
GO

CREATE TABLE dbo.InventoryTransactions
(
    InventoryTransactionID bigint IDENTITY(1,1) NOT NULL CONSTRAINT PK_InventoryTransactions PRIMARY KEY,
    WarehouseID             int NOT NULL,
    ProductID               int NOT NULL,
    InventoryTransactionTypeID int NOT NULL,
    TransactionDate         datetime2(0) NOT NULL,
    QuantityChange          int NOT NULL,
    UnitCost                decimal(12,2) NOT NULL,
    DocumentNumber          varchar(35) NOT NULL,
    CONSTRAINT CK_InventoryTransactions_Quantity CHECK (QuantityChange <> 0),
    CONSTRAINT CK_InventoryTransactions_UnitCost CHECK (UnitCost >= 0),
    CONSTRAINT FK_InventoryTransactions_Warehouses
        FOREIGN KEY (WarehouseID) REFERENCES dbo.Warehouses(WarehouseID),
    CONSTRAINT FK_InventoryTransactions_Products
        FOREIGN KEY (ProductID) REFERENCES dbo.Products(ProductID),
    CONSTRAINT FK_InventoryTransactions_Types
        FOREIGN KEY (InventoryTransactionTypeID)
        REFERENCES dbo.InventoryTransactionTypes(InventoryTransactionTypeID)
);
GO

CREATE TABLE dbo.PurchaseOrderStatuses
(
    PurchaseOrderStatusID int IDENTITY(1,1) NOT NULL CONSTRAINT PK_PurchaseOrderStatuses PRIMARY KEY,
    StatusName            nvarchar(60) NOT NULL CONSTRAINT UQ_PurchaseOrderStatuses_StatusName UNIQUE
);
GO

CREATE TABLE dbo.PurchaseOrders
(
    PurchaseOrderID       int IDENTITY(1,1) NOT NULL CONSTRAINT PK_PurchaseOrders PRIMARY KEY,
    PurchaseOrderNumber   varchar(25) NOT NULL CONSTRAINT UQ_PurchaseOrders_Number UNIQUE,
    SupplierID            int NOT NULL,
    WarehouseID           int NOT NULL,
    BuyerEmployeeID       int NOT NULL,
    PurchaseOrderStatusID int NOT NULL,
    OrderDate             date NOT NULL,
    ExpectedDate          date NOT NULL,
    ReceivedDate          date NULL,
    CONSTRAINT CK_PurchaseOrders_Dates CHECK
        (ExpectedDate >= OrderDate AND (ReceivedDate IS NULL OR ReceivedDate >= OrderDate)),
    CONSTRAINT FK_PurchaseOrders_Suppliers
        FOREIGN KEY (SupplierID) REFERENCES dbo.Suppliers(SupplierID),
    CONSTRAINT FK_PurchaseOrders_Warehouses
        FOREIGN KEY (WarehouseID) REFERENCES dbo.Warehouses(WarehouseID),
    CONSTRAINT FK_PurchaseOrders_Buyers
        FOREIGN KEY (BuyerEmployeeID) REFERENCES dbo.Employees(EmployeeID),
    CONSTRAINT FK_PurchaseOrders_Statuses
        FOREIGN KEY (PurchaseOrderStatusID) REFERENCES dbo.PurchaseOrderStatuses(PurchaseOrderStatusID)
);
GO

CREATE TABLE dbo.PurchaseOrderItems
(
    PurchaseOrderItemID int IDENTITY(1,1) NOT NULL CONSTRAINT PK_PurchaseOrderItems PRIMARY KEY,
    PurchaseOrderID     int NOT NULL,
    ProductID           int NOT NULL,
    QuantityOrdered     int NOT NULL,
    UnitCost            decimal(12,2) NOT NULL,
    QuantityReceived    int NOT NULL,
    CONSTRAINT UQ_PurchaseOrderItems_PO_Product UNIQUE (PurchaseOrderID, ProductID),
    CONSTRAINT CK_PurchaseOrderItems_Values CHECK
        (QuantityOrdered > 0 AND UnitCost > 0 AND QuantityReceived BETWEEN 0 AND QuantityOrdered),
    CONSTRAINT FK_PurchaseOrderItems_Orders
        FOREIGN KEY (PurchaseOrderID) REFERENCES dbo.PurchaseOrders(PurchaseOrderID),
    CONSTRAINT FK_PurchaseOrderItems_Products
        FOREIGN KEY (ProductID) REFERENCES dbo.Products(ProductID)
);
GO

CREATE TABLE dbo.SupportPriorities
(
    PriorityID   int IDENTITY(1,1) NOT NULL CONSTRAINT PK_SupportPriorities PRIMARY KEY,
    PriorityName nvarchar(40) NOT NULL CONSTRAINT UQ_SupportPriorities_Name UNIQUE,
    TargetResolutionHours int NOT NULL,
    CONSTRAINT CK_SupportPriorities_Target CHECK (TargetResolutionHours > 0)
);
GO

CREATE TABLE dbo.SupportTicketStatuses
(
    SupportTicketStatusID int IDENTITY(1,1) NOT NULL CONSTRAINT PK_SupportTicketStatuses PRIMARY KEY,
    StatusName            nvarchar(60) NOT NULL CONSTRAINT UQ_SupportTicketStatuses_Name UNIQUE
);
GO

CREATE TABLE dbo.SupportTickets
(
    TicketID             int IDENTITY(1,1) NOT NULL CONSTRAINT PK_SupportTickets PRIMARY KEY,
    TicketNumber         varchar(25) NOT NULL CONSTRAINT UQ_SupportTickets_Number UNIQUE,
    CustomerID           int NOT NULL,
    OrderID              int NULL,
    AssignedEmployeeID   int NOT NULL,
    PriorityID           int NOT NULL,
    CurrentStatusID      int NOT NULL,
    CreatedAt            datetime2(0) NOT NULL,
    ResolvedAt           datetime2(0) NULL,
    Subject              nvarchar(180) NOT NULL,
    CONSTRAINT CK_SupportTickets_Dates CHECK (ResolvedAt IS NULL OR ResolvedAt >= CreatedAt),
    CONSTRAINT FK_SupportTickets_Customers
        FOREIGN KEY (CustomerID) REFERENCES dbo.Customers(CustomerID),
    CONSTRAINT FK_SupportTickets_Orders
        FOREIGN KEY (OrderID) REFERENCES dbo.SalesOrders(OrderID),
    CONSTRAINT FK_SupportTickets_Employees
        FOREIGN KEY (AssignedEmployeeID) REFERENCES dbo.Employees(EmployeeID),
    CONSTRAINT FK_SupportTickets_Priorities
        FOREIGN KEY (PriorityID) REFERENCES dbo.SupportPriorities(PriorityID),
    CONSTRAINT FK_SupportTickets_Statuses
        FOREIGN KEY (CurrentStatusID) REFERENCES dbo.SupportTicketStatuses(SupportTicketStatusID)
);
GO

CREATE TABLE dbo.TicketStatusHistory
(
    TicketStatusHistoryID bigint IDENTITY(1,1) NOT NULL CONSTRAINT PK_TicketStatusHistory PRIMARY KEY,
    TicketID               int NOT NULL,
    SupportTicketStatusID  int NOT NULL,
    ChangedAt              datetime2(0) NOT NULL,
    CONSTRAINT UQ_TicketStatusHistory UNIQUE (TicketID, ChangedAt, SupportTicketStatusID),
    CONSTRAINT FK_TicketStatusHistory_Tickets
        FOREIGN KEY (TicketID) REFERENCES dbo.SupportTickets(TicketID),
    CONSTRAINT FK_TicketStatusHistory_Statuses
        FOREIGN KEY (SupportTicketStatusID) REFERENCES dbo.SupportTicketStatuses(SupportTicketStatusID)
);
GO

CREATE TABLE dbo.ReturnReasons
(
    ReturnReasonID int IDENTITY(1,1) NOT NULL CONSTRAINT PK_ReturnReasons PRIMARY KEY,
    ReasonName     nvarchar(100) NOT NULL CONSTRAINT UQ_ReturnReasons_Name UNIQUE
);
GO

CREATE TABLE dbo.ReturnStatuses
(
    ReturnStatusID int IDENTITY(1,1) NOT NULL CONSTRAINT PK_ReturnStatuses PRIMARY KEY,
    StatusName     nvarchar(60) NOT NULL CONSTRAINT UQ_ReturnStatuses_Name UNIQUE
);
GO

CREATE TABLE dbo.Returns
(
    ReturnID             int IDENTITY(1,1) NOT NULL CONSTRAINT PK_Returns PRIMARY KEY,
    ReturnNumber         varchar(25) NOT NULL CONSTRAINT UQ_Returns_Number UNIQUE,
    OrderID              int NOT NULL,
    ReturnReasonID       int NOT NULL,
    ReturnStatusID       int NOT NULL,
    ApprovedByEmployeeID int NULL,
    ReturnDate           date NOT NULL,
    CONSTRAINT FK_Returns_Orders
        FOREIGN KEY (OrderID) REFERENCES dbo.SalesOrders(OrderID),
    CONSTRAINT FK_Returns_Reasons
        FOREIGN KEY (ReturnReasonID) REFERENCES dbo.ReturnReasons(ReturnReasonID),
    CONSTRAINT FK_Returns_Statuses
        FOREIGN KEY (ReturnStatusID) REFERENCES dbo.ReturnStatuses(ReturnStatusID),
    CONSTRAINT FK_Returns_Employees
        FOREIGN KEY (ApprovedByEmployeeID) REFERENCES dbo.Employees(EmployeeID)
);
GO

CREATE TABLE dbo.ReturnItems
(
    ReturnItemID     int IDENTITY(1,1) NOT NULL CONSTRAINT PK_ReturnItems PRIMARY KEY,
    ReturnID         int NOT NULL,
    OrderItemID      int NOT NULL,
    QuantityReturned int NOT NULL,
    RefundAmount     decimal(12,2) NOT NULL,
    CONSTRAINT UQ_ReturnItems_Return_OrderItem UNIQUE (ReturnID, OrderItemID),
    CONSTRAINT CK_ReturnItems_Values CHECK (QuantityReturned > 0 AND RefundAmount >= 0),
    CONSTRAINT FK_ReturnItems_Returns
        FOREIGN KEY (ReturnID) REFERENCES dbo.Returns(ReturnID),
    CONSTRAINT FK_ReturnItems_OrderItems
        FOREIGN KEY (OrderItemID) REFERENCES dbo.OrderItems(OrderItemID)
);
GO
