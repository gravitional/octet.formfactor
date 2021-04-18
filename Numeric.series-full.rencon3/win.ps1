## powershell script

## 开始主要测试
$order = 'full'
$prcs = '`20'
$wlscript = '.\e.Numeric.series-full.rencon3.strange.wl'
$fitting = 'Baryons'
$errobarQ = 'L_0.90_ci_1.50'

## start the ci=1.0 numeric
${lambdaList} = @('0.80', '0.90', '1.00')

foreach (${lambda} in $lambdaList) {
    wolframscript.exe -print 'all' -file $wlscript $order (${lambda} + ${prcs}) ('1.00' + ${prcs}) ${fitting} ${errobarQ}
    Start-Sleep -Seconds 2
}

## start the ci=1.5 numeric
foreach (${lambda} in $lambdaList) {
    wolframscript.exe -print 'all' -file $wlscript $order (${lambda} + ${prcs})   ('1.50' + ${prcs})  ${fitting} ${errobarQ}
    Start-Sleep -Seconds 2
}


# $order = 'full'
# $prcs = '`20'
# $wlscript = '.\e.Numeric.series-full.rencon3.strange.wl'
# $fitting = 'Baryons'
# $errobarQ = 'notbar'

# ## start the ci=1.0 numeric
# ${lambdaList} = @('0.80', '0.82', '0.84', '0.86', '0.88', '0.90', '0.92', '0.94', '0.96', '0.98', '1.00')

# foreach (${lambda} in $lambdaList) {
#     wolframscript -print 'all' -file $wlscript $order (${lambda} + ${prcs}) ('1.00' + ${prcs}) ${fitting} ${errobarQ}
#     Start-Sleep -Seconds 2
# }

# ## start the ci=1.5 numeric
# foreach (${lambda} in $lambdaList) {
#     wolframscript -print 'all' -file $wlscript $order (${lambda} + ${prcs})   ('1.50' + ${prcs})  ${fitting} ${errobarQ}
#     Start-Sleep -Seconds 2
# }

## 对ci 变动的测试
#$ciList=@( '1.05','1.10','1.15','1.20','1.25','1.30','1.35','1.40','1.45' )
#foreach ($ci in ${ciList}){
#    wolframscript -print 'all' -file $wlscript   $order  ('0.90'+${prcs})  (${ci}+${prcs}) ${fitting} ${errobarQ}
# Start-Sleep -Seconds 2
#}

## 原型
# #wolframscript -print 'all' -file '.\e.Numeric.series-full.rencon3.strange.wl'  'full' ('0.90'+'`20')  ('1.00'+'`20') 'Baryons'  'notbar'
