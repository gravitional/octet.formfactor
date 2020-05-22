$tepath="C:\repo-private\paper-2.prd\"


copy-item "fig.baryons.ge.charge.L-0.90.ci-1.50.pdf" (Join-Path $tepath "fig4.pdf")
Copy-Item "fig.baryons.ge.neutral.L-0.90.ci-1.50.pdf" (Join-Path $tepath "fig5.pdf")
Copy-Item "fig.baryons.gm.charge.L-0.90.ci-1.50.pdf" (Join-Path $tepath "fig2.pdf")
Copy-Item "fig.baryons.gm.neutral.L-0.90.ci-1.50.pdf" (Join-Path $tepath "fig3.pdf")

cd $tepath
.\build.ps1

cd C:\octet.formfactor\expression-results
