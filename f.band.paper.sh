#!/bin/bash

# parameters: filename, order, lambda0, ci, curveopacity, errobarmarkers, markersopacity
# 文件名，展开阶数，lambda0，ci，曲线透明度，曲线的误差棒记号，曲线记号的透明度
# 计算结果的曲线记号透明度markopacity 是一个数组，用字符串形式输入
# wolframscript -print "all" -file ./f.figure.series-full.rencon3.strange.baryons-all.band.wl "full" 0.90 1.50 1 "bands" "{0,0,0,0.2,0.2,0,0,0}" 3 1

# 这个文件用来计算论文中使用的特殊配制 0.90 1.50

curveopacity_normal="{1,1,1,1,1,1,1,1}" 
curveopacity_unnormal="{0,0,0,1,1,0,0,0}" 
markers="Bands"
# 透明度设置，先是ge,后是gm
markopacity_normal="{{0,0,0,0.3,0.3,0,0,0},{0,0,0,0,0,0,0,0}}" 
markopacity_unnormal="{{0,0,0,0.3,0.3,0,0,0},{0,0,0,0.3,0.3,0,0,0}}" 
expr_marker=4
expr_opacity=1
normal="normal"
unnormal="unnormal"

## ordinary configurations

wolframscript -print "all" -file f.figure.series-full.rencon3.strange.baryons-all.band.wl "full" 0.90 1.50 "$curveopacity_normal" $markers "$markopacity_normal" $expr_marker $expr_opacity $normal
wolframscript -print "all" -file f.figure.series-full.rencon3.strange.baryons-all.band.wl "full" 0.90 1.50 "$curveopacity_unnormal" $markers "$markopacity_unnormal" $expr_marker $expr_opacity $unnormal

