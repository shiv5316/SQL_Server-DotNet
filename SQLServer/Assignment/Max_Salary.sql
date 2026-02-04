use EmployeeDB;
create table Employee(Id int,Name VARCHAR(20),Dept VARCHAR(20),Salary int);
insert into Employee values
(1,'Shivansh','CSE',100000),
(2,'Anand','ML',120000),
(3,'Naman','MEC',70000),
(4,'Mari','ML',95000),
(5,'Deep','CSE',80000);

select Employee.Dept, Employee.Name, Employee.Salary FROM  Employee 
JOIN (SELECT Employee.Dept, MAX(Salary) AS MaxSalary FROM Employee GROUP BY Dept)
maximum_salaries ON Employee.Dept = maximum_salaries.Dept AND Salary = maximum_salaries.MaxSalary;
