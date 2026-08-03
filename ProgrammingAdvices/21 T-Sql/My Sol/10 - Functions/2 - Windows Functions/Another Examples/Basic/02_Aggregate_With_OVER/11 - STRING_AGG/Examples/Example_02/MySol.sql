USE WindowFunctionsTrainingDB;
GO


select 
      Region,
      STRING_AGG(ProductCategory, ', ')
      within group (order by ProductCategory)
      AS Categories
from
(
    select distinct Region, ProductCategory
    from SalesOrders
) x
group by Region
order by Region

