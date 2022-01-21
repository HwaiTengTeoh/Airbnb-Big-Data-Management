---------------------
-- Running Analysis
---------------------

-- (6) Average price of listings by location

USE bdm3;

select l.neighborhood_cleansed, avg(l.price) as avg_price
from listings l
group by neighborhood_cleansed
order by avg_price desc;


