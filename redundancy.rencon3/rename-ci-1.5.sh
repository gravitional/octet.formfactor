#!/bin/bash

# 复制到论文中的都是 ci==1.50 的结果
user_name=$(whoami)
# 配置计算结果目录，论文目录，论文压缩文件目录
originpath=$(pwd)
paperpath="/home/${user_name}/private/paper-2.prd/"
deskpath="/home/${user_name}/Desktop/paper.ff/"
# 复制计算结果到论文目录
cp "fig.baryons.ge.charge.L-0.90.ci-1.50.pdf"  ${paperpath}"fig4.pdf"
cp "fig.baryons.ge.neutral.L-0.90.ci-1.50.pdf" ${paperpath}"fig5.pdf"
cp "fig.baryons.gm.charge.L-0.90.ci-1.50.pdf" ${paperpath}"fig2.pdf"
cp "fig.baryons.gm.neutral.L-0.90.ci-1.50.pdf" ${paperpath}"fig3.pdf"
# cd 到论文目录，重新编译论文
cd $paperpath
# 我自己写的xelatex 编译脚本
texbuild
# 如果桌面还没有压缩文件目录，就创建一个
if [ ! -d $deskpath ];then
      mkdir -p $deskpath
fi
# 把论文目录的东西复制到桌面目录中
cp  ./* $deskpath 
# 进入桌面目录，删除tex编译过程中的额外文件
cd $deskpath 
echo -e '\n delete auxilary files \n'
for rmtype in aux lof log lot fls out toc fmt fot cb cb2 ptc xdv fdb_latexmk synctex.gz  swp ps1 sh bib bbl blg 
do
    rm *.${rmtype}
done
# 产生论文压缩文件
7z a ../paper.7z $deskpath
# 回到原来的文件夹
cd $originpath 
