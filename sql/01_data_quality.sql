-- Dataset size and coverage
SELECT
    COUNT(*) AS total_rows,
    COUNT(DISTINCT Id) AS unique_users,
    MIN(ActivityDate) AS earliest_date,
    MAX(ActivityDate) AS latest_date
FROM `daproject-494616.fitabasedata.0`;


-- Check duplicate user-days
SELECT
    Id,
    ActivityDate,
    COUNT(*) AS records
FROM `daproject-494616.fitabasedata.0`;
GROUP BY Id, ActivityDate
HAVING COUNT(*) > 1;