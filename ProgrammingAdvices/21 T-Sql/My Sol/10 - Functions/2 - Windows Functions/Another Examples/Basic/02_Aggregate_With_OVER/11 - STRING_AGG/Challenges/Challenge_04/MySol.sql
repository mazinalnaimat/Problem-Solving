USE WindowFunctionsTrainingDB;
GO

-- Write your solution below.

with PaidCustomers AS
(
    select distinct PlanName, CustomerName
    from SubscriptionPayments
    where PaymentStatus = 'Paid'
)

select 
     PlanName,
     STRING_AGG
     (
        CONVERT(nvarchar(max),CustomerName), ', '
     )
     within group(order by CustomerName)
     AS PaidCustomres
from PaidCustomers
group by PlanName
order by PlanName

