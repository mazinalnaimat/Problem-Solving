# Challenge 35: Cheapest Supplier Options per Product

**Difficulty:** Medium  
**Database:** `RetailOperations3NFDB`

## Business scenario

Procurement needs the three cheapest supplier quotations for every product, while preserving equal-cost ties.

## Task

Rank supplier quotations by unit cost within each product and return dense ranks 1 through 3.

## Input tables

- `dbo.Products`
- `dbo.Suppliers`
- `dbo.ProductSuppliers`

## Output columns

Return the columns in this exact order:

1. `SKU`
2. `SupplierCode`
3. `SupplierName`
4. `UnitCost`
5. `LeadTimeDays`
6. `CostRank`

## Business rules and constraints

- Only active suppliers.
- Use `DENSE_RANK`.
- Do not rank by lead time; it is only displayed.

## Required SQL techniques

- Use at least one Common Table Expression (`WITH ... AS`).
- Use one or more SQL Server window functions.
- Do not solve the challenge with procedural loops or cursors.
- Your result must be deterministic when values tie.

## Required ordering

Order the final result by:

```sql
ORDER BY SKU, CostRank, SupplierCode
```

## Setup

Run:

```text
00_Database_Setup/00_All_In_One.sql
```

Then write your answer in `MySolution.sql`.

Do not open `Solution.sql` until you finish your first attempt.
