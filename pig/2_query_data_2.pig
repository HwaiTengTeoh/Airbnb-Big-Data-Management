/**************************************************************************************************************************
 Note: For Pig only, in order to call other pig script, so that statement from the script are available in command history 
/**************************************************************************************************************************/
run /home/student/bdm/pig/1_load_data.pig;
run /home/student/bdm/pig/2_query_data.pig;


/********************************
* Query data for quick insights
*********************************/
/* (2) [Cleanliness] Top 20 Listings Based on Review Score, with review number more than 50 */
top20_clean = order join_listing_50review by listing_reviews::review_scores_cleanliness DESC;
top20_clean = foreach top20_clean 
			generate listing_reviews::listing_id..listing_reviews::listing_url, 
				 listing_reviews::review_scores_cleanliness,
				 filter_50::review_count;
top20_clean = limit top20_clean 20;
/*dump top20_clean;*/

store top20_clean into '/bdm/SINGAPORE/output/pig/output_p2_2';
