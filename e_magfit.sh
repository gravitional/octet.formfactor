#!/usr/bin/env bash

order="o0"
prcs='20'
wlscript='./e_Numeric_recon3_check.wls'

wolframscript -print "all" -file $wlscript $order   '0.90`'${prcs}   '1.00`'${prcs}
wolframscript -print "all" -file $wlscript $order   '0.90`'${prcs}   '1.05`'${prcs}
wolframscript -print "all" -file $wlscript $order   '0.90`'${prcs}   '1.10`'${prcs}
wolframscript -print "all" -file $wlscript $order   '0.90`'${prcs}   '1.15`'${prcs}
wolframscript -print "all" -file $wlscript $order   '0.90`'${prcs}   '1.20`'${prcs}
wolframscript -print "all" -file $wlscript $order   '0.90`'${prcs}   '1.25`'${prcs}
wolframscript -print "all" -file $wlscript $order   '0.90`'${prcs}   '1.30`'${prcs}
wolframscript -print "all" -file $wlscript $order   '0.90`'${prcs}   '1.35`'${prcs}
wolframscript -print "all" -file $wlscript $order   '0.90`'${prcs}   '1.40`'${prcs}
wolframscript -print "all" -file $wlscript $order   '0.90`'${prcs}   '1.45`'${prcs}
wolframscript -print "all" -file $wlscript $order   '0.90`'${prcs}   '1.50`'${prcs}
#####################   
wolframscript -print "all" -file $wlscript $order   '0.80`'${prcs}   '1.00`'${prcs}
wolframscript -print "all" -file $wlscript $order   '0.82`'${prcs}   '1.00`'${prcs}
wolframscript -print "all" -file $wlscript $order   '0.84`'${prcs}   '1.00`'${prcs}
wolframscript -print "all" -file $wlscript $order   '0.86`'${prcs}   '1.00`'${prcs}
wolframscript -print "all" -file $wlscript $order   '0.88`'${prcs}   '1.00`'${prcs}
wolframscript -print "all" -file $wlscript $order   '0.92`'${prcs}   '1.00`'${prcs}
wolframscript -print "all" -file $wlscript $order   '0.94`'${prcs}   '1.00`'${prcs}
wolframscript -print "all" -file $wlscript $order   '0.96`'${prcs}   '1.00`'${prcs}
wolframscript -print "all" -file $wlscript $order   '0.98`'${prcs}   '1.00`'${prcs}
wolframscript -print "all" -file $wlscript $order   '1.00`'${prcs}   '1.00`'${prcs}
####################
wolframscript -print "all" -file $wlscript $order   '0.80`'${prcs}   '1.50`'${prcs}
wolframscript -print "all" -file $wlscript $order   '0.82`'${prcs}   '1.50`'${prcs}
wolframscript -print "all" -file $wlscript $order   '0.84`'${prcs}   '1.50`'${prcs}
wolframscript -print "all" -file $wlscript $order   '0.86`'${prcs}   '1.50`'${prcs}
wolframscript -print "all" -file $wlscript $order   '0.88`'${prcs}   '1.50`'${prcs}
wolframscript -print "all" -file $wlscript $order   '0.92`'${prcs}   '1.50`'${prcs}
wolframscript -print "all" -file $wlscript $order   '0.94`'${prcs}   '1.50`'${prcs}
wolframscript -print "all" -file $wlscript $order   '0.96`'${prcs}   '1.50`'${prcs}
wolframscript -print "all" -file $wlscript $order   '0.98`'${prcs}   '1.50`'${prcs}
wolframscript -print "all" -file $wlscript $order   '1.00`'${prcs}   '1.50`'${prcs}