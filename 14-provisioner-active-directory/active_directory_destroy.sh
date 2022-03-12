#!/bin/bash

set -e

TF_IN_AUTOMATION=1 terraform destroy -auto-approve
