select CustomerId,CompanyName,round(total_expenditures,2)
from (select CustomerId,coalesce(CompanyName,'MISSING_NAME') CompanyName,total_expenditures,ntile(4) over (order by total_expenditures) n
        from (select CustomerId,CompanyName,sum(UnitPrice*Quantity)  total_expenditures
                from "Order" left join Customer on CustomerId=Customer.Id
                join OrderDetail on OrderId="Order".Id
                group by CustomerId))
where n=1;