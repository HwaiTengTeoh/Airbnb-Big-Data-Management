/**************************************************************************************************************************
 Note: For Pig only, in order to call other pig script, so that statement from the script are available in command history 
/**************************************************************************************************************************/
run /home/student/bdm/pig/1_load_data.pig;
run /home/student/bdm/pig/2_query_data.pig;


/********************************
* Query data for quick insights
*********************************/
/* (1) [Overall Experience] Top 20 Listings Based on Review Score, with review number more than 50 */
top20_overall = order join_listing_50review by listing_reviews::review_scores_rating DESC;
top20_overall = foreach top20_overall 
			generate listing_reviews::listing_id..listing_reviews::listing_url, 
				 listing_reviews::review_scores_rating,
				 filter_50::review_count;
top20_overall = limit top20_overall 20;
/*dump top20_overall;*/

store top20_overall into '/bdm/SINGAPORE/output/pig/output_p2_1';	


