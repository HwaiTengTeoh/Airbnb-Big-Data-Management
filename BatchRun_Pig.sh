############################################
# Remove all records from TIMECHECK folder #
############################################
rm -r -v /home/student/bdm/TIMECHECK
mkdir /home/student/bdm/TIMECHECK


#######################################################################
# Part 1: Load data from HDFS Storage, Define Schema, Preprocess Data #
#######################################################################

# Start time #
start_time_load=$(date +%s)
echo "Running 1_load_data.pig script"

# Run 1_load_data.pig script #
pig -f /home/student/bdm/pig/1_load_data.pig

# End time #
end_time_load=$(date +%s)

# Time taken #
duration_load_sec=$((end_time_load-start_time_load))
duration_load_min=$(((end_time_load-start_time_load)/60))

echo "[Duration] Time taken to run Part 1 Load, Define Schema, Preprocess Data : $duration_load_sec seconds or $duration_load_min minutes" >> /home/student/bdm/TIMECHECK/time_check_pig.txt



######################
# Part 2: Query Data #
######################

#-------------------------------#
# Run 2_query_data_1.pig script #
#-------------------------------#
# Start time #
start_time_query1=$(date +%s)
echo "Running 2_query_data_1.pig script"

pig -f /home/student/bdm/pig/2_query_data_1.pig

# End time #
end_time_query1=$(date +%s)

# Time taken #
duration_query1_sec=$((end_time_query1-start_time_query1))
duration_query1_min=$(((end_time_query1-start_time_query1)/60))
echo "[Duration] Time taken to run Part 2 Query Data (Top20 Listings in overall): $duration_query1_sec seconds or $duration_query1_min minutes" >> /home/student/bdm/TIMECHECK/time_check_pig.txt


#-------------------------------#
# Run 2_query_data_2.pig script #
#-------------------------------#
# Start time #
start_time_query2=$(date +%s)
echo "Running 2_query_data_2.pig script"

pig -f /home/student/bdm/pig/2_query_data_2.pig

# End time #
end_time_query2=$(date +%s)

# Time taken #
duration_query2_sec=$((end_time_query2-start_time_query2))
duration_query2_min=$(((end_time_query2-start_time_query2)/60))
echo "[Duration] Time taken to run Part 2 Query Data (Top20 Listings in terms of Cleanliness): $duration_query2_sec seconds or $duration_query2_min minutes" >> /home/student/bdm/TIMECHECK/time_check_pig.txt


#-------------------------------#
# Run 2_query_data_3.pig script #
#-------------------------------#
# Start time #
start_time_query3=$(date +%s)
echo "Running 2_query_data_3.pig script"

pig -f /home/student/bdm/pig/2_query_data_3.pig

# End time #
end_time_query3=$(date +%s)

# Time taken #
duration_query3_sec=$((end_time_query3-start_time_query3))
duration_query3_min=$(((end_time_query3-start_time_query3)/60))
echo "[Duration] Time taken to run Part 2 Query Data (Top20 Listings in terms of Accuracy): $duration_query3_sec seconds or $duration_query3_min minutes" >> /home/student/bdm/TIMECHECK/time_check_pig.txt


#-------------------------------#
# Run 2_query_data_4.pig script #
#-------------------------------#
# Start time #
start_time_query4=$(date +%s)
echo "Running 2_query_data_4.pig script"

pig -f /home/student/bdm/pig/2_query_data_4.pig

# End time #
end_time_query4=$(date +%s)

# Time taken #
duration_query4_sec=$((end_time_query4-start_time_query4))
duration_query4_min=$(((end_time_query4-start_time_query4)/60))
echo "[Duration] Time taken to run Part 2 Query Data (Top20 Listings in terms of Check-in): $duration_query4_sec seconds or $duration_query4_min minutes" >> /home/student/bdm/TIMECHECK/time_check_pig.txt


#-------------------------------#
# Run 2_query_data_5.pig script #
#-------------------------------#
# Start time #
start_time_query5=$(date +%s)
echo "Running 2_query_data_5.pig script"

pig -f /home/student/bdm/pig/2_query_data_5.pig

# End time #
end_time_query5=$(date +%s)

# Time taken #
duration_query5_sec=$((end_time_query5-start_time_query5))
duration_query5_min=$(((end_time_query5-start_time_query5)/60))
echo "[Duration] Time taken to run Part 2 Query Data (Top20 Listings in terms of Communication): $duration_query5_sec seconds or $duration_query5_min minutes" >> /home/student/bdm/TIMECHECK/time_check_pig.txt


#-------------------------------#
# Run 2_query_data_6.pig script #
#-------------------------------#
# Start time #
start_time_query6=$(date +%s)
echo "Running 2_query_data_6.pig script"

pig -f /home/student/bdm/pig/2_query_data_6.pig

# End time #
end_time_query6=$(date +%s)

# Time taken #
duration_query6_sec=$((end_time_query6-start_time_query6))
duration_query6_min=$(((end_time_query6-start_time_query6)/60))
echo "[Duration] Time taken to run Part 2 Query Data (Top20 Listings in terms of Location): $duration_query6_sec seconds or $duration_query6_min minutes" >> /home/student/bdm/TIMECHECK/time_check_pig.txt


#-------------------------------#
# Run 2_query_data_7.pig script #
#-------------------------------#
# Start time #
start_time_query7=$(date +%s)
echo "Running 2_query_data_7.pig script"

pig -f /home/student/bdm/pig/2_query_data_7.pig

# End time #
end_time_query7=$(date +%s)

# Time taken #
duration_query7_sec=$((end_time_query7-start_time_query7))
duration_query7_min=$(((end_time_query7-start_time_query7)/60))
echo "[Duration] Time taken to run Part 2 Query Data (Top20 Listings in terms of Value): $duration_query7_sec seconds or $duration_query7_min minutes" >> /home/student/bdm/TIMECHECK/time_check_pig.txt



#########################
# Part 3: Analysis Data #
#########################

#----------------------------------#
# Run 3_analysis_data_1.pig script #
#----------------------------------#
# Start time #
start_time_ana1=$(date +%s)
echo "Running 3_analysis_data_1.pig script"
echo ""

pig -f /home/student/bdm/pig/3_analysis_data_1.pig

# End time #
end_time_ana1=$(date +%s)

# Time taken #
duration_ana1_sec=$((end_time_ana1-start_time_ana1))
duration_ana1_min=$(((end_time_ana1-start_time_ana1)/60))
echo "[Duration] Time taken to run Part 3: Analysis Data (Listing - Count by Room Type): $duration_ana1_sec seconds or $duration_ana1_min minutes" >> /home/student/bdm/TIMECHECK/time_check_pig.txt


#----------------------------------#
# Run 3_analysis_data_2.pig script #
#----------------------------------#
# Start time #
start_time_ana2=$(date +%s)
echo "Running 3_analysis_data_2.pig script"
echo ""

pig -f /home/student/bdm/pig/3_analysis_data_2.pig

# End time #
end_time_ana2=$(date +%s)

# Time taken #
duration_ana2_sec=$((end_time_ana2-start_time_ana2))
duration_ana2_min=$(((end_time_ana2-start_time_ana2)/60))
echo "[Duration] Time taken to run Part 3: Analysis Data (Listing - Count by Property Type): $duration_ana2_sec seconds or $duration_ana2_min minutes" >> /home/student/bdm/TIMECHECK/time_check_pig.txt


#----------------------------------#
# Run 3_analysis_data_3.pig script #
#----------------------------------#
# Start time #
start_time_ana3=$(date +%s)
echo "Running 3_analysis_data_3.pig script"
echo ""

pig -f /home/student/bdm/pig/3_analysis_data_3.pig

# End time #
end_time_ana3=$(date +%s)

# Time taken #
duration_ana3_sec=$((end_time_ana3-start_time_ana3))
duration_ana3_min=$(((end_time_ana3-start_time_ana3)/60))
echo "[Duration] Time taken to run Part 3: Analysis Data (Top 10 Property Type with Expensive Average Price): $duration_ana3_sec seconds or $duration_ana3_min minutes" >> /home/student/bdm/TIMECHECK/time_check_pig.txt


#----------------------------------#
# Run 3_analysis_data_4.pig script #
#----------------------------------#
# Start time #
start_time_ana4=$(date +%s)
echo "Running 3_analysis_data_4.pig script"
echo ""

pig -f /home/student/bdm/pig/3_analysis_data_4.pig

# End time #
end_time_ana4=$(date +%s)

# Time taken #
duration_ana4_sec=$((end_time_ana4-start_time_ana4))
duration_ana4_min=$(((end_time_ana4-start_time_ana4)/60))
echo "[Duration] Time taken to run Part 3: Analysis Data (Top 10 Property Type with Cheapest Average Price): $duration_ana4_sec seconds or $duration_ana4_min minutes" >> /home/student/bdm/TIMECHECK/time_check_pig.txt


#----------------------------------#
# Run 3_analysis_data_5.pig script #
#----------------------------------#
# Start time #
start_time_ana5=$(date +%s)
echo "Running 3_analysis_data_5.pig script"
echo ""

pig -f /home/student/bdm/pig/3_analysis_data_5.pig

# End time #
end_time_ana5=$(date +%s)

# Time taken #
duration_ana5_sec=$((end_time_ana5-start_time_ana5))
duration_ana5_min=$(((end_time_ana5-start_time_ana5)/60))
echo "[Duration] Time taken to run Part 3: Analysis Data (Number of reviews by year): $duration_ana5_sec seconds or $duration_ana5_min minutes" >> /home/student/bdm/TIMECHECK/time_check_pig.txt


#----------------------------------#
# Run 3_analysis_data_6.pig script #
#----------------------------------#
# Start time #
start_time_ana6=$(date +%s)
echo "Running 3_analysis_data_6.pig script"
echo ""

pig -f /home/student/bdm/pig/3_analysis_data_6.pig

# End time #
end_time_ana6=$(date +%s)

# Time taken #
duration_ana6_sec=$((end_time_ana6-start_time_ana6))
duration_ana6_min=$(((end_time_ana6-start_time_ana6)/60))
echo "[Duration] Time taken to run Part 3: Analysis Data (Average Price by location): $duration_ana6_sec seconds or $duration_ana6_min minutes" >> /home/student/bdm/TIMECHECK/time_check_pig.txt



