/**************************************************************************************************************************
 Note: For Pig only, in order to call other pig script, so that statement from the script are available in command history 
/**************************************************************************************************************************/
run /home/student/bdm/pig/1_load_data.pig;
run /home/student/bdm/pig/2_query_data.pig;


/********************************
* Query data for quick insights
*********************************/
/* (7) [Value] Top 20 Listings Based on Review Score, with review number more than 50 */
top20_value = order join_listing_50review by listing_reviews::review_scores_value DESC;
top20_value = foreach top20_value
			generate listing_reviews::listing_id..listing_reviews::listing_url, 
				 listing_reviews::review_scores_value,
				 filter_50::review_count;
top20_value = limit top20_value 20;
/*dump top20_value;*/

store top20_value into '/bdm/SINGAPORE/output/pig/output_p2_7';

