
-- LeetCode Problem: Department Top Three Salaries
-- Link: https://leetcode.com/problems/department-top-three-salaries/
--
-- This SQL query identifies employees who earn the top three unique salaries in each department.
-- It utilizes a common table expression (CTE) to rank employees within each department based on their salary.
-- The DENSE_RANK() function is used to assign ranks, ensuring that employees with the same salary receive the same rank.
-- The PARTITION BY clause groups the data by department, and the ORDER BY clause sorts employees by salary in descending order.
-- After ranking, the main query filters out employees with ranks greater than 3, ensuring only the top three salaries per department are selected.

WITH RankedSalaries AS (
  SELECT 
    D.name AS Department,
    E.name AS Employee,
    E.salary AS Salary,
    DENSE_RANK() OVER (
      PARTITION BY D.name
      ORDER BY E.salary DESC
    ) AS rnk
  FROM Employee E
  JOIN Department D ON E.departmentId = D.id
)

SELECT Department, Employee, Salary
FROM RankedSalaries
WHERE rnk <= 3;
