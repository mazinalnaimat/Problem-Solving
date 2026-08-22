# Challenge 33: ABC Inventory Classification

**Difficulty:** Hard  
**Database:** `RetailOperations3NFDB`

## Business scenario

Inventory finance wants products classified by cumulative annual consumption value inside each warehouse.

## Task

Calculate sale-issue consumption value, sort products by value, and classify A up to 80%, B up to 95%, and C above 95%.

## Input tables

- `dbo.Warehouses`
- `dbo.Products`
- `dbo.InventoryTransactionTypes`
- `dbo.InventoryTransactions`

## Output columns

Return the columns in this exact order:

1. `WarehouseCode`
2. `SKU`
3. `ConsumptionValue`
4. `CumulativePercent`
5. `ABCClass`

## Business rules and constraints

- Use only `SALE_ISSUE` movements.
- Consumption value is issued units × transaction UnitCost.
- Classify using cumulative percentage after the current product.

## Required SQL techniques

- Use at least one Common Table Expression (`WITH ... AS`).
- Use one or more SQL Server window functions.
- Do not solve the challenge with procedural loops or cursors.
- Your result must be deterministic when values tie.

## Required ordering

Order the final result by:

```sql
ORDER BY WarehouseCode, CumulativePercent, SKU
```

## Setup

Run:

```text
00_Database_Setup/00_All_In_One.sql
```

Then write your answer in `MySolution.sql`.

Do not open `Solution.sql` until you finish your first attempt.
