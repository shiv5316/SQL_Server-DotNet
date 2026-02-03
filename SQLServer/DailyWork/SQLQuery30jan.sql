use College;
create function GetDepartMentName(@name nvarchar(20))
returns table
as return
(select * from CollegeMaster where Name=@name);
select * from GetDepartMentName('Amit Verma');

select * from CollegeMaster;

CREATE FUNCTION GetHighM2(@marks INT)
RETURNS TABLE
AS
RETURN
(
    SELECT MAX(m2) AS HighestM2
    FROM CollegeMaster
    WHERE m2 >= @marks
);
select * from GetHighM2(0);



create table #Student(id int,name varchar(20));
select * from #Student;
create table ##Students(id int,name varchar);
insert into #Student values(1,'Shivansh'),(2,'Rohan');