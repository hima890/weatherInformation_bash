#!/bin/bash

# Get the user configrition
source config.txt

# Constract the full api link
API_URL="http://api.weatherapi.com/v1/current.json?key=$API_KEY&q=$City&aqi=$API_OP"

# Make a GET request with an API key and store the JSON response in a variable
response=$(curl -s -X GET "$API_URL" | jq '.')

# Extract specific fields using jq(python)
region=$(echo "$response" | jq -r '.location.region')
temp_c=$(echo "$response" | jq -r '.current.temp_c')
temp_f=$(echo "$response" | jq -r '.current.temp_f')
wind_kh=$(echo "$response" | jq -r '.current.wind_kph')
wind_dir=$(echo "$response" | jq -r '.current.wind_dir')
humidity=$(echo "$response" | jq -r '.current.humidity')
vis_km=$(echo "$response" | jq -r '.current.vis_km')
pressure_in=$(echo "$response" | jq -r '.current.pressure_in')
precip_in=$(echo "$response" | jq -r '.current.precip_in')
cloud=$(echo "$response" | jq -r '.current.cloud')
feelslike_c=$(echo "$response" | jq -r '.current.feelslike_c')
feelslike_f=$(echo "$response" | jq -r '.current.feelslike_f')
uv=$(echo "$response" | jq -r '.current.uv')
last_updated=$(echo "$response" | jq -r '.current.last_updated')


# Formating the output
weather_info="
Location: $City, $region

Current Weather: $temp_c°C ($temp_f°F), Sunny
Wind: $wind_kh km, $wind_dir
Humidity: $humidity%
Visibility: $vis_km km

Pressure: $pressure_in in
Precipitation: $precip_in mm
Cloud Cover: $cloud%
Feels Like: $feelslike_c°C ($feelslike_f°F)
UV Index: $uv

Last Updated: $last_updated
"
# Print out the response
echo "$weather_info"