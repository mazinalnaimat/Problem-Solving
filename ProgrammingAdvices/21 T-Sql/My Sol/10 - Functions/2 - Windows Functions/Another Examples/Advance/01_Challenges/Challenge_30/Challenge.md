# Challenge 30: Best Warehouse Stock Position per Product

**Difficulty:** Medium  
**Database:** `RetailOperations3NFDB`

## Business scenario

Replenishment planners need to know which warehouse currently holds the highest quantity of each product.

## Task

Calculate current stock from all inventory movements, rank warehouses per product, and return the best stock position including ties.

## Input tables

- `dbo.Warehouses`
- `dbo.Products`
- `dbo.InventoryTransactions`

## Output columns

Return the columns in this exact order:

1. `SKU`
2. `WarehouseCode`
3. `CurrentQuantity`
4. `StockRank`

## Business rules and constraints

- Current quantity is the sum of QuantityChange.
- Use `RANK`.
- Keep ties for rank 1.

## Required SQL techniques

- Use at least one Common Table Expression (`WITH ... AS`).
- Use one or more SQL Server window functions.
- Do not solve the challenge with procedural loops or cursors.
- Your result must be deterministic when values tie.

## Required ordering

Order the final result by:

```sql
ORDER BY SKU, WarehouseCode
```

## Setup

Run:

```text
00_Database_Setup/00_All_In_One.sql
```

Then write your answer in `MySolution.sql`.

Do not open `Solution.sql` until you finish your first attempt.
