create table Attendance(EmpId INT,Month VARCHAR(10),TotalPresent INT);

insert into Attendance values
(101,'Jan',25),
(101,'Feb',22),
(101,'Mar',24),
(102,'Jan',20),
(102,'Feb',21),
(102,'Mar',23),
(103,'Jan',26),
(103,'Feb',25),
(103,'Mar',27);

select EmpId, [Jan], [Feb], [Mar]
from(SELECT EmpId, Month, TotalPresent FROM Attendance) as SourceTable
PIVOT
(sum(TotalPresent)
for Month in([Jan], [Feb], [Mar])
) as PivotTable;
