USE RetailOperations3NFDB;
GO

CREATE INDEX IX_Customers_City_Segment
    ON dbo.Customers(CityID, SegmentID);

CREATE INDEX IX_Employees_Manager
    ON dbo.Employees(ManagerID, DepartmentID);

CREATE INDEX IX_Products_Category_Brand
    ON dbo.Products(CategoryID, BrandID)
    INCLUDE (StandardCost, ListPrice, ReorderLevel);

CREATE INDEX IX_ProductSuppliers_Supplier
    ON dbo.ProductSuppliers(SupplierID, ProductID)
    INCLUDE (UnitCost, LeadTimeDays, IsPreferred);

CREATE INDEX IX_SalesOrders_Customer_Date
    ON dbo.SalesOrders(CustomerID, OrderDate, OrderID)
    INCLUDE (OrderStatusID, SalesEmployeeID, SalesChannelID, OrderDiscount);

CREATE INDEX IX_SalesOrders_Employee_Date
    ON dbo.SalesOrders(SalesEmployeeID, OrderDate, OrderID)
    INCLUDE (CustomerID, OrderStatusID, SalesChannelID);

CREATE INDEX IX_OrderItems_Product_Order
    ON dbo.OrderItems(ProductID, OrderID)
    INCLUDE (Quantity, UnitPrice, DiscountPercent);

CREATE INDEX IX_OrderStatusHistory_Order_Time
    ON dbo.OrderStatusHistory(OrderID, ChangedAt, OrderStatusHistoryID)
    INCLUDE (OrderStatusID);

CREATE INDEX IX_Payments_Order_Time
    ON dbo.Payments(OrderID, PaymentDate, PaymentID)
    INCLUDE (PaymentStatusID, PaymentMethodID, Amount);

CREATE INDEX IX_Shipments_Order_Time
    ON dbo.Shipments(OrderID, ShippedAt, ShipmentID)
    INCLUDE (WarehouseID, ShipmentStatusID, DeliveredAt, ShippingCost);

CREATE INDEX IX_Shipments_Warehouse_Time
    ON dbo.Shipments(WarehouseID, ShippedAt, ShipmentID)
    INCLUDE (OrderID, DeliveredAt, ShippingCost, ShipmentStatusID);

CREATE INDEX IX_InventoryTransactions_Warehouse_Product_Time
    ON dbo.InventoryTransactions(WarehouseID, ProductID, TransactionDate, InventoryTransactionID)
    INCLUDE (InventoryTransactionTypeID, QuantityChange, UnitCost);

CREATE INDEX IX_PurchaseOrders_Supplier_Date
    ON dbo.PurchaseOrders(SupplierID, OrderDate, PurchaseOrderID)
    INCLUDE (WarehouseID, PurchaseOrderStatusID, ExpectedDate, ReceivedDate);

CREATE INDEX IX_PurchaseOrderItems_Product
    ON dbo.PurchaseOrderItems(ProductID, PurchaseOrderID)
    INCLUDE (QuantityOrdered, QuantityReceived, UnitCost);

CREATE INDEX IX_SupportTickets_Agent_Date
    ON dbo.SupportTickets(AssignedEmployeeID, CreatedAt, TicketID)
    INCLUDE (PriorityID, CurrentStatusID, CustomerID, OrderID, ResolvedAt);

CREATE INDEX IX_TicketStatusHistory_Ticket_Time
    ON dbo.TicketStatusHistory(TicketID, ChangedAt, TicketStatusHistoryID)
    INCLUDE (SupportTicketStatusID);

CREATE INDEX IX_Returns_Order
    ON dbo.Returns(OrderID, ReturnDate, ReturnID)
    INCLUDE (ReturnStatusID, ReturnReasonID);

CREATE INDEX IX_ReturnItems_OrderItem
    ON dbo.ReturnItems(OrderItemID, ReturnID)
    INCLUDE (QuantityReturned, RefundAmount);
GO
