# Challenge 5: Remaining paid payments from the current row forward

## Required result

- Restart the calculation for each customer.
- For every row, count paid payments from the current payment through the customer’s final payment.
- Sort by `CustomerName`, `PaymentDate`, and `PaymentID`.

## Table(s)

- `dbo.SubscriptionPayments`

## Columns to show

- `PaymentID`
- `CustomerName`
- `PlanName`
- `PaymentDate`
- `PaymentStatus`
- `RemainingPaidPaymentCount`

## Skills practiced

- A forward-looking window frame
- Conditional counting with `CASE`

## Important

- Keep the source detail rows unless the challenge explicitly asks for grouped rows.
- The final `ORDER BY` controls display order; an `ORDER BY` inside `OVER()` controls the calculation order.
- Write your answer in `MySol.sql` before checking `Solution.sql`.
