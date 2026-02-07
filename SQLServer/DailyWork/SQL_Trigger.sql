use College;
create or alter trigger prevent_table_creation
on database
for DROP_TABLE
as 
begin
print 'You can not Drop table in this databse ..... ';
rollback;
end;
drop table UPSports;

create or alter trigger prevent_update
on [dbo].[CollegeMaster1]
for UPDATE
as begin
raiserror('You can not update in this table',16,1);
rollback;
end;
update [dbo].[CollegeMaster1] set Name='Ananya' where Name='Mahima';





CREATE TABLE Es (
    EmpID INT IDENTITY(1,1) PRIMARY KEY,
    EmpName VARCHAR(100),
    EmpSal DECIMAL(10,2)
);
GO


-- 2. Create audit table
CREATE TABLE Et (
    EmpID INT,
    EmpName VARCHAR(100),
    EmpSal DECIMAL(10,2),
    Audit_Action VARCHAR(100),
    Audit_Timestamp DATETIME
);
GO


-- 3. Create trigger after insert
CREATE or alter TRIGGER trpAfterInsertEmployee
ON ES
AFTER INSERT
AS
BEGIN
    SET NOCOUNT ON;   -- Prevents extra messages

    -- Insert the new data from the 'inserted' table into the audit table
    INSERT INTO Et (EmpID, EmpName, EmpSal, Audit_Action, Audit_Timestamp)
    SELECT
        i.EmpID,
        i.EmpName,
        i.EmpSal,
        'Inserted Record',
        GETDATE()
    FROM inserted AS i;   -- Reference the 'inserted' table
END;
GO


insert into ES(EmpName,EmpSal) values('ramu',20000)
select * from ES
select * from ET


use CitizenDB;
create or alter trigger trg_after_insert_employee
on Employee_Master
after insert
as
begin
set nocount on;
insert into Canteen(Id, Employee_Id, Date, Total_Remaining_Balance, Item_Purchased, Purchase_Value, Paid_Amount)
select
i.Id + 100,i.Id,getdate(),2000,'Welcome Coffee',0,0                     
from inserted i;
end;
go
insert into Employee_Master
values (5,'Rahul',40000,null,22,null);
select * from Employee_Master;
select * from Canteen;




