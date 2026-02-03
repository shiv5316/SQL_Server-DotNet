use College;
select * from CollegeData;
select Id,SUBSTRING(Name,1,3) AS Short_Name from CollegeData;
select Id,Left(Name,3) AS Short_Name from CollegeData;
SELECT LEFT(Name, CHARINDEX('R', Name)) AS Substring_Till_R FROM CollegeData;
SELECT Id,
CASE 
    WHEN CHARINDEX('R', Name) > 0
    THEN SUBSTRING(Name, CHARINDEX('R', Name), LEN(Name))
    ELSE Name
END AS From_R_To_End
FROM CollegeData;




