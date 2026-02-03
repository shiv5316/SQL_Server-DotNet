SELECT TOP (1000) [Id]
      ,[Name]
      ,[Department]
      ,[Gender]
      ,[m1]
      ,[m2]
      ,[m3]
      ,[tot]
      ,[Grade]
  FROM [College].[dbo].[CollegeData]



select Name,RoomNo from [dbo].[CollegeData] INNER JOIN [dbo].[Hostel] ON CollegeData.Id = Hostel.CollegeId  where m1=100 or m2=100 or m3=100;
SELECT * FROM CollegeData
SELECT * FROM Hostel
SELECT * FROM CollegeData INNER JOIN Hostel ON CollegeData.Id = Hostel.CollegeId

ALTER TABLE [dbo].[CollegeData] ADD PhoneNo bigint
update [dbo].[CollegeData] set tot=m1+m2+m3

update [dbo].[CollegeData] set Grade='fail' WHERE m1 < 60 or m2 < 60 or m3 < 60;
UPDATE dbo.CollegeData SET Grade = 'FIRST'WHERE m1 >= 75 AND m2 >= 75 AND m3 >= 75 AND (m1 < 90 OR m2 < 90 OR m3 < 90);
SELECT * FROM [dbo].[CollegeData]
UPDATE dbo.CollegeData SET Grade = 'THIRD' WHERE Grade IS NULL  AND m1 >= 40 AND m2 >= 40 AND m3 >= 40  AND (m1 < 60 OR m2 < 60 OR m3 < 60);

select PhoneNo from [dbo].[CollegeData] INNER JOIN [dbo].[Hostel] ON CollegeData.Id = Hostel.CollegeId  where RoomNo=22
select RoomNo from Hostel Inner join CollegeData ON CollegeData.Id = Hostel.CollegeId where Gender='male' or Gender='female'

select count(*) AS TopScorer from CollegeData Inner join Hostel ON CollegeData.Id = Hostel.CollegeId where m1=100 or m2=100 or m3=100 


select count(*) AS TotalStudent from CollegeData Inner join Hostel ON CollegeData.Id = Hostel.CollegeId where RoomNo=22
Select Avg(m1) from CollegeData Inner join Hostel ON CollegeData.Id = Hostel.CollegeId where RoomNo=22
