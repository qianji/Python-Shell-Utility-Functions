
BIND_FOLDER="/home/ubuntu/circuitbot-backend/analysis/"
PROGRAM_NAME=$1
PROGRAM=$1"/"
LOG_FILE=$PROGRAM_NAME"_log.txt"
S3PATH="s3://circuitbot-pta-results/"$PROGRAM

cd $BIND_FOLDER$PROGRAM
aws s3 cp ./pta_result.xml.gz $S3PATH
aws s3 cp "./"$LOG_FILE".gz" $S3PATH

