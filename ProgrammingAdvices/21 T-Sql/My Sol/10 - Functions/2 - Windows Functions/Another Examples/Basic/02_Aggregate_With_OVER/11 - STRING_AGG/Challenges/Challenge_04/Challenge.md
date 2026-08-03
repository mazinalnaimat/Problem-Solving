# Challenge 4: Distinct paid customers per subscription plan

## Required result

- Use only rows whose status is `Paid`.
- List each customer once per plan.
- Order customer names alphabetically inside the string.
- Return one row per plan.

## Table(s)

- `dbo.SubscriptionPayments`

## Columns to show

- `PlanName`
- `PaidCustomers`

## Skills practiced

- Filtering before aggregation
- Distinct grouped lists

## Important

- Keep the source detail rows unless the challenge explicitly asks for grouped rows.
- The final `ORDER BY` controls display order; an `ORDER BY` inside `OVER()` controls the calculation order.
- Write your answer in `MySol.sql` before checking `Solution.sql`.
