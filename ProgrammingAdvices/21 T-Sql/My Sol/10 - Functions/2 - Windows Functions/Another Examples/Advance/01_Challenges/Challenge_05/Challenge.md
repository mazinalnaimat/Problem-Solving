# Challenge 05: Product Margin Rank inside Brand

**Difficulty:** Medium  
**Database:** `RetailOperations3NFDB`

## Business scenario

Merchandising wants to compare list-price gross margin percentages among products of the same brand.

## Task

Calculate each active product's gross margin percentage and dense rank inside its brand from highest margin to lowest.

## Input tables

- `dbo.Brands`
- `dbo.Products`

## Output columns

Return the columns in this exact order:

1. `BrandName`
2. `SKU`
3. `ProductName`
4. `GrossMarginPercent`
5. `MarginRank`

## Business rules and constraints

- Gross margin percent = (ListPrice - StandardCost) / ListPrice × 100.
- Only active products.
- Use `DENSE_RANK`.

## Required SQL techniques

- Use at least one Common Table Expression (`WITH ... AS`).
- Use one or more SQL Server window functions.
- Do not solve the challenge with procedural loops or cursors.
- Your result must be deterministic when values tie.

## Required ordering

Order the final result by:

```sql
ORDER BY BrandName, MarginRank, SKU
```

## Setup

Run:

```text
00_Database_Setup/00_All_In_One.sql
```

Then write your answer in `MySolution.sql`.

Do not open `Solution.sql` until you finish your first attempt.
