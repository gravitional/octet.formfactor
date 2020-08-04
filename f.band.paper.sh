#!/bin/bash

# parameters: filename, order, lambda0, ci, curveopacity, errobarmarkers, markersopacity
# 文件名，展开阶数，lambda0，ci，曲线透明度，曲线的误差棒记号，曲线记号的透明度
# 计算结果的曲线记号透明度markopacity 是一个数组，用字符串形式输入
# wolframscript -print "all" -file ./f.figure.series-full.rencon3.strange.baryons-all.band.wl "full" 0.90 1.50 1 "bands" "{0,0,0,0.2,0.2,0,0,0}" 3 1

# 这个文件用来计算论文中使用的特殊配制 0.90 1.50

curveopacity=1
markers="Bands"
markopacity="{0,0,0,0.1,0.1,0,0,0}" 
expr_marker=3
expr_opacity=1
whether_normal="unnormal"

## ordinary configurations

wolframscript -print "all" -file f.figure.series-full.rencon3.strange.baryons-all.band.wl "full" 0.90 1.50 $curveopacity $markers $markopacity $expr_marker $expr_opacity $whether_normal
