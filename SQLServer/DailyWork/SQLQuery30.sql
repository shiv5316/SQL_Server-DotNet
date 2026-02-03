use College;
create or alter proc uspBonusCalculation
as
begin
create table #bonuscalculator(Name varchar(50),total int,Bonus int);
insert into #bonuscalculator(Name,total) select Name,total from CollegeMaster
update #bonuscalculator set bonus=500 where total>250
select * from #bonuscalculator
end
exec uspBonusCalculation

create or alter proc uspBonusMark
as
begin
create table #bonusmarks(name varchar(50),m1 int);
insert into #bonusmarks(Name,m1) select Name,m1 from CollegeData where m1<35
update #bonusmarks set m1=m1+5
select count(*) from #bonusmarks
select * from #bonusmarks
end


EXEC uspBonusMark;
