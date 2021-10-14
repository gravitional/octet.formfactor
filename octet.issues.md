# update

commit f3b69ad70ab3344e61fb

 sigma0 图片 legend 中的 u 改成 l
新建的画图的脚本为, f_figure_series-full_rencon3_strange_baryons-all_individual.wl, 执行对 sigma 三重子的画图任务。
也可以对别的粒子进行定制画图.

## Question

1. 图中的tree和loop乘以了Z，但表格中的tree和loop没有乘以Z。所以要乘以Z。 **solved**
2. quench sea valence 细分问题，quench sea没有问题，但同样需要乘以Z。valence 应该包含quench的贡献，同样需要乘以Z，这样valence+sea就是总贡献。valence指所有光子打在valence quark上的贡献，应包含quench的贡献，sea是指光子打在sea quark上的贡献。**solved**
3. 
4. 注意，比如对于质子，中间态为8重态时，总贡献没有pi^-的圈图，但是如果用夸克线来画，有两个图，一个是quench图，一个是sea夸克圈图，两个图加起来等于0，但是每个图都有贡献，这个也要考虑。**solved**
5. 对于sea quark的贡献，不考虑电荷（电荷都取1），从你的表格中可以看出，是不是ｕ夸克和d夸克的贡献差不多？是否就是格点文章中的G_sea^light-quark？**to solve**
6. 还有，对于sea 夸克的贡献，ｕ，d, s的图的系数是否一样，结果不同是不是因为他们的质量不同？**to solve**
7. 有些ｕ夸克在质子中与相应的d 夸克在中子中的结果不相等，是不是也是因为漏了一些图？**to solve**
8. 
9. 还有，在计算中，你用Z=1/（1+loop），所以结果等于Z*（tree+loop）。也可以用Z=1-loop，结果=Z* tree + loop。两种方法可能对于ｕ和d结果差不多，但是对于s夸克，因为只有圈图贡献，会不会差很多？差Z倍？你可以看一下。
10. 另外对于格点文章中的G_sea^light-quark，如果不明白，可以问一下他们作者，是ｕ夸克的贡献，还是d夸克的贡献，还是轻夸克的总贡献，是怎么得到了，有没有假定ｕ和d 的贡献一样（不考虑电荷）？**to solve**



## Answer

5. https://arxiv.org/pdf/1705.05849.pdf page 2 是格点文章中的G_sea^light-quark

By performing a first-principles calculation, we find that the total contribution of the light (up and down) and strange disconnected-sea quarks to the nucleon mean square charge radius is negative and significant

4 ![Lattice results](C:\Users\Tom\Desktop\{406F40C6-69BE-4E49-934E-7297DB7C0B4A}.png)

![](C:\Users\Tom\Desktop\{5BE3C58C-3779-46F2-A38B-3DF15FFEA44F}.png)



5，6，7是同一个问题，需要考虑额外虚拟粒子的quarkflow图