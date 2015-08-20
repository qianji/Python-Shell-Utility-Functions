PROGRAM=$1
aws s3 cp s3://circuitbot-pta-results/circuitbot-auto-solver-qianji.pem ./
chmod 400 circuitbot-auto-solver-qianji.pem
rsync -e "ssh -i /home/ubuntu/circuitbot-auto-solver-qianji.pem" -avz /home/ubuntu/circuitbot-backend/analysis/"$PROGRAM"/ptg* ubuntu@54.158.162.254:/home/ubuntu/circuitbot-backend/analysis/"$PROGRAM"
aws s3 cp /home/ubuntu/circuitbot-backend/analysis/"$PROGRAM"/*.gz s3://circuitbot-pta-results/"$PROGRAM"
