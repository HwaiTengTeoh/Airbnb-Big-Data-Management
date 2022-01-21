---------------------
-- Running Analysis
---------------------

-- (1) Listing - Count by Room Type

USE bdm3;

select room_type, count(*) as cnt
from bdm3.listings 
group by room_type;


