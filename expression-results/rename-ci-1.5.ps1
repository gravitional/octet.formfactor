$originpath=Get-Location;

$paperpath='C:\private\paper-2.prd\'

$deskpath='C:\Users\Thomas\Desktop\paper.ff\'

copy-item "fig.baryons.ge.charge.L-0.90.ci-1.50.pdf" (Join-Path $paperpath "fig4.pdf")
Copy-Item "fig.baryons.ge.neutral.L-0.90.ci-1.50.pdf" (Join-Path $paperpath "fig5.pdf")
Copy-Item "fig.baryons.gm.charge.L-0.90.ci-1.50.pdf" (Join-Path $paperpath "fig2.pdf")
Copy-Item "fig.baryons.gm.neutral.L-0.90.ci-1.50.pdf" (Join-Path $paperpath "fig3.pdf")

cd $paperpath
.\build.ps1

if(-not ( Test-Path $deskpath )){ mkdir $deskpath } else {}
copy-item .\* -Destination $deskpath -Force

cd $deskpath 

remove-item -Path ('.\temp\','.\*.aux','.\*.lof','.\*.log','.\*.lot','.\*.fls','.\*.out','.\*.toc','.\*.fmt','.\*.fot','.\*.cb','.\*.cb2','.\*.ptc','.\*.xdv','.\*.fdb_latexmk','.\*.synctex.gz','.\*.swp','.\*.ps1','.\*.bib','.\*.bbl','.\*.blg')

7z a ..\paper.7z $deskpath

cd $originpath 


