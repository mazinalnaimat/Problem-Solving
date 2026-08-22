# Challenge 31: Warehouse Fulfillment Percentiles

**Difficulty:** Hard  
**Database:** `RetailOperations3NFDB`

## Business scenario

Logistics leadership wants median and 90th-percentile order fulfillment time for each warehouse.

## Task

Calculate days from order date to final delivery, then report median and 90th percentile by warehouse.

## Input tables

- `dbo.Warehouses`
- `dbo.SalesOrders`
- `dbo.Shipments`

## Output columns

Return the columns in this exact order:

1. `WarehouseCode`
2. `DeliveredOrderCount`
3. `MedianFulfillmentDays`
4. `P90FulfillmentDays`

## Business rules and constraints

- Only orders where every shipment has DeliveredAt are eligible.
- For split shipments, use the latest DeliveredAt.
- Use `PERCENTILE_CONT` as a window function.

## Required SQL techniques

- Use at least one Common Table Expression (`WITH ... AS`).
- Use one or more SQL Server window functions.
- Do not solve the challenge with procedural loops or cursors.
- Your result must be deterministic when values tie.

## Required ordering

Order the final result by:

```sql
ORDER BY WarehouseCode
```

## Setup

Run:

```text
00_Database_Setup/00_All_In_One.sql
```

Then write your answer in `MySolution.sql`.

Do not open `Solution.sql` until you finish your first attempt.
