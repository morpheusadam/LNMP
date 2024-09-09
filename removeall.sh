#!/bin/bash

# Change to the directory containing the domains
cd /var/www

# Loop through each directory
for dir in */; do
  dir=${dir%/}  # Remove trailing slash
  if [[ "$dir" != "localhost" && "$dir" != "html" ]]; then
    # Delete the directory
    sudo rm -rf "$dir"
  fi
done