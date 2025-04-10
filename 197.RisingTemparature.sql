-- LeetCode Problem: Rising Temperature
-- Link: https://leetcode.com/problems/rising-temperature/
--
-- This SQL query identifies the dates when the temperature was higher than the previous day.
-- It uses a self-join to compare each day's temperature with the previous day's temperature.
-- The DATEDIFF() function calculates the difference in days between two dates.
-- The condition DATEDIFF(w1.recordDate, w2.recordDate) = 1 ensures that we are comparing consecutive days.
-- The condition w1.temperature > w2.temperature filters the results to include only days with higher temperatures than the previous day.
-- This approach helps in identifying all dates where the temperature increased compared to the previous day.

SELECT w1.id
FROM Weather w1
JOIN Weather w2
  ON DATEDIFF(w1.recordDate, w2.recordDate) = 1
WHERE w1.temperature > w2.temperature;
