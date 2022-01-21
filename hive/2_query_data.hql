---------------------------------
-- Query data for quick insights
---------------------------------

drop table if exists bdm3.reviews_table;
drop table if exists bdm3.over50;
drop table if exists bdm3.listings_reviews_table;


CREATE VIEW IF NOT EXISTS bdm3.reviews_table AS
SELECT * FROM bdm3.reviews 
WHERE comments != "";


CREATE VIEW IF NOT EXISTS bdm3.over50 AS
SELECT listing_id, COUNT(comments)
FROM bdm3.reviews_table
GROUP BY listing_id
HAVING COUNT(listing_id) > 50
ORDER BY listing_id desc;


use bdm3;
CREATE VIEW IF NOT EXISTS bdm3.listings_reviews_table AS
SELECT
over50.listing_id as over50_listing_id,
listings.listing_id as listings_listing_id,
name, neighborhood_cleansed, latitude, longitude, price, listing_url, review_scores_rating, review_scores_accuracy, review_scores_cleanliness, review_scores_checkin, review_scores_communication, review_scores_location, review_scores_value
from over50 LEFT JOIN listings on over50.listing_id=listings.listing_id;


-- Optional part
-- select * from bdm3.listings_reviews_table limit 5;

alter view bdm3.reviews_table set tblproperties('EXTERNAL' = 'FALSE');
alter view bdm3.over50 set tblproperties('EXTERNAL' = 'FALSE');
alter view bdm3.listings_reviews_table set tblproperties('EXTERNAL' = 'FALSE');


