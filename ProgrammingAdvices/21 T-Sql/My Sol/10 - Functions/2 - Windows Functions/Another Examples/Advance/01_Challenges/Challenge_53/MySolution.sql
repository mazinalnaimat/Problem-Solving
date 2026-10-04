USE RetailOperations3NFDB;
GO

-- Challenge 53: Customer Dominant Payment Method with APPLY
-- Write your solution below.


/*


select * from CustomerSegments


*/



;WITH Dominant AS
(
     select 
            Cu.CustomerID,
            Cu.SegmentID,
            Cu.CustomerNumber,
            COALESCE(x.MethodName,N'No completed payment') MethodName,
            COALESCE(x.PaymentCount,0) PaymentCount,
            COALESCE(x.SuccessfulAmount,0) SuccessfulAmount
     from Customers As Cu
     outer apply
     (
       select TOP(1) 
              PM.MethodName,
              COUNT(*) PaymentCount,
              SUM(Pay.Amount) AS  SuccessfulAmount
       from SalesOrders AS SO
       join Payments AS Pay 
            on Pay.OrderID=SO.OrderID
       join PaymentMethods AS PM 
            on PM.PaymentMethodID=Pay.PaymentMethodID
       join PaymentStatuses AS PS 
            on PS.PaymentStatusID=Pay.PaymentStatusID
       where SO.CustomerID=Cu.CustomerID AND PS.PaymentStatusID= 2 
       group by PM.PaymentMethodID,PM.MethodName
       order by COUNT(*) DESC,SUM(Pay.Amount) DESC,PM.MethodName
     ) x
),
R AS
(
     select     
             *,
             DENSE_RANK() 
             OVER
             (
                PARTITION BY SegmentID
                ORDER BY PaymentCount DESC,SuccessfulAmount DESC,CustomerNumber
             ) SegmentUsageRank
     from Dominant
)
select 
        cs.SegmentName,
        R.CustomerNumber,
        R.MethodName DominantPaymentMethod,
        R.PaymentCount SuccessfulPaymentCount,
        CAST(R.SuccessfulAmount AS decimal(14,2)) SuccessfulAmount,
        R.SegmentUsageRank
from R  
join CustomerSegments cs 
    on cs.SegmentID=R.SegmentID
order by cs.SegmentName,R.SegmentUsageRank,R.CustomerNumber;


















