#!/bin/bash

set -e

printf "[windows]\n"
printf "active-directory ansible_host="
terraform output -json public_ip_address_for_active_directory | jq -r .

cat << EOF
[windows:vars]
ansible_port=5986
ansible_connection=winrm
ansible_winrm_transport=basic
ansible_user=Administrator
ansible_winrm_server_cert_validation=ignore
EOF

printf "\n[windows:vars]\n"
printf "ansible_user=ubuntu\n"
printf "ansible_password='"
terraform output -json instance_group_masters_public_ips | jq -cj '.'
printf "'\n\n"