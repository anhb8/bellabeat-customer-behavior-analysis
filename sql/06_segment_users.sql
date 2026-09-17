WITH user_activity AS (
    SELECT
        Id,
        COUNT(*) AS recorded_days,
        AVG(TotalSteps) AS avg_daily_steps,
        AVG(VeryActiveMinutes) AS avg_very_active_minutes,
        AVG(LightlyActiveMinutes) AS avg_light_active_minutes,
        AVG(SedentaryMinutes) AS avg_sedentary_minutes,
        AVG(Calories) AS avg_daily_calories
    FROM `daproject-494616.fitabasedata.cleaned`
    GROUP BY Id
), 

segmented_users AS (
    SELECT
        *,
        CASE
            WHEN avg_daily_steps <= 3094.9167 THEN 'Q1 - Lowest activity'
            WHEN avg_daily_steps <= 6103.9167 THEN 'Q2 - Lower-middle activity'
            WHEN avg_daily_steps <= 8663.9167 THEN 'Q3 - Upper-middle activity'
            ELSE 'Q4 - Highest activity'
        END AS activity_segment
    FROM user_activity
)

SELECT
    activity_segment,
    COUNT(*) AS users,
    ROUND(AVG(avg_daily_steps), 0) AS avg_steps,
    ROUND(AVG(avg_very_active_minutes), 1) AS avg_very_active_minutes,
    ROUND(AVG(avg_light_active_minutes), 1) AS avg_light_active_minutes,
    ROUND(AVG(avg_sedentary_minutes), 1) AS avg_sedentary_minutes,
    ROUND(AVG(avg_daily_calories), 0) AS avg_calories
FROM segmented_users
GROUP BY activity_segment
ORDER BY activity_segment;