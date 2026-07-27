# STRING_AGG

Concatenates strings across a group. In SQL Server, it is not used with OVER().


> Important: SQL Server documentation says the `OVER` clause may follow aggregate functions except `STRING_AGG`, `GROUPING`, and `GROUPING_ID`. So this folder teaches `STRING_AGG` as an aggregate, but not as an `OVER()` window example.

## Contents

- `Examples/`: 3 worked examples
- `Challenges/`: 5 practice challenges with solution and explanation

## SQL Server note

`STRING_AGG` is practiced as a grouped aggregate because SQL Server does not allow `OVER()` after `STRING_AGG`. The challenges therefore focus on grouping, ordering, formatting, filtering, deduplication, and multi-stage aggregation.
