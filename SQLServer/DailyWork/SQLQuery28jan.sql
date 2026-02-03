use college;
SELECT * FROM CollegeMaster;

ALTER TABLE CollegeMaster ADD CONSTRAINT CheckGender CHECK(Gender='Male' or Gender='Female');
ALTER TABLE CollegeMaster ADD CONSTRAINT CheckPhone CHECK(LEN(PhoneNo) = 10);
ALTER TABLE CollegeMaster ADD CONSTRAINT CheckDept CHECK (Dept IN ('MCA', 'Btech', 'MBA'));
ALTER TABLE CollegeMaster ADD CONSTRAINT CheckAge CHECK(Age<=25 AND Age>=19);
ALTER TABLE CollegeMaster ADD CONSTRAINT CheckTotal CHECK(total<=300);


SELECT DATEADD(YEAR ,1, GETDATE()) AS WarrantyDate;
SELECT DATEDIFF(DAY ,'2005/02/15' ,GETDATE()) AS TotalDay;


ALTER TABLE CollegeMaster ADD DOB DATE;
