select distinct ShipName,substring(ShipName,1,charindex('-',ShipName)-1)
from "Order"
where ShipName like '%-%'
order by ShipName;