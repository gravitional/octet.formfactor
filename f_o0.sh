#!/usr/bin/env bash

order='o0'
prcs='`20'
wlscript='./f.table.series-o0.rencon3.strange.baryons-all.wl'
fitting='Baryons'
errobarQ='notbar'

## start the ci=1.0 numeric
declare -a lambdaList=('0.80' '0.90' '1.00')

for lambda in "${lambdaList[@]}"; do
    wolframscript -print 'all' -file $wlscript $order ${lambda}${prcs} '1.00'${prcs} ${fitting} ${errobarQ}
    echo $(date)
done

## start the ci=1.5 numeric
for lambda in "${lambdaList[@]}"; do
    wolframscript -print 'all' -file $wlscript $order ${lambda}${prcs} '1.50'${prcs} ${fitting} ${errobarQ}
    echo $(date)
done