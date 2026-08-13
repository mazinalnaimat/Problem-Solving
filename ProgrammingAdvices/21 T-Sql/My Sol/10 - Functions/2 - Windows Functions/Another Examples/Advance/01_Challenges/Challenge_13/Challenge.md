# Challenge 13: Split-Shipment Final Delivery Performance

**Difficulty:** Hard  
**Database:** `RetailOperations3NFDB`

## Business scenario

Customer operations wants one row per split order showing the complete fulfillment window and whether final delivery missed the required date.

## Task

Collapse multiple shipments per order and report first ship time, final delivery time, shipment count, fulfillment hours, and delay days.

## Input tables

- `dbo.SalesOrders`
- `dbo.Shipments`

## Output columns

Return the columns in this exact order:

1. `OrderNumber`
2. `ShipmentCount`
3. `FirstShippedAt`
4. `FinalDeliveredAt`
5. `FulfillmentHours`
6. `DelayDays`

## Business rules and constraints

- Only orders with more than one shipment.
- Only orders where all shipments are delivered.
- Use windowed `COUNT`, `MIN`, `MAX`, and `ROW_NUMBER`.

## Required SQL techniques

- Use at least one Common Table Expression (`WITH ... AS`).
- Use one or more SQL Server window functions.
- Do not solve the challenge with procedural loops or cursors.
- Your result must be deterministic when values tie.

## Required ordering

Order the final result by:

```sql
ORDER BY DelayDays DESC, OrderNumber
```

## Setup

Run:

```text
00_Database_Setup/00_All_In_One.sql
```

Then write your answer in `MySolution.sql`.

Do not open `Solution.sql` until you finish your first attempt.
