# Airbnb Big Data Management

## Introduction
Airbnb became one-of-a-kind accommodation service that is used and recognized by the whole world. It allows the renting of houses or rooms owned by hosts to guests with the help of a technology tool. Over the recent years, Airbnb has been undergoing rapid development as an online platform community to provide access in accommodation and hospitalities globally. Due to the nature of its business, Airbnb has positioned itself as a data driven company; hence, invested heavily on its data infrastructure. 

## Problem Statement
The huge number of listings generate a lot of data (structured and unstructured) separately by location in compressed file by Airbnb which will be updated in frequent manner. The bulky number of files and frequent update of the data become problem for public users who are interested in understanding market of Airbnb based on the data. Loading, querying and analysis on huge number of listings provided by Airbnb is a crucial problem. 

## Objectives 
1. To set up of database and build data pipeline for managing Airbnb data. 
2. To utilize data access tools such as MongoDB and tools in Hadoop architecture for managing Airbnb data.
3. To compare the effectiveness of MongoDB and different tools in Hadoop architecture for performing loading, query and running analysis on Airbnb data

## Data Sources
(Inside Airbnb)[http://insideairbnb.com/get-the-data.html] is a website with a repository of data sourced from publicly available information such as listings, reviews, and calendar details from the original Airbnb site. The website provides datasets to Airbnb listings worldwide for about 108 locations. These data have been analyzed, cleansed, and aggregated where appropriate to facilitate the usage by the public in a compressed gz file. For this project, we demonstrated the data pipeline development using data from Singapore. However, a similar process can be conducted in acquiring data from other locations as the pipeline developed is flexible to be utilized for all locations. The data used in this project are Listings, Reviews, and Calendars. 


## Tools Used
- Ubuntu 
- Hadoop
- PySpark
- Apache Hive
- Apache Pig
- MongoDB Compass (Not saved in this repository)



