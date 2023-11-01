#!/bin/bash
gmt gmtset MAP_FRAME_TYPE plain
gmt gmtset PS_MEDIA A3
gmt gmtset MAP_LABEL_OFFSET 1.5p
gmt gmtset MAP_ANNOT_OFFSET_PRIMARY 1.5p
gmt gmtset FONT_LABEL 6p
gmt gmtset FONT_TITLE 4p
gmt gmtset FONT_ANNOT_PRIMARY 4p
gmt gmtset MAP_TICK_LENGTH -0.1
gmt gmtset MAP_GRID_PEN_PRIMARY=0.25P,gray,-

source_dir="/project/wang/kuan/new_tianjin/collection_time_series/plot_InSAR_GW_v2/Groundwater_timeseries/"

for file in "${source_dir}"/Well_*_GW.txt; do
  # Extract the well number from the file name
  well_number=$(basename "$file" | sed 's/[^0-9]//g')
  # echo $well_number
  # Define the output file name for the plot
  PS=./Well_${well_number}_plot.ps
  ####InSAR
  InSAR_input=/project/wang/kuan/new_tianjin/collection_time_series/plot_InSAR_GW_v2/InSAR_timeseries/Well_${well_number}_ts.txt
  InSAR_LOWESS_input=/project/wang/kuan/new_tianjin/collection_time_series/plot_InSAR_GW_v2/InSAR_timeseries_LOWESS/LOWESS_Well_${well_number}_ts.txt
  ####Goundwater
  GW_input=/project/wang/kuan/new_tianjin/collection_time_series/plot_InSAR_GW_v2/Groundwater_timeseries/Well_${well_number}_GW.txt
  GW_LOWESS_input=/project/wang/kuan/new_tianjin/collection_time_series/plot_InSAR_GW_v2/Groundwater_timeseries_LOWESS/LOWESS_Well_${well_number}_GW.txt
  ###################################################################################InSAR Data################################################################################
  gmt gmtset MAP_FRAME_PEN 0.25p,TAN4
  gmt gmtset MAP_TICK_PEN 0.25p,TAN4
  gmt gmtset FONT_LABEL 6p,TAN4
  gmt gmtset FONT_ANNOT_PRIMARY 4p,TAN4
  min_InSAR=$(awk 'NR == 1 || $2 < min {min = $2} END {print min-50}' $InSAR_input)
  max_InSAR=$(awk 'NR == 1 || $2 > max {max = $2} END {print max+50}' $InSAR_input)

  J=-JX2.5i/1.5i
  R=-R2014.5/2023.5/$min_InSAR/$max_InSAR

  gmt psbasemap $J $R -K -Bxa2f1 -Bya100f20+l"Land Subsidence (mm)" -BW -P -X5i -Y4c >$PS

  gmt psxy -R -J -K -O $InSAR_input -Sc0.04 -GTAN4 >>$PS
  awk '{print $1,$3}' $InSAR_LOWESS_input | gmt psxy -R -J -K -O -W0.2p,TAN4 >>$PS

  ##############################################################################Groundwater Data################################################################################
  gmt gmtset MAP_FRAME_PEN 0.25p,deepskyblue
  gmt gmtset MAP_TICK_PEN 0.25p,deepskyblue
  gmt gmtset FONT_LABEL 6p,deepskyblue
  gmt gmtset FONT_ANNOT_PRIMARY 4p,deepskyblue
  min_GW=$(awk 'NR == 1 || $2 < min {min = $2} END {print min-2}' $GW_input)
  max_GW=$(awk 'NR == 1 || $2 > max {max = $2} END {print max+2}' $GW_input)
    
  J2=-JX2.5i/1.5i
  R2=-R2014.5/2023.5/$min_GW/$max_GW
  gmt psbasemap $J2 $R2 -K -O -Bxa2f1 -Bya5f1+l"Groundwater Level (m, BLS)" -BE -P -X0i -Y0c >> $PS

  gmt psxy -R -J -K -O $GW_input -St0.08 -Gdeepskyblue >>$PS
  awk '{print $1,$3}' $GW_LOWESS_input | gmt psxy -R -J -K -O -W0.2p,deepskyblue >>$PS

  gmt gmtset MAP_FRAME_PEN 0.25p,black
  gmt gmtset MAP_TICK_PEN 0.25p,black
  gmt gmtset FONT_ANNOT_PRIMARY 4p,black
  gmt psbasemap -R -J -K -O -Bxa2f1 -BSn -B0 >>$PS

  ###################################################################################Title#######################################################################################
  echo "Well #${well_number}" | gmt pstext -J -R -F+f5p,black+cTR -D-0.3c/-0.2c -N -O >> $PS


  gmt psconvert -A0.2c -E600 $PS
done

rm *.ps  gmt.*

