/**************************************************************************************************************************
* Note: For Pig only, in order to call other pig script, so that statement from the script are available in command history 
/**************************************************************************************************************************/
run /home/student/bdm/pig/1_load_data.pig;


/******************
* Running Analysis
/******************/

/* (2) Listing - Count by Property Type */
propertytype = foreach listings generate listing_id, property_type;
group_propertytype = group propertytype by property_type;
count_propertytype = foreach group_propertytype generate group, COUNT(propertytype) as cnt;
count_propertytype = order count_propertytype by cnt DESC;
/*dump count_propertytype;*/

store count_propertytype into '/bdm/SINGAPORE/output/pig/output_p3_2';


