# Challenge 07: Product Selling Price Changes

**Difficulty:** Medium  
**Database:** `RetailOperations3NFDB`

## Business scenario

Pricing analysts want to catch meaningful changes in the actual selling price of products.

## Task

Compare each order line's unit price with the previous sale of the same product and return changes of at least 10%.

## Input tables

- `dbo.Products`
- `dbo.SalesOrders`
- `dbo.OrderItems`

## Output columns

Return the columns in this exact order:

1. `SKU`
2. `OrderNumber`
3. `OrderDate`
4. `UnitPrice`
5. `PreviousUnitPrice`
6. `PriceChangePercent`

## Business rules and constraints

- Exclude cancelled orders.
- Sequence sales by OrderDate, OrderID, and OrderItemID.
- Use `LAG`.

## Required SQL techniques

- Use at least one Common Table Expression (`WITH ... AS`).
- Use one or more SQL Server window functions.
- Do not solve the challenge with procedural loops or cursors.
- Your result must be deterministic when values tie.

## Required ordering

Order the final result by:

```sql
ORDER BY ABS(PriceChangePercent) DESC, SKU, OrderDate
```

## Setup

Run:

```text
00_Database_Setup/00_All_In_One.sql
```

Then write your answer in `MySolution.sql`.

Do not open `Solution.sql` until you finish your first attempt.
