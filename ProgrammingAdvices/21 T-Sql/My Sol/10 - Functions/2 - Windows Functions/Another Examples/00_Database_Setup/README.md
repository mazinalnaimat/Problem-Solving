# Database Setup

Run `01_AllInOne_Create_Database.sql` first.

It creates the database:

```sql
WindowFunctionsTrainingDB
```

Then all examples and challenge solutions can be executed using:

```sql
USE WindowFunctionsTrainingDB;
```

The database contains these training tables:

- `dbo.Departments`
- `dbo.Employees`
- `dbo.SalesOrders`
- `dbo.StudentScores`
- `dbo.StockPrices`
- `dbo.Tasks`

> Note: the ZIP contains SQL scripts, not a live `.mdf` file. Run the setup script on your SQL Server instance to create the database.

## Extended challenge data

Run these scripts in this order:

1. `01_AllInOne_Create_Database.sql`
2. `03_Extended_Challenge_Data.sql`

The second script contains all additional DDL and DML used by the refactored challenges.
