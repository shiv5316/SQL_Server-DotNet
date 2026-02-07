use Assignment;

create table ContactDetails
(
    Id INT IDENTITY(1,1) PRIMARY KEY,
    Name VARCHAR(50),
    Email VARCHAR(50),
    FatherPhone VARCHAR(20),
    MotherPhone VARCHAR(20),
    Landline VARCHAR(20),
    FriendPhone VARCHAR(20)
);
insert into ContactDetails 
values
('Marimuthu', NULL, '102', NULL, NULL, NULL),
('Ravi', 'ravi@gmail.com', NULL, NULL, NULL, NULL),
('Sneha', NULL, NULL, '555111', NULL, NULL),
('Arjun', NULL, NULL, NULL, '0442345', NULL),
('Priya', NULL, NULL, NULL, NULL, '999888'),
('Kiran', NULL, NULL, NULL, NULL, NULL);


select isNull(Email,'No Email Id exists') 
from [dbo].[ContactDetails];

select isNull([FatherPhone],'No Father Phone number exists') 
from [dbo].[ContactDetails];

select isNull([MotherPhone],'No Mother Phone number exists') 
from [dbo].[ContactDetails];

select isNull([Landline],'No Landline number exists') 
from [dbo].[ContactDetails];

select Name,
coalesce([Email],[FatherPhone],[MotherPhone],[Landline],[FriendPhone],
'No contact details') as Details from [dbo].[ContactDetails];
