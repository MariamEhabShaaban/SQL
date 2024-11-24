use Company_SD
--1
select * from Employee
--2
select Fname,Lname,Address,Salary,Dno from Employee 
--3
select Pname,Plocation,Dname
from Project p , Departments D
where P.Dnum = D.Dnum
--4
select Fname+' '+Lname as [Full Name],(Salary *12)*0.1 as [ANNUAL COMM] from  Employee 
--5
select SSN,Fname+' '+Lname as [Full Name],Salary from  Employee 
where Salary>1000

--6
select SSN,Fname+' '+Lname as [Full Name],Salary from  Employee 
where (Salary*12)>(10000)

--7
select Fname+' '+Lname as [Full Name] ,salary  from  Employee 
where Sex='F'

--8
select Dnum, Dname from Departments
where MGRSSN=968574

--9
select Pnumber ,Pname ,Plocation,Dnum from Project 
where Dnum=10



