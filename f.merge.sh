#!/bin/bash

# parameters: filename, order, lambda0, ci, curveopacity, errobarmarkers, markersopacity
# 文件名，展开阶数，lambda0，ci，曲线透明度，曲线的误差棒记号，曲线记号的透明度
# 将归一化和没有归一化的图合并
echo -e "+++++++++++++\nmerge the pictures \n+++++++++++++++++"

mfiles_list='<|"unmerge" -> <|"normal" -> <|"ge_charge" -> "fig.baryons.normal.ge.charge.L-0.90.ci-1.50.m", "ge_neutral" -> "fig.baryons.normal.ge.neutral.L-0.90.ci-1.50.m"|>|>, "merge" -> <|"normal" -> <|"gm_charge" -> "fig.baryons.normal.gm.charge.L-0.90.ci-1.50.m", "gm_neutral" -> "fig.baryons.normal.gm.neutral.L-0.90.ci-1.50.m"|>, "unnormal" -> <|"gm_charge" -> "fig.baryons.unnormal.gm.charge.L-0.90.ci-1.50.m", "gm_neutral" -> "fig.baryons.unnormal.gm.neutral.L-0.90.ci-1.50.m"|>|>|>'

wolframscript -print "all" -file  'f.figure.subfigure.wl' "${mfiles_list}"

