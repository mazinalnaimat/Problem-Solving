# Explanation: Composite race-result checksum per event

## Approach

- A row checksum allows non-integer source columns to participate indirectly.
- The aggregate checksum is calculated independently for every event.

## Main ideas

- Composite row checksums
- Partitioned checksum over descriptive and numeric data

Review `Solution.sql` only after attempting the challenge yourself.
