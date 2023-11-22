#!/bin/bash

# Get the user configrition
source config.txt

# Constract the full api link
API_URL="http://api.weatherapi.com/v1/current.json?key=$API_KEY&q=$City&aqi=$API_OP"

# Make a GET request with an API key and store the JSON response in a variable
response=$(curl -s -X GET "$API_URL" | jq '.')

# Extract and print specific fields using jq

# Print out the response
# echo "$response"