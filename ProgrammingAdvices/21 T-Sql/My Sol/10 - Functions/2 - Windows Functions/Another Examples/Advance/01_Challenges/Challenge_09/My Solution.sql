USE RetailOperations3NFDB;
GO

with ActiveMonths as
(
	select distinct
	      Cu.CustomerID,
		  DATEFROMPARTS(Year(OrderDate), MONTH(OrderDate),1)
		  AS MonthStart
	from Customers AS Cu
	join SalesOrders AS SO
		on  Cu.CustomerID = SO.CustomerID
		and SO.OrderStatusID <> 6
),
NumberedMonths as 
(
	 select 
           AM.*,
           ROW_NUMBER()
		   OVER
           (
               partition by AM.CustomerID
               order by AM.MonthStart
           ) AS MonthSequence
    from ActiveMonths AS AM
),
MonthIslands AS
(
    select
        NM.*,
        DATEADD(MONTH, -CONVERT(int, NM.MonthSequence), NM.MonthStart) AS IslandKey
    from NumberedMonths NM
),
Streaks AS
(
    select
          CustomerID,
          IslandKey,
          MIN(MonthStart) AS StreakStartMonth,
          MAX(MonthStart) AS StreakEndMonth,
          COUNT(*) AS StreakMonths
    from MonthIslands
    group by CustomerID, IslandKey
),
RankedStreaks AS
(
    SELECT
          St.*,
          ROW_NUMBER()
          OVER
          (
              partition by St.CustomerID
              order by St.StreakMonths DESC, St.StreakEndMonth DESC
          ) AS StreakRank
    from Streaks AS St


)

select
      Cu.CustomerNumber,
      RS.StreakStartMonth,
      RS.StreakEndMonth,
      RS.StreakMonths
from RankedStreaks AS RS
join Customers AS Cu
    on RS.CustomerID = Cu.CustomerID
where RS.StreakRank =1
order by RS.StreakMonths DESC, Cu.CustomerNumber;

