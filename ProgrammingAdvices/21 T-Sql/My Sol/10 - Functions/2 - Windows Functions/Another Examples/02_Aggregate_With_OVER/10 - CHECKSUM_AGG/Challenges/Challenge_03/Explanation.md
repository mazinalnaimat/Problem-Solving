# Explanation: Compare team and team-priority ticket checksums

## Approach

- The two windows use the same input but different scopes.
- The team checksum is shared across priorities, while the second restarts for every priority.

## Main ideas

- Multiple checksum windows in one query
- Comparing broad and narrow partitions

Review `Solution.sql` only after attempting the challenge yourself.
