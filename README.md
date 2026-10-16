# Bellabeat User Activity and Sleep Analysis

## Overview

This project analyzes Fitbit activity and sleep data to identify patterns in daily movement, differences between user activity levels, and the relationship between daytime activity and sleep.

BigQuery was used for data cleaning, transformation, and SQL analysis. Power BI was used to build a dashboard showing the main results.

The analysis focuses on four questions:

- Does activity change depending on the day of the week?
- How different are low-activity users and high-activity users?
- Is daytime activity related to sleep duration?
- What could Bellabeat test based on these patterns?

## Tools

- BigQuery / SQL
- Power BI
- Git / GitHub

## Dataset

The project uses Fitbit fitness tracker data from March and April 2016.

The daily activity data contains:

- 457 records
- 35 users
- Dates from March 12, 2016 to April 12, 2016

The sleep data was recorded at the minute level. After import into BigQuery, the dataset contained:

- 198,559 minute-level sleep records
- 23 users
- 556 sleep logs

Not every user had both activity and sleep data. After matching daytime activity with the following night's sleep, the final activity-sleep dataset contained 171 matched user-days from 20 users.

## Data Preparation

The daily activity data was checked for:

- Duplicate user-date records
- Missing values
- Negative or invalid values
- User coverage
- Zero-step days

No duplicate user-date records or missing values were found in the main activity fields.

There were 61 records with zero steps. These records were kept because they still contained sedentary minutes, so there was not enough evidence to treat them as incorrect.

The sleep data required additional transformation because each row represented approximately one minute of sleep data. Minute-level records were first grouped into sleep sessions using `logId`, then summarized to the daily level.

For the activity and sleep comparison, activity from one calendar day was matched with the sleep period ending the following morning.

## Analysis

### Activity by Day of Week

Average daily steps were calculated for each weekday.

Tuesday had the lowest average step count at **4,915 steps**, while Wednesday had the highest at **7,511 steps**.

Monday and Saturday were also relatively high, with average step counts of **7,119** and **7,090**.

The results show that activity was not evenly distributed across the week in this sample.

## User Activity Groups

Daily activity was summarized at the user level.

Average daily steps ranged from 0 to about 17,417, showing a large difference in activity between users.

Quartiles of average daily steps were used to divide users into four groups: Q1 - Lowest activity, Q2 - Lower-middle activity, Q3 - Upper-middle activity, Q4 - Highest activity.

The higher-activity groups recorded much more very active time. The highest-activity group averaged 41.8 very active minutes per day compared with 2.5 minutes in the lowest group.

## Activity and Sleep

The analysis looked at whether daytime activity was associated with subsequent sleep duration.

The correlation between daily steps and sleep duration was: **r = -0.218**

Other activity measures also showed weak correlations with sleep:

- Very active minutes vs. sleep: **-0.192**
- Sedentary minutes vs. sleep: **-0.207**
- Calories vs. sleep: **-0.067**

No strong linear relationship was observed between daytime activity and subsequent sleep duration in the matched sample. It shows that a strong linear relationship was not present in this dataset.

## Dashboard

The Power BI dashboard was created to summarize the main results. It includes:

- Average daily steps by weekday
- Average daily steps by activity group
- Daily steps vs. subsequent sleep duration
- Average daily steps and sleep KPIs
- Matched users and matched user-days

![Bellabeat Dashboard](dashboard/bellabeat_dashboard.pdf)

## Key Findings

- Tuesday had the lowest average step count in the dataset.
- Activity levels varied substantially between users.
- Higher-step users also recorded much more very active time.
- Daily steps and subsequent sleep duration showed only a weak relationship.
- The sleep analysis included fewer users than the full daily activity dataset.

## Recommendations

### Test activity reminders on lower-activity days

Tuesday had the lowest average step count in the sample. Bellabeat could test a Tuesday-specific step goal, reminder, or short activity challenge.

The effect could be measured by comparing Tuesday activity between users receiving the intervention and a control group.

### Personalize goals by activity level

The difference between the activity groups was large, which suggests that the same activity goal may not be useful for every user.

Lower-activity users could receive smaller starting goals or gradual challenges, while highly active users could receive more difficult goals or activity streaks.

### Use more than activity data for sleep recommendations

Daily activity did not show a strong relationship with sleep duration in this sample.

Sleep-related recommendations may be more useful if they also consider factors such as sleep consistency, bedtime patterns, and a user's normal sleep behavior.

## Limitations

This analysis has several limitations:

- The number of users is relatively small.
- Users did not contribute the same number of recorded days.
- Only 20 users were included in the final activity-sleep analysis.
- The dataset covers a short period of time.
- Correlation does not show causation.
- Fitbit users in this dataset may not represent Bellabeat's customer base.

The results should be viewed as general trends rather than conclusions about all wearable-device users.
