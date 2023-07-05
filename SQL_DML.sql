select* from Products
select ProductId as Id, ProductName as Name from Products

select ProductName from Products
select p.ProductName from Products p

select p.ProductName, p.UnitPrice*p.UnitsInStock as total from products p

select p.ProductName + ' ' + p.QuantityPerUnit  from products p

select 'Beyza Nur Karadana' as egitmen

select 9*8 as sonuc

--conditional statements
select * from products where CategoryId=1
select * from products as p  where p.UnitsInStock=0 

select * from Products as p where p.UnitsInStock= 0 and p.UnitsOnOrder>0

select * from Products  where UnitsInStock=0 or UnitsOnOrder=0

select * from Products where not ProductName= 'chai' and CategoryID=1

select * from Products order by CategoryID, ProductName
select * from Products order by CategoryID, ProductName asc
select * from Products order by CategoryID, ProductName desc

select * from Products where ProductName like 'ch%'
select * from Products where ProductName like '%ch'
select * from Products where ProductName like '%ch%'

select * from Products where UnitsInStock between 10 and 46 
select * from Products where UnitsInStock between 10 and 46 order by UnitsInStock
select * from Products where CategoryID in (1,2)
select * from Products where CategoryID in (1,2) order by CategoryID, ProductName

select * from Products p where p.CategoryID =1 or p.CategoryID=2



--functions (aggregeation)
select  count(*)  from products --null bir alan varsa onu saymaz
select  count(*) as productStock from products
select  count(*) as [product Stock] from products
select  count(ProductName)  from products
select  count(*)  from Customers
select  count(Region)  from Customers

select min(UnitPrice) from Products
select max(UnitPrice) from Products
select AVG(UnitPrice) from Products
select SUM(UnitPrice*Quantity) as kazanç from [Order Details]

--Working with String Functions (Parameter can be filled if it has the @ sign next to it.)

select LEFT('beyza nur karadana',3) 
select right('beyza nur karadana',3)
select left(ProductName,4) from Products

select UPPER('beyza nur karadana')
select lower('ISTANBUL')
select LEN('beyza nur karadana')
select p.ProductName, LEN(p.ProductName) as characters from Products p

select '      beyzanurkaradana       '
select  trim ('      beyzanurkaradana       ')
select  rtrim ('      beyzanurkaradana       ')
select  ltrim ('      beyzanurkaradana       ')
select * from Products where TRIM(ProductName)= 'chai' -- if the name "chai" was written with spaces in the existing data, we would have to call it this way with the version with the spaces removed; otherwise, when we call the data without using "trim" when there is a space, the data we want will not come.
select REVERSE('beyzanurkaradana')

select charindex('a', 'beyzanurkaradana',1 ) -- 1=let me start searching from the first character
select ProductName from Products where charindex(' ', productname,1)>0
select productname from products where CHARINDEX('anton', productname,1)>0

select REPLACE('beyza nur karadana', ' ','_' )
select replace (ProductName, ' ', '_')  from Products

select SUBSTRING('beyzanurkaradana',2,5)

select ASCII('a')
select ASCII(1917)

select distinct country from Customers  --The "distinct" method is used to retrieve duplicate data in the column without repeating it.
select distinct country from Customers order by Country
select distinct country, city from Customers --2 columns can only repeat 1 time at the same time.

select country from Customers group by Country -- The "distinct" method is also a "group by" expression, but the distinct method has an extra feature: 
select country, COUNT(*) from Customers group by Country --...Whatever you group, it creates a list for each group in the background.
select country, COUNT(*) as adet from Customers group by Country
select country, COUNT(*) adet from Customers group by Country
select country,city, COUNT(*) adet from Customers group by Country, city --if we say how many there are country city together

--ülke ve þehir bazýnda 1 den fazla müþterimiz nerelerde var?
select country,city, COUNT(*) adet from Customers group by Country,City having COUNT(*)>1 order by adet --"group by" creates lists for each group in the background; That's why the method of writing a query and setting conditions for each list is "having".
select country,city from Customers where City <> 'nantes' 
select country,city, COUNT(*) from Customers where City <> 'nantes'  group by Country,City having COUNT(*)>1  --"where" is for filtering; "having" applies to each list; (example:What is the city information of the country where we have more than one customer?)
select country,city, COUNT(*) from Customers where City <> 'nantes'  group by Country,City --With "having", the condition is applied to each group.

--inner join(example: which customers have ordered from us ...)
select * from Products p inner join Categories c  on p.CategoryID  = c.CategoryID--products have "categoryid" but I want to see the name of that category.
select * from Categories c inner join Products p on c.CategoryID = p.CategoryID 
select * from Products p inner join Categories c  on p.CategoryID  = c.CategoryID where p.UnitPrice > 20 order by UnitPrice
select p.ProductName, c.Description, UnitPrice * UnitsInStock as total from Products p inner join Categories c  on p.CategoryID  = c.CategoryID where p.UnitPrice > 20 order by UnitPrice
select p.ProductName, o.OrderDate, od.Quantity * od.UnitPrice as kazanç from products p inner join [Order Details] od on p.ProductID = od.ProductID inner join orders o on o.OrderID = od.OrderID order by p.ProductName, o.OrderDate
select p.ProductName, o.OrderDate, od.Quantity*od.UnitPrice as kazanç from orders o inner join [Order Details] od on o.OrderID = od.OrderID inner join Products p on p.ProductID = od.ProductID order by p.ProductName, o.OrderDate

--left join
--We want to see products that cannot be sold:
select * from products p left join [Order details] od on p.ProductID = od.ProductID where od.ProductID is null-- The "left join" statement is present and right is absent
--We want to see customers that we have not sold any products to:
select * from Customers c left join Orders o on o.CustomerID = c.CustomerID where o.CustomerID is null
--bring person both what we can sell and what we cannot sell.
select * from Customers c left join Orders o on o.CustomerID = c.CustomerID

--right join: The opposite of "left join"
select * from orders o right join Customers c on c.CustomerID = o.CustomerID 
select * from orders o right join Customers c on c.CustomerID = o.CustomerID where o.CustomerID is null
select c.ContactName, c.CustomerID from orders o right join Customers c on c.CustomerID = o.CustomerID where o.CustomerID is null

--full join
select * from orders o full join Customers c on c.CustomerID = o.CustomerID 

--example: are there any personnel who can't sell at all, and if so, who?
select * from orders o right join Employees e on o.EmployeeID = e.EmployeeID where o.EmployeeID is null

--Example: How many of which product did we sell?
select p.ProductName, COUNT(*) as adet from Products p inner join [Order Details] od on p.ProductID = od.ProductID group by p.ProductName order by p.ProductName

--Example: How many of each category did we sell?
select c.CategoryName, COUNT(*) as adet from Products p inner join [Order Details] od on od.ProductID = p.ProductID inner join Categories c on c.CategoryID = p.CategoryID group by c.CategoryName

--example: A table showing employees and the people they report to is requested.
select e.FirstName + ' '+ e.LastName as çalýþanlar,  as rapor_verilen_kiþi from Employees e 

--insert into
insert into Categories (CategoryName,Description) values('teetbrush', 'teet')
insert into [Order Details] values(10248, 12, 12, 10, 0)

--update
update Territories set TerritoryDescription= 'marmara bölgesi'
update Categories set CategoryName= 'test category 3' where CategoryID>=9
update Categories set CategoryName= 'test category 3', description= 'test' where CategoryID>=9

--delete
select * from CustomerWork
delete from Categories where CategoryID=9 --and....



--Using the "insert" command with the "select" statement

insert into CustomerWork (customerýd, companyname, contactname) select customerýd, companyname, contactname from customers
delete from customerwork
insert into CustomerWork (customerýd, companyname, contactname) select customerýd, companyname, contactname from customers where ContactName like '%en%'
select * from CustomerWork

--WRITE UPDATE WITH JOIN METHOD
update Customers set CompanyName= CustomerWork.CompanyName from Customers inner join customerWork on customers.CustomerID = CustomerWork.CustomerID where customerwork.companyname like '%test%'

--using the delete statement with the join method
delete Customers from Customers inner join customerWork on customers.CustomerID = CustomerWork.CustomerID where customerwork.companyname like '%test%'

--union, union all methods
select CustomerID, CompanyName,ContactName from Customers union select * from CustomerWork--union 2 tane sorguyu (tablo deðil) alt alta getirmeye yarar ,kolon sayýlarý eþit olmalý(deðilse sen eþitle seçip), tamamý farklý olanlarý bir araya getiriyor bir kayýt 2 sorguda da varsa onlarý union yapmaz.,bir araya gelen veri tipleri de ayný olmalý: biri sayýsal biri metinsel ise bir problem oluþur.