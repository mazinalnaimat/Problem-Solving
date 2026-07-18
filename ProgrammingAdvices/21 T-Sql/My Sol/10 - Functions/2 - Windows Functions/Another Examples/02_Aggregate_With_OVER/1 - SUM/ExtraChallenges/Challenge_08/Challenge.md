# Challenge 08: Moving total of the latest three cashier transactions

## Required result

Return `TransactionID`, `Branch`, `Cashier`, `TransactionDate`, `Amount`, and `LastThreeTransactionsTotal` from `dbo.StoreTransactions`, with `LastThreeTransactionsTotal` showing the total of `Amount` for rows that have the same `Branch` and `Cashier`.
Order each calculation group by `TransactionDate` and `TransactionID` in ascending order, and calculate `LastThreeTransactionsTotal` from the current row and the two previous rows when they exist.
Sort the final result by `Branch`, `Cashier`, `TransactionDate`, and `TransactionID` in ascending order.

## Table(s)

- `dbo.StoreTransactions`

## Columns to show

- `TransactionID`
- `Branch`
- `Cashier`
- `TransactionDate`
- `Amount`
- `LastThreeTransactionsTotal`

## Important

- Keep the source detail rows; the calculated value must appear beside each required row.
- Write your solution in `MySolution.sql` before checking `Solution.sql`.
