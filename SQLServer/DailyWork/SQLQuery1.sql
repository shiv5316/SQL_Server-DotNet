create proc uspGetStudentCountByDept
@dept nvarchar(10),
@StudentCount int output
as 
begin
select @StudentCount=count(*) from CollegeMaster where Dept=@dept
end;
go

declare @scount int;

exec uspGetStudentCountByDept
@dept='MCA',
@StudentCount = @scount OUTPUT;

select @scount as TotalStudent;


use college;
select * from Hostel;
select * from CollegeMaster;
SELECT * FROM CollegeMaster INNER JOIN Hostel ON CollegeMaster.Id = Hostel.CollegeId

-- Write a stored procedure to print all hostel students name
CREATE PROCEDURE uspGetAllHostelStudents
@RoomNo INT
AS
BEGIN
SELECT * FROM CollegeData INNER JOIN Hostel ON CollegeData.Id = Hostel.CollegeId where Hostel.RoomNo=@RoomNo
END;
GO
EXEC uspGetAllHostelStudents @RoomNo = 22;

-- write a stored procedure to print all the hostel students name who is staying in room no.22
CREATE PROCEDURE uspGetRoom22Students
AS
BEGIN
SELECT * FROM CollegeData INNER JOIN Hostel ON CollegeData.Id = Hostel.CollegeId where Hostel.RoomNo=22
END;
GO
EXEC uspGetRoom22Students;




DROP PROCEDURE InsertHostelStudent;


--Insert one hostel student record through SP but RoomNo should be limited to 100

ALTER TABLE Hostel ADD CONSTRAINT RoomLimit CHECK (RoomNo <= 100);

CREATE PROCEDURE InsertHostelStudent1
@Id INT,
@RoomNo INT,
@CollegeId INT
AS
BEGIN
INSERT INTO Hostel(Id, RoomNo, CollegeId) VALUES(@Id, @RoomNo, @CollegeId);
END;
GO
EXEC InsertHostelStudent1 9, 50, 2;
EXEC InsertHostelStudent1 19, 150, 2;


SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER PROCEDURE uspGetstudentCountByDept
AS
BEGIN

BEGIN TRY

BEGIN TRANSACTION Trans_One

update CollegeMaster set Dept ='ME' where Dept ='MCA'
insert into Hostel (RoomNo,CollegeId) values (23,7)


if @@ROWCOUNT = 0
ROLLBACK TRANSACTION Trans_One

COMMIT TRANSACTION Trans_One

END TRY

BEGIN CATCH

ROLLBACK TRANSACTION Trans_One

END CATCH

END;
exec uspGetstudentCountByDept;




Create or alter proc uspAddNewStudentWithHostel
as
begin
begin try
begin transaction;
declare @RegNo int;
insert into CollegeMaster(Name,Age,Gender,m1,m2,m3,total,PhoneNo,Dept,DOB)
values('Shivansh',21,'Male',60,80,50,190,7023459012,'Btech','2005-01-01');
SET @RegNo=SCOPE_IDENTITY();
Insert into Hostel(Id,RoomNo,CollegeId) values(@RegNo,23,10);
COMMIT transaction;
end try
begin catch;
if @@TRANCOUNT>0 rollback transaction;
throw;
end catch
end;
go

exec uspAddNewStudentWithHostel;
select * from CollegeMaster;

create table PunjabSports(
    Id int IDENTITY(1,1) Primary Key,
    Name varchar(20),
    Sports Varchar(10),
    );

    
create table UPSports(
    Id int IDENTITY(1,1) Primary Key,
    Name varchar(20),
    Sports Varchar(10),
    );

SELECT * FROM PunjabSports WHERE Sports='Cricket' UNION SELECT * FROM UPSports WHERE Sports='Cricket';