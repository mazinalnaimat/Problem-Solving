USE RetailOperations3NFDB;
GO
SET NOCOUNT ON;
GO

SELECT 'Regions' AS TableName, COUNT(*) AS RowCount FROM dbo.Regions
UNION ALL SELECT 'Countries', COUNT(*) FROM dbo.Countries
UNION ALL SELECT 'Cities', COUNT(*) FROM dbo.Cities
UNION ALL SELECT 'Customers', COUNT(*) FROM dbo.Customers
UNION ALL SELECT 'Employees', COUNT(*) FROM dbo.Employees
UNION ALL SELECT 'Products', COUNT(*) FROM dbo.Products
UNION ALL SELECT 'Suppliers', COUNT(*) FROM dbo.Suppliers
UNION ALL SELECT 'ProductSuppliers', COUNT(*) FROM dbo.ProductSuppliers
UNION ALL SELECT 'SalesOrders', COUNT(*) FROM dbo.SalesOrders
UNION ALL SELECT 'OrderItems', COUNT(*) FROM dbo.OrderItems
UNION ALL SELECT 'OrderStatusHistory', COUNT(*) FROM dbo.OrderStatusHistory
UNION ALL SELECT 'Payments', COUNT(*) FROM dbo.Payments
UNION ALL SELECT 'Shipments', COUNT(*) FROM dbo.Shipments
UNION ALL SELECT 'ShipmentItems', COUNT(*) FROM dbo.ShipmentItems
UNION ALL SELECT 'InventoryTransactions', COUNT(*) FROM dbo.InventoryTransactions
UNION ALL SELECT 'PurchaseOrders', COUNT(*) FROM dbo.PurchaseOrders
UNION ALL SELECT 'PurchaseOrderItems', COUNT(*) FROM dbo.PurchaseOrderItems
UNION ALL SELECT 'SupportTickets', COUNT(*) FROM dbo.SupportTickets
UNION ALL SELECT 'TicketStatusHistory', COUNT(*) FROM dbo.TicketStatusHistory
UNION ALL SELECT 'Returns', COUNT(*) FROM dbo.Returns
UNION ALL SELECT 'ReturnItems', COUNT(*) FROM dbo.ReturnItems
ORDER BY TableName;

IF (SELECT COUNT(*) FROM dbo.Customers) <> 160
    THROW 51000, 'Customer seed count is incorrect.', 1;

IF (SELECT COUNT(*) FROM dbo.Products) <> 100
    THROW 51000, 'Product seed count is incorrect.', 1;

IF (SELECT COUNT(*) FROM dbo.SalesOrders) <> 900
    THROW 51000, 'Sales order seed count is incorrect.', 1;

IF (SELECT COUNT(*) FROM dbo.OrderItems) <> 3600
    THROW 51000, 'Order item seed count is incorrect.', 1;

IF EXISTS
(
    SELECT OrderID
    FROM dbo.OrderItems
    GROUP BY OrderID
    HAVING COUNT(*) <> 4
)
    THROW 51000, 'Every sales order should have exactly four order items.', 1;

IF EXISTS
(
    SELECT PurchaseOrderID
    FROM dbo.PurchaseOrderItems
    GROUP BY PurchaseOrderID
    HAVING COUNT(*) <> 3
)
    THROW 51000, 'Every purchase order should have exactly three purchase order items.', 1;

IF EXISTS
(
    SELECT 1
    FROM dbo.ShipmentItems si
    JOIN dbo.OrderItems oi ON oi.OrderItemID = si.OrderItemID
    JOIN dbo.Shipments s ON s.ShipmentID = si.ShipmentID
    WHERE oi.OrderID <> s.OrderID
)
    THROW 51000, 'A shipment item is linked to an order item from another order.', 1;

PRINT 'Database verification completed successfully.';
GO
