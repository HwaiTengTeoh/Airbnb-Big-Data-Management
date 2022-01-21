/**************************************************************************************************************************
* Note: For Pig only, in order to call other pig script, so that statement from the script are available in command history 
/**************************************************************************************************************************/
run /home/student/bdm/pig/1_load_data.pig;


/******************
* Running Analysis
/******************/

/* (5) Summary for number of reviews comment by year */
group_reviews_yr = group reviews by review_year;
count_reviews_yr = foreach group_reviews_yr generate group, COUNT(reviews.listing_id) as cnt;
/*dump count_reviews_yr;*/


store count_reviews_yr into '/bdm/SINGAPORE/output/pig/output_p3_5';
