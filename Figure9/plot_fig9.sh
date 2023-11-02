####
#####
gmt gmtset PS_MEDIA A2
gmt gmtset MAP_FRAME_TYPE plain
gmt gmtset MAP_FRAME_PEN 1.5p
gmt gmtset FONT_ANNOT_PRIMARY Helvetica
gmt gmtset FONT_LABEL 12p
gmt gmtset FONT_TITLE 12p
gmt gmtset FONT_ANNOT_PRIMARY  12p

#PS=fault.ps
PS=Fig9.ps

R=-R116.69/118.07/38.57/39.7
J=-JM20c
I=-I0.001

in=/project/wang/kuan/new_tianjin/plot/plot_total_subsidence/get_shp/tianjin_county.shp
out=/project/wang/kuan/new_tianjin/plot/plot_total_subsidence/get_shp/tj_boundary_line.shp

hebei=/project/wang/kuan/new_tianjin/plot/plot_total_subsidence/get_shp/hebei.shp
beijing=/project/wang/kuan/new_tianjin/plot/plot_total_subsidence/get_shp/beijing.shp

coast=/project/wang/kuan/new_tianjin/plot/plot_total_subsidence/get_shp/tj_coastal_line.shp

GWL_40=/project/wang/kuan/new_tianjin/plot/plot_GWL/get_shp/GWL_40m.shp
GWL_40_special=/project/wang/kuan/new_tianjin/plot/plot_GWL/get_shp/GWL_40m_special.shp
GWL_50=/project/wang/kuan/new_tianjin/plot/plot_GWL/get_shp/GWL_50m.shp
GWL_50_special=/project/wang/kuan/new_tianjin/plot/plot_GWL/get_shp/GWL_50m_special.shp
GWL_60=/project/wang/kuan/new_tianjin/plot/plot_GWL/get_shp/GWL_60m.shp
GWL_70=/project/wang/kuan/new_tianjin/plot/plot_GWL/get_shp/GWL_70m.shp

Ellip1=/project/wang/kuan/new_tianjin/plot/plot_total_subsidence/get_shp/Ellip1.shp
Ellip2=/project/wang/kuan/new_tianjin/plot/plot_total_subsidence/get_shp/Ellip2.shp
Ellip3=/project/wang/kuan/new_tianjin/plot/plot_total_subsidence/get_shp/Ellip3.shp
Ellip4=/project/wang/kuan/new_tianjin/plot/plot_total_subsidence/get_shp/Ellip4.shp
Ellip5=/project/wang/kuan/new_tianjin/plot/plot_total_subsidence/get_shp/Ellip5.shp
Ellip6=/project/wang/kuan/new_tianjin/plot/plot_total_subsidence/get_shp/Ellip6.shp
Ellip7=/project/wang/kuan/new_tianjin/plot/plot_total_subsidence/get_shp/Ellip7.shp
####################################################Base Map 1#########################################################
gmt psbasemap $R $J  -X2c -Yc -Bx0.5 -By0.5 -BWS -K > $PS
gmt psbasemap -R -J -K -O -Ben -B0 >> $PS

# gmt makecpt -Cgebco -D -M -Z  > tdem.cpt
gmt grdimage $R $J gebco_2022.nc  -Ii_dem.nc -Ctest.cpt -O -K >> $PS

###############################################################Boundaries########################################################################
gmt psxy -R -J $beijing -W0.8p,black,solid -O -K >> $PS
gmt psxy -R -J $hebei -W0.8p,black,solid -O -K >> $PS
gmt psxy -R -J $coast -W0.8p,black,solid -G176/226/255 -O -K >> $PS

gmt psxy -R -J $in  -W1p,black,- -O  -K >> $PS
gmt psxy -R -J $out -W0.8p,black,solid -Gwhite -O -K >> $PS

#########################################################################################################################################
gmt psxy $Ellip1 -W1p,blue -Glightblue -R -J -K -O -t30 >> $PS
gmt psxy $Ellip2 -W1p,blue -Glightblue -R -J -K -O -t30 >> $PS
gmt psxy $Ellip3 -W1p,blue -Glightblue -R -J -K -O -t30 >> $PS
gmt psxy $Ellip4 -W1p,blue -Glightblue -R -J -K -O -t30 >> $PS
gmt psxy $Ellip5 -W1p,blue -Gdarkgray -R -J -K -O -t10 >> $PS
gmt psxy $Ellip6 -W1p,blue -Gdarkgray -R -J -K -O -t10 >> $PS
gmt psxy $Ellip7 -W1p,blue -Gdarkgray -R -J -K -O -t10 >> $PS

######################################################clip&hydrhead_contour###############################################################
gmt psclip new_polygon.gmt -R -J -K -O >> $PS
gmt psclip $out -R -J -K -O >> $PS
gmt psxy -R -J $out -Gwhite -t80 -K -O >> $PS
gmt psxy $GWL_40 -R -J -K -O -W1p,darkgreen -G255/211/155 -t80 >> $PS
gmt psxy $GWL_50 -R -J -K -O -W1p,darkgreen -G238/149/114 -t80 >> $PS
gmt psxy $GWL_60 -R -J -K -O -W1p,darkgreen -G205/129/98 -t80 >> $PS
gmt psxy $GWL_70 -R -J -K -O -W1p,darkgreen -G139/87/66 -t80 >> $PS
gmt psxy $GWL_40_special -R -J -K -O -W1p,darkgreen -Gwhite -t80 >> $PS
gmt psxy $GWL_50_special -R -J -K -O -W1p,darkgreen -G255/211/155 -t80 >> $PS
gmt psclip -C -K -O >> $PS
gmt psclip -C -K -O >> $PS

gmt psxy -R -J $out -W0.8p,black,solid -K -O >> $PS
gmt psxy -R -J $in  -W01p,black,- -O  -K >> $PS

###########################################################Path:69 Frame###################################################################
gmt psxy  -R -J new_polygon.gmt -W1.2p,255/128/128 -O -K >> $PS
echo 116.85 39.5 "P69 (Ascending)"|gmt pstext -R -K -J -F+f13p,1,255/128/128+a10 -O -N>> $PS

############################################################County names####################################################################
gmt pstext -R -J -Xa-0.75c -Ya-0.2c -F+f14p,1 -t40 -N  -O -K   << EOF   >> $PS
-242.46088   39.60750   BD
-242.90702   39.461   WQ
-242.26088   39.35   NH
-242.98085   38.87374   JH
117.18   39.04   XQ
-242.77085   39.26374   BC
117.49   39.13   DL
-242.51085   38.97374   JN
EOF

gmt pstext -R -J -Xa-0.75c -Ya-0.5c -F+f14p,1 -t40 -N  -O -K   << EOF   >> $PS
-242.58   38.75374   DG
-242.29   39.04   TG
-242.11088   39.28   HG
EOF

gmt pstext -R -J -Xa-0.75c -Ya-0.5c -F+f14p,1 -t40 -N  -O -K   << EOF   >> $PS
117.24   39.14  CT
EOF

gmt pstext -R -J -Xa-0.75c -Ya-0.2c -F+f14p,1 -N -O -K   << EOF   >> $PS
116.92 38.64 Cangzhou
EOF

gmt pstext -R -J -Xa-0.75c -Ya-0.2c -F+f14p,1+a90 -N -O -K   << EOF   >> $PS
116.82 39.22 Langfang
#118.05 39.55 Tangshan
EOF

gmt pstext -R -J -K -O -F+f14p,1   << EOF   >> $PS
117.88 38.78 Bohai Bay
EOF

#################################################################Wells##########################################################################
# gmt psclip new_polygon.gmt -R -J -K -O >> $PS
gmt psclip new_polygon.gmt -R -J -K -O >> $PS
awk '{print $1,$2}' wells_NPCH_70_80.txt | gmt psxy -R -J -K -O -Sc0.35 -W1p,black -G139/87/66 >> $PS
awk '{print $1,$2,$4}' wells_NPCH_70_80.txt | gmt pstext -R -J -K -O -F+f6p,1,red+jTC -D0/0.5 >> $PS
awk '{print $1,$2,$3}' wells_NPCH_70_80.txt | gmt pstext -R -J -K -O -F+f8p,3,black+jBC -D0/-0.5 >> $PS

awk '{print $1,$2}' wells_NPCH_60_70.txt | gmt psxy -R -J -K -O -Sc0.35 -W1p,black -G205/129/98 >> $PS
awk '{print $1,$2,$4}' wells_NPCH_60_70.txt | gmt pstext -R -J -K -O -F+f6p,1,red+jTC -D0/0.5 >> $PS
awk '{print $1,$2,$3}' wells_NPCH_60_70.txt | gmt pstext -R -J -K -O -F+f8p,3,black+jBC -D0/-0.5 >> $PS

awk '{print $1,$2}' wells_NPCH_50_60.txt | gmt psxy -R -J -K -O -Sc0.35 -W1p,black -G238/149/114 >> $PS
awk '{print $1,$2,$4}' wells_NPCH_50_60.txt | gmt pstext -R -J -K -O -F+f6p,1,red+jTC -D0/0.5 >> $PS
awk '{print $1,$2,$3}' wells_NPCH_50_60.txt | gmt pstext -R -J -K -O -F+f8p,3,black+jBC -D0/-0.5 >> $PS

awk '{print $1,$2}' wells_NPCH_40_50.txt | gmt psxy -R -J -K -O -Sc0.35 -W1p,black -G255/211/155 >> $PS
awk '{print $1,$2,$4}' wells_NPCH_40_50.txt | gmt pstext -R -J -K -O -F+f6p,1,red+jTC -D0/0.5 >> $PS
awk '{print $1,$2,$3}' wells_NPCH_40_50.txt | gmt pstext -R -J -K -O -F+f8p,3,black+jBC -D0/-0.5 >> $PS

awk '{print $1,$2}' wells_NPCH_under40.txt | gmt psxy -R -J -K -O -Sc0.35 -W1p,black -G255/255/224 >> $PS
awk '{print $1,$2,$4}' wells_NPCH_under40.txt | gmt pstext -R -J -K -O -F+f6p,1,red+jTC -D0/0.5 >> $PS
awk '{print $1,$2,$3}' wells_NPCH_under40.txt | gmt pstext -R -J -K -O -F+f8p,3,black+jBC -D0/-0.5 >> $PS

echo 117.66 39.31 | gmt psxy -R -J -K -O -Sc0.35 -W1p,black -G255/211/155 >> $PS
echo 117.66 39.31 "W15" | gmt pstext -R -J -K -O -F+f6p,1,red+jTC -D0/0.4 >> $PS
echo 117.66 39.31 "-45m" | gmt pstext -R -J -K -O -F+f8p,3,black+jBC -D0.2/-0.4 >> $PS

echo 117.64 39.29 | gmt psxy -R -J -K -O -Sc0.35 -W1p,black -G255/211/155 >> $PS
echo 117.64 39.29 "W14" | gmt pstext -R -J -K -O -F+f6p,1,red+jTC -D-0.2/0.4 >> $PS
echo 117.64 39.29 "-45m" | gmt pstext -R -J -K -O -F+f8p,3,black+jBC -D0/-0.4 >> $PS

echo 117.06 39.39 | gmt psxy -R -J -K -O -Sc0.35 -W1p,black -G205/129/98 >> $PS
echo 117.06 39.39 "W27"| gmt pstext -R -J -K -O -F+f6p,1,red+jTC -D0/0.5 >> $PS
echo 117.06 39.39 "-60m"| gmt pstext -R -J -K -O -F+f8p,3,black+jBC -D0/-0.4 >> $PS

echo 117.19 39.49 | gmt psxy -R -J -K -O -Sc0.35 -W1p,black -G238/149/114 >> $PS
echo 117.19 39.49 "W26" | gmt pstext -R -J -K -O -F+f6p,1,red+jTC -D0.2/0.4 >> $PS
echo 117.19 39.49 "-50m" | gmt pstext -R -J -K -O -F+f8p,3,black+jBC -D0/-0.5 >> $PS

echo 117.82 39.54 | gmt psxy -R -J -K -O -Sc0.35 -W1p,black -G255/255/224 >> $PS
echo 117.82 39.54 "W20" | gmt pstext -R -J -K -O -F+f6p,1,red+jTC -D0.2/0.4 >> $PS
echo 117.82 39.54 "-27m" | gmt pstext -R -J -K -O -F+f8p,3,black+jBC -D0.2/-0.4 >> $PS
# awk '{print $1,$2}' wells_NPCH_samelocation.txt | gmt psxy -R -J -K -O -Sc0.3 -W1p,black -Gred >> $PS
# awk '{print $1,$2,$4}' wells_NPCH_samelocation.txt | gmt pstext -R -J -K -O -F+f7p,1,red -D-1/0 >> $PS
# awk '{print $1,$2,$3}' wells_NPCH_samelocation.txt | gmt pstext -R -J -K -O -F+f7p,3,black -D0.4/0 >> $PS
gmt psclip -C -K -O >> $PS
# gmt psclip -C -K -O >> $PS


gmt psxy  -R -J -St0.5 -W1p,black -Gred -O -K   << EOF   >> $PS
-242.89702   39.37545 10 0 0 CM   TJWQ
EOF
gmt pstext  -R -J -F+f6p,1,red -D0/0.5 -O -K  << EOF   >> $PS
-242.89702   39.37545   TJWQ
EOF
#############################################################Text on Map###################################################################
echo 116.93 38.92 "Hydraulic Head: -60 to -70 m" |gmt pstext  -J -R -K -O -F+f12p,4 >> $PS

gmt pslegend -R -J -DjTC+w3.9c/1.2c+o-2.55i/1.2i -F+p0.1p,black+gwhite+r -K -O >> $PS<< EOF
S 0.1i s 0.0000001 - 0.0p,- 0i
EOF
gmt pstext  -J -R -K -O -F+f12p >> $PS << EOF
116.93 39.52 NPCH: -50 to -60 m 
116.93 39.49 SPB: ~10 to 15 m
EOF

gmt pslegend -R -J -DjTC+w3.9c/1.2c+o-0.3i/0.8i -F+p0.1p,black+gwhite+r -K -O >> $PS<< EOF
S 0.1i s 0.0000001 - 0.0p,- 0i
EOF
gmt pstext  -J -R -K -O -F+f12p >> $PS << EOF
117.325 39.575 NPCH: -35 to -45 m 
117.325 39.545 SPB: ~5 to 10 m
EOF

gmt pslegend -R -J -DjTC+w3.9c/1.2c+o3.15i/0.5i -F+p0.1p,black+gwhite+r -K -O >> $PS<< EOF
S 0.1i s 0.0000001 - 0.0p,- 0i
EOF
gmt pstext  -J -R -K -O -F+f12p >> $PS << EOF
117.93 39.615 NPCH: -25 to -30 m 
117.93 39.585 SPB: ~0 m
EOF

gmt pslegend -R -J -DjTC+w3.9c/1.2c+o3.10i/2.32i -F+p0.1p,black+gwhite+r -K -O >> $PS<< EOF
S 0.1i s 0.0000001 - 0.0p,- 0i
EOF
gmt pstext  -J -R -K -O -F+f12p >> $PS << EOF
117.925 39.365 NPCH: -45 to -55 m 
117.925 39.335 SPB: ~5 m
EOF

gmt pslegend -R -J -DjTC+w3.9c/1.2c+o-2.55i/3.8i -F+p0.1p,black+gwhite+r -K -O >> $PS<< EOF
S 0.1i s 0.0000001 - 0.0p,- 0i
EOF
gmt pstext  -J -R -K -O -F+f12p >> $PS << EOF
116.935 39.165 NPCH: -50 to -55 m 
116.935 39.135 SPB: ~0 m
EOF

gmt pslegend -R -J -DjTC+w3.9c/1.2c+o2.55i/4.8i -F+p0.1p,black+gwhite+r -K -O >> $PS<< EOF
S 0.1i s 0.0000001 - 0.0p,- 0i
EOF
gmt pstext  -J -R -K -O -F+f12p >> $PS << EOF
117.825 39.03 NPCH: -35 to -45 m 
117.825 39.00 SPB: ~10 to 15 m
EOF

gmt pslegend -R -J -DjTC+w3.9c/1.2c+o-2.55i/6.6i -F+p0.1p,black+gwhite+r -K -O >> $PS<< EOF
S 0.1i s 0.0000001 - 0.0p,- 0i
EOF
gmt pstext  -J -R -K -O -F+f12p >> $PS << EOF
116.935 38.78 NPCH: -40 to -60 m 
116.935 38.75 SPB: ~0 m
EOF

echo 117.188 39.38 "Zone 1" |gmt pstext  -J -R -K -O -F+f12p,1 >> $PS
echo 117.36 39.46 "Zone 2" |gmt pstext  -J -R -K -O -F+f12p,1 >> $PS
echo 117.61 38.88 "Zone 3" |gmt pstext  -J -R -K -O -F+f12p,1 >> $PS
echo 117.79 39.41 "Zone 4" |gmt pstext  -J -R -K -O -F+f12p,1 >> $PS
echo 117.22 39.09 "Zone 5" |gmt pstext  -J -R -K -O -F+f12p,1 >> $PS
echo 117.89 39.54 "Zone 6" |gmt pstext  -J -R -K -O -F+f12p,1 >> $PS
echo 117.23 38.69 "Zone 7" |gmt pstext  -J -R -K -O -F+f12p,1 >> $PS
##############################################################Color Bar####################################################################
gmt gmtset FONT_LABEL 10.5p
gmt gmtset FONT_ANNOT_PRIMARY 9p
gmt gmtset MAP_TICK_PEN 0.25p
gmt gmtset MAP_TICK_LENGTH 0.1p
gmt gmtset MAP_LABEL_OFFSET 0.5p

gmt pslegend -R -J -DjBR+w6.1c/0.4c+o0.22i/0.34i -F+gwhite+r -K -O >> $PS<< EOF
S 0.1i s 0.0000001 - 0.0p,- 0i
EOF
gmt psscale -R -J -DjBC+w6c/0.35c+o2.5i/0.35i+m+e -Cmyscale.cpt -Bx10 -By -t45 -K -O >> $PS
echo 117.82 38.65 "Hydraulic Head in Aquifer III as of 2022" |gmt pstext  -J -R -K -O -F+f9p >> $PS
echo 117.82 38.586 "Below Land Surface (m)" |gmt pstext  -J -R -K -O -F+f9p >> $PS
##########################
gmt gmtset FONT_LABEL 12p
##########################

gmt pslegend -R -J -DjTC+w18.2c/0.5c+o0i/0.17i -F+gwhite@40+r -K -O >> $PS<< EOF
S 0.1i s 0.0000001 - 0.0p,- 0i
EOF
echo  "New Pre-consolidation Heads (NPCH) and Safe Pumping Buffers (SPB-2022) in Tianjin"|gmt pstext -R -J -F+f12p,1,black+cTC -Dj0.2i/0.2i -O -N>> $PS


gmt psconvert -A0.2c  -E600 $PS
gmt psconvert -A0.2c -Tf -E1000 $PS