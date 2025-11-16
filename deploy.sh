#!/bin/bash
set -e

terraform init
terraform apply -auto-approve

echo "Deployment started. Use 'terraform output' to get the public IP."
