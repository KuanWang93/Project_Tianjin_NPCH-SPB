#!/bin/bash
gmt gmtset MAP_FRAME_TYPE plain
gmt gmtset PS_MEDIA A3
gmt gmtset FONT_LABEL 6p
gmt gmtset FONT_TITLE 6p
gmt gmtset FONT_ANNOT_PRIMARY 4p
gmt gmtset MAP_FRAME_PEN 0.25p
gmt gmtset MAP_TICK_PEN 0.25p
gmt gmtset MAP_TICK_LENGTH -0.1
gmt gmtset MAP_GRID_PEN_PRIMARY=0.25P,gray,-
gmt gmtset LABEL_OFFSET 0.05i

source_dir="/project/wang/kuan/new_tianjin/collection_time_series/Archive/datafile/point_ts_LOWESS_1.2km_file"

for file in "${source_dir}"/LOWESS_point_*.txt; do
  # Extract the well number from the file name
    point_number=$(echo "$file" | sed -n 's/.*LOWESS_point_\([0-9]*\)\.txt/\1/p')
    # echo $point_number
  # Define the output file name for the plot
    PS=Point_${point_number}_plot.ps
    ####InSAR
    InSAR_input=/project/wang/kuan/new_tianjin/collection_time_series/Archive/datafile/point_ts_LOWESS_1.2km_file/LOWESS_point_${point_number}.txt
    result_file="/project/wang/kuan/new_tianjin/collection_time_series/Archive/datafile/point_classify_file/Result.txt"

    ###################################################################################InSAR Data################################################################################
    # min_InSAR=$(awk 'NR == 1 || $2 < min {min = $2} END {print min-50}' $InSAR_input)
    # max_InSAR=$(awk 'NR == 1 || $2 > max {max = $2} END {print max+50}' $InSAR_input)
    
    J=-JX2.5i/1.5i
    R=-R2014.5/2023.5/-300/50

    gmt psbasemap $J $R -K -Bxa1g1+l"Decimal Year" -Bya50f10g50+l"Land Subsidence (mm)" -BWS -P -X1.5i -Yc > $PS
    gmt psbasemap -R -J -K -O -Ben -B0 >>$PS

    awk '{print $1,$2}' $InSAR_input | gmt psxy -R -J -K -O -Sc0.08 -Gblack >>$PS
    awk '{print $1,$3}' $InSAR_input | gmt psxy -R -J -K -O -W0.35p,red  >>$PS

    awk '{if (($1<=2019.5)&&($1>=2016)) print $1,$2}' $InSAR_input > tmp
    gmt regress tmp -Fxymc -C99 > zzz
    slope1=`gmt regress tmp -Fp -o5`
    formatted_slope1=$(printf "%.5f" $slope1)
    echo 2017 -300	"Subsidence Rate 2016.0-2019.5 = $formatted_slope1 mm/yr" |gmt pstext  -J -R -K -O -F+f4p -D0/0.6c >> $PS
   
    awk '{print $1,$3}' zzz >tmp
    gmt psxy -R -J -K -O tmp -W0.9p,blue,- >>$PS

    awk '{if (($1>=2020)&&($1<=2023.5)) print $1,$2}' $InSAR_input > tmp
    gmt regress tmp -Fxymc -C99 > zzz
    slope2=`gmt regress tmp -Fp -o5`
    formatted_slope2=$(printf "%.5f" $slope2)
    echo 2017 -300	"Subsidence Rate 2020.0-2023.5 = $formatted_slope2 mm/yr" |gmt pstext  -J -R -K -O -F+f4p -D0/0.3c >> $PS

    awk '{print $1,$3}' zzz >tmp
    gmt psxy -R -J -K -O tmp -W0.9p,blue,- >>$PS

    value5=$(awk -v point="Point_$point_number.txt" '$1 == point { print $5 }' $result_file)
    value6=$(awk -v point="Point_$point_number.txt" '$1 == point { print $6 }' $result_file)

    if [ "$value6" != "None" ]; then
    echo "$value5 $value6" | gmt psxy -R -J -O -K -Sa0.2 -W0.01p,red -Gyellow >>$PS
    fi

    ######################################################################################Title####################################################################################
    echo "2019 50 Point_${point_number}" | gmt pstext -J -R -F+f8p,black -D0/0.3c -N -O >>$PS

    gmt psconvert -A0.2c -E600 $PS
done

rm *tmp *zzz *.ps gmt.*
