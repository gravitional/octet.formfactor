#!/usr/bin/env bash

order='o0'
prcs='`20'
wlscript='./e.Numeric.series-o0.rencon3.strange.sea-valence.mass-limit.wl'
fitting='Baryons'
errobarQ='notbar'

## start the ci=1.0 numeric
declare -a lambdaList=('0.80' '0.82' '0.84' '0.86' '0.88' '0.90' '0.92' '0.94' '0.96' '0.98' '1.00')

for lambda in "${lambdaList[@]}"; do
    wolframscript -print 'all' -file $wlscript $order ${lambda}${prcs} '1.00'${prcs} ${fitting} ${errobarQ}
    echo $(date)
done

## start the ci=1.5 numeric
for lambda in "${lambdaList[@]}"; do
    wolframscript -print 'all' -file $wlscript $order ${lambda}${prcs} '1.50'${prcs} ${fitting} ${errobarQ}
    echo $(date)
done

# ## 对ci 变动的测试
# declare -a ciList=('1.05' '1.10' '1.15' '1.20' '1.25' '1.30' '1.35' '1.40' '1.45')
# for ci in "${ciList[@]}"; do
#     wolframscript -print 'all' -file $wlscript $order '0.90'${prcs} ${ci}${prcs} ${fitting} ${errobarQ}
#     sleep 2
# done

## 原型
## wolframscript -print 'all' -file './e.Numeric.series-o0.rencon3.strange.sea-valence.mass-limit.wl' 'o0' '0.90`20' '1.00`20' 'Baryons' 'notbar'