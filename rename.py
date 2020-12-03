#!/usr/bin/env python3
import os,shutil,time,gfm
# 复制到论文中的都是 ci==1.50 的结果
user_name='tom'
# 配置计算结果目录，论文目录，论文压缩文件目录
originpath=os.getcwd()
result_path=os.path.join(originpath,'expression-results/')
paper_path=os.path.join('/home',user_name,'private','paper_2_prd/')
desk_path=os.path.join('/home',user_name,'Desktop','paper_ff/')
# 复制计算结果到论文目录
shutil.copy(os.path.join(result_path,'fig.baryons.ge.charge.L-0.90.ci-1.50.pdf'),os.path.join(paper_path,'fig4.pdf')) 
shutil.copy(os.path.join(result_path,'fig.baryons.ge.neutral.L-0.90.ci-1.50.pdf'),os.path.join(paper_path,'fig5.pdf')) 
shutil.copy(os.path.join(result_path,'fig.baryons.gm.charge.L-0.90.ci-1.50.pdf'),os.path.join(paper_path,'fig2.pdf')) 
shutil.copy(os.path.join(result_path,'fig.baryons.gm.neutral.L-0.90.ci-1.50.pdf'),os.path.join(paper_path,'fig3.pdf')) 
# cd 到论文目录，重新编译论文
os.chdir(paper_path)
# 清除之前的编译结果，重新编译
os.system('latexmk -C')
os.system('texbuild')
# 如果桌面有压缩文件目录，就删除，shutil.copytree需要目标不存在
src_list=['fig1.pdf','fig2.pdf','fig3.pdf','fig4.pdf','fig5.pdf','octetFF.tex','octetFF.pdf']
# 把论文目录的东西复制到桌面目录中
if  os.path.isdir(desk_path):
    for src in src_list:
        shutil.copy2(src,desk_path)
else:
    os.mkdir(desk_path)
    for src in src_list:
        shutil.copy2(src,desk_path)

## 切换到桌面整理目录
os.chdir(desk_path)

print("+++++++\nthe file left in",os.getcwd(),"\n+++++++")
os.listdir(desk_path)

# 产生论文压缩文件
os.system('rm ../paper.7z; 7z a ../paper.7z '+desk_path)
# 回到原来的文件夹
os.listdir(originpath)
