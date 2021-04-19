(* ::Package:: *)

(* ::Title:: *)
(*f.table.series-o0.rencon3.strange.baryons-all.wl*)


(* ::Chapter:: *)
(*initial 1*)


gitRemoteName="octet.formfactor";(*\:7ed9\:51fa\:8fdc\:7a0bgit\:4ed3\:5e93\:7684\:540d\:5b57*)
cmdQ=Not[$Notebooks];(*\:811a\:672c\:7684\:8fd0\:884c\:6a21\:5f0f\:5224\:65ad\:ff0cTrue\:4ee3\:8868\:547d\:4ee4\:884c\:ff0cFalse\:4ee3\:8868\:524d\:7aef*)
fileName=If[Not[cmdQ],NotebookFileName[],$InputFileName](*\:7ed9\:51fa\:7b14\:8bb0\:672c\:7684\:7edd\:5bf9\:8def\:5f84*)
enString[x__]:=StringJoin[ToString[#1]&/@Flatten[{x}]](*\:5b9a\:4e49\:4e00\:4e2a\:786e\:4fdd\:5b57\:7b26\:4e32\:7684\:51fd\:6570*)
If[cmdQ,
echo[x__]:=Print["----------------------------","\n\033[1;44m\033[1;37m",enStr[x],"\033[0;0m\n","----------------------------"],(*\:5b9a\:4e49\:7ec8\:7aef\:7684\:6253\:5370\:51fd\:6570*)
echo[x__]:=Print[x](*\:5b9a\:4e49\:7b14\:8bb0\:672c\:7684\:6253\:5370\:51fd\:6570*)
]
(*\:5982\:679c\:5728\:524d\:7aef\:6267\:884c\:ff0c\:5c31\:5237\:65b0\:7b14\:8bb0\:672c\:7684\:540d\:5b57*)
Once[If[
(* if $ScriptCommandLine==={}, the environment is frontend*)
Not[cmdQ],
(*if execute in the frontend mode, refresh the title name*)
CompoundExpression[
cellTitle=(Cells[]//First),(*\:5355\:5143\:5bf9\:8c61,\:7b2c\:4e00\:4e2a\:5355\:5143*)
NotebookWrite[cellTitle,Cell[FileNameSplit[fileName][[-1]],"Title"]](*\:5237\:65b0\:7b2c\:4e00\:4e2a\:5355\:5143\:7684\:540d\:5b57*)
]
]];
If[cmdQ,echo["Ready to execute this script"]](*\:5982\:679c\:5728\:547d\:4ee4\:884c\:6267\:884c\:ff0c\:5c31\:6253\:5370\:63d0\:793a\:4fe1\:606f*)
echo["the gitLocalName is"]
gitLocalName=FileNameJoin[Append[TakeWhile[FileNameSplit[ExpandFileName[fileName]],UnsameQ[#1,gitRemoteName]&],gitRemoteName]](*\:5b9a\:4e49\:672c\:5730git\:76ee\:5f55\:ff0c\:4e5f\:5c31\:662f\:7a0b\:5e8f\:7684\:6839\:76ee\:5f55*)


(* ::Chapter:: *)
(*initial parameters*)


(*\:6a21\:62df\:547d\:4ee4\:884c\:8f93\:5165\:ff0c\:8c03\:8bd5\:4f7f\:7528*)
inputSim={"/home/tom/octet.formfactor/f.table.series-o0.rencon3.strange.baryons-all.wl",
"o0",0.80`20,1.50`20,"Baryons","notbar"};
If[cmdQ,
inputCml=$ScriptCommandLine,(*\:5982\:679c\:5728\:547d\:4ee4\:884c\:6267\:884c\:ff0c\:5c31\:91c7\:7528\:547d\:4ee4\:884c\:53c2\:6570*)
inputCml=inputSim(*\:5982\:679c\:5728\:7b14\:8bb0\:672c\:6267\:884c\:ff0c\:5c31\:91c7\:7528\:6a21\:62df\:53c2\:6570*)
];
echo["the parameter:order,lambda,ci,fitting"];(*\:5c55\:793a\:63a5\:53d7\:5230\:7684\:53c2\:6570*)
{fileName,parOrder,parLambda0,parci,cFitting,errorbarQ}={
inputCml[[1]],inputCml[[2]],
ToExpression[inputCml[[3]]],ToExpression[inputCml[[4]]],
inputCml[[5]],inputCml[[6]]
}
parOrderStr=ToString[parOrder];
parLambda0Str=ToString[NumberForm[parLambda0,{3,2}]];
parciStr=ToString[NumberForm[parci,{3,2}]];
cFittingStr=enString[cFitting];
errorbarQStr=enString[errorbarQ];
(*\:68c0\:67e5\:8f93\:5165\:7684\:53c2\:6570\:662f\:5426\:5408\:6cd5*)
If[Not[StringMatchQ[cFittingStr,{"Sigma1","Sigma2","Nucleon","Cascade","Baryons"}]&&StringMatchQ[errorbarQStr,{"notbar" ,"L_"~~NumberString~~"_ci_"~~NumberString}]],
(*eg."L_0.90_ci_1.50"*)
echo["Please check the input parameters"];Abort[]
]


(* ::Chapter:: *)
(*import *)


centerQ=StringMatchQ[parLambda0Str,"0.90"] && StringMatchQ[parciStr,("1.00"|"1.50")];(*\:662f\:5426\:662f\:7279\:5b9a\:7684\:4e2d\:5fc3\:914d\:7f6e*)
parLambda0GroupStr=If[centerQ,
{
ToString[NumberForm[parLambda0-0.1,{3,2}]],(*\:5bf9\:4e8e0.90,\:4e5f\:5c31\:662f\:4e2d\:5fc3\:503c\:7684\:60c5\:51b5\:ff0c\:8003\:8651\:504f\:5dee0.1\:7684\:53e6\:5916\:4e24\:4e2a\:914d\:7f6e*)
ToString[NumberForm[parLambda0,{3,2}]],
ToString[NumberForm[parLambda0+0.1,{3,2}]]
},
{
ToString[NumberForm[parLambda0,{3,2}]],(*\:5bf9\:4e8e\:975e\:4e2d\:5fc3\:503c\:7684\:60c5\:51b5\:ff0c\:505a\:6210\:76f8\:540c\:7684\:6570\:636e\:7ed3\:6784*)
ToString[NumberForm[parLambda0,{3,2}]],
ToString[NumberForm[parLambda0,{3,2}]]
}
]
(*++++++++++++++++++++\:5bfc\:5165\:6570\:636e+++++++++++++++++++++*)
inputDir=FileNameJoin[{gitLocalName,"/expression-mfiles/"}]
echo[".m files list"];
mfileSeries=Module[{temp},
If[centerQ,
FileNames[StringExpression["data_fit_",cFittingStr,"_",errorbarQStr,"_series_",parOrderStr,"_L_",parLambda0GroupStr,"_ci_",parciStr,".m"],inputDir],
{temp=FileNames[StringExpression["data_fit_",cFittingStr,"_",errorbarQStr,"_series_",parOrderStr,"_L_",parLambda0GroupStr,"_ci_",parciStr,".m"],inputDir]//First,
temp,temp}(*\:5f3a\:884c\:5199\:6210\:4e09\:7ec4\:6570\:636e\:5e76\:5217\:7684\:5f62\:5f0f\:ff0c\:65b9\:4fbf\:7edf\:4e00\:5904\:7406*)
]
]
(dataSeriesRaw=Map[Get,mfileSeries,{-1}]);
(*dataSeriesRaw//Dimensions
dataSeriesRaw,{3,2,8,37},{conf,gegm,io,seva}*)


(* ::Chapter:: *)
(*formatting*)


(*dataSeriesRaw,{3,2,8,37},{conf,gegm,io,seva}
\:5728\:8fd9\:91cc\:6307\:5b9a\:4f5c\:56fe\:9009\:7528\:7684\:6570\:636e\:96c6\:ff0cci=1.0\:ff0cor\:ff0cci=1.5
\:6307\:5b9a\:4e2d\:5fc3\:6570\:636e\:70b9\:ff0c\:7136\:540e\:7ed9\:5b83\:52a0\:4e0a\:4e0b errorbar
\:4e2d\:5fc3\:6570\:636e\:70b9\:7684\:6307\:6807\:4e3a2*)
dataCenter=2;
dataSeries=dataSeriesRaw[[dataCenter]];
(*dataSeries//Dimensions
dataSeries,{2,8,37},{gegm,io,seva}*)


Module[{teData},(*\:5bf9\:4e8e\:603b\:8d21\:732e\:7684seva\:ff0c\:6539\:5199\:6210\:6709\:8bef\:5dee\:5e26\:7684\:5f62\:5f0f*)
gegm=2;io=1;seva=9;(*seva 9 \:662f\:603b\:8d21\:732e\:7684\:4f4d\:7f6e*)
dataSeries[[All,All,seva]]=Table[
teData=dataSeriesRaw[[All,gegm,io,seva]];
PlusMinus[teData[[2]],Mean[Abs[teData[[{1,3}]]-teData[[2]]]]]
,{gegm,1,2,1}
,{io,1,8,1}
];
]


choplimit=10^-8;(*\:5bf9\:6570\:636e\:663e\:793a\:683c\:5f0f\:5316\:7684\:7cbe\:786e\:5ea6\:63a7\:5236*)
dataSeriesTrim=Map[NumberForm[Chop[#1,choplimit],{6,3}]&,dataSeries,{-1}];
(*dataSeriesTrim//Dimensions
{2,8,37}*)


(* ::Section:: *)
(*Q2tableStyle 2*)


Q2tableRearrange=Function[{namesHorizontal,namesVertical,dataList,backGround},
Grid[(*grid start*)
Prepend[(*\:6dfb\:52a0\:6a2a\:7740\:7684\:540d\:79f0*)
MapThread[Prepend,(*\:6dfb\:52a0\:7ad6\:7740\:7684\:540d\:79f0*)
{dataList,(*\:5c06\:8981\:5c55\:793a\:7684\:6570\:636e*)namesVertical (*\:7ad6\:7740\:6392\:5217\:7684\:540d\:79f0*)}
],
namesHorizontal(*\:6a2a\:7740\:7684\:540d\:79f0\:ff0c\:5e94\:8be5+1\:ff0c\:4ee5\:5305\:62ec\:5217\:540d\:79f0*)
]
,Frame->{All,All}
,Spacings->{2,2}
,Background->backGround
,ItemSize->Full
](*grid end*)
];


namesVertical={"\[CapitalSigma]m","\[CapitalSigma]0","\[CapitalSigma]p","pr","ne","\[CapitalXi]m","\[CapitalXi]0","\[CapitalLambda]"};(*octet \:540d\:79f0\:7f29\:5199*)
namesHorizontal={
{"Ge",
(*1:*)"tree,uds",(*2:*)"tree,u",(*3:*)"tree,d",(*4:*)"tree,s",
(*5:*)"loop,uds",(*6:*)"loop,u",(*7:*)"loop,d",(*8:*)"loop,s",
(*9:*)"tree+loop,uds",(*10:*)"tree+loop,u",(*11:*)"tree+loop,d",(*12:*)"tree+loop,s",
(*13:*)"quench,u",(*14:*)"quench d",(*15:*)"quench,s",
(*16:*)"valence,u",(*17:*)"valence,d",(*18:*)"valence,s",
(*19:*)"sea,u",(*20:*)"sea,d",(*21:*)"sea,s",
(*22:*)"quench+valence,u",(*23:*)"quench+valence,d",(*24:*)"quench+valence,s",
(*25:*)"tree+quench+valence,u",(*26:*)"tree+quench+valence,d",(*27:*)"tree+quench+valence,s",
(*28:*)"(Z-1)tree+loop,uds",(*29:*)"(Z-1)tree+loop,u",(*30:*)"(Z-1)tree+loop,d",(*31:*)"(Z-1)tree+loop,s",
(*32:*)"(Z-1)tree+quench+valence,u",(*33:*)"(Z-1)tree+quench+valence,d",(*34:*)"(Z-1)tree+quench+valence,s",
(*35:*)"exprmt.",(*36:*)"lattice",(*37:*)"paper"
},
{"\[Mu]",
(*1:*)"tree,uds",(*2:*)"tree,u",(*3:*)"tree,d",(*4:*)"tree,s",
(*5:*)"loop,uds",(*6:*)"loop,u",(*7:*)"loop,d",(*8:*)"loop,s",
(*9:*)"tree+loop,uds",(*10:*)"tree+loop,u",(*11:*)"tree+loop,d",(*12:*)"tree+loop,s",
(*13:*)"quench,u",(*14:*)"quench d",(*15:*)"quench,s",
(*16:*)"valence,u",(*17:*)"valence,d",(*18:*)"valence,s",
(*19:*)"sea,u",(*20:*)"sea,d",(*21:*)"sea,s",
(*22:*)"quench+valence,u",(*23:*)"quench+valence,d",(*24:*)"quench+valence,s",
(*25:*)"tree+quench+valence,u",(*26:*)"tree+quench+valence,d",(*27:*)"tree+quench+valence,s",
(*28:*)"(Z-1)tree+loop,uds",(*29:*)"(Z-1)tree+loop,u",(*30:*)"(Z-1)tree+loop,d",(*31:*)"(Z-1)tree+loop,s",
(*32:*)"(Z-1)tree+quench+valence,u",(*33:*)"(Z-1)tree+quench+valence,d",(*34:*)"(Z-1)tree+quench+valence,s",
(*35:*)"exprmt.",(*36:*)"lattice",(*37:*)"paper"
}
};


dataBackground={
None,(* color horizontal: x1, x2, x3...*)
{
LightCyan,{None,LightBlue}
}(* color vertical: y1, y2, y3...*)
};


(* ::DisplayFormula:: *)
(*Q2tableRearrange=Function[{namesHorizontal,namesHorizontal,dataList,backGround},*)


(* ::DisplayFormula:: *)
(*dataSeries,{2,8,6},{gegm,io,seva}*)


tabFontsize=12;(*\:8868\:683c\:5b57\:4f53\:5c3a\:5bf8*)gegm=1;
seriesGeTotal=Style[
Multicolumn[
{(* Multicolumn\:7684\:53c2\:6570\:9700\:8981\:4e00\:4e2a{}*)
(*+++++++++++++++++++++++++sea-valence part  +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++*)
Q2tableRearrange[
namesHorizontal[[gegm]],(*\:6a2a\:7740\:7684\:540d\:79f0*)
namesVertical,(*\:7ad6\:7740\:7684\:540d\:79f0*)
(*****************************data list start********************************)
dataSeriesTrim[[gegm]],
(********************************start backGround*******************************************)
dataBackground
]
(*+++++++++++++++++++++++++sea-valence part  +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++*)
}
,1
]
,FontSize->tabFontsize
];
If[!cmdQ,Print[seriesGeTotal]]


gegm=2;
seriesGmTotal=Style[
Multicolumn[
{(* paras of column need an {} *)
(*+++++++++++++++++++++++++sea-valence part  +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++*)
Q2tableRearrange[(*legend name*)
namesHorizontal[[gegm]],(*column name*)
namesVertical,(*row name*)
(*****************************data list start********************************)
dataSeriesTrim[[gegm]],
(********************************start backGround*******************************************)
dataBackground
]
(*+++++++++++++++++++++++++sea-valence part  +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++*)
}
,1
]
,FontSize->tabFontsize
];
If[!cmdQ,Print[seriesGmTotal]]


(* ::Chapter:: *)
(*storage*)


echo["output directory"];
outputDir=FileNameJoin[{gitLocalName,"/expression-results/"}]
echo["files to export"];(*\:8981\:5bfc\:51fa\:7684\:6587\:4ef6,\:5173\:8054\:7684\:5f62\:5f0f\:ff0c\:4fdd\:5b58\:7528\:7684\:6587\:4ef6\:540d\[Rule]\:5bf9\:5e94\:7684\:6587\:4ef6*)
outputAssoc=<|
(*++++++++++++++++*)
FileNameJoin[{outputDir,StringJoin[{"Ge_",cFittingStr,"_",errorbarQStr,"_series_",parOrderStr,"_L_",parLambda0Str,"_ci_",parciStr,".pdf"}]}]->seriesGeTotal,
FileNameJoin[{outputDir,StringJoin[{"Gm_",cFittingStr,"_",errorbarQStr,"_series_",parOrderStr,"_L_",parLambda0Str,"_ci_",parciStr,".pdf"}]}]->seriesGmTotal
(*++++++++++++++++*)
|>;
echo["output status"];
KeyValueMap[Export,outputAssoc]
