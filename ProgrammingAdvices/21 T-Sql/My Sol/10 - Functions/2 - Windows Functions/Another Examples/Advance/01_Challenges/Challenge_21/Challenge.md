# Challenge 21: Longest Out-of-Stock Period

**Difficulty:** Hard  
**Database:** `RetailOperations3NFDB`

## Business scenario

Inventory control wants to identify the longest continuous period where a warehouse-product balance was zero or negative.

## Task

Reconstruct running stock, group consecutive out-of-stock transaction intervals, and return the longest period for each warehouse-product pair.

## Input tables

- `dbo.Warehouses`
- `dbo.Products`
- `dbo.InventoryTransactions`

## Output columns

Return the columns in this exact order:

1. `WarehouseCode`
2. `SKU`
3. `OutOfStockStart`
4. `RecoveryDate`
5. `OutOfStockDays`

## Business rules and constraints

- A period starts when running quantity becomes <= 0.
- Duration continues until the next transaction that restores a positive balance; open periods end at the dataset's maximum transaction date.
- Use `SUM OVER`, `LEAD`, `LAG`, and gaps-and-islands logic.

## Required SQL techniques

- Use at least one Common Table Expression (`WITH ... AS`).
- Use one or more SQL Server window functions.
- Do not solve the challenge with procedural loops or cursors.
- Your result must be deterministic when values tie.

## Required ordering

Order the final result by:

```sql
ORDER BY OutOfStockDays DESC, WarehouseCode, SKU
```

## Setup

Run:

```text
00_Database_Setup/00_All_In_One.sql
```

Then write your answer in `MySolution.sql`.

Do not open `Solution.sql` until you finish your first attempt.
