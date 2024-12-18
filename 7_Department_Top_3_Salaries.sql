# Write your MySQL query statement below
WITH CTE AS(
    SELECT e.departmentId AS 'd_Id', e.name AS 'Employee', e.salary AS 'Salary', DENSE_RANK() 
    OVER (PARTITION BY e.departmentId ORDER BY e.salary DESC) 
    AS 'rnk' FROM Employee e
)
SELECT d.name AS 'Department', c.Employee, c.Salary FROM Department d INNER JOIN CTE c
ON d.id = c.d_Id WHERE c.rnk <= 3

--- Approach 2 ---
SELECT d.name AS 'Department', e.name AS 'Employee', e.salary 
FROM Employee e LEFT JOIN Department d ON e.departmentID = d.id
WHERE (SELECT COUNT(DISTINCT e2.salary) FROM employee e2 WHERE e2.salary > e.salary AND e.departmentId = e2.departmentId) < 3