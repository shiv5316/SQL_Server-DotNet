use adodotnet;
create table Students(Id int primary key identity,Name varchar(50),Gender varchar(50),Marks int);
insert into  Students values ('Shivansh','Male',80),('Riya','Female',90),('Deepak','Male',70),('Naman','Male',60),('Ananya','Female',95);

create or alter proc sp_GetStuByNameGender
@Name varchar(50),
@Gender varchar(50)
as begin
select * from Students
where Name = @Name and Gender = @Gender
end;
exec sp_GetStuByNameGender 'Shivansh','Male';



alter table CollegeMaster1
add Gender varchar(50);
select * from CollegeMaster1;


create or alter proc sp_countbygender
@Gender varchar(50),
@TotalCount int output
as begin
begin try
select @TotalCount = COUNT(*) from CollegeMaster1 where Gender = @Gender;
end try
begin catch
print 'Error occurred';
end catch
end

declare @Totalcount int;
exec sp_CountByGender 'Female', @Totalcount output;
print @Totalcount;