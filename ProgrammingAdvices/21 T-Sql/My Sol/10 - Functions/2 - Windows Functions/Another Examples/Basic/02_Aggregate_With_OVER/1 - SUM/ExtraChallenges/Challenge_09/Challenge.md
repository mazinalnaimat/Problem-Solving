# Challenge 09: Current transaction plus the next two branch transactions

## Required result

Return `TransactionID`, `Branch`, `TransactionDate`, `Cashier`, `Amount`, and `CurrentAndNextTwoTotal` from `dbo.StoreTransactions`, with `CurrentAndNextTwoTotal` showing the total of `Amount` for rows that have the same `Branch`.
Order each calculation group by `TransactionDate` and `TransactionID` in ascending order, and calculate `CurrentAndNextTwoTotal` from the current row and the next two rows when they exist.
Sort the final result by `Branch`, `TransactionDate`, and `TransactionID` in ascending order.

## Table(s)

- `dbo.StoreTransactions`

## Columns to show

- `TransactionID`
- `Branch`
- `TransactionDate`
- `Cashier`
- `Amount`
- `CurrentAndNextTwoTotal`

## Important

- Keep the source detail rows; the calculated value must appear beside each required row.
- Write your solution in `MySolution.sql` before checking `Solution.sql`.
