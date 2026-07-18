# Explanation: Total sales for every region

`GROUP BY Region` combines all orders with the same region into one group.

`SUM(Amount)` then calculates one total for each group. Unlike a window function, the original order rows disappear because the result has one row per region.
