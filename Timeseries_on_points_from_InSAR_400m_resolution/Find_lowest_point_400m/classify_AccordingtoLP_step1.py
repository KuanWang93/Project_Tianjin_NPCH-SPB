import os
import pandas as pd
import numpy as np
from scipy.stats import linregress

# Function to calculate linear regression slope
def calculate_slope(x, y):
    slope, intercept, _, _, _ = linregress(x, y)
    return slope

# Directory containing the *.txt files
input_directory = '/project/wang/kuan/new_tianjin/collection_time_series/Archive/datafile/LOWESS_points_ts_400m'

# Create an empty DataFrame to store results
result_df = pd.DataFrame(columns=['File Name', 'Decimal Year', 'Lowest Value', 'Slope Before', 'Slope After'])
low_index_below_50 = pd.DataFrame(columns=['File Name', 'Decimal Year','Lowest Value'])
low_index_above_205 = pd.DataFrame(columns=['File Name', 'Decimal Year','Lowest Value'])

# Loop through each file in the directory
for filename in os.listdir(input_directory):
    if filename.endswith(".txt"):
        file_path = os.path.join(input_directory, filename)
    
        # Read the data from the text file into a DataFrame
        df = pd.read_csv(file_path, sep='\s+', names=['Year', 'Displacement', 'LOWESS'],skipfooter=1, header=None)
       
        # ignore_last_10_rows = df['LOWESS'][:-10] 
        # Find the index of the row with the lowest LOWESS value
        lowest_index = df['LOWESS'][9:-1].idxmin()
        # print (lowest_index)
        # Extract the relevant data
        if pd.notna(lowest_index):
            # Extract the relevant data
            if lowest_index < 17:
                low_index_below_50 = pd.concat([low_index_below_50, pd.DataFrame({'File Name': [filename], 'Decimal Year': [df.loc[lowest_index, 'Year']],'Lowest Value': [df.loc[lowest_index, 'LOWESS']]} )], ignore_index=True)
            elif lowest_index >= 205:
                low_index_above_205 = pd.concat([low_index_above_205, pd.DataFrame({'File Name': [filename], 'Decimal Year': [df.loc[lowest_index, 'Year']],'Lowest Value': [df.loc[lowest_index, 'LOWESS']]} )], ignore_index=True)
            else:
                # Extract the relevant data
                lowest_point = df.loc[lowest_index]
                year_lowest = lowest_point['Year']
                lowest_value = lowest_point['LOWESS']

                # Calculate the slopes before and after the lowest point
                filtered_df = df[9:-1]
                before_lowest = filtered_df[filtered_df.index < lowest_index]
                after_lowest = filtered_df[filtered_df.index > lowest_index]
            
                # Calculate the slopes before and after the lowest point
                slope_before = calculate_slope(before_lowest['Year'], before_lowest['LOWESS'])
                slope_after = calculate_slope(after_lowest['Year'], after_lowest['LOWESS'])

                # Append the results to the result DataFrame
                result_df = pd.concat([result_df, pd.DataFrame({'File Name': [filename], 'Decimal Year': [year_lowest], 'Lowest Value': [lowest_value], 'Slope Before': [slope_before], 'Slope After': [slope_after]} )], ignore_index=True)

# Save the results to a CSV file
low_index_below_50.to_csv('uplifting_points.txt', index=False, sep=" ")
low_index_above_205.to_csv('subsiding_points.txt', index=False, sep=" ")
result_df.to_csv('turning_points.txt', index=False, sep=" ")

