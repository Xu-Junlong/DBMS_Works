select Category.CategoryName,count(*) as num,
       round(avg(UnitPrice),2) as average_unit_price,
       min(UnitPrice) as minimum_unit_price,
       max(UnitPrice) as maximum_unit_price,
       sum(UnitsOnOrder) as total_units
from Product,Category
where CategoryId=Category.Id
group by CategoryId
having num>10
order by CategoryId;