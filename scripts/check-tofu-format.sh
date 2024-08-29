#!/usr/bin/env bash

set -euo pipefail

# Runs terraform format and checks if git is clean afterwards

tofu fmt -recursive

if ! git diff --exit-code; then
  echo "Opentofu files are not formatted. Please run 'tofu fmt -recursive' and commit the changes."
  exit 1
fi
