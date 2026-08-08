# Challenge 06: Most Common Product Pairs

**Difficulty:** Hard  
**Database:** `RetailOperations3NFDB`

## Business scenario

Merchandising wants to discover products that are frequently purchased together in valid orders.

## Task

Build unique product pairs per order, count pair support, and return the ten highest-ranked pairs.

## Input tables

- `dbo.Products`
- `dbo.SalesOrders`
- `dbo.OrderItems`

## Output columns

Return the columns in this exact order:

1. `Product1SKU`
2. `Product2SKU`
3. `OrdersTogether`
4. `PairRank`

## Business rules and constraints

- Exclude cancelled orders.
- A pair is unordered: ProductID1 must be less than ProductID2.
- Count each pair once per order.
- Use `DENSE_RANK`.

## Required SQL techniques

- Use at least one Common Table Expression (`WITH ... AS`).
- Use one or more SQL Server window functions.
- Do not solve the challenge with procedural loops or cursors.
- Your result must be deterministic when values tie.

## Required ordering

Order the final result by:

```sql
ORDER BY PairRank, Product1SKU, Product2SKU
```

## Setup

Run:

```text
00_Database_Setup/00_All_In_One.sql
```

Then write your answer in `MySolution.sql`.

Do not open `Solution.sql` until you finish your first attempt.
