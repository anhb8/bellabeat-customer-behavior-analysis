-- Match a user's daytime activity with the sleep period ending the following moring
CREATE TABLE `daproject-494616.fitabasedata.activity_sleep_analysis` AS 
SELECT 
  a.Id,
    a.ActivityDate,
    a.TotalSteps,
    a.TotalDistance,
    a.VeryActiveMinutes,
    a.FairlyActiveMinutes,
    a.LightlyActiveMinutes,
    a.SedentaryMinutes,
    a.Calories,
    s.minutes_asleep,
    s.minutes_restless,
    s.minutes_awake,
    s.minutes_in_bed,
    s.sleep_sessions
FROM `daproject-494616.fitabasedata.cleaned` a
INNER JOIN `daproject-494616.fitabasedata.daily_sleep_analysis` s
  ON a.Id = s.Id 
  AND a.ActivityDate = s.ActivityDate;

