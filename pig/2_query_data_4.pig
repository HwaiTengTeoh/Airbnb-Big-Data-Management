/**************************************************************************************************************************
 Note: For Pig only, in order to call other pig script, so that statement from the script are available in command history 
/**************************************************************************************************************************/
run /home/student/bdm/pig/1_load_data.pig;
run /home/student/bdm/pig/2_query_data.pig;


/********************************
* Query data for quick insights
*********************************/
/* (4) [Check-in] Top 20 Listings Based on Review Score, with review number more than 50 */
top20_checkin = order join_listing_50review by listing_reviews::review_scores_checkin DESC;
top20_checkin = foreach top20_checkin 
			generate listing_reviews::listing_id..listing_reviews::listing_url, 
				 listing_reviews::review_scores_checkin,
				 filter_50::review_count;
top20_checkin = limit top20_checkin 20;
/*dump top20_checkin;*/

store top20_checkin into '/bdm/SINGAPORE/output/pig/output_p2_4';
