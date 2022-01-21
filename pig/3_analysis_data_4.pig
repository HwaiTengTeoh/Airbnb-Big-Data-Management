/**************************************************************************************************************************
* Note: For Pig only, in order to call other pig script, so that statement from the script are available in command history 
/**************************************************************************************************************************/
run /home/student/bdm/pig/1_load_data.pig;


/******************
* Running Analysis
/******************/

/* (4) Top 10 Property Type with Cheapest Average Price */
price_property = foreach listings generate listing_id, price, property_type;
group_price_property = group price_property by property_type;
avgprice_property = foreach group_price_property generate group, AVG(price_property.price) as avg_price;

avgprice_property = order avgprice_property by avg_price ASC;
bot10_avgprice_property = limit avgprice_property 10;
/*dump bot10_avgprice_property;*/

store bot10_avgprice_property into '/bdm/SINGAPORE/output/pig/output_p3_4';
