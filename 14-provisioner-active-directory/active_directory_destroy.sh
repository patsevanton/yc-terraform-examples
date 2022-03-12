#!/bin/bash

set -e

start_time=`date +%s`
TF_IN_AUTOMATION=1 terraform destroy -auto-approve
end_time=`date +%s`
echo execution time was `expr $end_time - $start_time` s.