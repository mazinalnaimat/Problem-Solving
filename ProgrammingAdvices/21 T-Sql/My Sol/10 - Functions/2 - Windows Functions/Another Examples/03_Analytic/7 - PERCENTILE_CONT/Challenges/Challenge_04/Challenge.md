# Challenge 4: PERCENTILE_CONT challenge 4: median inventory quantity

## Task

Show each detail row and calculate the median inventory quantity for its partition.

## Requirements

- Use `PERCENTILE_CONT(0.50)`.
- Order the percentile by `QuantityOnHand`.
- Partition by `WarehouseName, Category`.

## Tables

- `dbo.InventorySnapshots`

## Setup

Run these files first:

1. `00_Database_Setup/01_AllInOne_Create_Database.sql`
2. `00_Database_Setup/03_Extended_Challenge_Data.sql`

## Try first

Write your query in `MySol.sql` before opening `Solution.sql`.
