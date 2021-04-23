#!/usr/bin/env bash

## 开始主要测试
order='full'
prcs='`20'
wlscript='./e.Numeric.series-full.rencon3.strange.wl'
fitting='Baryons'

## start the ci=1.0 numeric
# errobarQ='L_0.90_ci_1.00'
# declare -a lambdaList=('0.80' '1.00')

# for lambda in "${lambdaList[@]}"; do
#     wolframscript -print 'all' -file $wlscript $order ${lambda}${prcs} '1.00'${prcs} ${fitting} ${errobarQ}
#     sleep 2
# done

# # start the ci=1.5 numeric
errobarQ='L_0.90_ci_1.50'
declare -a lambdaList=('0.80' '1.00')
for lambda in "${lambdaList[@]}"; do
    wolframscript -print 'all' -file $wlscript $order ${lambda}${prcs} '1.50'${prcs} ${fitting} ${errobarQ}
    sleep 2
done

## 原型
## wolframscript -print 'all' -file './e.Numeric.series-full.rencon3.strange.wl' 'full' '0.80`20' '1.00`20' 'Baryons' 'L_0.90_ci_1.00'