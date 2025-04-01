mkdir -p processed_data  # Ensure the processed_data directory exists

for folder in cmip6_data/*/; do  # Loop through all subdirectories
    foldername=$(basename "$folder")  # Extract the folder name
    mkdir -p "processed_data/$foldername"  # Create corresponding output folder

    for file in "$folder"/*.nc; do  # Loop through NetCDF files in the subfolder
        filename=$(basename "$file")  # Extract filename
        output="processed_data/$foldername/${filename%.nc}_ymean.nc"  # Define output filename
        cdo yearmean "$file" "$output"  # Apply the cdo command
        echo "Processed: $file -> $output"
    done
done
