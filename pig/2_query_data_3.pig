/**************************************************************************************************************************
 Note: For Pig only, in order to call other pig script, so that statement from the script are available in command history 
/**************************************************************************************************************************/
run /home/student/bdm/pig/1_load_data.pig;
run /home/student/bdm/pig/2_query_data.pig;


/********************************
* Query data for quick insights
*********************************/
/* (3) [Accuracy] Top 20 Listings Based on Review Score, with review number more than 50 */
top20_acc = order join_listing_50review by listing_reviews::review_scores_accuracy DESC;
top20_acc = foreach top20_acc
			generate listing_reviews::listing_id..listing_reviews::listing_url, 
				 listing_reviews::review_scores_accuracy,
				 filter_50::review_count;
top20_acc = limit top20_acc 20;
/*dump top20_acc;*/

store top20_acc into '/bdm/SINGAPORE/output/pig/output_p2_3';


