mkdir -p processed_data/fldmean_data/
for folder in processed_data/*/; do  # Loop through all subdirectories
    foldername=$(basename "$folder")  # Extract the folder name
    mkdir -p "processed_data/fldmean_data/$foldername"  # Create corresponding output folder

    for file in "$folder"/*.nc; do  # Loop through NetCDF files in the subfolder
        filename=$(basename "$file")  # Extract filename
        output="processed_data/fldmean_data/$foldername/${filename%.nc}_fldmean.nc"  # Define output filename
        cdo fldmean "$file" "$output"  # Apply the cdo command
        echo "Processed: $file -> $output"
    done
done

#for folder in processed_data/*/; do
#    foldername=$(basename "$folder")
#    echo $foldername
#    rm "$folder"/*fldmean.nc
#done