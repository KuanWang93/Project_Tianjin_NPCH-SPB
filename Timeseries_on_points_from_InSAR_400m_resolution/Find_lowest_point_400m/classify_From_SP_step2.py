import os
import pandas as pd
import numpy as np
from scipy.stats import linregress
from sklearn.linear_model import LinearRegression

# Define the directory where your data files are located
target_point_list_dir = "/project/wang/kuan/new_tianjin/collection_time_series/Find_lowest_point_400m"
data_dir = "/project/wang/kuan/new_tianjin/collection_time_series/Archive/datafile/LOWESS_points_ts_400m"

# Define the output file name
output_file = "Result_From_SP.txt"

# Read the list of files to process from "uplifting_points.txt" using pandas
subsiding_points_df = pd.read_csv(os.path.join(target_point_list_dir, "subsiding_points.txt"), sep='\s+')

# Initialize an empty DataFrame to store the output data
output_df = pd.DataFrame(columns=["Point", "Latitude", "Longitude", "Category", "PCH_time", "Displacement"])

# Iterate through the list of files
for index, row in subsiding_points_df.iterrows():
    filename = row.iloc[0]  # Assuming the 'File Name' column is the first column (index 0)
    file_path = os.path.join(data_dir, filename)

    # Initialize variables to store "Decimal Year" and "Lowest Value"
    # decimal_year = row["Decimal Year"]
    # lowest_value = row["Lowest Value"]

    # Check if the file exists
    if os.path.exists(file_path):
        # Read the data from the current file using pandas
        data_df = pd.read_csv(file_path, sep='\s+', header=None, names=["Decimal Year", "Displacement", "LOWESS"],skipfooter=1, engine='python')

        # Extract latitude and longitude from "select_points.txt" using pandas
        point_index = int(filename.split("_")[2].split(".")[0])  # Assuming the file format is "LOWESS_point_X.txt"
        select_points_df = pd.read_csv(os.path.join(target_point_list_dir, "selected_points.txt"), sep='\s+', header=None, names=["Latitude", "Longitude"])
        lat_lon = select_points_df.loc[point_index - 1]

        # Extract data points between 2016 and 2023.6
        data_df = data_df[(data_df["Decimal Year"] >= 2016)]
        data_2016_2019 = data_df[(data_df["Decimal Year"] >= 2016) & (data_df["Decimal Year"] <= 2019.9)]
        data_2020_2023 = data_df[(data_df["Decimal Year"] >= 2020) ]

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

            # Initialize variables to keep track of the smallest slope_diff and related_point
            smallest_slope_diff = None
            related_point = None

            # Determine category and PCH time based on slope
            if slope_2020_2023 < -10:
                category = "C4"
                pch_time = "9999"
                displacement = "None"
            elif -10 <= slope_2020_2023 < -5:
                category = "C3"
                pch_time = "2025.5"
                displacement = "None"
            elif -5 <= slope_2020_2023 <= 0:
                if slope_2016_2019 < -5:
                    category = "C1"
                else:
                    category = "C2"
                pch_time = "2022.5"
                displacement = "None"
            elif slope_2020_2023 > 0:
                if slope_2016_2019 < -5:
                    category = "C1"
                else:
                    category = "C2"    
                window_size = 5  # You can adjust this window size as needed
                #Find turn point
                for i in range(len(data_df)):
                    year = data_df.iloc[i]["Decimal Year"]

                    if 2018 <= year <= 2022.8:
                    # Calculate the index range for the window before and after the current point
                        start_index = max(0, i - window_size)
                        end_index = min(len(data_df), i + window_size + 1)

                        if start_index < end_index:  # Ensure valid indices
                            # Create linear regression models for before and after points
                            model_before = LinearRegression()
                            model_before.fit(data_df["Decimal Year"][start_index:i].values.reshape(-1, 1), data_df["LOWESS"][start_index:i].values)

                            model_after = LinearRegression()
                            model_after.fit(data_df["Decimal Year"][i+1:end_index].values.reshape(-1, 1), data_df["LOWESS"][i+1:end_index].values)

                            # Calculate the slopes using the coefficients of the linear models
                            slope_before = model_before.coef_[0]
                            slope_after = model_after.coef_[0]

                            # Calculate the slope_diff
                            slope_diff = slope_before - slope_after

                            # Update the smallest_slope_diff and related_point if necessary
                            if smallest_slope_diff is None or slope_diff < smallest_slope_diff:
                                smallest_slope_diff = slope_diff
                                related_point = (year, data_df.iloc[i]["LOWESS"])
                # print(f"The smallest slope_diff is {smallest_slope_diff} at Decimal year {related_point[0]} with displacement {related_point[1]}")

                pch_time = related_point[0] if related_point is not None else None
                displacement = related_point[1] if related_point is not None else None

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
