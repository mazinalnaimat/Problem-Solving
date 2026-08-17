# Challenge 20: Shipment Cost Anomalies

**Difficulty:** Hard  
**Database:** `RetailOperations3NFDB`

## Business scenario

Logistics audit wants shipments whose cost is unusually high relative to recent shipments from the same warehouse.

## Task


Flag shipments whose cost exceeds the previous 20-shipment average by more than two previous-window standard deviations.

## Input tables

- `dbo.Warehouses`
- `dbo.Shipments`

## Output columns

Return the columns in this exact order:

1. `WarehouseCode`
2. `ShipmentNumber`
3. `ShippedAt`
4. `ShippingCost`
5. `Previous20Average`
6. `Previous20StdDev`
7. `ZScore`

## Business rules and constraints

- The current shipment must not be included in its baseline.
- Require at least 10 prior shipments.
- Use windowed `AVG`, `STDEV`, and `COUNT`.

## Required SQL techniques

- Use at least one Common Table Expression (`WITH ... AS`).
- Use one or more SQL Server window functions.
- Do not solve the challenge with procedural loops or cursors.
- Your result must be deterministic when values tie.

## Required ordering

Order the final result by:

```sql
ORDER BY ZScore DESC, WarehouseCode, ShippedAt
```

## Setup

Run:

```text
00_Database_Setup/00_All_In_One.sql
```

Then write your answer in `MySolution.sql`.

Do not open `Solution.sql` until you finish your first attempt.
