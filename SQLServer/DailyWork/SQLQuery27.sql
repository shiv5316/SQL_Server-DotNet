use CitizenDB;
CREATE TABLE Employee_Master(
	Id INT PRIMARY KEY NOT NULL,
	Name varchar(50) NOT NULL,
	Salary decimal(10,2) NOT NULL,
	PF decimal(10,2) NULL,
    Age INT NOT NULL,
    Bonus decimal(10,2) NULL
	);

CREATE TABLE Canteen(
	Id INT PRIMARY KEY,
	Employee_Id INT NOT NULL,
	Date DATE NOT NULL,
	Total_Remaining_Balance DECIMAL(10,2) NOT NULL,
    Item_Purchased VARCHAR(200),
	Purchase_Value DECIMAL(10,2) NOT NULL,
    Paid_Amount DECIMAL(10,2) NULL,
  

    FOREIGN KEY (Employee_Id) REFERENCES Employee_Master(Id)
);

INSERT INTO Employee_Master
VALUES
(1, 'Shivansh', 50000.00, 2000.00, 21, NULL),
(2, 'Rauhan', 45000.00, NULL, 22, 4000.00),
(3, 'Deep', 40000.00, NULL,    23, 3000.00),
(4, 'Antra', 48000.00, 1500.00, 20, NULL);

SELECT * FROM Employee_Master;

INSERT INTO Canteen
VALUES
(101, 1, '2026-01-20', 1500.00, 'Coffee',   200.00, 200.00),
(102, 2, '2026-01-21', 1200.00, 'Snacks',  150.00, 150.00),
(103, 3, '2026-01-22', 1000.00, 'Tea',      50.00,  NULL),
(104, 4, '2026-01-23', 1800.00, 'Cake',  300.00, 300.00);

SELECT * FROM Canteen;

SELECT Name, Total_Remaining_Balance FROM Canteen INNER JOIN Employee_Master on Canteen.Employee_Id=Employee_Master.Id WHERE Employee_Id=3;
SELECT count(Item_Purchased) from Canteen where Date='2026-01-23';
SELECT Top 1 Name, SUM(Canteen.Purchase_Value) AS Total_Spent FROM Canteen JOIN Employee_Master ON Canteen.Employee_Id = Employee_Master.Id GROUP BY Name ORDER BY Total_Spent DESC;