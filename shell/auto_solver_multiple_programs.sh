# This script is used to do the following step by step
# 1. Run the auto-solver on a specific bind program
# 2. Convert the ptg result got from #1 to pta result
# 3. Copy the pta result from 2 to S3
# 4. Stop the machine from running to save money

# This script is used to do the following step by step
# 1. Run the auto-solver on a specific bind program
# 2. Convert the ptg result got from #1 to pta result
# 3. Copy the pta result from 2 to S3
# 4. Stop the machine from running to save money
# define the global variable names
BIND_FOLDER="/home/ubuntu/circuitbot-backend/analysis/*"
for file in $BIND_FOLDER
do
PROGRAM=$(basename "$file")
LOGFILE=$PROGRAM"_log.txt"
PROGRAM=$PROGRAM"/"
echo "Processing $PROGRAM"

BIND_FOLDER="/home/ubuntu/circuitbot-backend/analysis/"
#PROGRAM=$1
S3PATH="s3://circuitbot-pta-results/"$PROGRAM

#0 unzip the anchor file if it is zipped
cd $BIND_FOLDER$PROGRAM
if test -e CH_Analysis_anchors.xml.gz;
then
gunzip CH_Analysis_anchors.xml.gz
fi
# 1. Run the auto-solver on a specific bind program

# go to the folder where the auto-solver is 
cd /home/ubuntu/circuitbot-game-model/GameModel\ Dictioanry/GameModel/bin/Debug
# run the solver on a specific bind program
mono --gc=sgen ./GameModel.exe $BIND_FOLDER$PROGRAM >$BIND_FOLDER$PROGRAM$LOG_FILE
#./complete_solver $BIND_FOLDER$PROGRAM &>$BIND_FOLDER$LOGFILE

# 2. Convert the ptg result to pta result

# go the folder where the program is
cd /home/ubuntu/circuitbot-game-model/PTA/src/
ruby generate_result.rb $BIND_FOLDER$PROGRAM

# 3. Copy the pta result to S3
cd $BIND_FOLDER$PROGRAM
gzip ./pta_result.xml "./"$LOG_FILE
aws s3 cp ./pta_result.xml.gz $S3PATH
aws s3 cp "./"$LOG_FILE".gz" $S3PATH

done
echo "ALl programs done"
#/sbin/shutdown -h now


