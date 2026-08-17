# Challenge 18: Purchase Order Fill-Rate Rank by Supplier

**Difficulty:** Medium  
**Database:** `RetailOperations3NFDB`

## Business scenario

Procurement wants to compare how completely suppliers fulfill individual purchase orders.

## Task

Calculate each purchase order's quantity fill percentage and rank purchase orders within each supplier.

## Input tables

- `dbo.Suppliers`
- `dbo.PurchaseOrders`
- `dbo.PurchaseOrderItems`

## Output columns

Return the columns in this exact order:

1. `SupplierCode`
2. `PurchaseOrderNumber`
3. `QuantityOrdered`
4. `QuantityReceived`
5. `FillPercent`
6. `SupplierFillRank`

## Business rules and constraints

- Use total line quantities per purchase order.
- Rank highest fill percentage first with `DENSE_RANK`.
- Include all purchase order statuses.

## Required SQL techniques

- Use at least one Common Table Expression (`WITH ... AS`).
- Use one or more SQL Server window functions.
- Do not solve the challenge with procedural loops or cursors.
- Your result must be deterministic when values tie.

## Required ordering

Order the final result by:

```sql
ORDER BY SupplierCode, SupplierFillRank, PurchaseOrderNumber
```

## Setup

Run:

```text
00_Database_Setup/00_All_In_One.sql
```

Then write your answer in `MySolution.sql`.

Do not open `Solution.sql` until you finish your first attempt.
