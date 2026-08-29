# Challenge 46: Running Inventory Balance

**Difficulty:** Medium  
**Database:** `RetailOperations3NFDB`

## Business scenario

Operations needs an audit trail showing the stock position after every inventory movement.

## Task

Calculate the running quantity balance for each warehouse-product pair after every transaction.

## Input tables

- `dbo.Warehouses`
- `dbo.Products`
- `dbo.InventoryTransactions`

## Output columns

Return the columns in this exact order:

1. `WarehouseCode`
2. `SKU`
3. `TransactionDate`
4. `InventoryTransactionID`
5. `QuantityChange`
6. `RunningQuantity`

## Business rules and constraints

- Order transactions by TransactionDate and InventoryTransactionID.
- Use an explicit `ROWS` frame.
- Do not aggregate away individual transactions.

## Required SQL techniques

- Use at least one Common Table Expression (`WITH ... AS`).
- Use one or more SQL Server window functions.
- Do not solve the challenge with procedural loops or cursors.
- Your result must be deterministic when values tie.

## Required ordering

Order the final result by:

```sql
ORDER BY WarehouseCode, SKU, TransactionDate, InventoryTransactionID
```

## Setup

Run:

```text
00_Database_Setup/00_All_In_One.sql
```

Then write your answer in `MySolution.sql`.

Do not open `Solution.sql` until you finish your first attempt.
