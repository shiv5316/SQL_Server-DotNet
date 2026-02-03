use Assignment;

create table Customers(
CustomerID INT PRIMARY KEY, 
CustomerName VARCHAR(100), 
PhoneNumber VARCHAR(15), 
City VARCHAR(50), 
CreatedDate DATE 
);
INSERT INTO Customers 
VALUES 
(1, 'Ravi Kumar', '9876543210', 'Chennai', '2023-01-10'), 
(2, 'Priya Sharma', '9123456789', 'Bangalore', '2023-03-15'), 
(3, 'John Peter', '9988776655', 'Hyderabad', '2023-06-20');

CREATE TABLE Accounts (
AccountID INT PRIMARY KEY, 
CustomerID INT, 
AccountNumber VARCHAR(20), 
AccountType VARCHAR(20),  
OpeningBalance DECIMAL(12,2), 
FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID) 
);
INSERT INTO Accounts 
VALUES 
(101, 1, 'SB1001', 'Savings', 20000), 
(102, 2, 'SB1002', 'Savings', 15000), 
(103, 3, 'SB1003', 'Savings', 30000);


CREATE TABLE Transactions (
TransactionID INT PRIMARY KEY, 
AccountID INT, 
TransactionDate DATE, 
TransactionType VARCHAR(10), 
Amount DECIMAL(12,2), 
FOREIGN KEY (AccountID) REFERENCES Accounts(AccountID) 
);
INSERT INTO Transactions 
VALUES 
(1, 101, '2024-01-05', 'Deposit', 30000), 
(2, 101, '2024-01-18', 'Withdraw', 5000), 
(3, 101, '2024-02-10', 'Deposit', 25000), 
(4, 102, '2024-01-07', 'Deposit', 20000), 
(5, 102, '2024-01-25', 'Deposit', 35000), 
(6, 102, '2024-02-05', 'Withdraw', 10000), 
(7, 103, '2024-01-10', 'Deposit', 15000), 
(8, 103, '2024-01-20', 'Withdraw', 5000);

CREATE TABLE Bonus (
BonusID INT PRIMARY KEY, 
AccountID INT, 
BonusMonth INT, 
BonusYear INT, 
BonusAmount DECIMAL(10,2), 
CreatedDate DATE, 
FOREIGN KEY (AccountID) REFERENCES Accounts(AccountID) 
);

--Question1–Stored Procedure(DateRange+Aggregation)
create or alter proc GetTransSummary
@StartDate date,
@EndDate date,
@AccountID int
as
begin
select sum(
case when TransactionType='Deposit' 
then Amount
else 0
end ) as TotalDeposited,
sum(
case when TransactionType='Withdraw' 
then Amount
else 0
end ) as TotalWithdrawn
from Transactions where AccountID=@AccountID
and TransactionDate between @StartDate and @EndDate;
end;

exec GetTransSummary '2024-01-01', '2024-01-31', 101;


--Question2–Monthly Bonus Update(Business Rule+Grouping)
create or alter proc UpdateBonus
as
begin
insert into Bonus(BonusID, AccountID, BonusMonth, BonusYear, BonusAmount, CreatedDate)
select ROW_NUMBER() over (orser by AccountID)+ isnull((select max(BonusID) from Bonus), 0) as BonusID,
[AccountID],Month([TransactionDate]),Year([TransactionDate]),1000,GETDATE()
from [dbo].[Transactions] where [TransactionType]='Deposit'
group by [TransactionID],[AccountID],Month([TransactionDate]),Year([TransactionDate])
having sum([Amount])>50000
and not exists  (select 1 from Bonus B WHERE 
B.AccountID = Transactions.AccountID
AND B.BonusMonth = MONTH(TransactionDate)
AND B.BonusYear = YEAR(TransactionDate)
    );
end;
exec UpdateBonus;
select * from Bonus;




--Question3–Check Current Balance(Logical Calculation)
select c.CustomerName,a.AccountNumber,a.OpeningBalance
+ isnull(sum(case 
     when t.TransactionType = 'Deposit' 
     then t.Amount 
     else 0 
     end), 0)
- isnull(sum(case 
     when t.TransactionType = 'Withdraw' 
     then t.Amount 
     else 0 
     end), 0)

+ isnull(sum(b.BonusAmount), 0)
as Currentbalance

from Customers c
join Accounts a on c.CustomerID = a.CustomerID
left join Transactions t on a.AccountID = t.AccountID
left join Bonus b on a.AccountID = b.AccountID
group by c.CustomerName,a.AccountNumber,a.OpeningBalance;


