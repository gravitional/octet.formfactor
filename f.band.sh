#!/bin/bash

# parameters: filename, order, lambda0, ci, curveopacity, errobarmarkers, markersopacity
# 文件名，展开阶数，lambda0，ci，曲线透明度，曲线的误差棒记号，曲线记号的透明度
# 计算结果的曲线记号透明度markopacity 是一个数组，用字符串形式输入
# wolframscript -print "all" -file ./f.figure.series-full.rencon3.strange.baryons-all.band.wl "full" 0.90 1.50 1 "bands" "{0,0,0,0.2,0.2,0,0,0}" 3 1

curveopacity=1
markers="Bands"
markopacity="{0,0,0,0.1,0.1,0,0,0}" 
expr_marker=3
expr_opacity=1

## ordinary configurations

wolframscript -print "all" -file "./f.figure.series-full.rencon3.strange.baryons-all.band.wl" "full" 0.80 1.00 $curveopacity $markers $markopacity $expr_marker $expr_opacity

wolframscript -print "all" -file ./f.figure.series-full.rencon3.strange.baryons-all.band.wl "full" 0.80 1.50 $curveopacity $markers $markopacity $expr_marker $expr_opacity


wolframscript -print "all" -file ./f.figure.series-full.rencon3.strange.baryons-all.band.wl "full" 1.00 1.00 $curveopacity $markers $markopacity $expr_marker $expr_opacity


wolframscript -print "all" -file ./f.figure.series-full.rencon3.strange.baryons-all.band.wl "full" 1.00 1.50 $curveopacity $markers $markopacity $expr_marker $expr_opacity


## ci test configurations

wolframscript -print "all" -file ./f.figure.series-full.rencon3.strange.baryons-all.band.wl "full" 0.90 1.00 $curveopacity $markers $markopacity $expr_marker $expr_opacity


wolframscript -print "all" -file ./f.figure.series-full.rencon3.strange.baryons-all.band.wl "full" 0.90 1.05 $curveopacity $markers $markopacity $expr_marker $expr_opacity


wolframscript -print "all" -file ./f.figure.series-full.rencon3.strange.baryons-all.band.wl "full" 0.90 1.10 $curveopacity $markers $markopacity $expr_marker $expr_opacity


wolframscript -print "all" -file ./f.figure.series-full.rencon3.strange.baryons-all.band.wl "full" 0.90 1.15 $curveopacity $markers $markopacity $expr_marker $expr_opacity


wolframscript -print "all" -file ./f.figure.series-full.rencon3.strange.baryons-all.band.wl "full" 0.90 1.20 $curveopacity $markers $markopacity $expr_marker $expr_opacity


wolframscript -print "all" -file ./f.figure.series-full.rencon3.strange.baryons-all.band.wl "full" 0.90 1.25 $curveopacity $markers $markopacity $expr_marker $expr_opacity


wolframscript -print "all" -file ./f.figure.series-full.rencon3.strange.baryons-all.band.wl "full" 0.90 1.30 $curveopacity $markers $markopacity $expr_marker $expr_opacity


wolframscript -print "all" -file ./f.figure.series-full.rencon3.strange.baryons-all.band.wl "full" 0.90 1.35 $curveopacity $markers $markopacity $expr_marker $expr_opacity


wolframscript -print "all" -file ./f.figure.series-full.rencon3.strange.baryons-all.band.wl "full" 0.90 1.40 $curveopacity $markers $markopacity $expr_marker $expr_opacity


wolframscript -print "all" -file ./f.figure.series-full.rencon3.strange.baryons-all.band.wl "full" 0.90 1.45 $curveopacity $markers $markopacity $expr_marker $expr_opacity


wolframscript -print "all" -file ./f.figure.series-full.rencon3.strange.baryons-all.band.wl "full" 0.90 1.50 $curveopacity $markers $markopacity $expr_marker $expr_opacity


