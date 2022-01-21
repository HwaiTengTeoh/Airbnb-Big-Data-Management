/********************************
* Query data for quick insights
*********************************/

temp = foreach reviews generate listing_id, comments;
group_temp = group temp by listing_id;
count_temp = foreach group_temp generate group as listing_id, COUNT(temp.comments) as review_count; 
filter_50 = filter count_temp by review_count > 50;

listing_reviews = foreach listings 
			generate listing_id, name, neighborhood_cleansed, latitude, longitude, price, listing_url, 
			   	 review_scores_rating, review_scores_accuracy, review_scores_cleanliness, 
			   	 review_scores_checkin, review_scores_communication, review_scores_location, 
			   	 review_scores_value;

join_listing_50review = join listing_reviews by listing_id, filter_50 by listing_id;
join_listing_50review = foreach join_listing_50review generate listing_reviews::listing_id..listing_reviews::review_scores_value, filter_50::review_count;
