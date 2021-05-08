#!/usr/bin/env bash

# 要复制到论文中的结果
user_name=$(whoami)
# 配置目录
rstPath="/home/${user_name}/octet.formfactor/expression-results/" # mma计算结果目录
originPath=$(pwd)                                                 # 脚本执行目录
paperPath="/home/${user_name}/private/my_papers/sigma/"           # 论文 tex 文件目录
archPath="/home/${user_name}/Documents/sigma1/"                   # 论文压缩文件存放目录
# 复制计算结果到论文目录
cp ${rstPath}'sigma_Fig3.pdf' ${paperPath}"fig3.pdf"
cp ${rstPath}'sigma_Fig4.pdf' ${paperPath}"fig4.pdf"
cp ${rstPath}'sigma_Fig5.pdf' ${paperPath}"fig5.pdf"
cp ${rstPath}'sigma_Fig6.pdf' ${paperPath}"fig6.pdf"
cp ${rstPath}'sigma_Fig7.pdf' ${paperPath}"fig7.pdf"
cp ${rstPath}'sigma_Fig8.pdf' ${paperPath}"fig8.pdf"
cp ${rstPath}'sigma_Fig9.pdf' ${paperPath}"fig9.pdf"
cp ${rstPath}'sigma_Fig10.pdf' ${paperPath}"fig10.pdf"
# 复制表格
cp ${rstPath}'Ge_Baryons_rela_L_0.90_ci_1.50_series_o0_L_0.90_ci_1.50.pdf' ${paperPath}"fig21.pdf"
cp ${rstPath}'Gm_Baryons_rela_L_0.90_ci_1.50_series_o0_L_0.90_ci_1.50.pdf' ${paperPath}"fig22.pdf"
cp ${rstPath}'Ge_Baryons_rela_L_0.90_ci_1.50_series_o1_L_0.90_ci_1.50.pdf' ${paperPath}"fig23.pdf"
cp ${rstPath}'Gm_Baryons_rela_L_0.90_ci_1.50_series_o1_L_0.90_ci_1.50.pdf' ${paperPath}"fig24.pdf"

# cd $paperPath                # cd 到论文目录
# lyx --export xetex sigma.lyx # 将 lyx 文档导出成xetex 格式
# texbuild sigma               #重新编译论文, texbuild 是我自己写的 xelatex 编译脚本

# #++++++下面是复制不要文件到 ~/Documents 目录 +++++++++++++++++++++++++++
# # 如果桌面还没有压缩文件目录，就创建一个
# if [ ! -d $archPath ]; then
#     mkdir -p $archPath
# fi
# # 把论文目录的东西复制到桌面目录中
# declare -a src_list=(fig*.pdf 'sigma.lyx' 'sigma.tex' 'sigma.pdf')
# cp -t $archPath ${src_list[@]}
# # 进入桌面目录，产生论文压缩文件
# cd $archPath
# tar -vczf paper.tgz ${src_list[@]}
# # 回到原来的文件夹
# cd $originPath
