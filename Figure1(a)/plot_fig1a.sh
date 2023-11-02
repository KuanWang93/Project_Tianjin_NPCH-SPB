gmt gmtset PS_MEDIA A2
gmt gmtset MAP_FRAME_TYPE plain
gmt gmtset FONT_ANNOT_PRIMARY Helvetica
gmt gmtset MAP_FRAME_PEN 0.8p
gmt gmtset FONT_LABEL 12p
gmt gmtset FONT_TITLE 12p
gmt gmtset FONT_ANNOT_PRIMARY  12p

#PS=fault.ps
PS=Fig1a.ps

R=-R116.25/118.7/38.35/40.08
J=-JM20c
I=-I0.001

in=/project/wang/kuan/new_tianjin/plot/plot_total_subsidence/get_shp/tianjin_county.shp
out=/project/wang/kuan/new_tianjin/plot/plot_total_subsidence/get_shp/tj_boundary_line.shp

hebei=/project/wang/kuan/new_tianjin/plot/plot_total_subsidence/get_shp/hebei.shp
beijing=/project/wang/kuan/new_tianjin/plot/plot_total_subsidence/get_shp/beijing.shp

coast=/project/wang/kuan/new_tianjin/plot/plot_total_subsidence/get_shp/tj_coastal_line.shp

# awk '{ match($1, /point_([0-9]+)/, arr); if (arr[1]) print $2, $3, "P" arr[1] }' extracted_lines.txt > select_point.txt

# awk '$5 >=2019.0 && $5 <=2020.0 {gsub("oint_", "", $1); gsub(".txt", "", $1); print $1,$2,$3,$4,$5,$6}' Result_1.2km.txt > Point_2019_2020.txt
# awk '$5 > 2020.0 && $5 <=2021.0 {gsub("oint_", "", $1); gsub(".txt", "", $1); print $1,$2,$3,$4,$5,$6}' Result_1.2km.txt > Point_2020_2021.txt
# awk '$5 > 2021.0 && $5 <=2022.0 {gsub("oint_", "", $1); gsub(".txt", "", $1); print $1,$2,$3,$4,$5,$6}' Result_1.2km.txt > Point_2021_2022.txt
# awk '$5 > 2022.0 && $5 <=2023.0 {gsub("oint_", "", $1); gsub(".txt", "", $1); print $1,$2,$3,$4,$5,$6}' Result_1.2km.txt > Point_2022_2023.txt
# awk '$5 == 2025 {gsub("oint_", "", $1); gsub(".txt", "", $1); print $1,$2,$3,$4,$5,$6}' Result_1.2km.txt > Point_projectable.txt
# awk '$5 == 9999 {gsub("oint_", "", $1); gsub(".txt", "", $1); print $1,$2,$3,$4,$5,$6}' Result_1.2km.txt > Point_still_subsidence.txt
# awk '$5 == "None" {gsub("oint_", "", $1); gsub(".txt", "", $1); print $1,$2,$3,$4,$5,$6}' Result_1.2km.txt > Point_uplift.txt
# ###########################################################Base Map######################################################################
gmt psbasemap $R $J  -X21.5c -Bx0.5 -By0.5 -BWS -K  > $PS
gmt psbasemap -R -J -K -O -Ben -B0 >> $PS

gmt makecpt -Cgray -D -M -Z  > test.cpt
gmt grdimage $R $J gebco_2022.nc  -Ii_dem1.nc -Ctest.cpt -O -K >> $PS

# gmt pscoast -R -J -B30g30 -Df -W0.5p -S176/226/255 -K -O >> $PS

###############################################################Boundaries########################################################################
# gmt psxy -R -J $beijing -W0.8p,black,solid -O -K >> $PS
# gmt psxy -R -J $hebei -W0.8p,black,solid -O -K >> $PS

gmt psclip new_polygon.gmt -R -J -K -O >> $PS
gmt grdimage lr_velocity_2016.0_2019.5.grd -R -J -Cmy4.cpt -Q -K -O >> $PS
gmt psclip -C -K -O >> $PS

gmt psxy -R -J $coast -W0.8p,black,solid -G176/226/255 -O -K >> $PS


gmt psxy -R -J $in  -W1p,blue,- -O  -K >> $PS
gmt psxy -R -J $out -W0.8p,black,solid -O -K >> $PS

###########################################################Path:69 and Frame################################################################
echo 118.12 39.75 "P69 (Ascending)"|gmt pstext -R -K -J -F+f13p,1,255/128/128+a10 -O -N>> $PS
gmt psxy  -R -J new_polygon.gmt -W1.2p,255/128/128 -O -K >> $PS

#################################################################Wells##########################################################################
awk '{print $1,$2}' GPSstationlist | gmt psxy -R -J -K -O -St0.3  -Gblue >> $PS
awk '{print $1,$2,$3}' GPSstationlist | gmt pstext -R -J -K -O -F+f8p,5,black+jBC -D0/0.2 >> $PS

awk '{print $1,$2}' GPSstationlist2 | gmt psxy -R -J -K -O -St0.3  -Gblue >> $PS
awk '{print $1,$2,$3}' GPSstationlist2 | gmt pstext -R -J -K -O -F+f8p,5,black+jTC -D0/-0.2 >> $PS

echo 117.88 39.56 | gmt psxy -R -J -K -O -St0.3  -Gblue >> $PS
echo 117.88 39.56 CH02 | gmt pstext -R -J -K -O -F+f8p,5,black+jBC -D-0.50/-0.05 >> $PS

echo 117.75 39.00  | gmt psxy -R -J -K -O -St0.3  -Gblue >> $PS
echo 117.75 39.00  KC01 | gmt pstext -R -J -K -O -F+f8p,5,black+jBC -D-0.20/0.2 >> $PS

echo 116.88 38.70  | gmt psxy -R -J -K -O -St0.3  -Gblue >> $PS
echo 116.88 38.70  SW01 | gmt pstext -R -J -K -O -F+f8p,5,black+jBC -D0.10/0.2 >> $PS
##############################################################County names#######################################################################
gmt pstext -R -J -Xa-0.75c -Ya-0.2c -F+f10p,1 -N  -O -K   << EOF   >> $PS
-242.53952   39.90604  JX
-242.45088   39.55750   BD
-242.85702   39.461   WQ
-242.26088   39.35   NH
-242.90085   38.87374   JH
117.24   39.05   XQ
-242.67085   39.29374   BC
117.51   39.16   DL
-242.51085   38.97374   JN
EOF

gmt pstext -R -J -Xa-0.75c -Ya-0.5c -F+f10p,1  -N  -O -K   << EOF   >> $PS
-242.55   38.75374   DG
-242.26   39.09   TG
-242.04088   39.31   HG
EOF

gmt pstext -R -J -Xa-0.75c -Ya-0.5c -F+f10p,1 -N  -O -K   << EOF   >> $PS
117.27   39.17  CT
EOF

gmt pstext -R -J -Xa-0.75c -Ya-0.2c -F+f13p,1 -N  -O -K   << EOF   >> $PS
116.95 38.55 Cangzhou
116.75 39.28 Langfang
118.3 39.55 Tangshan
EOF

gmt pstext -R -J -K -O -F+f15p,1   << EOF   >> $PS
118.2 38.78 Bohai Bay
EOF
###############################################################Title & Info########################################################################
gmt gmtset FONT_LABEL 12p
###################################################################################################################################################
gmt pslegend -R -J -DjTL+w19.2c/0.55c+o0.12i/0.17i -F+gwhite@40+r -K -O >> $PS<< EOF
S 0.1i s 0.0000001 - 0.0p,- 0i
EOF
echo  "(a) InSAR-Derived 3.5-Year Land Surface Elevation Change Rate: 2016.0-2019.5"|gmt pstext -R -K -J -F+f12p,1,black+cTC -Dj0.2i/0.22i -O -N>> $PS
echo  "Pixel size: 1.2-by-1.2 km"|gmt pstext -R -K -J -F+f11p,1,black+cBR -Dj0.35i/0.1i -O -N>> $PS
echo 118.60 38.4	 "2" |gmt pstext  -J -R -K -O -F+f9p,1 >> $PS

##################################################################Color Bar#########################################################################
gmt gmtset FONT_LABEL 10.5p
gmt gmtset FONT_ANNOT_PRIMARY 10.5p
####################################################################################################################################################
gmt psscale -R -J -DjBC+w6c/0.45c+o2.7i/0.5i+m -Cmy4.cpt -Bxa20f10 -K -O >> $PS
echo 118.31 38.55	 "Elevation Change Rate (mm/yr)" |gmt pstext  -J -R -K -O -F+f12p >> $PS

#################################################################China Map###########################################################################
gmt gmtset MAP_FRAME_PEN 0.5p
##############################################################Frame for small map####################################################################
Rg=-R72/136/17/56
Jg=-JM6c
gmt psbasemap $Jg $Rg -Gwhite -Y12.3c -X0.01c -K -O -B0 >> $PS

##################################################################China boundary######################################################################
gmt psxy bou1_4l.gmt -J -R -W0.5p -O -K >> $PS

##################################################################Tianjin Frame#######################################################################
gmt psxy  -R -J new_polygon.gmt -W1.3p,255/128/128 -O -K >> $PS
####################################################################Beijing Point#######################################################################
gmt psxy -Sc0.1c -Gyellow -W0.5p,black -J -R -K -O << EOF >>$PS
116.3 40.2
EOF
#######################################################################River Line#######################################################################
gmt psxy -R -J -K -O Yellow_River.xy  -W0.5p,blue >> $PS
gmt psxy -R -J -K -O Yangtze_River.xy -W0.5p,blue >> $PS
gmt psxy -R -J -K -O Jinshajiang_River.xy -W0.5p,blue >> $PS

gmt psxy -R -J -K -O Han_River.xy  -W0.5p,blue >> $PS
gmt psxy -R -J -K -O Yalong_River.xy -W0.5p,blue >> $PS
gmt psxy -R -J -K -O Daduhe.xy  -W0.5p,blue >> $PS
gmt psxy -R -J -K -O Minjiang_River.xy -W0.5p,blue >> $PS

##########################################################South-to-North Water Diversion Project#########################################################
# gmt psxy -R -J -K -O Danjiangkou_Reservior.xy -W0.5p,blue -Gblue >> $PS
gmt psxy -R -J -K -O  S2N_Central_Route.xy -W1p,red >> $PS
gmt psxy -R -J -K -O  S2N_Central_Tianjin.xy  -W1p,red >> $PS

gmt psxy -R -J -K -O  S2N_Eastern_Route.xy -W1p,brown >> $PS
gmt psxy -R -J -K -O  S2N_Eastern_Shandong.xy  -W1p,brown >> $PS

# gmt psxy -R -J -K -O S2N_Western_Route1.xy -W1p,green >> $PS
# gmt psxy -R -J -K -O S2N_Western_Route2.xy -W1p,green >> $PS

gmt pstext -R -J -K -O -F+f8p,1 << EOF >> $PS
104 55 South-to-North Water Diversion Project
EOF
#
#
gmt pstext -R -J -K -O -F+a0+jLM+f5p,1  << EOF >> $PS
99 52 Central Route
99 50.7 Easter Route
EOF
# 95 52.3 Western Route (Planned)
# gmt psxy -R -J -K -O  -W1.5p,green  << EOF >> $PS
# 88 52.3
# 93 52.3
# EOF
gmt psxy -R -J -K -O  -W1.5p,red  << EOF >> $PS
92 52
97 52
EOF
gmt psxy -R -J -K -O  -W1.5p,brown  << EOF >> $PS
92 50.7
97 50.7
EOF
#######################################################################Label names#########################################################################
gmt pstext -R -J -K -O -F+f6p,1 << EOF >> $PS
119 43.5 North China
110 24.5   South China
114.5 41.8 Beijing
87 35.5  Qinghai-Tibet
87 33  Plateau
EOF

gmt pstext -R -J -K -O -F+f5p,1   << EOF >> $PS
125.4 38.3 Tianjin
EOF

gmt pstext -R -J -K -O -F+f5p,1+a8  << EOF >> $PS
112 28.3 Yangtze River
EOF

gmt pstext -R -J -K -O -F+f5p,1 << EOF >> $PS
107.3 33.9  Han River
EOF

gmt pstext -R -J -K -O -F+f5p,1+a40   << EOF >> $PS
103 39 Yellow River
EOF
####################################################################Nansha Island#########################################################################
R2=-R107/126/2.75/25
J2=-JM1c
gmt psbasemap $J2 $R2 -Gwhite -X5c -K -O -B0 >> $PS
gmt psxy bou1_4l.gmt -J -R -W0.7p -O >> $PS


gmt psconvert -A0.2c -Tf -E1000 $PS
