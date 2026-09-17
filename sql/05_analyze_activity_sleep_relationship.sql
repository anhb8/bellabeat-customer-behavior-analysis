-- Activity and sleep correlation
SELECT
    COUNT(*) AS matched_days,
    COUNT(DISTINCT Id) AS users,

    ROUND(AVG(TotalSteps), 0) AS avg_steps,
    ROUND(AVG(VeryActiveMinutes), 1) AS avg_very_active_min,
    ROUND(AVG(SedentaryMinutes), 1) AS avg_sedentary_min,
    ROUND(AVG(minutes_asleep), 1) AS avg_sleep_min,

    ROUND(CORR(TotalSteps, minutes_asleep), 3) AS steps_sleep_corr,
    ROUND(CORR(VeryActiveMinutes, minutes_asleep), 3) AS very_active_sleep_corr,
    ROUND(CORR(SedentaryMinutes, minutes_asleep), 3) AS sedentary_sleep_corr,
    ROUND(CORR(Calories, minutes_asleep), 3) AS calories_sleep_corr
FROM `YOUR_PROJECT_ID.bellabeat.activity_sleep_analysis`;