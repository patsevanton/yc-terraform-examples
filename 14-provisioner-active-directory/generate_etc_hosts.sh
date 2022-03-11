#!/bin/bash

set -e

terraform output -json public_ip_address_for_active_directory | jq -r .
