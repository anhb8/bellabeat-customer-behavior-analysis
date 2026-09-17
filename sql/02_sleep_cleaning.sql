-- Convert minute-level sleep records into individual sleep sessions
-- Raw grain: one user-minute observation
-- Output grain: one user-sleep session
CREATE TABLE `daproject-494616.fitabasedata.sleep_sessions_cleaned` AS
SELECT
    Id,
    logId,
    MIN(PARSE_TIMESTAMP('%m/%d/%Y %I:%M:%S %p', date)) AS sleep_start,
    MAX(PARSE_TIMESTAMP('%m/%d/%Y %I:%M:%S %p', date)) AS sleep_end,
    COUNT(*) AS minute_records, 
    COUNTIF(value = 1) AS value_1_minutes, 
    COUNTIF(value = 2) AS value_2_minutes, 
    COUNTIF(value = 3) AS value_3_minutes, 

FROM `daproject-494616.fitabasedata.minuteSleep_raw`
GROUP BY Id, logId;


