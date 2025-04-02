#!/bin/bash
# This script processes NetCDF files in subdirectories of cmip6_data using CDO to compute the yearly mean.
# It creates a new directory for processed files and saves the output with a modified filename.
# Ensure the processed_data directory exists
mkdir -p processed_data
for folder in cmip6_data/*/; do  # Loop through all subdirectories
    if [ -d "$folder" ] && ls "$folder"/*.nc 1> /dev/null 2>&1; then  # Check if directory exists and contains .nc files
        foldername=$(basename "$folder")  # Extract the folder name
        mkdir -p "processed_data/$foldername"  # Create corresponding output folder

        for file in "$folder"/*.nc; do  # Loop through NetCDF files in the subfolder
            filename=$(basename "$file")  # Extract filename
            output="processed_data/$foldername/${filename%.nc}_ymean.nc"  # Define output filename
            cdo yearmean "$file" "$output"  # Apply the cdo command
        done
    fi
done


#sed -i 's/\r$//' cdo_ymean.sh # if "with CRLF line terminators" convert to "with LF line terminators"