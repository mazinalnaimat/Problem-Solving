USE RetailOperations3NFDB;
GO
SET NOCOUNT ON;

SELECT 'EmployeeMonthlyTargets' AS TableName, COUNT(*) AS [RowCount] FROM dbo.EmployeeMonthlyTargets
UNION ALL SELECT 'ProductPriceHistory', COUNT(*) FROM dbo.ProductPriceHistory
UNION ALL SELECT 'CustomerContactEvents', COUNT(*) FROM dbo.CustomerContactEvents
UNION ALL SELECT 'Promotions', COUNT(*) FROM dbo.Promotions
UNION ALL SELECT 'PromotionProducts', COUNT(*) FROM dbo.PromotionProducts
UNION ALL SELECT 'OrderPromotions', COUNT(*) FROM dbo.OrderPromotions;

IF (SELECT COUNT(*) FROM dbo.EmployeeMonthlyTargets) <> 216
    THROW 51001, 'EmployeeMonthlyTargets should contain 216 rows.', 1;
IF (SELECT COUNT(*) FROM dbo.ProductPriceHistory) <> 400
    THROW 51002, 'ProductPriceHistory should contain 400 rows.', 1;
IF (SELECT COUNT(*) FROM dbo.CustomerContactEvents) <> 1280
    THROW 51003, 'CustomerContactEvents should contain 1280 rows.', 1;
IF (SELECT COUNT(*) FROM dbo.Promotions) <> 12
    THROW 51004, 'Promotions should contain 12 rows.', 1;
IF (SELECT COUNT(*) FROM dbo.PromotionProducts) <> 240
    THROW 51005, 'PromotionProducts should contain 240 rows.', 1;

PRINT 'Advanced-query extension verification passed.';
GO
