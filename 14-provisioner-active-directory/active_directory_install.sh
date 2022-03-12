#!/bin/bash

set -e

start_time=`date +%s`
TF_IN_AUTOMATION=1 terraform init
TF_IN_AUTOMATION=1 terraform apply -auto-approve
ansible-playbook -vvv -i inventory.yml playbook.yml
end_time=`date +%s`
echo execution time was `expr $end_time - $start_time` s.
