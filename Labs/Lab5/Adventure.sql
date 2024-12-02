use AdventureWorks2012

--1

select sd.SalesOrderID,sh.ShipDate
from Sales.salesorderdetail sd , sales.salesorderheader sh
where sh.OrderDate between '7/28/2002' and '7/29/2014'


--2

select Productid,Name
from Production.Product
where  StandardCost<110

--3
select Productid,Name
from Production.Product
where Weight is null

--4
select Productid,Name,color
from Production.Product
where Color in ('red','silver','black')

--5

select Name
from Production.Product
where name like 'b%'

--6

update Production.ProductDescription
set Description='chromoly steel_high of defects'
where ProductDescriptionid=3

select Description 
from Production.ProductDescription
where Description  like '%[_]%'

--7

select sum(TotalDue)
from Sales.SalesOrderHeader
where OrderDate between '7/1/2001' and '7/31/2014'
group by OrderDate

--8
select distinct HireDate
from Humanresources.Employee


--9

 select avg(distinct ListPrice)
from Production.Product;

--10

select concat ('The' ,name, 'is only!',listprice)
from Production.Product
where ListPrice between 100 and 120
order by listprice

--11
/*select rowguid,Name,SalesPersonID,Demographics into Store_Archive
from Sales.Store


--only structure
select rowguid,Name,SalesPersonID,Demographics into Store_Archive2
from Sales.Store
where 1=2*/

--12
select FORMAT(GETDATE(),'dd mm yyyy')
union
select FORMAT(GETDATE(),'ddd mmm yyyy')
union
select FORMAT(GETDATE(),'dddd mmmm yyyy')
union
select FORMAT(GETDATE(),'dd mm yyyy hh:mm:ss/900')
union
select FORMAT(GETDATE(),'dd mmmm yyyy hh tt')
union
select cast(GETDATE() as varchar(20))
union
select CONVERT(varchar(20),GETDATE())

--bonus

select @@VERSION
select @@SERVERNAME

/*
@@  is used to access system variables
which provide information about the server's configuration and state.
These variables are typically used to retrieve information like the server version,
date and time, and other system-related details
*/

