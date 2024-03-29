gmt gmtset PS_MEDIA A2
gmt gmtset MAP_FRAME_TYPE plain
gmt gmtset FONT_ANNOT_PRIMARY Helvetica
gmt gmtset MAP_FRAME_PEN 0.8p
gmt gmtset FONT_LABEL 12p
gmt gmtset FONT_TITLE 12p
gmt gmtset FONT_ANNOT_PRIMARY  12p

#PS=fault.ps
PS=Fig1b.ps

R=-R116.2/118.7/38.35/40.08
J=-JM20c
I=-I0.001

in=/project/wang/kuan/new_tianjin/plot/plot_total_subsidence/get_shp/tianjin_county.shp
out=/project/wang/kuan/new_tianjin/plot/plot_total_subsidence/get_shp/tj_boundary_line.shp

hebei=/project/wang/kuan/new_tianjin/plot/plot_total_subsidence/get_shp/hebei.shp
beijing=/project/wang/kuan/new_tianjin/plot/plot_total_subsidence/get_shp/beijing.shp

coast=/project/wang/kuan/new_tianjin/plot/plot_total_subsidence/get_shp/tj_coastal_line.shp

Zone1=/project/wang/kuan/new_tianjin/plot/plot_total_subsidence/get_shp/Zone1.shp
Zone2=/project/wang/kuan/new_tianjin/plot/plot_total_subsidence/get_shp/Zone2.shp
Zone3=/project/wang/kuan/new_tianjin/plot/plot_total_subsidence/get_shp/Zone3.shp
# Zone4=/project/wang/kuan/new_tianjin/plot/plot_total_subsidence/get_shp/Zone4.shp
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

# gmt makecpt -Cgray -D -M -Z  > test.cpt
gmt grdimage $R $J gebco_2022.nc  -Ii_dem1.nc -Ctest.cpt -O -K >> $PS

# gmt pscoast -R -J -B30g30 -Df -W0.5p -S176/226/255 -K -O >> $PS

###############################################################Boundaries########################################################################
gmt psclip new_polygon.gmt -R -J -K -O >> $PS
# gmt psclip $out -R -J -K -O >> $PS
gmt grdimage lr_velocity.grd -R -J -Cmy4.cpt -Q -K -O >> $PS
# gmt psclip -C -K -O >> $PS
gmt psclip -C -K -O >> $PS

gmt psxy -R -J $coast -W0.8p,black,solid -G176/226/255 -O -K >> $PS

gmt psxy -R -J $in  -W1p,darkgreen,- -O  -K >> $PS
gmt psxy -R -J $out -W1p,black,solid -O -K >> $PS

# gmt psxy -R -J $beijing -W0.8p,black,solid -O -K >> $PS
# gmt psxy -R -J $hebei -W0.8p,black,solid -O -K >> $PS
###########################################################Path:69 and Frame################################################################
echo 118.12 39.75 "P69 (Ascending)"|gmt pstext -R -K -J -F+f13p,1,255/128/128+a10 -O -N>> $PS
gmt psxy  -R -J new_polygon.gmt -W1.2p,255/128/128 -O -K >> $PS

#################################################################Wells##########################################################################
# awk '{print $1,$2}' well_location.txt | gmt psxy -R -J -K -O -St0.1 -Gred >> $PS
# awk '{print $1,$2,$3}' well_location.txt | gmt pstext -R -J -K -O -F+f4p,1,red+jTL -D0.05/0.05 >> $PS
echo 117.06	39.39 | gmt psxy -R -J -Sc0.2 -W0.7p,black -Gred -O -K >> $PS
echo 117.06	39.39 "W27" | gmt pstext -R -J -F+f10p,1,black -D-0.5/0 -O -K >> $PS

echo 117.07	39.31 | gmt psxy -R -J -Sc0.2 -W0.7p,black -Gred -O -K >> $PS
echo 117.07	39.31 "W23" | gmt pstext -R -J -F+f10p,1,black -D0.6/0 -O -K >> $PS

echo 117.17	39.16 | gmt psxy -R -J -Sc0.2 -W0.7p,black -Gred -O -K >> $PS
echo 117.17	39.16 "W42" | gmt pstext -R -J -F+f10p,1,black -D-0.5/0 -O -K >> $PS

echo 117.73	39.34 | gmt psxy -R -J -Sc0.2 -W0.7p,black -Gred -O -K >> $PS
echo 117.73	39.34 "W65" | gmt pstext -R -J -F+f10p,1,black -D0/-0.3 -O -K >> $PS

echo 116.86	38.94 | gmt psxy -R -J -Sc0.2 -W0.7p,black -Gred -O -K >> $PS
echo 116.86	38.94 "W68" | gmt pstext -R -J -F+f10p,1,black -D0/-0.3 -O -K >> $PS

gmt psxy  -R -J -St0.5 -W1p,black -Gblue -O -K   << EOF   >> $PS
-242.89702   39.37545 10 0 0 CM   TJWQ
EOF
gmt pstext  -R -J -F+f10p,1,black -D0.7/0 -O -K  << EOF   >> $PS
-242.89702   39.37545   TJWQ
EOF

##############################################################Subsidence Ceased Area#############################################################
gmt psxy -R -J $Zone1  -W1p,blue  -O  -K  >> $PS
# echo 117.25 39.35  "Zone1" | gmt pstext -R -J -O -K -F+f8p,1 -t50 >> $PS
gmt psxy -R -J $Zone2  -W1p,blue  -O  -K  >> $PS
# echo 117.15 39.14  "Zone2" | gmt pstext -R -J -O -K -F+f8p,1 -t50 >> $PS
gmt psxy -R -J $Zone3  -W1p,blue  -O  -K  >> $PS
# echo 117.5 38.98  "Zone3" | gmt pstext -R -J -O -K -F+f8p,1 -t50 >> $PS
# gmt psxy -R -J $Zone4  -W1p,red -Gwhite -O  -K -t70 >> $PS
# echo 117.75 39.31  "Zone4" | gmt pstext -R -J -O -K -F+f8p,1 -t70 >> $PS

gmt psxy -R -J $out -W1p,black,solid -O -K >> $PS
##############################################################County names#######################################################################
gmt pstext -R -J -Xa-0.75c -Ya-0.2c -F+f10p,1 -N  -O -K   << EOF   >> $PS
-242.53952   39.90604  JX
-242.45088   39.55750   BD
-242.85702   39.461   WQ
-242.29088   39.37   NH
-242.90085   38.87374   JH
117.25   39.04   XQ
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

gmt pslegend -R -J -DjBR+w6.1c/3.2c+o0.1c/0.2c -F+gwhite@40+r -K -O >> $PS<< EOF
S 0.1i s 0.0000001 - 0.0p,- 0i
EOF

echo 117.97 38.645 | gmt psxy -R -J -K -O -St0.5 -W0.01p,black -Gblue >> $PS
echo "Continuous GPS Stations"|gmt pstext -R -K -J -F+f12p,1,black+cBR -Dj0.14i/1.15i -O -N>> $PS
echo 117.97 38.6 | gmt psxy -R -J -K -O -Sc0.25 -W0.01p,black -Gred >> $PS
echo "Groundwater Wells"|gmt pstext -R -K -J -F+f12p,1,black+cBR -Dj0.38i/0.95i -O -N>> $PS
echo  "Pixel  size:  1.2-by-1.2 km"|gmt pstext -R -K -J -F+f12p,1,black+cBR -Dj0.29i/0.11i -O -N>> $PS
echo 118.62 38.4	 "2" |gmt pstext  -J -R -K -O -F+f9p,1 >> $PS

##################################################################Color Bar#########################################################################
gmt gmtset FONT_LABEL 10.5p
gmt gmtset FONT_ANNOT_PRIMARY 10.5p
####################################################################################################################################################
gmt psscale -R -J -DjBC+w6c/0.45c+o2.7i/0.5i+m -Cmy4.cpt -Bxa20f10 -K -O >> $PS
echo 118.31 38.55	 "Elevation Change Rate (mm/yr)" |gmt pstext  -J -R -K -O -F+f11p,1,black >> $PS

##################################################################Color Bar#########################################################################
gmt gmtset FONT_LABEL 10.5p
gmt gmtset FONT_ANNOT_PRIMARY 10.5p
####################################################################################################################################################
gmt psscale -R -J -DjBC+w6c/0.45c+o2.7i/0.5i+m -Cmy4.cpt -Bxa20f10 -K -O >> $PS
echo 118.31 38.55	 "Elevation Change Rate (mm/yr)" |gmt pstext  -J -R -K -O -F+f11p,1,black >> $PS

#################################################################China Map###########################################################################
gmt gmtset MAP_FRAME_PEN 0.5p
##############################################################Frame for small map####################################################################
Rg=-R72/136/17/56
Jg=-JM6c
gmt psbasemap $Jg $Rg -Gwhite -Y12c -X0.01c -K -O -B0 >> $PS

##################################################################China boundary######################################################################
gmt psxy bou1_4l.gmt -J -R -W0.5p -O -K >> $PS

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

gmt pstext -R -J -K -O -F+f8.5p,1 << EOF >> $PS
104 54.9 South-to-North Water Diversion Project
EOF
#
#
gmt pstext -R -J -K -O -F+a0+jLM+f7p,1  << EOF >> $PS
99 52.5 Central Route
99 50.7 Eastern Route
EOF
# 95 52.3 Western Route (Planned)
# gmt psxy -R -J -K -O  -W1.5p,green  << EOF >> $PS
# 88 52.3
# 93 52.3
# EOF
gmt psxy -R -J -K -O  -W1.5p,red  << EOF >> $PS
92 52.5
97 52.5
EOF
gmt psxy -R -J -K -O  -W1.5p,brown  << EOF >> $PS
92 50.7
97 50.7
EOF

##################################################################Tianjin Frame#######################################################################
gmt psxy  -R -J new_polygon.gmt -W0.8p,255/128/128 -Gyellow -O -K >> $PS
#######################################################################Label names#########################################################################
gmt pstext -R -J -K -O -F+f7p,1 << EOF >> $PS

114.9 41.8 Beijing
87 35.5  Qinghai-Tibet
87 33  Plateau
EOF
#119 43.5 North China
#110 24.5   South China
gmt pstext -R -J -K -O -F+f9p,1,red << EOF >> $PS
124.7 39.3 Tianjin
EOF

gmt pstext -R -J -K -O -F+f7p,1+a8  << EOF >> $PS
112 28.3 Yangtze River
EOF

# gmt pstext -R -J -K -O -F+f5p,1 << EOF >> $PS
# 107.3 33.9  Han River
# EOF

gmt pstext -R -J -K -O -F+f7p,1+a40   << EOF >> $PS
102.9 39.1 Yellow River
EOF
####################################################################Nansha Island#########################################################################
R2=-R107/126/2.75/25
J2=-JM1c
gmt psbasemap $J2 $R2 -Gwhite -X0c -K -O -B0 >> $PS
gmt psxy bou1_4l.gmt -J -R -W0.7p -K -O >> $PS

gmt psbasemap $R $J  -X0c -Y-12c -Bx0.5 -By0.5 -Bws -K -O >> $PS
gmt psbasemap -R -J -K -O -Ben -B0 >> $PS
gmt psxy -R -J $out -W1p,black,solid -O  >> $PS


gmt psconvert -A0.2c -Tf -E1000 $PS
gmt psconvert -A0.2c -E1000 $PS
