#!/usr/bin/env bash

# 要复制到论文中的结果
user_name=$(whoami)
# 配置计算结果目录，论文目录，论文压缩文件目录
rstPath="/home/${user_name}/octet.formfactor/expression-results/"
originPath=$(pwd)
paperPath="/home/${user_name}/private/my_papers/sigma/"
archPath="/home/${user_name}/Documents/sigma1/"
# 复制计算结果到论文目录
cp ${rstPath}'norm_1_gegm_1_seva_19 ;; 21_io_1_fit_Baryons_rela_L_0.90_ci_1.50_series_full_L_0.90_ci_1.50.pdf' ${paperPath}"io-1_ge_sea.pdf"
cp ${rstPath}'norm_1_gegm_1_seva_22 ;; 24_io_1_fit_Baryons_rela_L_0.90_ci_1.50_series_full_L_0.90_ci_1.50.pdf' ${paperPath}"io-1_ge_valence.pdf"
cp ${rstPath}'norm_1_gegm_2_seva_19 ;; 21_io_1_fit_Baryons_rela_L_0.90_ci_1.50_series_full_L_0.90_ci_1.50.pdf' ${paperPath}"io-1_gm_sea.pdf"
cp ${rstPath}'norm_1_gegm_2_seva_22 ;; 24_io_1_fit_Baryons_rela_L_0.90_ci_1.50_series_full_L_0.90_ci_1.50.pdf' ${paperPath}"io-1_gm_valence.pdf"

# cd $paperPath                # cd 到论文目录
# lyx --export xetex sigma.lyx # 将 lyx 文档导出成xetex 格式
# texbuild sigma               #重新编译论文, texbuild 是我自己写的 xelatex 编译脚本

##++++++下面是复制不要文件到 ~/Documents 目录 +++++++++++++++++++++++++++
# # 如果桌面还没有压缩文件目录，就创建一个
# if [ ! -d $archPath ]; then
#     mkdir -p $archPath
# fi
# # 把论文目录的东西复制到桌面目录中
# declare -a src_list=('io-1_ge_sea.pdf' 'io-1_ge_valence.pdf' 'io-1_gm_sea.pdf' 'io-1_gm_valence.pdf' 'sigma.tex' 'sigma.pdf')
# cp -t $archPath "$src_list{@}"
# # 进入桌面目录，产生论文压缩文件
# cd $archPath
# tar -vczf ./paper.tar.gz $archPath
# # 回到原来的文件夹
# cd $originPath
