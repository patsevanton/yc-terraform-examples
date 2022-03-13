#!/bin/bash

set -e

# read -p "Enter GITLAB_ROOT_PASSWORD: " GITLAB_ROOT_PASSWORD
export GITLAB_ROOT_PASSWORD=source_me_from_secret_manager

start_time=`date +%s`
date1=$(date +"%s")
TF_IN_AUTOMATION=1 terraform init
TF_IN_AUTOMATION=1 terraform apply -auto-approve
# sed -e s/GITLAB_ROOT_PASSWORD_ENV/$GITLAB_ROOT_PASSWORD/ -i playbook.yml
ansible-playbook -vvv -i inventory.yml playbook.yml
end_time=`date +%s`
date2=$(date +"%s")
echo "###############"
echo Execution time was `expr $end_time - $start_time` s.
DIFF=$(($date2-$date1))
echo "Duration: $(($DIFF / 3600 )) hours $((($DIFF % 3600) / 60)) minutes $(($DIFF % 60)) seconds"
echo "###############"
echo "GITLAB_ROOT_PASSWORD is: $GITLAB_ROOT_PASSWORD"
