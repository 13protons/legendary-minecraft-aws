#!/bin/bash
# Export all variables from .env for Terraform and AWS CLI usage
set -e

if [ ! -f .env ]; then
  echo ".env file not found!"
  exit 1
fi

# Export each variable in .env
export $(grep -v '^#' .env | xargs)

echo "Environment variables exported. You can now run terraform commands."
