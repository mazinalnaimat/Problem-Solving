# Challenge 5: MAX challenge 5: current and future subscription payments

## Required result

Return `PaymentID`, `CustomerName`, `PlanName`, `Country`, `PaymentDate`, `Seats`, and `FutureMaximumSeats` from `dbo.SubscriptionPayments`, with `FutureMaximumSeats` showing the highest value of `Seats` for rows that have the same `CustomerName`.
Order each calculation group by `PaymentDate` and `PaymentID` in ascending order, and calculate `FutureMaximumSeats` from the current row through the last row in that group.
Sort the final result by `CustomerName`, `PaymentDate`, and `PaymentID` in ascending order.

## Table(s)

- `dbo.SubscriptionPayments`

## Columns to show

- `PaymentID`
- `CustomerName`
- `PlanName`
- `Country`
- `PaymentDate`
- `Seats`
- `FutureMaximumSeats`

## Important

- Keep the source detail rows; the calculated value must appear beside each required row.
- Write your solution in `MySol.sql` before checking `Solution.sql`.
