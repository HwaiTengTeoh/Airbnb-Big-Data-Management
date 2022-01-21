/**************************************************************************************************************************
* Note: For Pig only, in order to call other pig script, so that statement from the script are available in command history 
/**************************************************************************************************************************/
run /home/student/bdm/pig/1_load_data.pig;


/******************
* Running Analysis
/******************/

/* (1) Listing - Count by Room Type */
roomtype = foreach listings generate listing_id, room_type;
group_roomtype = group roomtype by room_type;
count_roomtype = foreach group_roomtype generate group, COUNT(roomtype) as cnt;
count_roomtype = order count_roomtype by cnt DESC;
/*dump count_roomtype;*/

store count_roomtype into '/bdm/SINGAPORE/output/pig/output_p3_1';
