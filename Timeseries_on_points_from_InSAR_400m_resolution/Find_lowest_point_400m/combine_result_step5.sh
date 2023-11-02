# Create temporary files for the concatenated data
cat Result_From_UP.txt > temp_merged.csv
tail -n +2 Result_From_TP.txt >> temp_merged.csv
tail -n +2 Result_From_SP.txt >> temp_merged.csv

# Keep the header from the first file
head -n 1 Result_From_UP.txt > Result.txt

# Sort the concatenated data by the first column and append it to the merged file
tail -n +2 temp_merged.csv | sort -t, -k1 >> Result.txt

# Clean up temporary files
rm temp_merged.csv