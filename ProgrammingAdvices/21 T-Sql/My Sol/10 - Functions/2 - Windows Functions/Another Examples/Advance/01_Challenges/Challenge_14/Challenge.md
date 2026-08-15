# Challenge 14: Longest Negative Inventory-Movement Streak

**Difficulty:** Hard  
**Database:** `RetailOperations3NFDB`

## Business scenario

Inventory audit wants the longest consecutive sequence of negative quantity movements for each warehouse-product ledger.

## Task

Group consecutive negative transactions and return the longest negative streak per warehouse-product.

## Input tables

- `dbo.Warehouses`
- `dbo.Products`
- `dbo.InventoryTransactions`

## Output columns

Return the columns in this exact order:

1. `WarehouseCode`
2. `SKU`
3. `StreakStart`
4. `StreakEnd`
5. `NegativeTransactions`
6. `TotalQuantityDecrease`

## Business rules and constraints

- Sequence by TransactionDate and InventoryTransactionID.
- Any positive movement ends the streak.
- Use a cumulative group identifier and `ROW_NUMBER`.

## Required SQL techniques

- Use at least one Common Table Expression (`WITH ... AS`).
- Use one or more SQL Server window functions.
- Do not solve the challenge with procedural loops or cursors.
- Your result must be deterministic when values tie.

## Required ordering

Order the final result by:

```sql
ORDER BY NegativeTransactions DESC, WarehouseCode, SKU
```

## Setup

Run:

```text
00_Database_Setup/00_All_In_One.sql
```

Then write your answer in `MySolution.sql`.

Do not open `Solution.sql` until you finish your first attempt.
