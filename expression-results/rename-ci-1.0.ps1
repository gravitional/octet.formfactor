$tepath="C:\repo-private\paper-2.prd.ci-1.0\"


Copy-Item "series``o0``gm``total.ci-1.0.pdf" (Join-Path $tepath "fig2.pdf")
Copy-Item "series``o1``ge``total.ci-1.0.pdf" (Join-Path $tepath "fig3.pdf")
Copy-Item "series``o1``gm``total.ci-1.0.pdf" (Join-Path $tepath "fig4.pdf")
copy-item "fig``baryons``ge``charge.ed3.ci-1.0.pdf" (Join-Path $tepath "fig5.pdf")
Copy-Item "fig``baryons``ge``neutral.ed3.ci-1.0.pdf" (Join-Path $tepath "fig6.pdf")
Copy-Item "fig``baryons``gm``charge.ed3.ci-1.0.pdf" (Join-Path $tepath "fig7.pdf")
Copy-Item "fig``baryons``gm``neutral.ed3.ci-1.0.pdf" (Join-Path $tepath "fig8.pdf")


Copy-Item "series``o0``check``gm``total.ci-1.0.pdf" (Join-Path $tepath "fig2a.pdf")
Copy-Item "series``o1``check``ge``total.ci-1.0.pdf" (Join-Path $tepath "fig3a.pdf")
Copy-Item "series``o1``check``gm``total.ci-1.0.pdf" (Join-Path $tepath "fig4a.pdf")
