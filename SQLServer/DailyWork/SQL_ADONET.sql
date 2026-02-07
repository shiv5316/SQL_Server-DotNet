SELECT TOP (1000) [Id]
      ,[Name]
      ,[Department]
  FROM [adodotnet].[dbo].[CollegeMaster1]


create or alter proc sp_getStudentDetails
as
begin
	select Id, Name, Department
	from CollegeMaster1
end;

exec sp_getStudentDetails;