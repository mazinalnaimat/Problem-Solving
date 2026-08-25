# Challenge 37: Rolling Delayed-Delivery Rate by Channel

**Difficulty:** Hard  
**Database:** `RetailOperations3NFDB`

## Business scenario

Fulfillment leadership wants a smoothed delay rate based on the latest three active months for each sales channel.

## Task

Calculate completed-order delay counts and a rolling three-month delayed-delivery percentage using rolling sums.

## Input tables

- `dbo.SalesChannels`
- `dbo.SalesOrders`
- `dbo.Shipments`

## Output columns

Return the columns in this exact order:

1. `ChannelName`
2. `MonthStart`
3. `DeliveredOrders`
4. `DelayedOrders`
5. `Rolling3MonthDelayRate`

## Business rules and constraints

- An order is complete only when every shipment has DeliveredAt.
- An order is delayed when final delivery date is after RequiredDate.
- Use rolling sums, not the average of monthly percentages.

## Required SQL techniques

- Use at least one Common Table Expression (`WITH ... AS`).
- Use one or more SQL Server window functions.
- Do not solve the challenge with procedural loops or cursors.
- Your result must be deterministic when values tie.

## Required ordering

Order the final result by:

```sql
ORDER BY ChannelName, MonthStart
```

## Setup

Run:

```text
00_Database_Setup/00_All_In_One.sql
```

Then write your answer in `MySolution.sql`.

Do not open `Solution.sql` until you finish your first attempt.
