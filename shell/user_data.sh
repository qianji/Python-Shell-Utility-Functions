#!/bin/bash
cd /home/ubuntu
wget https://s3.amazonaws.com/circuitbot-pta-results/auto_solver_one_program.sh
chmod 777 auto_solver_one_program.sh
./auto_solver_one_program.sh /home/ubuntu/circuitbot-backend/analysis/ bxdiz0017
