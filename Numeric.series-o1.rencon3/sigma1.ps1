## powershell script

## 开始主要测试
$order = 'o1'
$prcs = '`20'
$wlscript = '.\e.Numeric.series-o1.rencon3.strange.sea-valence.mass-limit.wl'
$fitting = 'Sigma1'

Get-Date
## start the ci=1.0 numeric
$errobarQ = 'notbar'
${lambdaList} = @('0.80', '0.90', '1.00')
foreach (${lambda} in $lambdaList) {
    wolframscript.exe -print 'all' -file $wlscript $order (${lambda} + ${prcs}) ('1.00' + ${prcs}) ${fitting} ${errobarQ}
    Get-Date
}

## start the ci=1.5 numeric
$errobarQ = 'notbar'
foreach (${lambda} in $lambdaList) {
    wolframscript.exe -print 'all' -file $wlscript $order (${lambda} + ${prcs})   ('1.50' + ${prcs})  ${fitting} ${errobarQ}
    Get-Date
}

## 原型
# #wolframscript -print 'all' -file '.\e.Numeric.series-full.rencon3.strange.wl'  'full' ('0.90'+'`20')  ('1.00'+'`20') 'Sigma1'  'notbar'
