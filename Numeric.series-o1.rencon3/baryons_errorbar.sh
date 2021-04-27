#!/usr/bin/env bash

order='o1'
prcs='`20'
wlscript='./e.Numeric.series-o1.rencon3.strange.sea-valence.mass-limit.wl'
fitting='Baryons'
errobarQ='notbar'

echo -e "\n\n$(date)"
## start the ci=1.0 numeric
errobarQ='L_0.90_ci_1.00'
declare -a lambdaList=('0.80' '1.00')
for lambda in "${lambdaList[@]}"; do
    wolframscript -print 'all' -file $wlscript $order ${lambda}${prcs} '1.00'${prcs} ${fitting} ${errobarQ}
    echo -e "\n\n$(date)"
done

# start the ci=1.5 numeric
errobarQ='L_0.90_ci_1.50'
for lambda in "${lambdaList[@]}"; do
    wolframscript -print 'all' -file $wlscript $order ${lambda}${prcs} '1.50'${prcs} ${fitting} ${errobarQ}
    echo -e "\n\n$(date)"
done

## 原型
## wolframscript -print 'all' -file './e.Numeric.series-o1.rencon3.strange.sea-valence.mass-limit.wl' 'o1' '0.80`20' '1.00`20' 'Baryons' ''L_0.90_ci_1.00''
