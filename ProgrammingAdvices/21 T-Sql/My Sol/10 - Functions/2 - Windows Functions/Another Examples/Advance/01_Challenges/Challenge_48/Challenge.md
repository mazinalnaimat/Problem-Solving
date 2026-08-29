# Challenge 48: Time between Warehouse Deliveries

**Difficulty:** Medium  
**Database:** `RetailOperations3NFDB`

## Business scenario

Warehouse managers want to understand the spacing between completed outbound deliveries.

## Task

Return each delivered shipment with the previous delivered-shipment timestamp and gap in hours for the same warehouse.

## Input tables

- `dbo.Warehouses`
- `dbo.Shipments`

## Output columns

Return the columns in this exact order:

1. `WarehouseCode`
2. `ShipmentNumber`
3. `DeliveredAt`
4. `PreviousDeliveredAt`
5. `GapHours`

## Business rules and constraints

- Only shipments with DeliveredAt are included.
- Sequence by DeliveredAt, then ShipmentID.
- Use `LAG`.

## Required SQL techniques

- Use at least one Common Table Expression (`WITH ... AS`).
- Use one or more SQL Server window functions.
- Do not solve the challenge with procedural loops or cursors.
- Your result must be deterministic when values tie.

## Required ordering

Order the final result by:

```sql
ORDER BY WarehouseCode, DeliveredAt, ShipmentNumber
```

## Setup

Run:

```text
00_Database_Setup/00_All_In_One.sql
```

Then write your answer in `MySolution.sql`.

Do not open `Solution.sql` until you finish your first attempt.
