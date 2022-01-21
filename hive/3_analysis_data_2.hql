---------------------
-- Running Analysis
---------------------

-- (2) Listing - Count by Property Type

USE bdm3;

select l.property_type, count(l.listing_id) as cnt
from listings l
group by l.property_type;




