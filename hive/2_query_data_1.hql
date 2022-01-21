--------------------------------
-- Query data for quick insights
--------------------------------

-- (1) [Overall Experience] Top 20 Listings Based on Review Score, with review number more than 50

use bdm3;
select listings_listing_id, 
       name, 
       neighborhood_cleansed, 
       latitude,
       longitude, 
       price, 
       listing_url, 
       listings_reviews_table.review_scores_rating 
from listings_reviews_table
order by listings_reviews_table.review_scores_rating desc
limit 20;

