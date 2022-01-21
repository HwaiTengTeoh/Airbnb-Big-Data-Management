#############################################
# Download Airbnb Data to Local File System #
#############################################
 
echo "DOWNLOAD AIRBNB DATA"
echo "Please browse this site: http://insideairbnb.com/get-the-data.html and determine the following:"
echo "(1) Location"
echo "(2) Location specific ULRs"
echo "------------------------------------------------------------------------------------------------
Location	      	Location URL path
------------------------------------------------------------------------------------------------
AMSTERDAM		the-netherlands/north-holland/amsterdam
ANTWERP			belgium/vlg/antwerp
ASHEVILLE		united-states/nc/asheville
ATHENS			greece/attica/athens
AUSTIN			united-states/tx/austin
BANGKOK			thailand/central-thailand/bangkok
BARCELONA		spain/catalonia/barcelona
BAROSSA-VALLEY		australia/sa/barossa-valley
BARWON-SOUTH-WEST-VIC	australia/vic/barwon-south-west-vic
BEIJING			china/beijing/beijing
BELIZE			belize/bz/belize
BERGAMO			italy/lombardia/bergamo
BERLIN			germany/be/berlin
BOLOGNA			italy/emilia-romagna/bologna
BORDEAUX		france/nouvelle-aquitaine/bordeaux
BOSTON			united-states/ma/boston
BRISTOL			united-kingdom/england/bristol
BROWARD-COUNTY		united-states/fl/broward-county
BRUSSELS		belgium/bru/brussels
BUENOS-AIRES		argentina/ciudad-aut%c3%b3noma-de-buenos-aires/buenos-aires
CAMBRIDGE		united-states/ma/cambridge
CAPE-TOWN		south-africa/wc/cape-town
CHICAGO			united-states/il/chicago
CLARK-COUNTY-NV		united-states/nv/clark-county-nv
COLUMBUS		united-states/oh/columbus
COPENHAGEN		denmark/hovedstaden/copenhagen
CRETE			greece/crete/crete
DENVER			united-states/co/denver
DUBLIN			ireland/leinster/dublin
EDINBURGH		united-kingdom/scotland/edinburgh
EUSKADI			spain/pv/euskadi
FLORENCE		italy/toscana/florence
GAUTENG			south-africa/gt/gauteng
GENEVA			switzerland/geneva/geneva
GHENT			belgium/vlg/ghent
GIRONA			spain/catalonia/girona
GREATER-MANCHESTER	united-kingdom/england/greater-manchester
HAWAII			united-states/hi/hawaii
HONG-KONG		china/hk/hong-kong
IRELAND			ireland
ISTANBUL		turkey/marmara/istanbul
JERSEY-CITY		united-states/nj/jersey-city
LISBON			portugal/lisbon/lisbon
LONDON			united-kingdom/england/london
LOS-ANGELES		united-states/ca/los-angeles
LYON			france/auvergne-rhone-alpes/lyon
MADRID			spain/comunidad-de-madrid/madrid
MALAGA			spain/andaluc%c3%ada/malaga
MALLORCA		spain/islas-baleares/mallorca
MALTA			malta
MELBOURNE		australia/vic/melbourne
MENORCA			spain/islas-baleares/menorca
MEXICO-CITY		mexico/df/mexico-city
MILAN			italy/lombardy/milan
MONTREAL		canada/qc/montreal
MUNICH			germany/bv/munich
NAPLES			italy/campania/naples
NASHVILLE		united-states/tn/nashville
NEW-BRUNSWICK		canada/nb/new-brunswick
NEW-ORLEANS		united-states/la/new-orleans
NEW-YORK-CITY		united-states/ny/new-york-city
NEW-ZEALAND		new-zealand
NORTHERN-RIVERS		australia/nsw/northern-rivers
OAKLAND			united-states/ca/oakland
OSLO			norway/oslo/oslo
OTTAWA			canada/on/ottawa
PACIFIC-GROVE		united-states/ca/pacific-grove
PARIS			france/ile-de-france/paris
PORTLAND		united-states/or/portland
PORTO			portugal/norte/porto
PRAGUE			czech-republic/prague/prague
PUGLIA			italy/puglia/puglia
QUEBEC-CITY		canada/qc/quebec-city
RHODE-ISLAND		united-states/ri/rhode-island
RIGA			latvia/riga/riga
RIO-DE-JANEIRO		brazil/rj/rio-de-janeiro
ROME			italy/lazio/rome
SALEM-OR		united-states/or/salem-or
SAN-DIEGO		united-states/ca/san-diego
SAN-FRANCISCO		united-states/ca/san-francisco
SAN-MATEO-COUNTY	united-states/ca/san-mateo-county
SANTA-CLARA-COUNTY	united-states/ca/santa-clara-county
SANTA-CRUZ-COUNTY	united-states/ca/santa-cruz-county
SANTIAGO		chile/rm/santiago
SEATTLE			united-states/wa/seattle
SEVILLA			spain/andaluc%c3%ada/sevilla
SHANGHAI		china/shanghai/shanghai
SICILY			italy/sicilia/sicily
SINGAPORE		singapore/sg/singapore
SOUTH-AEGEAN		greece/south-aegean/south-aegean
STOCKHOLM		sweden/stockholms-l%c3%a4n/stockholm
SYDNEY			australia/nsw/sydney
TAIPEI			taiwan/northern-taiwan/taipei
TASMANIA		australia/tas/tasmania
THESSALONIKI		greece/central-macedonia/thessaloniki
TOKYO			japan/kant%c5%8d/tokyo
TORONTO			canada/on/toronto
TRENTINO		italy/trentino-alto-adige-s%c3%bcdtirol/trentino
TWIN-CITIES-MSA		united-states/mn/twin-cities-msa
VALENCIA		spain/vc/valencia
VANCOUVER		canada/bc/vancouver
VAUD			switzerland/vd/vaud
VENICE			italy/veneto/venice
VICTORIA		canada/bc/victoria
VIENNA			austria/vienna/vienna
WASHINGTON-DC		united-states/dc/washington-dc
WESTERN-AUSTRALIA	australia/wa/western-australia
ZURICH			switzerland/z%c3%bcrich/zurich
"
echo ""
echo "(3) Latest uploading date for your preferred location"
echo ""

# Choose and the region
read -p "Enter the location : " location_name
read -p "Enter the location_url : " location_url
read -p "Enter the latest file update date (in yyyy-mm-dd format) : " file_date

echo ""
echo "You have chosen the following: "
echo $location_name
echo $location_url
echo $file_date
echo ""

# Start time #
start_time=$(date +%s)

echo "Create Location Folder"
mkdir /home/student/bdm/"$location_name"
echo ""

echo "Downloading listing file for ${location_name}"
wget -q http://data.insideairbnb.com/"$location_url"/"$file_date"/data/listings.csv.gz -O /home/student/bdm/"$location_name"/listings.csv.gz

echo "Downloading calendar file for ${location_name}"
wget -q http://data.insideairbnb.com/"$location_url"/"$file_date"/data/calendar.csv.gz -O /home/student/bdm/"$location_name"/calendar.csv.gz

echo "Downloading review file for ${location_name}"
wget -q http://data.insideairbnb.com/"$location_url"/"$file_date"/data/reviews.csv.gz -O /home/student/bdm/"$location_name"/reviews.csv.gz

echo "COMPLETE DOWNLOADING AIRBNB DATA for ${location_name}"
echo ""

echo "Unzipping listing file for ${location_name}"
gunzip -f /home/student/bdm/"$location_name"/listings.csv.gz

echo "Unzipping calendar file for ${location_name}"
gunzip -f /home/student/bdm/"$location_name"/calendar.csv.gz

echo "Unzipping review file for ${location_name}"
gunzip -f /home/student/bdm/"$location_name"/reviews.csv.gz

echo "COMPLETE UNZIPPING AIRBNB DATA for ${location_name}"
echo ""

###################################################
# Load Airbnb Data from Local File System to HDFS #
###################################################

echo "Remove existing folder (if any, including the all the files in this directory)"
hadoop fs -rm -r /bdm/"$location_name"
echo ""

echo "Creating HDFS Directory"
hadoop fs -mkdir /bdm
hadoop fs -mkdir /bdm/"$location_name"
echo ""

echo "Creating HDFS Directory to store outputs"
hadoop fs -mkdir /bdm/"$location_name"/pig
hadoop fs -mkdir /bdm/"$location_name"/hbase
hadoop fs -mkdir /bdm/"$location_name"/spark
hadoop fs -mkdir /bdm/"$location_name"/hive
hadoop fs -mkdir /bdm/"$location_name"/mongodb
echo ""

echo "Copying Airbnb data files from local file system to the directory of Hadoop"
echo "Copying listing file for ${location_name} to HDFS"
hadoop fs -copyFromLocal /home/student/bdm/"$location_name"/listings.csv /bdm/"$location_name"/listings
echo "Copying calendar file for ${location_name} to HDFS"
hadoop fs -copyFromLocal /home/student/bdm/"$location_name"/calendar.csv /bdm/"$location_name"/calendar
echo "Copying review file for ${location_name} to HDFS"
hadoop fs -copyFromLocal /home/student/bdm/"$location_name"/reviews.csv /bdm/"$location_name"/reviews

echo "COMPLETE LOADING FILES TO HDFS"
echo ""

echo "CHEKING LIST OF FILES AND DIRECTORIES PRESENT IN HDFS"
hadoop fs -ls /bdm/"$location_name"
echo ""

# End time #
end_time=$(date +%s)

# Time taken #
duration_sec=$((end_time-start_time))
duration_min=$(((end_time-start_time)/60))

echo "[Duration] Time taken to load Airbnb Data from Inside Airbnb site to HDFS : $duration_min minutes or $duration_sec seconds"



