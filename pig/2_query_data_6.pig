/**************************************************************************************************************************
 Note: For Pig only, in order to call other pig script, so that statement from the script are available in command history 
/**************************************************************************************************************************/
run /home/student/bdm/pig/1_load_data.pig;
run /home/student/bdm/pig/2_query_data.pig;


/********************************
* Query data for quick insights
*********************************/
/* (6) [Location] Top 20 Listings Based on Review Score, with review number more than 50 */
top20_location = order join_listing_50review by listing_reviews::review_scores_location DESC;
top20_location = foreach top20_location 
			generate listing_reviews::listing_id..listing_reviews::listing_url, 
				 listing_reviews::review_scores_location,
				 filter_50::review_count;
top20_location = limit top20_location 20;
/*dump top20_location;*/

store top20_location into '/bdm/SINGAPORE/output/pig/output_p2_6';
