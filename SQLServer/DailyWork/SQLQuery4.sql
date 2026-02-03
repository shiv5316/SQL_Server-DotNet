SELECT TOP (1000) [Id]
      ,[Name]
      ,[Department]
      ,[Gender]
      ,[m1]
      ,[m2]
      ,[m3]
      ,[tot]
  FROM [College].[dbo].[CollegeData]

  select count(*) from [dbo].[CollegeData] where m1=100 or m2=100 or m3=100;
  select * from [dbo].[CollegeData] where m2=100
  select name from [dbo].[CollegeData] where m1=100 or m2=100 or m3=100;
  select * from [dbo].[CollegeData] where m3=100 and Department='Btech';

