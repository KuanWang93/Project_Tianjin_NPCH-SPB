Fig1(a).sh is used to draw the map, all files needed are included in the folder except gebco.nc and i_dem1.nc because they are too large to be uploaded.
gebco.nc and i_dem1.nc are used to draw the background DEM and color, if you don't want to use the background, just ignore them.
gebco.nc is downloaded from: www.gebco.net. It is the DEM and the area can be selected when downloading
i_dem.nc can be generated using command: grdgradient gebco_2022.nc -A35 -Gi_dem.nc -Ne0.6 -V
