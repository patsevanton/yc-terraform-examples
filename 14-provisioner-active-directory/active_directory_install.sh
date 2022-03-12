#!/bin/bash

set -e

TF_IN_AUTOMATION=1 terraform init
TF_IN_AUTOMATION=1 terraform apply -auto-approve
ansible-playbook -vvv -i inventory.yml playbook.yml
