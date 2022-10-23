select Id,OrderDate,lag(OrderDate,1,OrderDate)over (order by OrderDate) as previousOrderDate,
       round(julianday(datetime(OrderDate))-julianday(datetime(lag(OrderDate,1,OrderDate) over (order by OrderDate))),2)
        as difference
from "Order"
where CustomerId='BLONP'
order by OrderDate
limit 10;