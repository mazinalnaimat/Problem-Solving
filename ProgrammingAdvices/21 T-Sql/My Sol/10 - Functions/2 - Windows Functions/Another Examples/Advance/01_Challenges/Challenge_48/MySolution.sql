USE RetailOperations3NFDB;
GO

/*
Challenge 48: Time between Warehouse Deliveries
Difficulty: Medium

Write your solution below.
Requirements:
- Use at least one CTE.
- Use at least one window function.
- Return the exact columns and ordering from Challenge.md.
*/


with DeliverySequence as
(
	select
		  Shp.WarehouseID,
		  Shp.ShipmentID,
		  Shp.ShipmentNumber,
		  Shp.DeliveredAt,
		  LAG(Shp.DeliveredAt) 
		  OVER
		  (
			partition by Shp.WarehouseID
			order by Shp.DeliveredAt, Shp.ShipmentID
		  )AS PreDeliverdAt
	from Shipments AS Shp
	where Shp.DeliveredAt is not null
)

select 
      Wh.WarehouseCode,
	  DS.ShipmentNumber,
	  DS.DeliveredAt,
	  DS.PreDeliverdAt,
	  DATEDIFF(hour, DS.PreDeliverdAt, DS.DeliveredAt) AS GapHours
from DeliverySequence AS DS
join Warehouses AS Wh
	on DS.WarehouseID = Wh.WarehouseID
order by Wh.WarehouseCode, DS.DeliveredAt, DS.ShipmentNumber







