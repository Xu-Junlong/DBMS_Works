select id,ShipCountry,(case when ShipCountry = 'USA' or ShipCountry = 'Mexico' or ShipCountry = 'Canada'
    then 'NorthAmerica' else 'OtherPlace'end )
from "Order"
where id>=15445
limit 20;