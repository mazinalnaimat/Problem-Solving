# Challenge 19: Preferred-Supplier Dependency Rank

**Difficulty:** Medium  
**Database:** `RetailOperations3NFDB`

## Business scenario

Procurement risk management wants to see which suppliers are preferred for the greatest share of their listed products.

## Task

Calculate each supplier's preferred-product percentage and rank suppliers from highest dependency to lowest.

## Input tables


- `dbo.Suppliers`
- `dbo.ProductSuppliers`

## Output columns

Return the columns in this exact order:

1. `SupplierCode`
2. `SupplierName`
3. `ListedProductCount`
4. `PreferredProductCount`
5. `PreferredPercent`
6. `DependencyRank`

## Business rules and constraints

- Count all product-supplier rows for the denominator.
- Use `DENSE_RANK`.
- Include inactive suppliers.

## Required SQL techniques

- Use at least one Common Table Expression (`WITH ... AS`).
- Use one or more SQL Server window functions.
- Do not solve the challenge with procedural loops or cursors.
- Your result must be deterministic when values tie.

## Required ordering

Order the final result by:

```sql
ORDER BY DependencyRank, SupplierCode
```

## Setup

Run:

```text
00_Database_Setup/00_All_In_One.sql
```

Then write your answer in `MySolution.sql`.

Do not open `Solution.sql` until you finish your first attempt.
