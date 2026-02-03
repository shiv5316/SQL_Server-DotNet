SELECT TOP (1000) [Id]
      ,[Name]
      ,[Age]
      ,[Gender]
      ,[m1]
      ,[m2]
      ,[m3]
      ,[total]
      ,[PhoneNo]
  FROM [College].[dbo].[CollegeMaster]

INSERT INTO CollegeMaster (Id, Name, Age, Gender, m1, m2, m3, total, PhoneNo)
VALUES
(1, 'Rahul Sharma', 20, 'Male', 85, 90, 88, 263, 9876543210),

(2, 'Priya Singh', 19, 'Female', 78, 82, 80, 240, 9876543211),

(3, 'Amit Verma', 21, 'Male', 92, 89, 95, 276, 9876543212),

(4, 'Neha Gupta', 20, 'Female', 88, 91, 84, 263, 9876543213),

(5, 'Suresh Kumar', 22, 'Male', 70, 75, 72, 217, 9876543214),

(6, 'Anjali Mehta', 19, 'Female', 95, 96, 94, 285, 9876543215),

(7, 'Vikas Yadav', 21, 'Male', 60, 65, 62, 187, 9876543216),

(8, 'Simran Kaur', 20, 'Female', 83, 85, 87, 255, 9876543217),

(9, 'Rohit Jain', 22, 'Male', 90, 92, 89, 271, 9876543218),

(10, 'Kiran Patel', 19, 'Female', 76, 80, 78, 234, 9876543219);

select * from CollegeMaster

use College;

CREATE TABLE [dbo].[BoysHostel] (
    [Id] INT PRIMARY KEY,
    [Room_Number] int,
    College_Id int,
);

CREATE TABLE [dbo].[GirlsHostel] (
    [Id] INT PRIMARY KEY,
    [Room_Number] int,
    College_Id int,
);

CREATE TABLE [dbo].[Book_Master] (
    [Book_Id] INT PRIMARY KEY,
    [Book_Name] VARCHAR(50),
    [Author_Name] varchar(50),
    [ISBN_Code] nchar(50),
    [Price] nchar(5)    
);

CREATE TABLE [Library]([Id] INT PRIMARY KEY,
[Book_Id] INT, 
[Issued_To] INT,[Issued_Date] DATE);

ALTER TABLE GirlsHostel Add College_Id int;
ALTER TABLE BoysHostel Add College_Id int;


ALTER TABLE BoysHostel ADD CONSTRAINT FK_BoysHostel_College FOREIGN KEY (College_Id) REFERENCES CollegeMaster(Id);
ALTER TABLE GirlsHostel ADD CONSTRAINT FK_GirlsHostel_College FOREIGN KEY (College_Id) REFERENCES CollegeMaster(Id);
ALTER TABLE Library ADD CONSTRAINT FK_Library_Student FOREIGN KEY (Issued_To) REFERENCES CollegeMaster(Id);
ALTER TABLE Library ADD CONSTRAINT FK_Library_Book FOREIGN KEY (Book_Id) REFERENCES Book_Master(Book_Id);

INSERT INTO BoysHostel (Id, Room_Number, College_Id) VALUES(1, 101, 1),(2, 102, 3),(3, 103, 5),(4, 104, 7);
INSERT INTO GirlsHostel (Id, Room_Number, College_Id) VALUES(1, 201, 2),(2, 202, 4),(3, 203, 6),(4, 204, 8);
INSERT INTO Book_Master (Book_Id, Book_Name, Author_Name, ISBN_Code, Price) VALUES
(1, 'Java Programming', 'Herbert Schildt', 'ISBN001', '500'),
(2, 'C# Basics', 'Microsoft Press', 'ISBN002', '450'),
(3, 'Python for Data Science', 'OReilly', 'ISBN003', '600'),
(4, 'Database Systems', 'Raghu Ramakrishnan', 'ISBN004', '700'),
(5, 'Operating Systems', 'Galvin', 'ISBN005', '650'),
(6, 'Computer Networks', 'Tanenbaum', 'ISBN006', '550'),
(7, 'Machine Learning', 'Tom Mitchell', 'ISBN007', '800');

INSERT INTO Library (Id, Book_Id, Issued_To, Issued_Date) VALUES
(1, 1, 1, '2026-01-10'),
(2, 3, 2, '2026-01-12'),
(3, 5, 4, '2026-01-15'),
(4, 7, 6, '2026-01-20');


ALTER TABLE CollegeMaster Add Dept varchar(50);
UPDATE CollegeMaster SET Dept = 'Btech' WHERE Age < 20;
UPDATE CollegeMaster SET Dept = 'MBA' WHERE Age > 20;
UPDATE CollegeMaster SET Dept = 'MCA' WHERE Age =20;


SELECT * FROM BoysHostel;
SELECT * FROM GirlsHostel;
SELECT * FROM Book_Master;
SELECT * FROM Library;
SELECT * FROM CollegeMaster;


select cm.Name from Library l JOIN CollegeMaster cm ON l.Issued_To = cm.Id JOIN Book_Master bm ON l.Book_Id = bm.Book_Id
WHERE bm.Book_Name = 'Java Programming'

SELECT COUNT(*) FROM Library l JOIN CollegeMaster cm ON l.Issued_To = cm.Id where m1=90 or m2=90 or m3=90
SELECT * FROM Library l JOIN BoysHostel bh ON l.Issued_To=bh.College_Id WHERE bh.Room_Number=101
SELECT cm.Name,cm.Dept FROM Library l JOIN CollegeMaster cm ON l.Issued_To = cm.Id JOIN Book_Master bm ON l.Book_Id = bm.Book_Id 
WHERE bm.Book_Name = 'Python for Data Science'

SELECT cm.PhoneNo FROM Library l JOIN CollegeMaster cm ON l.Issued_To = cm.Id JOIN Book_Master bm ON l.Book_Id = bm.Book_Id 
WHERE bm.Book_Name = 'Java Programming'






















