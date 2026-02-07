use CitizenDB;

create table Student(StudentId int identity(1,1) primary key,StudentName varchar(50),JoiningDate date);

create table Trainer(TrainerId int identity(1,1) primary key,TrainerName varchar(50));

create table Course(CourseId int identity(1,1) primary key,CourseName varchar(50),CourseFee int,
TrainerId int
foreign key (TrainerId) references Trainer(TrainerId));

create table Marks(MarkId int identity(1,1) primary key,ExamMonth varchar(50),ExamYear int,Marks int,
StudentId int,
CourseId int
foreign key (StudentId) references Student(StudentId),
foreign key (CourseId) references Course(CourseId)
);

--Question 2 – ALTER TABLE (Schema Change)
alter table Student add RewardPoints int default 0;
select * from Student;

--Question 3 – CHECK Constraint (Mandatory)
alter table Student add constraint CRP check(RewardPoints between 0 and 100);

--Question 4 – INNER JOIN (Mandatory)
select s.StudentName,c.CourseName,t.TrainerName,m.ExamMonth,m.ExamYear,m.Marks from Marks m
inner join Student s on m.StudentId=s.StudentId
inner join Course c on m.CourseId=c.CourseId
inner join Trainer t on c.TrainerId=t.TrainerId;

--Question 5 – Date Function (Mandatory)
select s.StudentName, sum(m.Marks) as TotalMarks from Marks m
inner join Student s on m.StudentId=s.StudentId
where m.ExamYear=year(getdate())
group by s.StudentName;

--Question 6 – SUBSTRING and LEFT (Mandatory)
select s.StudentName,left(s.StudentName,3)+left(c.CourseName,2)+cast(s.StudentId as varchar) as LoginId from Student s
join Marks m on s.StudentId=m.StudentId
join Course c on m.CourseId=c.CourseId;

--Question 7 – Subquery (Mandatory)
select s.StudentName,sum(m.Marks) as Totalmarks from Student s
join Marks m on s.StudentId=m.StudentId
group by s.StudentId,s.StudentName
having sum(m.Marks)>(select AVG(Marks) from Marks);

--Question 8 – UNION (Mandatory)
select s.StudentName,m.Marks,'high' as category from Marks m
join Student s on s.StudentId=m.StudentId
where Marks>80
union
select s.StudentName,m.Marks,'low' as category from Marks m
join Student s on s.StudentId=m.StudentId
where Marks<80;

--Question 9 – Trigger (Mandatory)
create or alter trigger TRP on Marks 
after insert
as begin
update s
set s.RewardPoints=IsNull(s.RewardPoints,0)+
case
when i.Marks>=80 then 10
when i.Marks>=60 then 5
else 2
end
from Student s
join inserted i on s.StudentId=i.StudentId;
end;
insert into Marks values('Jan',2026,75,5,3);
select * from Student;
select * from Marks;
select * from Course;


--Question 10 – COALESCE + Date Calculation (Mandatory)
select StudentName,JoiningDate,datediff(year,JoiningDate,getdate()) as TotalYears,
coalesce(RewardPoints,0) as RewardPoints,
case
when datediff(year,JoiningDate,getdate())>=3
then 10000
else 0
end
as Scholorship
from Student;

