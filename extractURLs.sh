#!/bin/bash

input_file="/path/to/your/html.txt"
output_file="/path/to/your/urls.txt"

# Use awk to extract URLs after "HLSUrl":
awk -F'HLSUrl":' '{for (i=2; i<=NF; i++) print $i}' "$input_file" | awk -F'"' '{print $2}' | sort -u > "$output_file"

echo "Extracted URLs saved to $output_file"
