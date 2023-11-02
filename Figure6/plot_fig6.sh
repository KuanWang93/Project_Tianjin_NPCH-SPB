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
PS=Fig6.ps

R=-R116.69/118.07/38.57/39.7
J=-JM20c
I=-I0.001

in=/project/xhu/xiao/new_tianjin/plot/plot_total_subsidence/get_shp/tianjin_county.shp
out=/project/xhu/xiao/new_tianjin/plot/plot_total_subsidence/get_shp/tj_boundary_line.shp

hebei=/project/xhu/xiao/new_tianjin/plot/plot_total_subsidence/get_shp/hebei.shp
beijing=/project/xhu/xiao/new_tianjin/plot/plot_total_subsidence/get_shp/beijing.shp

coast=/project/xhu/xiao/new_tianjin/plot/plot_total_subsidence/get_shp/tj_coastal_line.shp

####################################################Base Map 1#########################################################
gmt psbasemap $R $J  -X2c -Yc -Bx0.5 -By0.5 -BWS -K > $PS
gmt psbasemap -R -J -K -O -Ben -B0 >> $PS

gmt makecpt -Cgray -D -M -Z  > test.cpt
gmt grdimage $R $J gebco_2022.nc  -Ii_dem.nc -Ctest.cpt -O -K >> $PS

###############################################################Boundaries########################################################################
gmt psxy -R -J $beijing -W0.8p,black,solid -O -K >> $PS
gmt psxy -R -J $hebei -W0.8p,black,solid -O -K >> $PS
gmt psxy -R -J $coast -W0.8p,black,solid -G176/226/255 -O -K >> $PS

gmt psclip new_polygon.gmt  -R -J -K -O >> $PS
gmt psclip $out -R -J -K -O >> $PS
gmt grdimage PCHtime4.grd -R -J -Ctest3.cpt -Q -K -O >> $PS
gmt psclip -C -K -O >> $PS
gmt psclip -C -K -O >> $PS

gmt psclip $Zone1 -R -J -K -O >> $PS
gmt grdimage PCHtime3.grd -R -J -Ctest3.cpt -Q -K -O >> $PS
gmt psclip -C -K -O >> $PS

gmt psclip $Zone2 -R -J -K -O >> $PS
gmt grdimage PCHtime3.grd -R -J -Ctest3.cpt -Q -K -O >> $PS
gmt psclip -C -K -O >> $PS

gmt psclip $Zone3 -R -J -K -O >> $PS
gmt grdimage PCHtime3.grd -R -J -Ctest3.cpt -Q -K -O >> $PS
gmt psclip -C -K -O >> $PS

gmt psxy -R -J $in  -W1p,black,- -O  -K >> $PS
gmt psxy -R -J $out -W0.8p,black,solid -O -K >> $PS

###########################################################Path:69 Frame###################################################################
gmt psxy  -R -J new_polygon.gmt -W1.2p,255/128/128 -O -K >> $PS
echo 116.85 39.5 "P69 (Ascending)"|gmt pstext -R -K -J -F+f13p,1,255/128/128+a10 -O -N>> $PS

############################################################County names####################################################################
gmt pstext -R -J -Xa-0.75c -Ya-0.2c -F+f10p,1 -t40 -N  -O -K   << EOF   >> $PS
-242.50088   39.58750   BD
-242.90702   39.461   WQ
-242.26088   39.35   NH
-242.98085   38.87374   JH
117.18   39.04   XQ
-242.77085   39.26374   BC
117.49   39.13   DL
-242.51085   38.97374   JN
EOF

gmt pstext -R -J -Xa-0.75c -Ya-0.5c -F+f10p,1 -t40 -N  -O -K   << EOF   >> $PS
-242.62   38.75374   DG
-242.25   39.05   TG
-242.11088   39.28   HG
EOF

gmt pstext -R -J -Xa-0.75c -Ya-0.5c -F+f10p,1 -t40 -N  -O -K   << EOF   >> $PS
117.24   39.14  CT
EOF

gmt pstext -R -J -Xa-0.75c -Ya-0.2c -F+f13p,1 -N -t20 -O -K   << EOF   >> $PS
116.92 38.64 Cangzhou
EOF

gmt pstext -R -J -Xa-0.75c -Ya-0.2c -F+f13p,1+a90 -N -t20 -O -K   << EOF   >> $PS
116.82 39.22 Langfang
118.05 39.55 Tangshan
EOF

gmt pstext -R -J -K -O -F+f15p,1  -t20  << EOF   >> $PS
117.88 38.78 Bohai Bay
EOF

#############################################################Wells########################################################################
echo 117.67	38.96 | gmt psxy -R -J -Sc0.2 -W0.7p,black -Gred -O -K >> $PS
echo 117.67	38.96 "W41" | gmt pstext -R -J -F+f10p,1,black -D0/-0.3 -O -K >> $PS

echo 117.23	39.27 | gmt psxy -R -J -Sc0.2 -W0.7p,black -Gred -O -K >> $PS
echo 117.23	39.27 "W47" | gmt pstext -R -J -F+f10p,1,black -D0/0.3 -O -K >> $PS

echo 116.92	39.24 | gmt psxy -R -J -Sc0.2 -W0.7p,black -Gred -O -K >> $PS
echo 116.92	39.24 "W44" | gmt pstext -R -J -F+f10p,1,black -D0/0.3 -O -K >> $PS

echo 117.82	39.54 | gmt psxy -R -J -Sc0.2 -W0.7p,black -Gred -O -K >> $PS
echo 117.82	39.54 "W20" | gmt pstext -R -J -F+f10p,1,black -D0/0.3 -O -K >> $PS

echo 117.69	39.53 | gmt psxy -R -J -Sc0.2 -W0.7p,black -Gred -O -K >> $PS
echo 117.69	39.53 "W17" | gmt pstext -R -J -F+f10p,1,black -D0/-0.3 -O -K >> $PS

echo 117.79	39.54 | gmt psxy -R -J -Sc0.2 -W0.7p,black -Gred -O -K >> $PS
echo 117.79	39.54 "W13" | gmt pstext -R -J -F+f10p,1,black -D-0.5/0 -O -K >> $PS

echo 117.599792 39.0375 | gmt psxy -R -J -Sc0.2 -W0.7p,black -Gdarkred -O -K >> $PS
echo 117.599792 39.0375 "P405" | gmt pstext -R -J -F+f10p,1,black -D-0.1/0.4 -O -K >> $PS

echo 117.657708 39.0375 | gmt psxy -R -J -Sc0.2 -W0.7p,black -Gdarkred -O -K >> $PS
echo 117.657708 39.0375 "P406" | gmt pstext -R -J -F+f10p,1,black -D0.2/0.4 -O -K >> $PS

echo 117.657708 38.9925 | gmt psxy -R -J -Sc0.2 -W0.7p,black -Gdarkred -O -K >> $PS
echo 117.657708 38.9925 "P432" | gmt pstext -R -J -F+f10p,1,black -D0.6/0 -O -K >> $PS

##########################
gmt gmtset FONT_LABEL 12p
##########################

gmt pslegend -R -J -DjTC+w10.8c/0.5c+o0i/0.17i -F+gwhite@40+r -K -O >> $PS<< EOF
S 0.1i s 0.0000001 - 0.0p,- 0i
EOF
echo  "Establishment Dates of the New Pre-Consolidation Heads"|gmt pstext -R -K -J -F+f14p,1,black+cTC -Dj0.2i/0.2i -O -N>> $PS
echo  "Pixel size: 1.2-by-1.2 km"|gmt pstext -R -K -J -F+f11p,1,black+cBR -Dj6i/0.1i -O -N>> $PS
echo 117.02 38.6	 "2" |gmt pstext  -J -R -K -O -F+f9p,1 >> $PS

##################################################################Color Bar######################################################################
gmt gmtset FONT_LABEL 10.5p
gmt gmtset FONT_ANNOT_PRIMARY 10.5p
##################################################################Scale Bar######################################################################
gmt psscale -R -J -DjBC+w6c/0.35c+o2.55i/0.22i+m+e -Ctest3.cpt -Bxa2f1 -K -O >> $PS
echo 117.825 38.635	 "Establishment of New Pre-consolidation Head" |gmt pstext -R -J -O -F+f10p,4 >> $PS


gmt psconvert -A0.2c -Tf -E1000 $PS
gmt psconvert -A0.2c -E1000 $PS
