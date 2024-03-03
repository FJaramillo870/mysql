# Write your MySQL query statement below
create table Department(
    id int NOT NULL AUTO_INCREMENT,
    name1 varchar(255),
    primary key(id)
);

create table Employee(
    id int NOT NULL AUTO_INCREMENT,
    name1 varchar(255),
    salary int,
    departmentId int,
    FOREIGN KEY (departmentId) REFERENCES Department(id),
    primary key(id)
);

SELECT Department.name1 as Department,Employee.name1 as Employee, Employee.salary as Salary
FROM Employee
INNER JOIN Department
ON Employee.id = Department.id
ORDER BY Salary ASC;

SET FOREIGN_KEY_CHECKS=0;

insert into Employee(id, name1, salary, departmentId)
values
(1, "bob", 100000, 1);

insert into Department(id, name1)
values
(1, "IT");

select * from Employee;

