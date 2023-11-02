Fig1(a).sh is the script used to draw the figure. All the files needed are included in the folder except gebco.nc and i_dem.nc.
this two files are used to draw the background color of DEM. I cannot upload because they are too big, you can download gebco_2022.nc from www.gebco.net if you want to use this background.
i_dem.nc can be generated using command: grdgradient gebco_2022.nc -A35 -Gi_dem.nc -Ne0.6 -V
