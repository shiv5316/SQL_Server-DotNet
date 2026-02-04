create table Users(Id INT,Email VARCHAR(50));
insert into Users values
(1, 'a@gmail.com'),
(2, 'b@gmail.com'),
(3, 'a@gmail.com'),
(4, 'c@gmail.com'),
(5, 'b@gmail.com'),
(6, 'b@gmail.com');

select Email, count(*) as DuplicateCount from Users group by Email having count(*) > 1;
