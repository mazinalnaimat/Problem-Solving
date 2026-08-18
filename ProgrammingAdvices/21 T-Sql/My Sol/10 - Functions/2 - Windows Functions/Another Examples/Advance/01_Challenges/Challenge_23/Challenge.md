# Challenge 23: Product Return-Rate Rank

**Difficulty:** Hard  
**Database:** `RetailOperations3NFDB`

## Business scenario

Quality management wants products ranked by returned-unit rate within their category.

## Task

Calculate sold quantity, completed-return quantity, return rate, and percentile position by category.

## Input tables


- `dbo.Categories`
- `dbo.Products`
- `dbo.SalesOrders`
- `dbo.OrderItems`
- `dbo.Returns`
- `dbo.ReturnItems`

## Output columns

Return the columns in this exact order:

1. `CategoryName`
2. `SKU`
3. `SoldQuantity`
4. `ReturnedQuantity`
5. `ReturnRatePercent`
6. `CategoryPercentRank`

## Business rules and constraints

- Exclude cancelled orders from sold quantity.
- Count only returns with status `Completed`.
- Only include products with at least 20 sold units.
- Use `PERCENT_RANK` ordered by return rate.

## Required SQL techniques

- Use at least one Common Table Expression (`WITH ... AS`).
- Use one or more SQL Server window functions.
- Do not solve the challenge with procedural loops or cursors.
- Your result must be deterministic when values tie.

## Required ordering

Order the final result by:

```sql
ORDER BY CategoryName, CategoryPercentRank DESC, SKU
```

## Setup

Run:

```text
00_Database_Setup/00_All_In_One.sql
```

Then write your answer in `MySolution.sql`.

Do not open `Solution.sql` until you finish your first attempt.
