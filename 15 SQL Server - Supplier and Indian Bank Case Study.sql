use master

CREATE DATABASE ibank

use ibank

CREATE table ProductMaster ( 
PID CHAR(2) Primary Key, 
ProductName VARCHAR(25) NOT NULL 
) 
go 


--insert 
insert into ProductMaster values ('SB', 'Savings Bank') 
insert into ProductMaster values ('LA', 'Loan Account') 
insert into ProductMaster values ('FD', 'Fixed Deposit') 
insert into ProductMaster values ('RD', 'Recurring Deposits') 
go 
--REGION MASTER 
--ctrl+shift+u 
create table RegionMaster ( 
RID INTEGER Primary Key, 
RegionName CHAR(6) NOT NULL 
) 
go 

--insert 
insert into RegionMaster values (1, 'South') 
insert into RegionMaster values (2, 'North') 
insert into RegionMaster values (3, 'East') 
insert into RegionMaster values (4, 'West') 

SELECT * from RegionMaster


--BRANCH MASTER 
create table BranchMaster ( 
BRID CHAR(3) Primary Key, 
BranchName VARCHAR(30) NOT NULL, 
BranchAddress VARCHAR(50) NOT NULL, 
RID INT NOT NULL Foreign Key references RegionMaster (RID) 
)

--insert 
insert into BranchMaster values ('BR1', 'Goa', 'Opp: KLM Mall, Panaji, Goa-677123',2 ) 
insert into BranchMaster values ('BR2', 'Hyd', 'Hitech City, Hitex, Hyd- 500012', 1 ) 
insert into BranchMaster values ('BR3', 'Mumbai', 'Andhery East', 2 ) 
go 


--DROP TABLE  UserMaster
--USER MASTER 
create table UserMaster (
UserID int Primary Key, 
UserName VARCHAR(30) NOT NULL, 
Designation CHAR(1) NOT NULL Check(Designation in ('M', 'C', 'T', 'O'))
) 
go

--insert 
insert into UserMaster values (1, 'Bhaskar Jogi', 'M' ) 
insert into UserMaster values (2, 'Priyanko', 'O' )
insert into UserMaster values  (3, 'Hemanth', 'M' )
insert into UserMaster values  (4, 'John K', 'C' )
insert into UserMaster values  (5, 'Aman Pandey', 'T' )
insert into UserMaster values  (6, 'Rahul B', 'C' ) 

select * from UserMaster


--ACCOUNT MASTER 
create table AccountMaster( 
ACID		INTEGER			Primary Key, 
NAME		VARCHAR(40)		NOT NULL, 
ADDRESS		VARCHAR(50)		NOT NULL, 
BRID		CHAR(3)			NOT NULL Foreign Key references BranchMaster (BRID), 
PID			CHAR(2)			NOT NULL Foreign Key references ProductMaster(PID), 
DOO			DATETIME		NOT NULL, 
CBALANCE	MONEY			NULL, 
UBALANCE	MONEY			NULL, 
STATUS		CHAR(1)			NOT NULL check (STATUS in ('O', 'I', 'C')) 
)
go 

