select group_concat(ProductName)
from  (select ProductName from "Order",OrderDetail,Customer,Product
        where CustomerId=Customer.Id and "Order".Id=OrderId and ProductId=Product.Id
        and CompanyName='Queen Cozinha' and OrderDate like '2014-12-25%'
        order by ProductId );