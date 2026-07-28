# Explanation: Website channel summaries with total rows and channel list

## Approach

- After duplicate removal, `COUNT(*)` becomes the distinct channel count.
- The same reduced rows feed the ordered channel list.

## Main ideas

- Combining `COUNT` and `STRING_AGG`
- Aggregating a deduplicated CTE

Review `Solution.sql` only after attempting the challenge yourself.
