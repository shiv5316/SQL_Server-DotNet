use college;
select* from CollegeMaster;
select* from CollegeData;


With AvgM2ByDept as(
Select Dept,Avg(m2) as AvgM2
from CollegeMaster group by Dept 
)
select * from AvgM2ByDept;


select distinct m1 from CollegeMaster order by m1 desc offset 2 rows fetch next 1 row only;

WITH AvgM1ByDept AS(
    SELECT Dept, AVG(m1) AS AvgM1
    FROM CollegeMaster
    GROUP BY Dept
)
SELECT TOP 1 * FROM AvgM1ByDept ORDER BY AvgM1 DESC;



