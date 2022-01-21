---------------------
-- Running Analysis
---------------------

-- (5) Summary for number of reviews comment by year

USE bdm3;

select r.review_year, count(r.listing_id) as cnt
from reviews r
group by r.review_year;


