#!/usr/bin/env bash

order='o1'
prcs='`20'
wlscript='./e.Numeric.series-o1.rencon3.strange.sea-valence.mass-limit.wl'
fitting='Sigma1'
errobarQ='notbar'

echo -e "\n\n$(date)"
# ## start the ci=1.0 numeric
declare -a lambdaList=('0.80' '0.90' '1.00')
for lambda in "${lambdaList[@]}"; do
    wolframscript -print 'all' -file $wlscript $order ${lambda}${prcs} '1.00'${prcs} ${fitting} ${errobarQ}
    echo -e "\n\n$(date)"
done

## start the ci=1.5 numeric
declare -a lambdaList=('0.80' '0.90' '1.00')
for lambda in "${lambdaList[@]}"; do
    wolframscript -print 'all' -file $wlscript $order ${lambda}${prcs} '1.50'${prcs} ${fitting} ${errobarQ}
    echo -e "\n\n$(date)"
done

## 原型
## wolframscript -print 'all' -file './e.Numeric.series-o1.rencon3.strange.sea-valence.mass-limit.wl' 'o1' '0.90`20' '1.00`20' 'Sigma1' 'notbar'