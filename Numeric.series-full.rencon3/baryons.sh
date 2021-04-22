#!/usr/bin/env bash

## 开始主要测试
order='full'
prcs='`20'
wlscript='./e.Numeric.series-full.rencon3.strange.wl'
fitting='Baryons'
errobarQ='notbar'

## start the ci=1.0 numeric
declare -a lambdaList=('0.80' '0.90' '1.00')

for lambda in "${lambdaList[@]}"; do
    wolframscript -print 'all' -file $wlscript $order ${lambda}${prcs} '1.00'${prcs} ${fitting} ${errobarQ}
    sleep 2
done

# start the ci=1.5 numeric
for lambda in "${lambdaList[@]}"; do
    wolframscript -print 'all' -file $wlscript $order ${lambda}${prcs} '1.50'${prcs} ${fitting} ${errobarQ}
    sleep 2
done

## 原型
## wolframscript -print 'all' -file './e.Numeric.series-full.rencon3.strange.wl' 'full' '0.90`20' '1.00`20' 'Baryons' 'notbar'
