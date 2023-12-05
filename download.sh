#!/bin/bash

# Check if ffmpeg is installed
if ! command -v ffmpeg &> /dev/null; then
    echo "ffmpeg is not installed. Please install it before running this script."
    exit 1
fi

# EDIT THE PATH TO YOUR INPUT FILE!
input_file="/path/to/your/urls.txt"

# Check if the input file exists
if [ ! -f "$input_file" ]; then
    echo "Input file not found: $input_file"
    exit 1
fi

# Function to extract the desired portion of the URL for the output file name
extract_output_name() {
    url=$1
    output_name=$(echo "$url" | sed 's|.*/\(.*\)/.*|\1|'  | sed 's/COMB//')
    echo "$output_name"
}

# Loop through each URL in the file and download the video
while IFS= read -r url || [ -n "$url" ]; do
    output_name=$(extract_output_name "$url")

    ffmpeg -nostdin -i "$url" -c copy $output_name
done < "$input_file"

echo "All downloads completed."
