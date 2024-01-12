go
create database ex11
go 

create table Employee(
EmployeeID int primary key ,
Name varchar(100),
Tel char(11),
Email varchar(30)
);

create table Groupp(
GroupID int,
GroupName varchar(30),
LeaderID int,
ProjectID int primary key
);
create table Project(
ProjectID int,
ProjectName varchar(30),
StartDate datetime,
EndDate datetime,
Period int,
Cost money
foreign key (ProjectID) references Groupp (ProjectID)
);
create table GroupDetail(
GroupID int,
EmployeeID int,
Status int
foreign key (EmployeeID) references Employee (EmployeeID)
);

INSERT INTO 