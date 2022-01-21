/**************************************************************************************************************************
* Note: For Pig only, in order to call other pig script, so that statement from the script are available in command history 
/**************************************************************************************************************************/
run /home/student/bdm/pig/1_load_data.pig;


/******************
* Running Analysis
/******************/

/* (6) Average price of listings by location */
neighborhood = foreach listings generate listing_id, neighborhood_cleansed, price;
group_neighborhood = group neighborhood by neighborhood_cleansed;
neighborhood_price = foreach group_neighborhood generate group, AVG(neighborhood.price) as avg_price;
neighborhood_price = order neighborhood_price by avg_price DESC;
/*dump neighborhood_price;*/

store neighborhood_price into '/bdm/SINGAPORE/output/pig/output_p3_6';


