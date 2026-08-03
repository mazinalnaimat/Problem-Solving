# Explanation: Total by region and product category

A partition may contain multiple columns.

`PARTITION BY Region, ProductCategory` builds partitions from the combination of both values. SQL Server does not first calculate by region and then separately by category; each unique pair is one partition.
