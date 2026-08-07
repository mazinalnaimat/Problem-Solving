# Challenge 02: Warehouse Monthly Sales-Issue Ranking

**Difficulty:** Medium  
**Database:** `RetailOperations3NFDB`

## Business scenario

Inventory leadership compares which warehouse issued the most units to sales each month.

## Task

Aggregate sale-issue quantities by warehouse and month, then rank warehouses inside each month.

## Input tables

- `dbo.Warehouses`
- `dbo.InventoryTransactionTypes`
- `dbo.InventoryTransactions`

## Output columns

Return the columns in this exact order:

1. `MonthStart`
2. `WarehouseCode`
3. `UnitsIssued`
4. `MonthlyRank`

## Business rules and constraints

- Only transaction type `SALE_ISSUE` counts.
- Report issued units as a positive number.
- Use `DENSE_RANK`.

## Required SQL techniques

- Use at least one Common Table Expression (`WITH ... AS`).
- Use one or more SQL Server window functions.
- Do not solve the challenge with procedural loops or cursors.
- Your result must be deterministic when values tie.

## Required ordering

Order the final result by:

```sql
ORDER BY MonthStart, MonthlyRank, WarehouseCode
```

## Setup

Run:

```text
00_Database_Setup/00_All_In_One.sql
```

Then write your answer in `MySolution.sql`.

Do not open `Solution.sql` until you finish your first attempt.
