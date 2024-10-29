---3. Perform the following with help of the above database:
---a. Get all the details from the person table including email ID, phone number and phone number type
select pp.FirstName,pp.LastName, pa.AddressID,pa.AddressLine1,pa.City,pa.PostalCode, pe.EmailAddress,ph.PhoneNumber,
ps.PasswordHash,ps.PasswordSalt,pa.rowguid,pa.ModifiedDate
 
 from [Person].[Address] as pa
 inner join
 [Person].[EmailAddress] as pe
 on pa.AddressID=pe.EmailAddressID
 inner join
 [Person].[Person] as pp
 on pe.EmailAddressID=pp.BusinessEntityID
 inner join
 [Person].[PersonPhone] as ph
 on pp.BusinessEntityID=ph.BusinessEntityID
 inner join
 [Person].[Password] as ps
 on ph.BusinessEntityID=ps.BusinessEntityID




---b. Get the details of the sales header order made in May 2011
select * from [Sales].[SalesOrderHeader] where YEAR(ModifiedDate)=2011


---c. Get the details of the sales details order made in the month of May 2011
select * from [Sales].[SalesOrderDetail] where YEAR(ModifiedDate)=2011 and MONTH(ModifiedDate)=05

---d. Get the total sales made in May 2011
select ModifiedDate as year, sum(LineTotal) as total_sales from [Sales].[SalesOrderDetail] group by  ModifiedDate 
having YEAR(ModifiedDate)=2011 and MONTH(ModifiedDate)=05 

---e. Get the total sales made in the year 2011 by month order by increasing sales

SELECT 
    MONTH(ModifiedDate) AS SaleMonth, 
    SUM(LineTotal) AS TotalSales
FROM [Sales].[SalesOrderDetail]
WHERE YEAR(ModifiedDate) = 2011
GROUP BY MONTH(ModifiedDate)
ORDER BY TotalSales ASC;


--f. Get the total sales made to the customer with FirstName='Gustavo' and LastName ='Achong'select pp.FirstName,pp.LastName,sp.SalesYTD as Total_sales from  [Person].[Person] as pp
inner join
[Sales].[SalesPerson] as sp
on pp.BusinessEntityID= sp.BusinessEntityID
where FirstName='Gustavo' and LastName='Achong'

