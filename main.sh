#!/bin/bash

# Check if the configuration file exists
# Source the configuration file in the same directory
if [ -e "$(dirname "$0")/config.txt" ]; then
    source "$(dirname "$0")/config.txt"
else
    echo "Configuration file (config.txt) not found in the same directory."
    exit 1
fi

# Checking internet connectivity
if ! curl -s --head http://www.google.com | grep "200 OK" > /dev/null;
then
    echo "No internet connection."
    exit 1
fi

# Construct the full API link
API_URL="http://api.weatherapi.com/v1/current.json?key=$API_KEY&q=$City&aqi=$API_OP"

# Make a GET request and store the response headers and body in separate variables
response=$(curl -s -X GET "$API_URL" | jq '.')
cdn_status=$(echo "$response_headers" | grep -i "CDN-Status" | awk '{print $2}')

# Check if the response contains a "status" field with a value of "OK"
if [ -n "$cdn_status" ] && [ "$cdn_status" != "200" ];
then
    echo "API did not respond with code 200."
    exit 1
else
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

    # Formatting the output
    printf "
    Location: %s, %s

    Current Weather: %s°C (%s°F), Sunny
    Wind: %s km, %s
    Humidity: %s%%
    Visibility: %s km

    Pressure: %s in
    Precipitation: %s mm
    Cloud Cover: %s%%
    Feels Like: %s°C (%s°F)
    UV Index: %s

    Last Updated: %s
    " "$City" "$region" "$temp_c" "$temp_f" "$wind_kh" "$wind_dir" \
    "$humidity" "$vis_km" "$pressure_in" "$precip_in" "$cloud" \
    "$feelslike_c" "$feelslike_f" "$uv" "$last_updated"
fi
exit 0
