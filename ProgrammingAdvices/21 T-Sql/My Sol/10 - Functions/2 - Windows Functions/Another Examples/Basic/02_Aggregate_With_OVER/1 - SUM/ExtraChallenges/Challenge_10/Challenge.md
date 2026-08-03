# Challenge 10: Apply temporary data changes and calculate cumulative daily totals

## Required result

Return one row for each `Branch` and `TransactionDate` from `dbo.StoreTransactions`, showing `DailyTotal` as the total `Amount` for that branch and date, `BranchRunningTotal` as the running total of those daily totals for the same branch in ascending `TransactionDate` order, and `BranchGrandTotal` as the total of all daily totals for that branch.
Before returning the result, start a transaction; insert a row only when `ReferenceCode` `PRACTICE-001` does not already exist, using `Branch` `North`, `Cashier` `Aisha`, `TransactionDate` `2025-01-06`, `ProductCategory` `Tables`, and `Amount` `900.00`; then change the `Amount` of `ReferenceCode` `N-A-003` to `575.00`.
Create the daily totals in a CTE or an equivalent intermediate query, sort the final result by `Branch` and `TransactionDate` in ascending order, and finish with `ROLLBACK` so the insert and update are not saved permanently.

## Table(s)

- `dbo.StoreTransactions`

## Columns to show

- `Branch`
- `TransactionDate`
- `DailyTotal`
- `BranchRunningTotal`
- `BranchGrandTotal`

## Important

- Perform all data changes and calculations inside the same transaction.
- Write your solution in `MySolution.sql` before checking `Solution.sql`.
