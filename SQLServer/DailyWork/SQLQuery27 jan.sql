select * from CollegeMaster1;
select * from Course;
ALTER TABLE CollegeMaster1 DROP COLUMN CourseId ;
ALTER TABLE CollegeMaster1 ADD CourseId INT;

ALTER TABLE CollegeMaster1 ADD CONSTRAINT FK_CollegeMaster_Course FOREIGN KEY (CourseId) REFERENCES Course(Id);
select * from CollegeMaster1 Right Join Course on CollegeMaster1.CourseId=Course.Id;
select * from CollegeMaster1 Left Join Course on CollegeMaster1.CourseId=Course.Id;

select * from CollegeMaster1 where CourseId not in (select CourseId from CollegeMaster1 where CourseId=1);