import os
import pandas as pd
import numpy as np
from scipy.stats import linregress
from sklearn.linear_model import LinearRegression

# Define the directory where your data files are located
target_point_list_dir = "/project/wang/kuan/new_tianjin/collection_time_series/Find_lowest_point_400m"
data_dir = "/project/wang/kuan/new_tianjin/collection_time_series/Archive/datafile/LOWESS_points_ts_400m"

# Define the output file name
output_file = "Result_From_TP.txt"

# Read the list of files to process from "uplifting_points.txt" using pandas
turning_points_df = pd.read_csv(os.path.join(target_point_list_dir, "turning_points.txt"), sep='\s+')

# Initialize an empty DataFrame to store the output data
output_df = pd.DataFrame(columns=["Point", "Latitude", "Longitude", "Category", "PCH_time", "Displacement"])

# Iterate through the list of files
for index, row in turning_points_df.iterrows():
    filename = row.iloc[0]  # Assuming the 'File Name' column is the first column (index 0)
    file_path = os.path.join(data_dir, filename)

    # Initialize variables to store "Decimal Year" and "Lowest Value"
    decimal_year = row["Decimal Year"]
    lowest_value = row["Lowest Value"]

    # Check if the file exists
    if os.path.exists(file_path):
        # Read the data from the current file using pandas
        data_df = pd.read_csv(file_path, sep='\s+', header=None, names=["Decimal Year", "Displacement", "LOWESS"], skipfooter=1, engine='python')

        # Extract latitude and longitude from "select_points.txt" using pandas
        point_index = int(filename.split("_")[2].split(".")[0])  # Assuming the file format is "LOWESS_point_X.txt"
        select_points_df = pd.read_csv(os.path.join(target_point_list_dir, "selected_points.txt"), sep='\s+', header=None, names=["Latitude", "Longitude"])
        lat_lon = select_points_df.loc[point_index - 1]

        # Extract data points between 2016 and 2023.6
        data_df = data_df[(data_df["Decimal Year"] >= 2016)]
        data_2016_2019 = data_df[(data_df["Decimal Year"] >= 2016) & (data_df["Decimal Year"] <= 2019.9)]
        data_2020_2023 = data_df[(data_df["Decimal Year"] >= 2020)]

        if not data_df.empty:
            x_values = data_df["Decimal Year"].tolist()
            y_values = data_df["LOWESS"].tolist()
            slope, _, _, _, _ = linregress(x_values, y_values)

        if not data_2016_2019.empty:
            x_values = data_2016_2019["Decimal Year"].tolist()
            y_values = data_2016_2019["LOWESS"].tolist()
            slope_2016_2019, _, _, _, _ = linregress(x_values, y_values)

        if not data_2020_2023.empty:
            x_values = data_2020_2023["Decimal Year"].tolist()
            y_values = data_2020_2023["LOWESS"].tolist()
            slope_2020_2023, _, _, _, _ = linregress(x_values, y_values)
            
            # Determine category and PCH time based on slope
            if slope_2020_2023 < -10:
                category = "C4"
                pch_time = "9999"
                displacement = "None"        

            elif -10 <= slope_2020_2023 < -5:
                category = "C3"
                pch_time = "2025.5"
                displacement = "None"

            elif -5 <= slope_2020_2023 <= 0 :
                if slope_2016_2019 < -5:
                    category = "C1"
                else:
                    category = "C2"
                pch_time = "2022.5"
                displacement = "None"

            elif slope_2020_2023 > 0 :
                if slope_2016_2019 < -5:
                    category = "C1"
                else:
                    category = "C2"
                pch_time = decimal_year
                displacement = lowest_value

            # Append data to the output DataFrame
            output_df = output_df.append({"Point": "Point_" + filename.split("_")[2],
                                          "Latitude": lat_lon["Latitude"],
                                          "Longitude": lat_lon["Longitude"],
                                          "Category": category,
                                          "PCH_time": pch_time,
                                          "Displacement": displacement}, ignore_index=True)

# Write the output DataFrame to a new text file using pandas
output_df.to_csv(os.path.join(target_point_list_dir, output_file), sep='\t', index=False)

print("Data processing complete.")
