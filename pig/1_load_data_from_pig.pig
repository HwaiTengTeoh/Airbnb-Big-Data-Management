/***********************************************************************************
* Load Airbnb Files with org.apache.pig.piggybank.storage.CSVExcelStorage()
* Preprocess each data file 
* (1) listings
* (2) reviews
* (3) calendar
*************************************************************************************/

/************************************************************************************
/* (1) listings 
/* - Define Schema for each attribute
/* - Eliminate multiple new line spaces within 'host_about'
/* - Tokenize chararray with list of items (host_identity_verified, amenities) 
     into several tokens 
/* - Obtain the month from 'start_host' date
/* - Remove '$' and ',' sign from 'price' attribute and cast it from chararray to float
/* - Remove first row of header
/*************************************************************************************/

load_listings = load '/bdm/SINGAPORE/listings' 
		using org.apache.pig.piggybank.storage.CSVExcelStorage(',','YES_MULTILINE','NOCHANGE','SKIP_INPUT_HEADER') as 
		(listing_id: chararray,
		listing_url: chararray,
		scrape_id: chararray,
		last_scraped: datetime,
		name: chararray,
		description: chararray,
		neighborhood_overview: chararray,
		picture_url: chararray,
		host_id: chararray,
		host_url: chararray,
		host_name: chararray,
		host_since: datetime,
		host_location: chararray,
		host_about: chararray,
		host_response_time: chararray,
		host_response_rate: float,
		host_acceptance_rate: float,
		host_is_superhost: chararray,
		host_thumbnail_url: chararray,
		host_picture_url: chararray,
		host_neighbourhood: chararray,
		host_listings_count: int,
		host_total_listings_count: int,
		host_verifications: chararray,
		host_has_profile_pic: chararray,
		host_identity_verified: chararray,
		neighborhood: chararray,
		neighborhood_cleansed: chararray,
		neighborhood_group_cleansed: chararray,
		latitude: float,
		longitude: float,
		property_type: chararray,
		room_type: chararray,
		accommodates: int,
		bathrooms: int,
		bathrooms_text: chararray,
		bedrooms: int,
		beds: int,
		amenities: chararray,
		price: chararray,
		minimum_nights: int,
		maximum_nights: int,
		minimum_minimum_nights: int,
		maximum_minimum_nights: int,
		minimum_maximum_nights: int,
		maximum_maximum_nights: int,
		minimum_nights_avg_ntm: int,
		maximum_nights_avg_ntm: int,
		calendar_updated: datetime,
		has_availability: chararray,
		availability_30: int,
		availability_60: int,
		availability_90: int,
		availability_365: int,
		calendar_last_scraped: datetime,
		number_of_reviews: int,
		number_of_reviews_ltm: int,
		number_of_reviews_l30d: int,
		first_review: datetime,
		last_review: datetime,
		review_scores_rating: float,
		review_scores_accuracy: float,
		review_scores_cleanliness: float,
		review_scores_checkin: float,
		review_scores_communication: float,
		review_scores_location: float,
		review_scores_value: float,
		license: chararray,
		instant_bookable: chararray,
		calculated_host_listings_count: int,
		calculated_host_listings_count_entire_homes: int,
		calculated_host_listings_count_private_rooms: int,
		calculated_host_listings_count_shared_rooms: int,
		reviews_per_month: float);

listings = foreach load_listings 
		generate listing_id..name,
			 REPLACE(description,'(<br />)|(<br/>)|(<b>)|(</b>)|(\n)|(\t)|(•)','') as description,
			 REPLACE(neighborhood_overview,'(<br />)|(<br/>)|(<b>)|(</b>)|(\n)|(\t)|(•)','') as neighborhood_overview,
			 picture_url..host_location,
			 REPLACE(host_about,'(<br />)|(<br/>)|(<b>)|(</b>)|(\n)|(\t)|(•)','') as host_about,
			 host_response_time..host_has_profile_pic,
			 host_identity_verified,
			 neighborhood..beds,
			 amenities,
			 (float)REPLACE(REPLACE(price,'[$]',''),',','') as price,
			 minimum_nights..reviews_per_month,
			 GetYear(host_since) as start_year; /* extra */

store listings into '/bdm/SINGAPORE/pig/clean_data/listings';

/************************************************************************************
/* (2) reviews
/* - Define Schema for each attribute
/* - Obtain month and year from review date
/* - Remove first row of header
/*************************************************************************************/

load_reviews = load '/bdm/SINGAPORE/reviews' 
	       using org.apache.pig.piggybank.storage.CSVExcelStorage(',','YES_MULTILINE','NOCHANGE','SKIP_INPUT_HEADER') as 
	       (listing_id: chararray,
		review_id: chararray,
		date: datetime,
		reviewer_id: chararray,
		reviewer_name: chararray,
		comments: chararray);

reviews = foreach load_reviews 
		generate listing_id, review_id, date, 
			 GetYear(date) as review_year,
			 GetMonth(date) as review_month,
			 reviewer_id,
			 reviewer_name,
			 REPLACE(comments,'(<br />)|(<br/>)|(<b>)|(</b>)|(\n)|(\t)|(•)','') as comments;

store reviews into '/bdm/SINGAPORE/pig/clean_data/reviews';


/************************************************************************************
/* (3) calendar
/* - Define Schema for each attribute
/* - Obtain month and year from review date
/* - Remove $ sign from 'price' and 'adjusted_price' attribute and store it as float
/* - Remove first row of header
/*************************************************************************************/
load_calendar = load '/bdm/SINGAPORE/calendar' 
	        using org.apache.pig.piggybank.storage.CSVExcelStorage(',','YES_MULTILINE','NOCHANGE','SKIP_INPUT_HEADER') as 
	        (listing_id: chararray,
		date: datetime,
		available: chararray,
		price: chararray,
		adjusted_price: chararray,
		minimum_nights: int,
		maximum_nights: int);

calendar = foreach load_calendar 
		generate listing_id, date,
			 GetYear(date) as calendar_year,
			 GetMonth(date) as calendar_month,
			 available,
			 (float)REPLACE(REPLACE(price,'[$]',''),',','') as price,
			 (float)REPLACE(REPLACE(adjusted_price,'[$]',''),',','') as adjusted_price,
			 minimum_nights,
			 maximum_nights;

store calendar into '/bdm/SINGAPORE/pig/clean_data/calendar';


