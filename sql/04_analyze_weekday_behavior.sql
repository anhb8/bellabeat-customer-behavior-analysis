-- Activity by weekday
SELECT
      FORMAT_DATE('%A', ActivityDate) AS day_of_week, 
      EXTRACT(DAYOFWEEK FROM ActivityDate) AS day_number, 
      ROUND(AVG(TotalSteps), 0) AS avg_steps, 
      ROUND(AVG(VeryActiveMinutes), 1) AS avg_very_active_minutes, 
      ROUND(AVG(SedentaryMinutes), 1) AS avg_sendentary_minutes, 
      COUNT(*) AS number_of_days
FROM `daproject-494616.fitabasedata.cleaned`
GROUP BY day_of_week, day_number
ORDER BY day_number;