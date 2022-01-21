---------------------
-- Running Analysis
---------------------

-- (3) Top 10 Property Type with Expensive Average Price 

USE bdm3;
select listings.property_type, avg(listings.price) as avg_price
from listings
GROUP BY property_type
order by avg_price desc
limit 10;




