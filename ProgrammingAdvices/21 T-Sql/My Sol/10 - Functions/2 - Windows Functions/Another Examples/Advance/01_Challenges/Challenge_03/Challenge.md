# Challenge 03: Post-Order Support Spike

**Difficulty:** Hard  
**Database:** `RetailOperations3NFDB`

## Business scenario

Customer experience wants to flag orders followed by an unusually high number of support tickets compared with that customer's recent orders.

## Task

Count tickets created within 14 days after each valid order and flag orders above twice the average ticket count of the customer's previous five orders.

## Input tables

- `dbo.Customers`
- `dbo.SalesOrders`
- `dbo.SupportTickets`

## Output columns

Return the columns in this exact order:

1. `CustomerNumber`
2. `OrderNumber`
3. `OrderDate`
4. `TicketsWithin14Days`
5. `PreviousFiveAverage`
6. `SpikeMultiple`

## Business rules and constraints

- Exclude cancelled orders.
- Tickets must belong to the same customer and be created from order time through 14 days after.
- The baseline excludes the current order, requires five previous orders, and must be greater than zero.

## Required SQL techniques

- Use at least one Common Table Expression (`WITH ... AS`).
- Use one or more SQL Server window functions.
- Do not solve the challenge with procedural loops or cursors.
- Your result must be deterministic when values tie.

## Required ordering

Order the final result by:

```sql
ORDER BY SpikeMultiple DESC, CustomerNumber, OrderDate
```

## Setup

Run:

```text
00_Database_Setup/00_All_In_One.sql
```

Then write your answer in `MySolution.sql`.

Do not open `Solution.sql` until you finish your first attempt.
