# SQL Server 3NF Window Functions + CTE Challenge Pack

This pack contains a realistic SQL Server retail-operations database in **Third Normal Form** and **50 HackerRank-style challenges**.

## Difficulty distribution

- 25 Medium
- 25 Hard
- Mixed in randomized order

## Every challenge requires

- at least one Common Table Expression
- at least one SQL Server window function
- deterministic ordering
- a real-world business calculation

## Database domain

The database includes customers, geography, employee hierarchy, products, categories, brands, suppliers, sales orders, order lines, payments, shipments, warehouses, inventory movements, purchasing, support tickets, and returns.

## Start here

1. Open `00_Database_Setup/00_All_In_One.sql`.
2. Run it in SQL Server Management Studio or Azure Data Studio.
3. Open `02_Challenge_Index.md`.
4. Choose a challenge.
5. Read `Challenge.md`.
6. Write your query in `MySolution.sql`.
7. Compare with `Solution.sql` and `Explanation.md`.

## Compatibility

- SQL Server 2017 or newer is recommended.
- Compatibility level 140 or newer supports all functions used here.
- The scripts do not contain machine-specific MDF or LDF paths.

## Folder layout

```text
00_Database_Setup/
    00_All_In_One.sql
    01_Create_Database_And_Schema.sql
    02_Seed_Real_World_Data.sql
    03_Create_Analytics_Indexes.sql
    04_3NF_Schema_Explanation.md
    05_Verify_Database.sql

01_Challenges/
    Challenge_01_.../
        Challenge.md
        MySolution.sql
        Solution.sql
        Explanation.md
    ...
    Challenge_50_.../

02_Challenge_Index.md
README.md
Validation_Report.json
```

## Important learning topics

The solutions cover ranking, running totals, moving windows, gap analysis, percentiles, cohort retention, RFM, Pareto analysis, ABC classification, gaps-and-islands, recursive CTEs, lifecycle durations, anomaly detection, and hierarchy analytics.
