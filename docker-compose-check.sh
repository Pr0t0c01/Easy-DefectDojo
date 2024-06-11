#!/bin/bash

# Function to compare versions
version_lt() { 
    test "$(echo "$@" | tr " " "\n" | sort -V | head -n 1)" != "$1"; 
}

current=$(docker-compose version --short)

if [[ $? -ne 0 ]]; then
  echo "Failed to get docker-compose version. Please ensure docker-compose is installed and accessible."
  exit 1
fi

main=$(echo $current | cut -d '.' -f 1)
minor=$(echo $current | cut -d '.' -f 2)

echo 'Checking docker-compose version'
if [[ $main -lt 2 ]]; then
  if [[ $main -eq 1 && $minor -lt 28 ]]; then
    echo "$current is not a supported docker-compose version, please upgrade to the minimum supported version: 1.28"
    exit 1
  elif [[ $main -lt 1 ]]; then
    echo "$current is not a supported docker-compose version, please upgrade to the minimum supported version: 2.0"
    exit 1
  fi
fi

echo "Your docker-compose version $current is supported."
