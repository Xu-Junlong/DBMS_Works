select ProductName,CompanyName,ContactName
from (select ProductName,CompanyName,ContactName,row_number() over (partition by ProductName order by OrderDate) as num
      from Product,OrderDetail,"Order",Customer
      where ProductId=Product.Id and OrderId="Order".Id and CustomerId=Customer.Id and Discontinued=1)
where num=1
order by ProductName;