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

####Station
CH01=/project/wang/kuan/new_tianjin/collection_time_series/GPS/GPS_after_clean/CH01.txt
CH02=/project/wang/kuan/new_tianjin/collection_time_series/GPS/GPS_after_clean/CH02.txt
DZ01=/project/wang/kuan/new_tianjin/collection_time_series/GPS/GPS_after_clean/DZ01.txt
GGSL=/project/wang/kuan/new_tianjin/collection_time_series/GPS/GPS_after_clean/GGSL.txt
HGBD=/project/wang/kuan/new_tianjin/collection_time_series/GPS/GPS_after_clean/HBGD.txt
HECX=/project/wang/kuan/new_tianjin/collection_time_series/GPS/GPS_after_clean/HECX.txt
JHAI=/project/wang/kuan/new_tianjin/collection_time_series/GPS/GPS_after_clean/JHAI.txt
KC01=/project/wang/kuan/new_tianjin/collection_time_series/GPS/GPS_after_clean/KC01.txt
KC02=/project/wang/kuan/new_tianjin/collection_time_series/GPS/GPS_after_clean/KC02.txt
NIHE=/project/wang/kuan/new_tianjin/collection_time_series/GPS/GPS_after_clean/NIHE.txt
PANZ=/project/wang/kuan/new_tianjin/collection_time_series/GPS/GPS_after_clean/PANZ.txt
QING=/project/wang/kuan/new_tianjin/collection_time_series/GPS/GPS_after_clean/QING.txt
SW01=/project/wang/kuan/new_tianjin/collection_time_series/GPS/GPS_after_clean/SW01.txt
TJA1=/project/wang/kuan/new_tianjin/collection_time_series/GPS/GPS_after_clean/TJA1.txt
TJBH=/project/wang/kuan/new_tianjin/collection_time_series/GPS/GPS_after_clean/TJBH.txt
TJCJ=/project/wang/kuan/new_tianjin/collection_time_series/GPS/GPS_after_clean/TJCJ.txt
TJJN=/project/wang/kuan/new_tianjin/collection_time_series/GPS/GPS_after_clean/TJJN.txt
TJWQ=/project/wang/kuan/new_tianjin/collection_time_series/GPS/GPS_after_clean/TJWQ.txt
XQYY=/project/wang/kuan/new_tianjin/collection_time_series/GPS/GPS_after_clean/XQYY.txt
XUZZ=/project/wang/kuan/new_tianjin/collection_time_series/GPS/GPS_after_clean/XUZZ.txt
YC01=/project/wang/kuan/new_tianjin/collection_time_series/GPS/GPS_after_clean/YC01.txt

###ascending 40m
CH0140=/project/wang/kuan/new_tianjin/collection_time_series/40m/CH01_ts.txt
CH0240=/project/wang/kuan/new_tianjin/collection_time_series/40m/CH02_ts.txt
DZ0140=/project/wang/kuan/new_tianjin/collection_time_series/40m/DZ01_ts.txt
GGSL40=/project/wang/kuan/new_tianjin/collection_time_series/40m/GGSL_ts.txt
HGBD40=/project/wang/kuan/new_tianjin/collection_time_series/40m/HBGD_ts.txt
HECX40=/project/wang/kuan/new_tianjin/collection_time_series/40m/HECX_ts.txt
JHAI40=/project/wang/kuan/new_tianjin/collection_time_series/40m/JHAI_ts.txt
KC0140=/project/wang/kuan/new_tianjin/collection_time_series/40m/KC01_ts.txt
KC0240=/project/wang/kuan/new_tianjin/collection_time_series/40m/KC02_ts.txt
NIHE40=/project/wang/kuan/new_tianjin/collection_time_series/40m/NIHE_ts.txt
PANZ40=/project/wang/kuan/new_tianjin/collection_time_series/40m/PANZ2_ts.txt
QING40=/project/wang/kuan/new_tianjin/collection_time_series/40m/QING_ts.txt
SW0140=/project/wang/kuan/new_tianjin/collection_time_series/40m/SW01_ts.txt
TJA140=/project/wang/kuan/new_tianjin/collection_time_series/40m/TJA1_ts.txt
TJBH40=/project/wang/kuan/new_tianjin/collection_time_series/40m/TJBH_ts.txt
TJCJ40=/project/wang/kuan/new_tianjin/collection_time_series/40m/TJCJ_ts.txt
TJJN40=/project/wang/kuan/new_tianjin/collection_time_series/40m/TJJN_ts.txt
TJWQ40=/project/wang/kuan/new_tianjin/collection_time_series/40m/TJWQ_ts.txt
XQYY40=/project/wang/kuan/new_tianjin/collection_time_series/40m/XQYY_ts.txt
XUZZ40=/project/wang/kuan/new_tianjin/collection_time_series/40m/XUZZ_ts.txt
YC0140=/project/wang/kuan/new_tianjin/collection_time_series/40m/YC01_ts.txt

###ascending 400m
CH01400=/project/wang/kuan/new_tianjin/collection_time_series/400m/CH01_ts.txt
CH02400=/project/wang/kuan/new_tianjin/collection_time_series/400m/CH02_ts.txt
DZ01400=/project/wang/kuan/new_tianjin/collection_time_series/400m/DZ01_ts.txt
GGSL400=/project/wang/kuan/new_tianjin/collection_time_series/400m/GGSL_ts.txt
HGBD400=/project/wang/kuan/new_tianjin/collection_time_series/400m/HBGD_ts.txt
HECX400=/project/wang/kuan/new_tianjin/collection_time_series/400m/HECX_ts.txt
JHAI400=/project/wang/kuan/new_tianjin/collection_time_series/400m/JHAI_ts.txt
KC01400=/project/wang/kuan/new_tianjin/collection_time_series/400m/KC01_ts.txt
KC02400=/project/wang/kuan/new_tianjin/collection_time_series/400m/KC02_ts.txt
NIHE400=/project/wang/kuan/new_tianjin/collection_time_series/400m/NIHE_ts.txt
PANZ400=/project/wang/kuan/new_tianjin/collection_time_series/400m/PANZ2_ts.txt
QING400=/project/wang/kuan/new_tianjin/collection_time_series/400m/QING_ts.txt
SW01400=/project/wang/kuan/new_tianjin/collection_time_series/400m/SW01_ts.txt
TJA1400=/project/wang/kuan/new_tianjin/collection_time_series/400m/TJA1_ts.txt
TJBH400=/project/wang/kuan/new_tianjin/collection_time_series/400m/TJBH_ts.txt
TJCJ400=/project/wang/kuan/new_tianjin/collection_time_series/400m/TJCJ_ts.txt
TJJN400=/project/wang/kuan/new_tianjin/collection_time_series/400m/TJJN_ts.txt
TJWQ400=/project/wang/kuan/new_tianjin/collection_time_series/400m/TJWQ_ts.txt
XQYY400=/project/wang/kuan/new_tianjin/collection_time_series/400m/XQYY_ts.txt
XUZZ400=/project/wang/kuan/new_tianjin/collection_time_series/400m/XUZZ_ts.txt
YC01400=/project/wang/kuan/new_tianjin/collection_time_series/400m/YC01_ts.txt
###ascending 1200m
CH011200=/project/wang/kuan/new_tianjin/collection_time_series/1200m/CH01_ts.txt
CH021200=/project/wang/kuan/new_tianjin/collection_time_series/1200m/CH02_ts.txt
DZ011200=/project/wang/kuan/new_tianjin/collection_time_series/1200m/DZ01_ts.txt
GGSL1200=/project/wang/kuan/new_tianjin/collection_time_series/1200m/GGSL_ts.txt
HGBD1200=/project/wang/kuan/new_tianjin/collection_time_series/1200m/HBGD_ts.txt
HECX1200=/project/wang/kuan/new_tianjin/collection_time_series/1200m/HECX_ts.txt
JHAI1200=/project/wang/kuan/new_tianjin/collection_time_series/1200m/JHAI_ts.txt
KC011200=/project/wang/kuan/new_tianjin/collection_time_series/1200m/KC01_ts.txt
KC021200=/project/wang/kuan/new_tianjin/collection_time_series/1200m/KC02_ts.txt
NIHE1200=/project/wang/kuan/new_tianjin/collection_time_series/1200m/NIHE_ts.txt
PANZ1200=/project/wang/kuan/new_tianjin/collection_time_series/1200m/PANZ2_ts.txt
QING1200=/project/wang/kuan/new_tianjin/collection_time_series/1200m/QING_ts.txt
SW011200=/project/wang/kuan/new_tianjin/collection_time_series/1200m/SW01_ts.txt
TJA11200=/project/wang/kuan/new_tianjin/collection_time_series/1200m/TJA1_ts.txt
TJBH1200=/project/wang/kuan/new_tianjin/collection_time_series/1200m/TJBH_ts.txt
TJCJ1200=/project/wang/kuan/new_tianjin/collection_time_series/1200m/TJCJ_ts.txt
TJJN1200=/project/wang/kuan/new_tianjin/collection_time_series/1200m/TJJN_ts.txt
TJWQ1200=/project/wang/kuan/new_tianjin/collection_time_series/1200m/TJWQ_ts.txt
XQYY1200=/project/wang/kuan/new_tianjin/collection_time_series/1200m/XQYY_ts.txt
XUZZ1200=/project/wang/kuan/new_tianjin/collection_time_series/1200m/XUZZ_ts.txt
YC011200=/project/wang/kuan/new_tianjin/collection_time_series/1200m/YC01_ts.txt

###ascending 5000m
CH015000=/project/wang/kuan/new_tianjin/collection_time_series/5000m/CH01_ts.txt
CH025000=/project/wang/kuan/new_tianjin/collection_time_series/5000m/CH02_ts.txt
DZ015000=/project/wang/kuan/new_tianjin/collection_time_series/5000m/DZ01_ts.txt
GGSL5000=/project/wang/kuan/new_tianjin/collection_time_series/5000m/GGSL_ts.txt
HGBD5000=/project/wang/kuan/new_tianjin/collection_time_series/5000m/HBGD_ts.txt
HECX5000=/project/wang/kuan/new_tianjin/collection_time_series/5000m/HECX_ts.txt
JHAI5000=/project/wang/kuan/new_tianjin/collection_time_series/5000m/JHAI_ts.txt
KC015000=/project/wang/kuan/new_tianjin/collection_time_series/5000m/KC01_ts.txt
KC025000=/project/wang/kuan/new_tianjin/collection_time_series/5000m/KC02_ts.txt
NIHE5000=/project/wang/kuan/new_tianjin/collection_time_series/5000m/NIHE_ts.txt
PANZ5000=/project/wang/kuan/new_tianjin/collection_time_series/5000m/PANZ2_ts.txt
QING5000=/project/wang/kuan/new_tianjin/collection_time_series/5000m/QING_ts.txt
SW015000=/project/wang/kuan/new_tianjin/collection_time_series/5000m/SW01_ts.txt
TJA15000=/project/wang/kuan/new_tianjin/collection_time_series/5000m/TJA1_ts.txt
TJBH5000=/project/wang/kuan/new_tianjin/collection_time_series/5000m/TJBH_ts.txt
TJCJ5000=/project/wang/kuan/new_tianjin/collection_time_series/5000m/TJCJ_ts.txt
TJJN5000=/project/wang/kuan/new_tianjin/collection_time_series/5000m/TJJN_ts.txt
TJWQ5000=/project/wang/kuan/new_tianjin/collection_time_series/5000m/TJWQ_ts.txt
XQYY5000=/project/wang/kuan/new_tianjin/collection_time_series/5000m/XQYY_ts.txt
XUZZ5000=/project/wang/kuan/new_tianjin/collection_time_series/5000m/XUZZ_ts.txt
YC015000=/project/wang/kuan/new_tianjin/collection_time_series/5000m/YC01_ts.txt


# source_dir="/project/xhu/xiao/new_tianjin/collection_time_series/GPS/GPS_after_clean"

# for file in "${source_dir}"/*.txt; do
#   # Extract the well number from the file name
#   station_name=$(basename "$file" | sed 's/.txt$//')
#   # echo $station_name
#   ####InSAR
#   InSAR_input_40=/project/xhu/xiao/new_tianjin/collection_time_series/40m/${station_name}_ts.txt
#   InSAR_input_400=/project/xhu/xiao/new_tianjin/collection_time_series/400m/${station_name}_ts.txt
#   InSAR_input_1200=/project/xhu/xiao/new_tianjin/collection_time_series/1200m/${station_name}_ts.txt
#   InSAR_input_5000=/project/xhu/xiao/new_tianjin/collection_time_series/5000m/${station_name}_ts.txt
#   # echo $InSAR_input_40
#   ####Goundwater
#   GPS_input=/project/xhu/xiao/new_tianjin/collection_time_series/GPS/GPS_after_clean/${station_name}.txt

# Define the output file name for the plot
PS=GPS_vs_InSAR_ts_p1.ps

# min_GPS=$(awk 'NR == 1 || $2 < min {min = $2} END {print min-10}' $GPS_input)
# max_GPS=$(awk 'NR == 1 || $2 > max {max = $2} END {print max+5}' $GPS_input)
J=-JX2i/1.5i
R=-R2016/2023.8/-13/3

##############################################################################Station KC01##############################################################################
gmt psbasemap $J $R -K -Bpxa2f1 -Bpya5f2.5 -BWs -P -X1.5i -Yc >$PS
gmt psbasemap -R -J -K -O -Ben -B0 >>$PS

awk '{print $1,$2}' $KC01 >tmp
gmt psxy -R -J -K -O tmp -Sc0.03 -Gdarkgray >>$PS
# gmt psxy -R -J -K -O tmp -W0.1p,gray,-  >>$PS

awk '{print $1,($2+35)/10}' $KC0140 >tmp
gmt psxy -R -J -K -O tmp -Sc0.03 -Gblack >>$PS

awk '{print $1,($2+30)/10}' $KC01400 >tmp
gmt psxy -R -J -K -O tmp -Sx0.05 -W0.03p,blue1 >>$PS

awk '{print $1,($2+30)/10}' $KC011200 >tmp
gmt psxy -R -J -K -O tmp -Sc0.03 -Gred >>$PS

awk '{print $1,($2+12)/10}' $KC015000 >tmp
gmt psxy -R -J -K -O tmp -Sc0.03 -Ggreen >>$PS

echo  "KC01"|gmt pstext -R -K -J -F+f5p,4,black+cTR -Dj0.1i/0.1i -Gwhite -O -N>> $PS

##################################################################################Station CH02##############################################################################
gmt psbasemap $J $R -K -Bpxa2f1 -Bpya5f2.5  -Bws -X2.2i -O >>$PS
gmt psbasemap -R -J -K -O -Ben -B0 >>$PS

awk '{print $1,$2}' $CH02 >tmp
gmt psxy -R -J -K -O tmp -Sc0.03 -Gdarkgray >>$PS
# gmt psxy -R -J -K -O tmp -W0.1p,gray,-  >>$PS

awk '{print $1-0.9,($2+20)/10}' $CH0240 >tmp
gmt psxy -R -J -K -O tmp -Sc0.03 -Gblack >>$PS

awk '{print $1-0.9,($2+20)/10}' $CH02400 >tmp
gmt psxy -R -J -K -O tmp -Sx0.05 -W0.03p,blue1 >>$PS

awk '{print $1-0.9,($2+20)/10}' $CH021200 >tmp
gmt psxy -R -J -K -O tmp -Sc0.03 -Gred >>$PS

awk '{print $1-0.9,($2+25)/10}' $CH025000 >tmp
gmt psxy -R -J -K -O tmp -Sc0.03 -Ggreen >>$PS

echo  "CH02"|gmt pstext -R -K -J -F+f5p,4,black+cTR -Dj0.1i/0.1i -Gwhite -O -N>> $PS

##################################################################################Station DZ01##############################################################################
gmt psbasemap $J $R -K -Bpxa2f1 -Bpya5f2.5+l'Vertical displacement (cm)'  -BWS -X-2.2i -Y-1.7i -O >>$PS
gmt psbasemap -R -J -K -O -Ben -B0 >>$PS

awk '{print $1,$2}' $DZ01 >tmp
gmt psxy -R -J -K -O tmp -Sc0.03 -Gdarkgray >>$PS
# gmt psxy -R -J -K -O tmp -W0.1p,gray,-  >>$PS

awk '{print $1,($2+10)/10}' $DZ0140 >tmp
gmt psxy -R -J -K -O tmp -Sc0.03 -Gblack >>$PS

awk '{print $1,($2+10)/10}' $DZ01400 >tmp
gmt psxy -R -J -K -O tmp -Sx0.05 -W0.03p,blue1 >>$PS

awk '{print $1,($2+10)/10}' $DZ011200 >tmp
gmt psxy -R -J -K -O tmp -Sc0.03 -Gred >>$PS

awk '{print $1,($2+25)/10}' $DZ015000 >tmp
gmt psxy -R -J -K -O tmp -Sc0.03 -Ggreen >>$PS

echo  "DZ01"|gmt pstext -R -K -J -F+f5p,4,black+cTR -Dj0.1i/0.1i -Gwhite -O -N>> $PS

##################################################################################Station PANZ##############################################################################
gmt psbasemap $J $R -K -Bpxa2f1 -Bpya5f2.5 -BwS -X2.2i -O >>$PS
gmt psbasemap -R -J -K -O -Ben -B0 >>$PS

awk '{print $1,$2}' $PANZ >tmp
gmt psxy -R -J -K -O tmp -Sc0.03 -Gdarkgray >>$PS
# gmt psxy -R -J -K -O tmp -W0.1p,gray,-  >>$PS

awk '{print $1,($2-15)/10}' $PANZ40 >tmp
gmt psxy -R -J -K -O tmp -Sc0.03 -Gblack >>$PS

awk '{print $1,($2-20)/10}' $PANZ400 >tmp
gmt psxy -R -J -K -O tmp -Sx0.05 -W0.03p,blue1 >>$PS

awk '{print $1,($2-20)/10}' $PANZ1200 >tmp
gmt psxy -R -J -K -O tmp -Sc0.03 -Gred >>$PS

awk '{print $1,($2-20)/10}' $PANZ5000 >tmp
gmt psxy -R -J -K -O tmp -Sc0.03 -Ggreen >>$PS

echo  "PANZ"|gmt pstext -R -K -J -F+f5p,4,black+cTR -Dj0.1i/0.1i -Gwhite -O -N>> $PS

##################################################################################Station TJBH##############################################################################
gmt psbasemap $J $R -K -Bpxa2f1 -Bpya5f2.5  -BWS -X-2.2i -Y-1.7i -O >>$PS
gmt psbasemap -R -J -K -O -Ben -B0 >>$PS

awk '{print $1,$2}' $TJBH >tmp
gmt psxy -R -J -K -O tmp -Sc0.03 -Gdarkgray >>$PS
# gmt psxy -R -J -K -O tmp -W0.1p,gray,-  >>$PS

awk '{print $1,($2+16)/10}' $TJBH40 >tmp
gmt psxy -R -J -K -O tmp -Sc0.03 -Gblack >>$PS

awk '{print $1,($2+16)/10}' $TJBH400 >tmp
gmt psxy -R -J -K -O tmp -Sx0.05 -W0.03p,blue1 >>$PS

awk '{print $1,($2+6)/10}' $TJBH1200 >tmp
gmt psxy -R -J -K -O tmp -Sc0.03 -Gred >>$PS

awk '{print $1,($2+20)/10}' $TJBH5000 >tmp
gmt psxy -R -J -K -O tmp -Sc0.03 -Ggreen >>$PS

echo  "TJBH"|gmt pstext -R -K -J -F+f5p,4,black+cTR -Dj0.1i/0.1i -Gwhite -O -N>> $PS

##################################################################################Station XQYY##############################################################################
gmt psbasemap $J $R -K -Bpxa2f1 -Bpya5f2.5 -BwS -X2.2i -O >>$PS
gmt psbasemap -R -J -K -O -Ben -B0 >>$PS

awk '{print $1,$2}' $XQYY >tmp
gmt psxy -R -J -K -O tmp -Sc0.03 -Gdarkgray >>$PS
# gmt psxy -R -J -K -O tmp -W0.1p,gray,-  >>$PS

awk '{print $1,($2-25)/10}' $XQYY40 >tmp
gmt psxy -R -J -K -O tmp -Sc0.03 -Gblack >>$PS

awk '{print $1,($2-25)/10}' $XQYY400 >tmp
gmt psxy -R -J -K -O tmp -Sx0.05 -W0.03p,blue1 >>$PS

awk '{print $1,($2-20)/10}' $XQYY1200 >tmp
gmt psxy -R -J -K -O tmp -Sc0.03 -Gred >>$PS

awk '{print $1,($2-35)/10}' $XQYY5000 >tmp
gmt psxy -R -J -K -O tmp -Sc0.03 -Ggreen >>$PS

echo  "XQYY"|gmt pstext -R -K -J -F+f5p,4,black+cTR -Dj0.1i/0.1i -Gwhite -O -N>> $PS

##################################################################################Legend##############################################################################
gmt gmtset FONT_ANNOT_PRIMARY 4p
gmt pslegend -R -J -DjTB+w4.2i/0.4i+o-1.1i/-0.6i -F+p0.1p,black -O  -V >> $PS << EOF
G -0.02i
H 6p,Times-Roman Map Legend
G 0.02i
D 0.1i 0.5p
G 0.03i
N 5
V 0 1p
# S 0.1i c 0.025i gray -
# G -0.06i
# S 0.155i - 0.05i - 0.25p,gray
# G -0.062i
S 0.21i c 0.025i darkgray - 0.25i GPS
#G 0.03i
S -0.41 c 0.025i black - -0.12i InSAR (40 x 40 m  grids)
#G 0.03i
S -0.33 x 0.035i blue 0.3p,blue -0.09i InSAR (400 x 400 m  grids)
#G 0.03i
S -0.15 c 0.025i red - -0.02i InSAR (1.2 x 1.2 km  grids)
S 0.01 c 0.025i green - 0.05i InSAR (5 x 5 km  grids)
EOF


gmt psconvert -A0.2c -E1000 -Tf $PS
gmt psconvert -A0.2c -E1000  $PS
# done



rm gmt.conf  gmt.history tmp* 
