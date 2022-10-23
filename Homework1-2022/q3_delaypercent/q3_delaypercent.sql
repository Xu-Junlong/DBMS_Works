select CompanyName,
       round(sum(case when ShippedDate>RequiredDate then 1.0 else 0.0 end)/sum(1.0)*100,2) as delaypercent
from "Order",Shipper where Shipper.Id = "Order".ShipVia group by Shipper.Id
order by delaypercent desc ;