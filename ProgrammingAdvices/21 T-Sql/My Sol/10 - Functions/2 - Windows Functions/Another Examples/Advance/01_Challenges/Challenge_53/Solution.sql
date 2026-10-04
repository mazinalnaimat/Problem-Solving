USE RetailOperations3NFDB;
GO
;WITH Dominant AS
(
 SELECT c.CustomerID,c.SegmentID,c.CustomerNumber,
        COALESCE(x.MethodName,N'No completed payment') MethodName,
        COALESCE(x.PaymentCount,0) PaymentCount,COALESCE(x.SuccessfulAmount,0) SuccessfulAmount
 FROM Customers c
 OUTER APPLY
 (
   SELECT TOP(1) pm.MethodName,COUNT(*) PaymentCount,SUM(p.Amount) SuccessfulAmount
   FROM SalesOrders o
   JOIN Payments p ON p.OrderID=o.OrderID
   JOIN PaymentMethods pm ON pm.PaymentMethodID=p.PaymentMethodID
   JOIN PaymentStatuses ps ON ps.PaymentStatusID=p.PaymentStatusID
   WHERE o.CustomerID=c.CustomerID AND ps.StatusName=N'Completed'
   GROUP BY pm.PaymentMethodID,pm.MethodName
   ORDER BY COUNT(*) DESC,SUM(p.Amount) DESC,pm.MethodName
 ) x
),
R AS
(
 SELECT *,DENSE_RANK() OVER(PARTITION BY SegmentID ORDER BY PaymentCount DESC,SuccessfulAmount DESC,CustomerNumber) SegmentUsageRank
 FROM Dominant
)
SELECT cs.SegmentName,r.CustomerNumber,r.MethodName DominantPaymentMethod,
       r.PaymentCount SuccessfulPaymentCount,CAST(r.SuccessfulAmount AS decimal(14,2)) SuccessfulAmount,r.SegmentUsageRank
FROM R r JOIN CustomerSegments cs ON cs.SegmentID=r.SegmentID
ORDER BY cs.SegmentName,r.SegmentUsageRank,r.CustomerNumber;
