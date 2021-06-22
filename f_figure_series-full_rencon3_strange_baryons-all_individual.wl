(* ::Package:: *)

(* ::Title:: *)
(*f_figure_series-full_rencon3_strange_baryons-all_individual.wl*)


(* ::Text:: *)
(*\:8fd9\:4e2a\:7248\:672c\:7684\:533a\:522b\:5728\:4e8e\:ff1a\:5c06\[CapitalLambda]0=0.80,0.90,1.00\:7684\:66f2\:7ebf\:5404\:81ea\:753b\:5728\:56fe\:4e0a\:ff0c\:800c\:4e0d\:662f\:753b\:6210 errorbar \:7684\:5f62\:5f0f\:3002*)


(* ::Chapter:: *)
(*initial 1*)


(*\:8ba1\:7b97\:73af\:5883\:53c2\:91cf\:ff0c\:6bd4\:5982\:8def\:5f84*)
gitRemoteName="octet.formfactor";(*\:7ed9\:51fa\:8fdc\:7a0bgit\:4ed3\:5e93\:7684\:540d\:5b57*)
cmdQ=Not[$Notebooks];(*\:811a\:672c\:7684\:8fd0\:884c\:6a21\:5f0f\:5224\:65ad\:ff0cTrue\:4ee3\:8868\:547d\:4ee4\:884c\:ff0cFalse\:4ee3\:8868\:524d\:7aef*)
fileName=If[Not[cmdQ],NotebookFileName[],$InputFileName](*\:7ed9\:51fa\:7b14\:8bb0\:672c\:7684\:7edd\:5bf9\:8def\:5f84*)
(*\:5b9a\:4e49\:4e00\:4e9b\:5e38\:7528\:7684\:51fd\:6570*)
enList[x__]:=Replace[{x},{{y__}}:>{y},{0}](*\:5b9a\:4e49\:4e00\:4e2a\:786e\:4fdd\:5217\:8868\:7684\:51fd\:6570*)
enString[x__]:=StringJoin[ToString[#1]&/@enList[x]](*\:5b9a\:4e49\:4e00\:4e2a\:786e\:4fdd\:5b57\:7b26\:4e32\:7684\:51fd\:6570*)
If[cmdQ,
echo[x__]:=Print["----------------------------","\n\033[1;44m\033[1;37m",enString[x],"\033[0;0m\n","----------------------------"],(*\:5b9a\:4e49\:7ec8\:7aef\:7684\:6253\:5370\:51fd\:6570*)
echo[x__]:=Print[x](*\:5b9a\:4e49\:7b14\:8bb0\:672c\:7684\:6253\:5370\:51fd\:6570*)
]
(*\:5982\:679c\:5728\:524d\:7aef\:6267\:884c\:ff0c\:5c31\:5237\:65b0\:7b14\:8bb0\:672c\:7684\:540d\:5b57*)
Once[If[
(* if $ScriptCommandLine==={}, the environment is frontend*)
Not[cmdQ],
(*if execute in the frontend mode, refresh the title name*)
CompoundExpression[
cellTitle=(Cells[][[1]]),(*\:5355\:5143\:5bf9\:8c61,\:7b2c\:4e00\:4e2a\:5355\:5143*)
NotebookWrite[cellTitle,Cell[FileNameSplit[fileName][[-1]],"Title"]](*\:5237\:65b0\:7b2c\:4e00\:4e2a\:5355\:5143\:7684\:540d\:5b57*)
]
]];
If[cmdQ,echo["Ready to execute this script"]](*\:5982\:679c\:5728\:547d\:4ee4\:884c\:6267\:884c\:ff0c\:5c31\:6253\:5370\:63d0\:793a\:4fe1\:606f*)
(*\:5b9a\:4e49\:672c\:5730git\:76ee\:5f55\:ff0c\:4e5f\:5c31\:662f\:7a0b\:5e8f\:7684\:6839\:76ee\:5f55*)
echo["the gitLocalName is"]
gitLocalName=FileNameJoin[Append[TakeWhile[FileNameSplit[ExpandFileName[fileName]],UnsameQ[#1,gitRemoteName]&],gitRemoteName]]


(* ::Section:: *)
(*initial parameters*)


(*\:6a21\:62df\:547d\:4ee4\:884c\:8f93\:5165,\:8c03\:8bd5\:4f7f\:7528*)
(*parMarker:"Bars","Fences","Points", "Ellipses","Bands"*)
inputSim={(*fileName=*)"/home/tom/octet.formfactor/f_figure_series-full_rencon3_strange_baryons-all_individual.wl",
(*parOrder=*)"full",(*parLambda0=*)0.90`20,(*parci=*)1.00`20,
(*calcPointOpacity=*)"{1,1,1,1,1,1,1,1,1,1,1,1}",(*exprOpacity=*)1,
(*cFitting=*)"Baryons",(*errorbarQ=*)"notbar"};
If[cmdQ,
inputCml=$ScriptCommandLine,(*\:5982\:679c\:5728\:547d\:4ee4\:884c\:6267\:884c\:ff0c\:5c31\:91c7\:7528\:547d\:4ee4\:884c\:53c2\:6570*)
inputCml=inputSim(*\:5982\:679c\:5728\:7b14\:8bb0\:672c\:6267\:884c\:ff0c\:5c31\:91c7\:7528\:6a21\:62df\:53c2\:6570*)
];
echo["the parameter:order,lambda,ci,fitting"];(*\:5c55\:793a\:63a5\:53d7\:5230\:7684\:53c2\:6570*)
{(*1=*)fileName,
(*2=*)parOrder,(*3=*)parLambda0,(*4=*)parci,
(*5=*)calcPointOpacity,(*6=*)exprOpacity,
(*7=*)cFitting,(*8=*)errorbarQ}={
inputCml[[1]],
inputCml[[2]],ToExpression[inputCml[[3]]],ToExpression[inputCml[[4]]],
ToExpression[inputCml[[5]]],ToExpression[inputCml[[6]]],
inputCml[[7]],inputCml[[8]]
}
(*\:53c2\:6570\:5904\:7406*)
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


(* ::Section:: *)
(*import data full and o0*)


(*\:5bfc\:5165 full \:7cfb\:5217\:7684\:6570\:636e\:ff0c\:56fe\:5f62\:7684\:5f62\:5f0f*)
centerQ=StringMatchQ[parLambda0Str,"0.90"] && StringMatchQ[parciStr,("1.00"|"1.50")];(*\:6d4b\:8bd5\:662f\:5426\:4e3a\:4e2d\:5fc3\:914d\:7f6e\:ff1a\[CapitalLambda]==0.90*)
parLambda0GroupStr=If[centerQ,
ToString[NumberForm[#,{3,2}]]&/@{parLambda0-0.1,parLambda0,parLambda0+0.1},(*\:5982\:679c\[CapitalLambda]\[Equal]0.90\:ff0c\:52a0\:4e0a\:8bef\:5dee\:5e26*)
ToString[NumberForm[#,{3,2}]]&/@{parLambda0,parLambda0,parLambda0}(*\:5982\:679c\[CapitalLambda]\[NotEqual]0.90\:ff0c\:4fdd\:6301\:5f62\:5f0f\:4e00\:81f4*)
]
(*++++++++++++++++++++\:5bfc\:5165\:6570\:636e+++++++++++++++++++++*)
inputDir=FileNameJoin[{gitLocalName,"/expression-mfiles/"}](*\:56fe\:7247\:6240\:5728\:7684\:76ee\:5f55*)
echo[".m files list"];
(*\:5236\:5907\:9700\:8981\:5bfc\:5165\:7684\:6587\:4ef6\:5217\:8868*)
mfileSeries=Module[{temp},
If[centerQ,
(*\:5982\:679c\[CapitalLambda]\[Equal]0.90\:ff0c\:4e24\:8fb9\:9009\:53d6 rela_L_0.90_ci_1.0\:ff0c\:4e2d\:95f4\:9009\:53d6 rela_notbar \:5373\:53ef*)
First[FileNames[#1//Echo,inputDir]]&/@{
StringExpression["data_fit_",cFittingStr,"_rela_",errorbarQStr,"_series_",parOrderStr,"_L_",parLambda0GroupStr[[1]],"_ci_",parciStr,".m"],
StringExpression["data_fit_",cFittingStr,"_rela_","notbar","_series_",parOrderStr,"_L_",parLambda0GroupStr[[2]],"_ci_",parciStr,".m"],
StringExpression["data_fit_",cFittingStr,"_rela_",errorbarQStr,"_series_",parOrderStr,"_L_",parLambda0GroupStr[[3]],"_ci_",parciStr,".m"]
},
(*\:5982\:679c\[CapitalLambda]\[NotEqual]0.90\:ff0c\:5f3a\:884c\:5199\:6210\:4e09\:7ec4\:6570\:636e\:5e76\:5217\:7684\:5f62\:5f0f\:ff0c\:65b9\:4fbf\:7edf\:4e00\:5904\:7406*)
temp=FileNames[StringExpression["data_fit_",cFittingStr,"_rela_",errorbarQStr,"_series_",parOrderStr,"_L_",parLambda0GroupStr[[1]],"_ci_",parciStr,".m"]//Echo,inputDir]//First;
{temp,temp,temp}
]
]//QuietEcho
(dataSeriesRaw=Map[Get,mfileSeries,{-1}]);
(*dataSeriesRaw//Dimensions
dataSeriesRaw,{3,2,17,8},{conf,gegm,seva,io}*)


(*\:5bfc\:5165o0\:7cfb\:5217\:ff0c\:4e5f\:5c31\:662f\:96f6\:70b9\:503c\:7684\:6587\:4ef6*)(*parLambda0GroupStr =={0.80,0.90,1.00}*)
dirSeriesO0=FileNameJoin[{gitLocalName,"/expression-mfiles/"}]
echo["Series,O0.m files list"];
(*\:5236\:5907\:9700\:8981\:5bfc\:5165\:7684\:6587\:4ef6\:5217\:8868*)
mfileSeriesO0=Module[{temp},
If[centerQ,
(*\:5982\:679c\[CapitalLambda]\[Equal]0.90\:ff0c\:4e24\:8fb9\:9009\:53d6 rela_L_0.90_ci_1.0\:ff0c\:4e2d\:95f4\:9009\:53d6 rela_notbar \:5373\:53ef*)
First[FileNames[#1//Echo,dirSeriesO0]]&/@{
StringExpression["data_fit_",cFittingStr,"_rela_",errorbarQStr,"_series_o0_L_",parLambda0GroupStr[[1]],"_ci_",parciStr,".m"],
StringExpression["data_fit_",cFittingStr,"_rela_","notbar","_series_o0_L_",parLambda0GroupStr[[2]],"_ci_",parciStr,".m"],
StringExpression["data_fit_",cFittingStr,"_rela_",errorbarQStr,"_series_o0_L_",parLambda0GroupStr[[3]],"_ci_",parciStr,".m"]
}//QuietEcho,
(*\:5982\:679c\[CapitalLambda]\[NotEqual]0.90\:ff0c\:5f3a\:884c\:5199\:6210\:4e09\:7ec4\:6570\:636e\:5e76\:5217\:7684\:5f62\:5f0f\:ff0c\:65b9\:4fbf\:7edf\:4e00\:5904\:7406*)
temp=FileNames[StringExpression["data_fit_",cFittingStr,"_rela_",errorbarQStr,"_series_o0_L_",parLambda0GroupStr[[1]],"_ci_",parciStr,".m"]//Echo,inputDir]//First;
{temp,temp,temp}
]
]
(*++++++++++++++\:5bfc\:5165\:6570\:636e+++++++++++++++++++++++++++*)
(dataSeriesO0Raw=Map[Get,mfileSeriesO0,{-1}]);
(*\:63d0\:53d6\:51fa\:5404\:4e2a\:914d\:7f6e\:4e0b\:78c1\:77e9\:7684\:503c\:ff0c\:53ea\:8981\:8ba1\:7b97\:7684total\:503c\:ff0cseva=18*)
dataSeriesO0=dataSeriesO0Raw[[conf=All,gegm=2,io=All,seva=18]];
(*dataSeriesO0//Dimensions
{3,8}*)
(*++++++++++++++\:8fd9\:91cc\:7ed9\:51fagegm\:7684\:5e45\:503c\:ff0c\:540e\:9762\:662f\:5426\:5bf9\:56fe\:7684\:6570\:636e\:8fdb\:884c\:5f52\:4e00\:5316\:4f1a\:7528\:5230+++++++++++++++++++++++++++*)
ampGegmCalc={
{ConstantArray[1,{3,8}],ConstantArray[1,{3,8}]},(*norm=1,\:96f6\:70b9\:503c\:4e0d\:5f52\:4e00\:5316*)
{ConstantArray[1,{3,8}],dataSeriesO0}(*norm=2,\:96f6\:70b9\:503c\:5f52\:4e00\:5316*)
};
(*ampGegmCalc//Dimensions
{2,2,3,8}*)


(* ::Subsection:: *)
(*rencon2.13*)


octetCharge={
(*1*)-1,(*2*)0,(*3*)1,
(*4*)1,(*5*)0,
(*6*)-1,(*7*)0,
(*8*)0
};
rencon=Table[1,{conf,1,3,1},{io,1,8,1}];
(*+++++++++++++++++renormalized according to charge+++++++++++++*)
Do[
rencon[[conf,io]]=Abs[octetCharge[[io]]-dataSeriesO0Raw[[conf,gegm=1,io,seva=5]]]
,{conf,1,3,1},{io,{1,3,4,6}}
];
rencon[[All,2]]=rencon[[All,3]];
rencon[[All,5]]=rencon[[All,4]];
rencon[[All,7]]=rencon[[All,6]];
rencon[[All,8]]=Abs[1-dataSeriesO0Raw[[conf=All,gegm=1,io=8,seva=6]]];
(*++++++++++++++++++++display+++++++++++++++++++++*)
echo["calculated renormalization constants"];
StringRiffle[rencon]


(* ::Section:: *)
(*\:8ba1\:7b97\:6570\:636e\:5904\:7406*)


(*dataSeriesRaw//Dimensions
{3,2,28,8},{conf,gegm,seva,io}*)
dataExtract[dataSeriesRaw_]:=Table[
(data@@Cases[dataSeriesRaw[[conf,gegm,seva,io]],_Line,Infinity])/.Line->Apply[Sequence]
(*\:63d0\:53d6\:51fa\:753b\:56fe\:4f7f\:7528\:7684\:5ea7\:6807\:70b9\:ff0c\:5c06\:5934\:90e8\:7684Line \:66ff\:6362\:6210 Sequence,\:6700\:5916\:5c42\:4f7f\:7528 data \:4fdd\:62a4*)
,{conf,1,3,1}
,{gegm,1,2,1}
,{seva,1,17,1}
,{io,1,8,1}
](*\:63d0\:53d6\:51fa\:539f\:59cb\:56fe\:5f62\:6570\:636e\:4e2d\:7684\:5ea7\:6807\:70b9\:4f4d\:7f6e*)
dataBaryonsRaw=dataExtract[dataSeriesRaw];
(*dataBaryonsRaw//Dimensions
{3,2,28,8},{conf,gegm,seva,io}*)


dataBaryons=Table[(*\:53bb\:9664\:91cd\:590d\:7684\:91c7\:6837\:70b9*)
DeleteDuplicates[dataBaryonsRaw[[conf,gegm,seva,io]]/.data->List](*\:89c4\:8303\:6570\:636e\:683c\:5f0f*)

,{conf,1,3,1}
,{gegm,1,2,1}
,{seva,1,17,1}
,{io,1,8,1}
];
(*dataBaryons//Dimensions
{3,2,28,8},{conf,gegm,seva,io}*)


(*\:5bf9\:6570\:636e\:4f5c\:5185\:63d2\:662f\:56e0\:4e3a\:4e2d\:5fc3\:503c\:548c\:8bef\:5dee\:5e26\:7684\:91c7\:70b9\:4f4d\:7f6e\:5e76\:4e0d\:76f8\:540c\:3002\:6570\:7ec4\:8fd8\:9700\:8981\:4f5c\:91cd\:7ec4\:3002*)
dataInterp=Table[
(Interpolation[dataBaryons[[conf,gegm,seva,io]]]/ampGegmCalc[[norm,gegm,conf,io]])@Q2(*\:5bf9\:6570\:636e\:4f5c\:5f52\:4e00\:5316*)
,{norm,1,2,1}
,{conf,1,3,1}
,{gegm,1,2,1}
,{io,1,8,1}
,{seva,1,17,1}
];
(*dataInterp//Dimensions
{2,3,2,8,17},{norm,conf,gegm,io,seva}*)


(*\:63d0\:53d6\:51fa\:6811\:56fe\:7684\:63d2\:503c\:51fd\:6570*)
treeGegm=dataInterp[[norm=All,conf=All,gegm=All,io=All,seva=1;;4]];
(*\:8ba1\:7b97 total \:8d21\:732e\:65f6\:ff0c\:7528treeGegmRencon2\:66f4\:65b9\:4fbf*)
treeGegmRencon2=Table[
treeGegm[[norm,conf,gegm,io,seva]]*rencon[[conf,io]]
,{norm,1,2,1}
,{conf,1,3,1}
,{gegm,1,2,1}
,{io,1,8,1}
,{seva,1,4,1}
];
(*\:8ba1\:7b97 loop \:8d21\:732e\:65f6\:ff0c\:7528treeGegmRencon3\:66f4\:65b9\:4fbf*)
treeGegmRencon3=Table[
treeGegm[[norm,conf,gegm,io,seva]]*(rencon[[conf,io]]-1)
,{norm,1,2,1}
,{conf,1,3,1}
,{gegm,1,2,1}
,{io,1,8,1}
,{seva,1,4,1}
];
(*\:5708\:56fe\:7684\:503c\:ff0c\:6309\:7167loop,quench, sea, valence \:6392\:5e8f*)
loopGegm=dataInterp[[norm=All,conf=All,gegm=All,io=All,seva=5;;17]];
(*\:7ed9\:51fa\:5708\:56fe\:7684\:96f6\:70b9\:503c,total = tree +(Z-1)*tree+loop*)
(*treeGegm//Dimensions
treeGegmRencon2//Dimensions
treeGegmRencon3//Dimensions
loopGegm//Dimensions*)


reSevaGegm1={
treeGegm[[All,All,All,All,1]],(*1;tree,uds*)
treeGegm[[All,All,All,All,2]],(*2;tree,u*)
treeGegm[[All,All,All,All,3]],(*3;tree,d*)
treeGegm[[All,All,All,All,4]],(*4;tree,s*)

loopGegm[[All,All,All,All,1]],(*5;loop,uds*)
loopGegm[[All,All,All,All,2]],(*6;loop,u*)
loopGegm[[All,All,All,All,3]],(*7;loop,d*)
loopGegm[[All,All,All,All,4]],(*8;loop,s*)

loopGegm[[All,All,All,All,5]],(*9;quench,u*)
loopGegm[[All,All,All,All,6]],(*10;quench,d*)
loopGegm[[All,All,All,All,7]],(*11;quench,s*)

loopGegm[[All,All,All,All,8]],(*12;valence,u*)
loopGegm[[All,All,All,All,9]],(*13;valence,d*)
loopGegm[[All,All,All,All,10]],(*14;valence,s*)

loopGegm[[All,All,All,All,11]],(*15;sea,u,*)
loopGegm[[All,All,All,All,12]],(*16;sea,d*)
loopGegm[[All,All,All,All,13]],(*17;sea,s*)

treeGegmRencon2[[All,All,All,All,1]]+loopGegm[[All,All,All,All,1]],(*18;Z*tree+loop,uds total*)
treeGegmRencon2[[All,All,All,All,2]]+loopGegm[[All,All,All,All,2]],(*19;Z*tree+loop,u*)
treeGegmRencon2[[All,All,All,All,3]]+loopGegm[[All,All,All,All,3]],(*20;Z*tree+loop,d*)
treeGegmRencon2[[All,All,All,All,4]]+loopGegm[[All,All,All,All,4]],(*21;Z*tree+loop,s*)

treeGegmRencon3[[All,All,All,All,1]]+loopGegm[[All,All,All,All,1]],(*22;(Z-1)tree+loop,uds total*)
treeGegmRencon3[[All,All,All,All,2]]+loopGegm[[All,All,All,All,2]],(*23;(Z-1)tree+loop,u*)
treeGegmRencon3[[All,All,All,All,3]]+loopGegm[[All,All,All,All,3]],(*24;(Z-1)tree+loop,d*)
treeGegmRencon3[[All,All,All,All,4]]+loopGegm[[All,All,All,All,4]],(*25;(Z-1)tree+loop,s*)

loopGegm[[All,All,All,All,5]]+loopGegm[[All,All,All,All,8]],(*26;quench+valence,u,*)
loopGegm[[All,All,All,All,6]]+loopGegm[[All,All,All,All,9]],(*27;quench+valence,d,*)
loopGegm[[All,All,All,All,7]]+loopGegm[[All,All,All,All,10]],(*28;quench+valence,s,*)

treeGegmRencon2[[All,All,All,All,2]]+loopGegm[[All,All,All,All,5]]+loopGegm[[All,All,All,All,8]],(*29;Z*tree+quench+loop,u*)
treeGegmRencon2[[All,All,All,All,3]]+loopGegm[[All,All,All,All,6]]+loopGegm[[All,All,All,All,9]],(*30;Z*tree+quench+loop,d*)
treeGegmRencon2[[All,All,All,All,4]]+loopGegm[[All,All,All,All,7]]+loopGegm[[All,All,All,All,10]],(*31;Z*tree+quench+loop,s*)

treeGegmRencon3[[All,All,All,All,2]]+loopGegm[[All,All,All,All,5]]+loopGegm[[All,All,All,All,8]],(*32;Z*tree+quench+loop,u*)
treeGegmRencon3[[All,All,All,All,3]]+loopGegm[[All,All,All,All,6]]+loopGegm[[All,All,All,All,9]],(*33;Z*tree+quench+loop,d*)
treeGegmRencon3[[All,All,All,All,4]]+loopGegm[[All,All,All,All,7]]+loopGegm[[All,All,All,All,10]](*34;Z*tree+quench+loop,s*)

};
(*reSevaGegm1//Dimensions
{seva,norm,conf,gegm,io},{34,2,3,2,8}*)


(*\:4fdd\:6301\:6570\:636e\:539f\:72b6\:ff0c\:8fd9\:91cc\:6ca1\:6709\:5c06\:4e0d\:5bf9\:79f0\:7684\:8bef\:5dee\:5206\:5e03\:8f6c\:6362\:6210\:5bf9\:79f0\:7684\:8bef\:5dee\:5206\:5e03,\:4f46\:9700\:8981\:8f6c\:7f6e\:6210{norm,conf,gegm,io,seva}\:7684\:987a\:5e8f*)
reSevaGegm=Transpose[reSevaGegm1,{5,1,2,3,4}];
(*reSevaGegm//Dimensions
{norm,conf,gegm,io,seva},{2,3,2,8,34}*)


(*\:8ba1\:7b97\:67d0\:4e00\:4e2aQ2\:70b9\:ff0c\:8bef\:5dee\:5e26\:7684\:534a\:5bbd\:5ea6*)
norm=1;gegm=1;seva=16;io=2;
reSevaGegm[[norm,conf=2,gegm,io,seva]]\[PlusMinus]Mean[Abs[
reSevaGegm[[norm,conf=2,gegm,io,seva]]-reSevaGegm[[norm,conf={1,3},gegm,io,seva]]
]]/.Q2->0.3


(* ::Chapter:: *)
(*Draw*)


(* ::Section:: *)
(*\:8ba1\:7b97\:6570\:636e\:5355\:4e2a\:4f5c\:56fe*)


(*mma \:9ed8\:8ba4\:7684\:56fe\:5f62\:989c\:8272*)
mmalineDefault={AbsoluteThickness[_]->AbsoluteThickness[.8],PointSize[_]->PointSize[0.02]};
mmacolorDefault=RGBColor[0.368417, 0.506779, 0.709798];


(*\:8bbe\:5b9a\:516b\:91cd\:6001\:66f2\:7ebfstyle*)
dataVtitle1={
(*1:*)"tree,uds",(*2:*)"tree,u",(*3:*)"tree,d",(*4:*)"tree,s",
(*5:*)"loop,uds",(*6:*)"loop,u",(*7:*)"loop,d",(*8:*)"loop,s",
(*9:*)"quench,u",(*10:*)"quench d",(*11:*)"quench,s",
(*12:*)"valence,u",(*13:*)"valence,d",(*14:*)"valence,s",
(*15:*)"sea,u",(*16:*)"sea,d",(*17:*)"sea,s",
(*18:*)"Z*tree+loop,uds",(*19:*)"Z*tree+loop,u",(*20:*)"Z*tree+loop,d",(*21:*)"Z*tree+loop,s",
(*22:*)"(Z-1)tree+loop,uds",(*23:*)"(Z-1)tree+loop,u",(*24:*)"(Z-1)tree+loop,d",(*25:*)"(Z-1)tree+loop,s",
(*26:*)"quench+valence,u",(*27:*)"quench+valence,d",(*28:*)"quench+valence,s",
(*29:*)"Z*tree+quench+valence,u",(*30:*)"Z*tree+quench+valence,d",(*31:*)"Z*tree+quench+valence,s",
(*32:*)"(Z-1)tree+quench+valence,u",(*33:*)"(Z-1)tree+quench+valence,d",(*34:*)"(Z-1)tree+quench+valence,s",
(*35:*)"exprmt.",(*36:*)"lattice",(*37:*)"paper"
};
(*\:7ebf\:578b\:548c\:989c\:8272\:7ec4\:5408\:ff0c\:7ed9\:5b9a\:4e00\:7ec4\:914d\:8272\:65b9\:6848*)
(*\:6307\:5b9a\:66f2\:7ebf\:7684\:7c97\:7ec6\:ff0c\:53ef\:4ee5\:7528\:6765\:533a\:5206 0.80\:ff0c0.90\:ff0c1.00*)
lineThick={AbsoluteThickness[2],AbsoluteThickness[2],AbsoluteThickness[2]};
(*\:6307\:5b9a\:7ebf\:578b\:65b9\:6848*)
lineDashTheme={
(*1:*)AbsoluteDashing[{}],AbsoluteDashing[{}],AbsoluteDashing[{6,6}],AbsoluteDashing[{1,4,1,4}],
(*5:*)AbsoluteDashing[{}],AbsoluteDashing[{}],AbsoluteDashing[{6,6}],AbsoluteDashing[{1,4,1,4}],
(*9:*)AbsoluteDashing[{}],AbsoluteDashing[{6,6}],AbsoluteDashing[{1,4,1,4}],
(*12:*)AbsoluteDashing[{}],AbsoluteDashing[{6,6}],AbsoluteDashing[{1,4,1,4}],
(*15:*)AbsoluteDashing[{}],AbsoluteDashing[{6,6}],AbsoluteDashing[{1,4,1,4}],
(*18:*)AbsoluteDashing[{}],AbsoluteDashing[{6,6}],AbsoluteDashing[{1,4,1,4}],
(*22:*)AbsoluteDashing[{}],AbsoluteDashing[{}],AbsoluteDashing[{6,6}],AbsoluteDashing[{1,4,1,4}],
(*26:*)AbsoluteDashing[{}],AbsoluteDashing[{}],AbsoluteDashing[{6,6}],AbsoluteDashing[{1,4,1,4}],
(*29:*)AbsoluteDashing[{}],AbsoluteDashing[{6,6}],AbsoluteDashing[{1,4,1,4}],
(*32:*)AbsoluteDashing[{}],AbsoluteDashing[{6,6}],AbsoluteDashing[{1,4,1,4}],
(*35:*)AbsoluteDashing[{}],AbsoluteDashing[{6,6}],AbsoluteDashing[{1,4,1,4}]
};(*\:7ebf\:578b,Dashing[{}]\:4e3a\:5b9e\:7ebf*)
(*\:6307\:5b9a\:914d\:8272\:65b9\:6848*)
colorTheme={Red,Green,Blue};(*\:914d\:8272\:65b9\:6848\:ff0c12\:4e2a*)
(*\:5faa\:73af\:52308\:79cd\:ff0c\:4e5f\:5c31\:662fio\:7684\:6570\:91cf*)
colorTheme=PadRight[{},8,colorTheme];
(* \:4ea7\:751f\:5e94\:7528\:5230\:540e\:9762\:66f2\:7ebf\:7684\:914d\:8272\:548c\:7ebf\:578b\:65b9\:6848 *)
lineStyleTable=Table[
Directive[colorTheme[[conf]],lineThick[[1]],lineDashTheme[[seva]],Opacity[calcPointOpacity[[io]]]]
,{conf,1,3,1}
,{seva,1,34,1}
,{io,1,8,1}
];


(*AbsoluteDashing[{}],AbsoluteDashing[{16,4,4,4}],AbsoluteDashing[{4,4}],AbsoluteDashing[{24,4,12,4}]*)
(*colorTheme1={
RGBColor["#FF99FF"],RGBColor["#FFA500"],RGBColor["#0099FF"],
RGBColor["#009900"],RGBColor["#A52A2A"],RGBColor["#00FFFF"],
RGBColor["#0000FF"],RGBColor["#FAEBD7"],RGBColor["#FF1493"],
RGBColor["#F0F8FF"],RGBColor["#8A2BE2"],RGBColor["#7FFFD4"]
};*)
(*lineThick={AbsoluteThickness[1.5],AbsoluteThickness[2],AbsoluteThickness[2.5]};*)
(*\:5faa\:73af\:523037\:79cd\:ff0c\:4e5f\:5c31\:662fseva\:7684\:6570\:91cf*)
(*lineDashTheme=PadRight[
{
AbsoluteDashing[{}],AbsoluteDashing[{16,4,4,4}],AbsoluteDashing[{4,4}],AbsoluteDashing[{24,4,12,4}],
AbsoluteDashing[{}],AbsoluteDashing[{16,4,4,4}],AbsoluteDashing[{4,4}],AbsoluteDashing[{24,4,12,4}],
AbsoluteDashing[{}],AbsoluteDashing[{16,4,4,4}],AbsoluteDashing[{4,4}],
AbsoluteDashing[{}],AbsoluteDashing[{16,4,4,4}],AbsoluteDashing[{4,4}],
AbsoluteDashing[{}],AbsoluteDashing[{16,4,4,4}],AbsoluteDashing[{4,4}],
AbsoluteDashing[{}],AbsoluteDashing[{16,4,4,4}],AbsoluteDashing[{4,4}],AbsoluteDashing[{24,4,12,4}],
AbsoluteDashing[{}],AbsoluteDashing[{16,4,4,4}],AbsoluteDashing[{4,4}],AbsoluteDashing[{24,4,12,4}],
AbsoluteDashing[{}],AbsoluteDashing[{16,4,4,4}],AbsoluteDashing[{4,4}]
},
37,lineDashTheme1];*)


(*\:7ed8\:5236\:8ba1\:7b97\:6570\:636e\:7684\:5e26\:72b6\:56fe\:ff0cerrobar \:53ef\:4ee5\:901a\:8fc7\:8bbe\:7f6e\:900f\:660e\:5ea6\:4e0d\:663e\:793a*)
Module[{term=0,teFig},
figCalc=Table[
If[Divisible[++term,70],echo[term]];(*\:4e00\:4e2a\:7b80\:5355\:7684\:6307\:793a\:5668*)
(*echo[{norm,conf=All,gegm,io,seva}];*)
teFig=reSevaGegm[[norm,conf=All,gegm,io,seva]];
Plot[
teFig,{Q2,0,1},
PlotRange->{Full,Full},
AxesOrigin->{0,0},Axes->True,
PlotRangePadding->{{0,0},{Scaled[0.09],Scaled[0.12]}}, 
PlotStyle->{
lineStyleTable[[conf=1,seva,io]],(*\:8fd9\:4e09\:4f8b\:662f0.80,0.90,1.00\:4e09\:6761\:66f2\:7ebf\:7684\:989c\:8272*)
lineStyleTable[[conf=2,seva,io]],
lineStyleTable[[conf=3,seva,io]]
}(*\:66f2\:7ebf\:7684\:6837\:5f0f*)
]

,{norm,1,2,1}
,{gegm,1,2,1}
,{seva,1,34,1}
,{io,1,8,1}
]
];//AbsoluteTiming
(*figCalc//Dimensions
{2,2,28,8},{norm,gegm,seva,io}*)


(* ::Section:: *)
(*\:66f2\:7ebfGroup*)


(*figGroup\:7528\:4e00\:4e2a\:5173\:8054Assoc \:4f20\:5165\:53c2\:6570\:ff0c\:4e0b\:9762\:662f\:9700\:8981\:4f20\:5165\:7684\:53c2\:6570\:540d\:79f0.
Assoc["Data"],\:4f5c\:56fe\:7528\:7684\:6570\:636e
Assoc["PlotRange"],\:4f5c\:56fe\:8303\:56f4
PlotRangePadding\[Rule]Assoc["PlotRangePadding"],\:4f5c\:56fe\:8303\:56f4\:586b\:5145
Assoc["FrameLabel"],FrameLabel,
Assoc["FrameStyle"],FrameStyle,
Assoc["LegendText"],\:56fe\:4f8b\:6587\:5b57
Assoc["LegendPositon"],\:56fe\:4f8b\:4f4d\:7f6e
Assoc["LegendStyle"],\:56fe\:4f8b\:6837\:5f0f,
Assoc["LegendMarkerSize"],\:56fe\:4f8b\:8bb0\:53f7\:5927\:5c0f*)
figGroup[figAssoc_]:=Legended[(*\:8bbe\:7f6e\:8ba1\:7b97\:66f2\:7ebf\:7684\:56fe\:4f8b*)
Show[
figAssoc["Data"],(*Show\:7684\:53c2\:6570\:662f\:5e8f\:5217*) 
ImageSize->Large,
PlotRange->figAssoc["PlotRange"],
AxesOrigin->{0,0},Axes->True,
PlotRangePadding->figAssoc["PlotRangePadding"],
Frame->True,
FrameLabel->figAssoc["FrameLabel"],
FrameStyle->figAssoc["FrameStyle"](*\:8fb9\:6846\:7684\:6837\:5f0f\:ff0c\:5728\:4e0b\:9762\:8be6\:7ec6\:6307\:5b9a*)
],
Placed[(*+++\:56fe\:4f8b\:90e8\:5206++++++++*)
Style[
LineLegend[
figAssoc["LegendStyle"],figAssoc["LegendText"],
LegendMarkerSize->figAssoc["LegendMarkerSize"],
LegendLayout->figAssoc["LegendLayout"],(*\:56fe\:4f8b\:7684\:5e03\:5c40\:51fd\:6570*)
LegendFunction->figAssoc["LegendFunction"](*\:4f5c\:7528\:5230\:56fe\:4f8b\:4e0a\:7684\:51fd\:6570*)
],
Magnification->1(*\:56fe\:4f8b\:653e\:5927\:7684\:500d\:6570*)
],
figAssoc["LegendPositon"]
]
];


(* ::Section:: *)
(*\:683c\:5f0f\:7684\:516c\:5171\:90e8\:5206*)


figArrayInit=0;(*\:7528\:6765\:4f5c\:56fe\:7684\:5404\:9879\:6570\:636e\:7684\:5360\:4f4d\:7b26*)
figAssoc=<|
"PlotRange"->figArrayInit,(*\:4f5c\:56fe\:8303\:56f4*)
"PlotRangePadding"->figArrayInit,(*\:4f5c\:56fe\:7a7a\:767d\:586b\:5145*)
"FrameLabel"->figArrayInit,(*\:5750\:6807\:8f74\:6807\:8bb0*)
"FrameStyle"->figArrayInit,(*\:5750\:6807\:8f74\:98ce\:683c*)
"LegendPositon"->figArrayInit,(*\:6574\:5757\:56fe\:4f8b\:7684\:4f4d\:7f6e*)
(*\:4e0a\:9762\:7684\:662f\:516c\:6709\:90e8\:5206\:ff0c\:4e0b\:9762\:7684\:9700\:8981\:548c\:6570\:636e\:4e00\:4e00\:5bf9\:5e94*)
"Data"->figArrayInit,(*\:4f5c\:56fe\:6570\:636e*)
"LegendText"->figArrayInit,(*\:56fe\:4f8b\:6587\:5b57*)
"LegendStyle"->figArrayInit,(*\:56fe\:4f8b\:98ce\:683c*)
"LegendMarkerSize"->figArrayInit (*\:56fe\:4f8b\:8bb0\:53f7*)
|>;(*\:7528\:6765\:753b\:56fe\:7684\:5173\:8054*)


frameTick=AbsoluteThickness[1.5];(*\:8fb9\:6846\:523b\:5ea6\:7ebf\:7684\:7c97\:7ec6*)
frameText=18;(*\:8fb9\:6846\:6587\:5b57\:5927\:5c0f*)(*<|"normalized"\[Rule]18,"unormalized"\[Rule]12|>*)
(*\:8bbe\:7f6eFrame \:7684\:6837\:5f0f,\:56db\:4e2a\:8fb9\:53ef\:4ee5\:5206\:522b\:6307\:5b9a*)
figAssoc["FrameStyle"]={
{
Directive[frameTick,FontSize->frameText,Black],(*\:5de6\:8fb9*)
Directive[frameTick,FontSize->frameText,Black](*\:53f3\:8fb9*)
},
{
Directive[frameTick,FontSize->frameText,Black],(*\:5e95\:90e8*)
Directive[frameTick,FontSize->frameText,Black](*\:9876\:90e8*)
}
};


octNameTeX={"\(\*SuperscriptBox[\(\[CapitalSigma]\), \(-\)]\)","\(\*SuperscriptBox[\(\[CapitalSigma]\), \(0\)]\)","\(\*SuperscriptBox[\(\[CapitalSigma]\), \(+\)]\)",
"p","n","\(\*SuperscriptBox[\(\[CapitalXi]\), \(-\)]\)","\(\*SuperscriptBox[\(\[CapitalXi]\), \(0\)]\)",
"\[CapitalLambda]"};
octNameTeX2=ConstantArray["",8];
lamdaConf={"L-0.8,","L-0.9,","L-1.0,"};
lamdaConf2={"","",""};
(*+++++++++++++++++++++++*)
sevaTitle=StringJoin[" ",#1]&/@{
(*1:*)"tree,uds",(*2:*)"tree,u",(*3:*)"tree,d",(*4:*)"tree,s",
(*5:*)"loop,uds",(*6:*)"loop,u",(*7:*)"loop,d",(*8:*)"loop,s",
(*9:*)"quench,u",(*10:*)"quench d",(*11:*)"quench,s",
(*12:*)"valence,u",(*13:*)"valence,d",(*14:*)"valence,s",(*\:975e\:8fde\:901a\:56fe\:4e2d\:7684valence*)
(*15:*)"sea,u",(*16:*)"sea,d",(*17:*)"sea,s",
(*18:*)"Z*tree+loop,uds",(*19:*)"Z*tree+loop,u",(*20:*)"Z*tree+loop,d",(*21:*)"Z*tree+loop,s",
(*22:*)"(Z-1)tree+loop,uds",(*23:*)"(Z-1)tree+loop,u",(*24:*)"(Z-1)tree+loop,d",(*25:*)"(Z-1)tree+loop,s",
(*26:*)"valence,u",(*27:*)"valence,d",(*28:*)"valence,s",(*quench+valence,\:7b80\:5199\:4e86*)
(*29:*)"Z*tree+quench+valence,u",(*30:*)"Z*tree+quench+valence,d",(*31:*)"Z*tree+quench+valence,s",
(*32:*)"(Z-1)tree+quench+valence,u",(*33:*)"(Z-1)tree+quench+valence,d",(*34:*)"(Z-1)tree+quench+valence,s",
(*35:*)"exprmt.",(*36:*)"lattice",(*37:*)"paper"
};
dataVtitle=Table[
StringJoin[lamdaConf2[[conf]],sevaTitle[[seva]],octNameTeX2[[io]]]
,{conf,1,3}
,{seva,1,37}
,{io,1,8}
];
(*+++++++++++++++++++++++*)
frameLabel=Table[
{
{Style["\!\(\*SubsuperscriptBox[\(G\), \("<>{"E","M"}[[gegm]]<>"\), \("<>octNameTeX[[io]]<>"\)]\)(\!\(\*SuperscriptBox[\(Q\), \(2\)]\))",
FontFamily->"Times New Roman",FontSize->frameText],None},
{Style["\!\(\*SuperscriptBox[\(Q\), \(2\)]\)(\!\(\*SuperscriptBox[\(GeV\), \(2\)]\))",FontFamily->"Times New Roman",FontSize->frameText],None}
}
,{gegm,1,2}
,{io,1,8}
];(*\:5750\:6807Frame\:7684\:6807\:7b7e*)


(* ::Section:: *)
(*figures*)


seriesFig=<||>;(*\:521d\:59cb\:5316,\:7528\:6765\:5b58\:50a8\:56fe\:50cf*)


(* ::Subsection:: *)
(*\[CapitalSigma]p*)


(*\:591a\:7ebf\:6bb5\:56fe\:4f8b\:6392\:7248\:51fd\:6570\:ff1a
figAssoc["LegendLayout"]=Function[pairs,Column[Row/@Join[Partition[pairs\[LeftDoubleBracket]All,1\[RightDoubleBracket],3],pairs[[;;;;3,{2}]],2]]];
figAssoc["LegendFunction"]=None;
*)
figOrder=Flatten[Transpose[#]]&;(*\:7528\:6765\:7ed9\:56fe\:50cf\:6392\:5e8f\:7684\:51fd\:6570,\:4f5c\:8f6c\:7f6e\:4e4b\:540e\:ff0c\:5c31\:5148\:6309io\:6392\:5e8f\:ff0c\:518d\:6309seva\:6392\:5e8f\:4e86*)
(*\:8981\:4f5c\:56fe\:7684\:6570\:636e*)
norm=1;gegm=1;seva=15;;17;io=3;
figAssoc["Data"]=figCalc[[norm,gegm,seva,io]]//figOrder;

figAssoc["PlotRange"]={{0,1},All};(*\:6307\:5b9a\:7eb5\:8f74\:8303\:56f4*)
figAssoc["PlotRangePadding"]={{0,0},{Scaled[0.09],Scaled[0.18]}};(*\:6307\:5b9a\:56fe\:50cf\:7a7a\:767d\:586b\:5145\:8303\:56f4\:ff0ccalc and expr \:90fd\:751f\:6548*)
figAssoc["FrameLabel"]=frameLabel[[gegm,io]];

figAssoc["LegendStyle"]=lineStyleTable[[conf=2,seva,io]]//figOrder;(*\:6307\:5b9a\:56fe\:4f8b\:989c\:8272\:ff0c\:6837\:5f0f*)
figAssoc["LegendText"]=dataVtitle[[conf=2,seva,io]]//figOrder;(*\:6307\:5b9a\:56fe\:4f8b\:6587\:5b57*)
figAssoc["LegendLayout"]=Automatic;
figAssoc["LegendFunction"]=None;

figAssoc["LegendMarkerSize"]={40,2};(*\:6307\:5b9a\:56fe\:4f8b\:4e2d\:7b26\:53f7\:7684\:5927\:5c0f.w,h*)
figAssoc["LegendPositon"]={{0.70,0.70},(*\:951a\:70b9\:4f4d\:7f6e*){0,0}(*\:56fe\:7684\:951a\:70b9*)};(*\:6307\:5b9a\:56fe\:4f8b\:4f4d\:7f6e*)
seriesFig[{"norm_"<>ToString[norm],"gegm_"<>ToString[gegm],"seva_"<>ToString[seva],"io_"<>ToString[io]}]=figGroup[figAssoc];
If[!cmdQ,echo[seriesFig[{"norm_"<>ToString[norm],"gegm_"<>ToString[gegm],"seva_"<>ToString[seva],"io_"<>ToString[io]}]]]


figOrder=Flatten[Transpose[#]]&;(*\:7528\:6765\:7ed9\:56fe\:50cf\:6392\:5e8f\:7684\:51fd\:6570*)
norm=1;gegm=1;seva=26;;28;io=3;(*\:8981\:4f5c\:56fe\:7684\:6570\:636e*)
figAssoc["Data"]=figCalc[[norm,gegm,seva,io]]//figOrder;

figAssoc["PlotRange"]={{0,1},All};(*\:6307\:5b9a\:7eb5\:8f74\:8303\:56f4*)
figAssoc["PlotRangePadding"]={{0,0},{Scaled[0.09],Scaled[0.12]}};(*\:6307\:5b9a\:56fe\:50cf\:7a7a\:767d\:586b\:5145\:8303\:56f4\:ff0ccalc and expr \:90fd\:751f\:6548*)
figAssoc["FrameLabel"]=frameLabel[[gegm,io]];

figAssoc["LegendStyle"]=lineStyleTable[[conf=2,seva,io]]//figOrder;(*\:6307\:5b9a\:56fe\:4f8b\:989c\:8272\:ff0c\:6837\:5f0f*)
figAssoc["LegendText"]=dataVtitle[[conf=2,seva,io]]//figOrder;(*\:6307\:5b9a\:56fe\:4f8b\:6587\:5b57*)
figAssoc["LegendLayout"]=Automatic;
figAssoc["LegendFunction"]=None;

figAssoc["LegendMarkerSize"]={40,2};(*\:6307\:5b9a\:56fe\:4f8b\:4e2d\:7b26\:53f7\:7684\:5927\:5c0f.w,h*)
figAssoc["LegendPositon"]={{0.70,0.70},(*\:951a\:70b9\:4f4d\:7f6e*){0,0}(*\:56fe\:7684\:951a\:70b9*)};(*\:6307\:5b9a\:56fe\:4f8b\:4f4d\:7f6e*)
seriesFig[{"norm_"<>ToString[norm],"gegm_"<>ToString[gegm],"seva_"<>ToString[seva],"io_"<>ToString[io]}]=figGroup[figAssoc];
If[!cmdQ,echo[seriesFig[{"norm_"<>ToString[norm],"gegm_"<>ToString[gegm],"seva_"<>ToString[seva],"io_"<>ToString[io]}]]]


figOrder=Flatten[Transpose[#]]&;(*\:7528\:6765\:7ed9\:56fe\:50cf\:6392\:5e8f\:7684\:51fd\:6570*)
norm=1;gegm=2;seva=15;;17;io=3;(*\:8981\:4f5c\:56fe\:7684\:6570\:636e*)
figAssoc["Data"]=figCalc[[norm,gegm,seva,io]]//figOrder;

figAssoc["PlotRange"]={{0,1},All};(*\:6307\:5b9a\:7eb5\:8f74\:8303\:56f4*)
figAssoc["PlotRangePadding"]={{0,0},{Scaled[0.03],Scaled[0.05]}};(*\:6307\:5b9a\:56fe\:50cf\:7a7a\:767d\:586b\:5145\:8303\:56f4\:ff0ccalc and expr \:90fd\:751f\:6548*)
figAssoc["FrameLabel"]=frameLabel[[gegm,io]];

figAssoc["LegendStyle"]=lineStyleTable[[conf=2,seva,io]]//figOrder;(*\:6307\:5b9a\:56fe\:4f8b\:989c\:8272\:ff0c\:6837\:5f0f*)
figAssoc["LegendText"]=dataVtitle[[conf=2,seva,io]]//figOrder;(*\:6307\:5b9a\:56fe\:4f8b\:6587\:5b57*)
figAssoc["LegendLayout"]=Automatic;
figAssoc["LegendFunction"]=None;

figAssoc["LegendMarkerSize"]={40,2};(*\:6307\:5b9a\:56fe\:4f8b\:4e2d\:7b26\:53f7\:7684\:5927\:5c0f.w,h*)
figAssoc["LegendPositon"]={{0.70,0.15},(*\:951a\:70b9\:4f4d\:7f6e*){0,0}(*\:56fe\:7684\:951a\:70b9*)};(*\:6307\:5b9a\:56fe\:4f8b\:4f4d\:7f6e*)
seriesFig[{"norm_"<>ToString[norm],"gegm_"<>ToString[gegm],"seva_"<>ToString[seva],"io_"<>ToString[io]}]=figGroup[figAssoc];
If[!cmdQ,echo[seriesFig[{"norm_"<>ToString[norm],"gegm_"<>ToString[gegm],"seva_"<>ToString[seva],"io_"<>ToString[io]}]]]


figOrder=Flatten[Transpose[#]]&;(*\:7528\:6765\:7ed9\:56fe\:50cf\:6392\:5e8f\:7684\:51fd\:6570*)
norm=1;gegm=2;seva=26;;28;io=3;(*\:8981\:4f5c\:56fe\:7684\:6570\:636e*)
figAssoc["Data"]=figCalc[[norm,gegm,seva,io]]//figOrder;

figAssoc["PlotRange"]={{0,1},All};(*\:6307\:5b9a\:7eb5\:8f74\:8303\:56f4*)
figAssoc["PlotRangePadding"]={{0,0},{Scaled[0.04],Scaled[0.04]}};(*\:6307\:5b9a\:56fe\:50cf\:7a7a\:767d\:586b\:5145\:8303\:56f4\:ff0ccalc and expr \:90fd\:751f\:6548*)
figAssoc["FrameLabel"]=frameLabel[[gegm,io]];

figAssoc["LegendStyle"]=lineStyleTable[[conf=2,seva,io]]//figOrder;(*\:6307\:5b9a\:56fe\:4f8b\:989c\:8272\:ff0c\:6837\:5f0f*)
figAssoc["LegendText"]=dataVtitle[[conf=2,seva,io]]//figOrder;(*\:6307\:5b9a\:56fe\:4f8b\:6587\:5b57*)
figAssoc["LegendLayout"]=Automatic;
figAssoc["LegendFunction"]=None;

figAssoc["LegendMarkerSize"]={40,2};(*\:6307\:5b9a\:56fe\:4f8b\:4e2d\:7b26\:53f7\:7684\:5927\:5c0f.w,h*)
figAssoc["LegendPositon"]={{0.70,0.70},(*\:951a\:70b9\:4f4d\:7f6e*){0,0}(*\:56fe\:7684\:951a\:70b9*)};(*\:6307\:5b9a\:56fe\:4f8b\:4f4d\:7f6e*)
seriesFig[{"norm_"<>ToString[norm],"gegm_"<>ToString[gegm],"seva_"<>ToString[seva],"io_"<>ToString[io]}]=figGroup[figAssoc];
If[!cmdQ,echo[seriesFig[{"norm_"<>ToString[norm],"gegm_"<>ToString[gegm],"seva_"<>ToString[seva],"io_"<>ToString[io]}]]]


(* ::Subsection:: *)
(*\[CapitalSigma]0*)


figOrder=Flatten[Transpose[#]]&;(*\:7528\:6765\:7ed9\:56fe\:50cf\:6392\:5e8f\:7684\:51fd\:6570*)
norm=1;gegm=1;seva={15,17};io=2;(*\:8981\:4f5c\:56fe\:7684\:6570\:636e*)
figAssoc["Data"]=figCalc[[norm,gegm,seva,io]]//figOrder;

figAssoc["PlotRange"]={{0,1},All};(*\:6307\:5b9a\:7eb5\:8f74\:8303\:56f4*)
figAssoc["PlotRangePadding"]={{0,0},{Scaled[0.04],Scaled[0.14]}};(*\:6307\:5b9a\:56fe\:50cf\:7a7a\:767d\:586b\:5145\:8303\:56f4\:ff0ccalc and expr \:90fd\:751f\:6548*)
figAssoc["FrameLabel"]=frameLabel[[gegm,io]];

figAssoc["LegendStyle"]=lineStyleTable[[conf=2,seva,io]]//figOrder;(*\:6307\:5b9a\:56fe\:4f8b\:989c\:8272\:ff0c\:6837\:5f0f*)
figAssoc["LegendText"]=dataVtitle[[conf=2,seva,io]]//figOrder;(*\:6307\:5b9a\:56fe\:4f8b\:6587\:5b57*)
figAssoc["LegendLayout"]=Automatic;
figAssoc["LegendFunction"]=None;

figAssoc["LegendMarkerSize"]={40,2};(*\:6307\:5b9a\:56fe\:4f8b\:4e2d\:7b26\:53f7\:7684\:5927\:5c0f.w,h*)
figAssoc["LegendPositon"]={{0.70,0.72},(*\:951a\:70b9\:4f4d\:7f6e*){0,0}(*\:56fe\:7684\:951a\:70b9*)};(*\:6307\:5b9a\:56fe\:4f8b\:4f4d\:7f6e*)
seriesFig[{"norm_"<>ToString[norm],"gegm_"<>ToString[gegm],"seva_"<>ToString[seva],"io_"<>ToString[io]}]=figGroup[figAssoc];
If[!cmdQ,echo[seriesFig[{"norm_"<>ToString[norm],"gegm_"<>ToString[gegm],"seva_"<>ToString[seva],"io_"<>ToString[io]}]]]


figOrder=Flatten[Transpose[#]]&;(*\:7528\:6765\:7ed9\:56fe\:50cf\:6392\:5e8f\:7684\:51fd\:6570*)
norm=1;gegm=1;seva={26,28};io=2;(*\:8981\:4f5c\:56fe\:7684\:6570\:636e*)
figAssoc["Data"]=figCalc[[norm,gegm,seva,io]]//figOrder;

figAssoc["PlotRange"]={{0,1},All};(*\:6307\:5b9a\:7eb5\:8f74\:8303\:56f4*)
figAssoc["PlotRangePadding"]={{0,0},{Scaled[0],Scaled[0.04]}};(*\:6307\:5b9a\:56fe\:50cf\:7a7a\:767d\:586b\:5145\:8303\:56f4\:ff0ccalc and expr \:90fd\:751f\:6548*)
figAssoc["FrameLabel"]=frameLabel[[gegm,io]];

figAssoc["LegendStyle"]=lineStyleTable[[conf=2,seva,io]]//figOrder;(*\:6307\:5b9a\:56fe\:4f8b\:989c\:8272\:ff0c\:6837\:5f0f*)
figAssoc["LegendText"]=dataVtitle[[conf=2,seva,io]]//figOrder;(*\:6307\:5b9a\:56fe\:4f8b\:6587\:5b57*)
figAssoc["LegendLayout"]=Automatic;
figAssoc["LegendFunction"]=None;

figAssoc["LegendMarkerSize"]={40,2};(*\:6307\:5b9a\:56fe\:4f8b\:4e2d\:7b26\:53f7\:7684\:5927\:5c0f.w,h*)
figAssoc["LegendPositon"]={{0.70,0.70},(*\:951a\:70b9\:4f4d\:7f6e*){0,0}(*\:56fe\:7684\:951a\:70b9*)};(*\:6307\:5b9a\:56fe\:4f8b\:4f4d\:7f6e*)
seriesFig[{"norm_"<>ToString[norm],"gegm_"<>ToString[gegm],"seva_"<>ToString[seva],"io_"<>ToString[io]}]=figGroup[figAssoc];
If[!cmdQ,echo[seriesFig[{"norm_"<>ToString[norm],"gegm_"<>ToString[gegm],"seva_"<>ToString[seva],"io_"<>ToString[io]}]]]


figOrder=Flatten[Transpose[#]]&;(*\:7528\:6765\:7ed9\:56fe\:50cf\:6392\:5e8f\:7684\:51fd\:6570*)
norm=1;gegm=2;seva={15,17};io=2;(*\:8981\:4f5c\:56fe\:7684\:6570\:636e*)
figAssoc["Data"]=figCalc[[norm,gegm,seva,io]]//figOrder;

figAssoc["PlotRange"]={{0,1},All};(*\:6307\:5b9a\:7eb5\:8f74\:8303\:56f4*)
figAssoc["PlotRangePadding"]={{0,0},{Scaled[0.04],Scaled[0.05]}};(*\:6307\:5b9a\:56fe\:50cf\:7a7a\:767d\:586b\:5145\:8303\:56f4\:ff0ccalc and expr \:90fd\:751f\:6548*)
figAssoc["FrameLabel"]=frameLabel[[gegm,io]];

figAssoc["LegendStyle"]=lineStyleTable[[conf=2,seva,io]]//figOrder;(*\:6307\:5b9a\:56fe\:4f8b\:989c\:8272\:ff0c\:6837\:5f0f*)
figAssoc["LegendText"]=dataVtitle[[conf=2,seva,io]]//figOrder;(*\:6307\:5b9a\:56fe\:4f8b\:6587\:5b57*)
figAssoc["LegendLayout"]=Automatic;
figAssoc["LegendFunction"]=None;

figAssoc["LegendPositon"]={{0.70,0.15},(*\:951a\:70b9\:4f4d\:7f6e*){0,0}(*\:56fe\:7684\:951a\:70b9*)};(*\:6307\:5b9a\:56fe\:4f8b\:4f4d\:7f6e*)
seriesFig[{"norm_"<>ToString[norm],"gegm_"<>ToString[gegm],"seva_"<>ToString[seva],"io_"<>ToString[io]}]=figGroup[figAssoc];
If[!cmdQ,echo[seriesFig[{"norm_"<>ToString[norm],"gegm_"<>ToString[gegm],"seva_"<>ToString[seva],"io_"<>ToString[io]}]]]


figOrder=Flatten[Transpose[#]]&;(*\:7528\:6765\:7ed9\:56fe\:50cf\:6392\:5e8f\:7684\:51fd\:6570*)
norm=1;gegm=2;seva={26,28};io=2;(*\:8981\:4f5c\:56fe\:7684\:6570\:636e*)
figAssoc["Data"]=figCalc[[norm,gegm,seva,io]]//figOrder;

figAssoc["PlotRange"]={{0,1},All};(*\:6307\:5b9a\:7eb5\:8f74\:8303\:56f4*)
figAssoc["PlotRangePadding"]={{0,0},{Scaled[0.04],Scaled[0.04]}};(*\:6307\:5b9a\:56fe\:50cf\:7a7a\:767d\:586b\:5145\:8303\:56f4\:ff0ccalc and expr \:90fd\:751f\:6548*)
figAssoc["FrameLabel"]=frameLabel[[gegm,io]];

figAssoc["LegendStyle"]=lineStyleTable[[conf=2,seva,io]]//figOrder;(*\:6307\:5b9a\:56fe\:4f8b\:989c\:8272\:ff0c\:6837\:5f0f*)
figAssoc["LegendText"]=dataVtitle[[conf=2,seva,io]]//figOrder;(*\:6307\:5b9a\:56fe\:4f8b\:6587\:5b57*)
figAssoc["LegendLayout"]=Automatic;
figAssoc["LegendFunction"]=None;

figAssoc["LegendPositon"]={{0.70,0.70},(*\:951a\:70b9\:4f4d\:7f6e*){0,0}(*\:56fe\:7684\:951a\:70b9*)};(*\:6307\:5b9a\:56fe\:4f8b\:4f4d\:7f6e*)
seriesFig[{"norm_"<>ToString[norm],"gegm_"<>ToString[gegm],"seva_"<>ToString[seva],"io_"<>ToString[io]}]=figGroup[figAssoc];
If[!cmdQ,echo[seriesFig[{"norm_"<>ToString[norm],"gegm_"<>ToString[gegm],"seva_"<>ToString[seva],"io_"<>ToString[io]}]]]


(* ::Chapter:: *)
(*storage*)


echo["files to export"];(*\:8981\:5bfc\:51fa\:7684\:6587\:4ef6,\:5173\:8054\:7684\:5f62\:5f0f\:ff0c\:4fdd\:5b58\:7528\:7684\:6587\:4ef6\:540d\[Rule]\:5bf9\:5e94\:7684\:6587\:4ef6*)
outputDir=FileNameJoin[{gitLocalName,"/expression-results/"}]
outputAssoc=<|
(*++++++++++++++++*)
norm=1;gegm=1;seva=15;;17;io=3;
(*StringJoin[{"norm_"<>ToString[norm],"_gegm_"<>ToString[gegm],"_seva_"<>ToString[seva],"_io_"<>ToString[io],"_fit_",cFittingStr,"_rela_",errorbarQStr,"_series_",parOrderStr,"_L_",parLambda0Str,"_ci_",parciStr,".pdf"}]*)
FileNameJoin[{outputDir,"sigma_Fig3.pdf"}]->seriesFig[{"norm_"<>ToString[norm],"gegm_"<>ToString[gegm],"seva_"<>ToString[seva],"io_"<>ToString[io]}],
(*+++++*)
norm=1;gegm=1;seva=26;;28;io=3;
FileNameJoin[{outputDir,"sigma_Fig4.pdf"}]->seriesFig[{"norm_"<>ToString[norm],"gegm_"<>ToString[gegm],"seva_"<>ToString[seva],"io_"<>ToString[io]}],
(*+++++*)
norm=1;gegm=2;seva=15;;17;io=3;
FileNameJoin[{outputDir,"sigma_Fig5.pdf"}]->seriesFig[{"norm_"<>ToString[norm],"gegm_"<>ToString[gegm],"seva_"<>ToString[seva],"io_"<>ToString[io]}],
(*+++++*)
norm=1;gegm=2;seva=26;;28;io=3;
FileNameJoin[{outputDir,"sigma_Fig6.pdf"}]->seriesFig[{"norm_"<>ToString[norm],"gegm_"<>ToString[gegm],"seva_"<>ToString[seva],"io_"<>ToString[io]}],
(*+++++*)
norm=1;gegm=1;seva={15,17}; io=2;
FileNameJoin[{outputDir,"sigma_Fig7.pdf"}]->seriesFig[{"norm_"<>ToString[norm],"gegm_"<>ToString[gegm],"seva_"<>ToString[seva],"io_"<>ToString[io]}],
(*+++++*)
norm=1;gegm=1;seva={26,28}; io=2;
FileNameJoin[{outputDir,"sigma_Fig8.pdf"}]->seriesFig[{"norm_"<>ToString[norm],"gegm_"<>ToString[gegm],"seva_"<>ToString[seva],"io_"<>ToString[io]}],
(*+++++*)
norm=1;gegm=2;seva={15,17}; io=2;
FileNameJoin[{outputDir,"sigma_Fig9.pdf"}]->seriesFig[{"norm_"<>ToString[norm],"gegm_"<>ToString[gegm],"seva_"<>ToString[seva],"io_"<>ToString[io]}],
(*+++++*)
norm=1;gegm=2;seva={26,28}; io=2;
FileNameJoin[{outputDir,"sigma_Fig10.pdf"}]->seriesFig[{"norm_"<>ToString[norm],"gegm_"<>ToString[gegm],"seva_"<>ToString[seva],"io_"<>ToString[io]}]
(*++++++++++++++++*)
|>;
echo["output status"];
KeyValueMap[Export,outputAssoc]


Run[FileNameJoin[{gitLocalName,"totex.sh"}]]


(*Run["rm "<>FileNameJoin[{gitLocalName,"expression-results/sigma_Fig*.pdf"}]]*)
