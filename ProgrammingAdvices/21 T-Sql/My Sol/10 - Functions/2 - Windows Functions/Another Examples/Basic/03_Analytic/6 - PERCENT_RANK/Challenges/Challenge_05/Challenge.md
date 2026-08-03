# Challenge 5: PERCENT_RANK challenge 5: payment amount inside each plan

## Task

Calculate the relative rank from 0 to 1 of payment amount inside each plan while keeping every detail row.

## Requirements

- Use `PERCENT_RANK()`.
- Partition by `PlanName`.
- Order by `Amount`.

## Tables

- `dbo.SubscriptionPayments`

## Setup

Run these files first:

1. `00_Database_Setup/01_AllInOne_Create_Database.sql`
2. `00_Database_Setup/03_Extended_Challenge_Data.sql`

## Try first

Write your query in `MySol.sql` before opening `Solution.sql`.
