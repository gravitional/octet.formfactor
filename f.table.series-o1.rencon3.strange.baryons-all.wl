(* ::Package:: *)

(* ::Title:: *)
(*f.table.series-o1.rencon3.strange.baryons-all.wl*)


(* ::Chapter:: *)
(*initial*)


(*\:8ba1\:7b97\:73af\:5883\:53c2\:91cf\:ff0c\:6bd4\:5982\:8def\:5f84*)
gitRemoteName="octet.formfactor";(*\:7ed9\:51fa\:8fdc\:7a0bgit\:4ed3\:5e93\:7684\:540d\:5b57*)
cmdQ=Not[$Notebooks];(*\:811a\:672c\:7684\:8fd0\:884c\:6a21\:5f0f\:5224\:65ad\:ff0cTrue\:4ee3\:8868\:547d\:4ee4\:884c\:ff0cFalse\:4ee3\:8868\:524d\:7aef*)
fileName=If[Not[cmdQ],NotebookFileName[],$InputFileName](*\:7ed9\:51fa\:7b14\:8bb0\:672c\:7684\:7edd\:5bf9\:8def\:5f84*)
enString[x__]:=StringJoin[ToString[#1]&/@Flatten[{x}]](*\:5b9a\:4e49\:4e00\:4e2a\:786e\:4fdd\:5b57\:7b26\:4e32\:7684\:51fd\:6570*)
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
echo["the gitLocalName is"](*\:5b9a\:4e49\:672c\:5730git\:76ee\:5f55\:ff0c\:4e5f\:5c31\:662f\:7a0b\:5e8f\:7684\:6839\:76ee\:5f55*)
gitLocalName=FileNameJoin[Append[TakeWhile[FileNameSplit[ExpandFileName[fileName]],UnsameQ[#1,gitRemoteName]&],gitRemoteName]]


(* ::Section:: *)
(*initial parameters*)


(*\:6a21\:62df\:547d\:4ee4\:884c\:8f93\:5165\:ff0c\:8c03\:8bd5\:4f7f\:7528*)
inputSim={"/home/tom/octet.formfactor/f.table.series-o1.rencon3.strange.baryons-all.wl",
"o1",0.90`20,1.00`20,"Baryons","L_0.90_ci_1.00"};
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


c3 = c2 - c1;
(*\:8bfb\:53d6c1,c2\:7684\:53d6\:503c*)
echo["c1,c2 configuration"]
If[errorbarQStr==="notbar",
(*\:5982\:679c\:4e0d\:662f\:4e3a\:4e86\:8ba1\:7b97Error\:ff0c\:5c31\:4f7f\:7528\:5339\:914d\:7684c1c2\:8fdb\:884c\:8ba1\:7b97*)
Print[cFittingDir=FileNameJoin[{gitLocalName,"expression-mfiles","c1c2_magfit_L_"<>parLambda0Str<>"_ci_"<>parciStr<>".m"}]];
Print[configc1c2=Get[cFittingDir][cFitting][[2,2]]];,(*\:4f7f\:7528\:7b2c\:4e8c\:79cd\:91cd\:6574\:5316\:65b9\:6848,Z*tree+loop*)
(*\:5982\:679c\:662f\:4e3a\:4e86\:8ba1\:7b97Error\:ff0c\:5c31\:4f7f\:7528\:6307\:5b9a \[CapitalLambda],ci \:5bf9\:5e94\:7684c1c2\:8fdb\:884c\:8ba1\:7b97*)
Print[cFittingDir=FileNameJoin[{gitLocalName,"expression-mfiles","c1c2_magfit_"<>errorbarQStr<>".m"}]];
Print[configc1c2=Get[cFittingDir][cFitting][[2,2]]];
]


(* ::Section:: *)
(*import *)


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
dataSeriesRaw,{3,2,8,21},{conf,gegm,io,seva}*)


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
{ConstantArray[1,{3,8}],ConstantArray[1,{3,8}]},(*\:4e0d\:5f52\:4e00\:5316\:7684\:96f6\:70b9\:503c*)
{ConstantArray[1,{3,8}],dataSeriesO0}(*\:5f52\:4e00\:5316\:7684\:96f6\:70b9\:503c*)
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


(* ::Chapter:: *)
(*\:91cd\:5236\:6570\:636e*)


dataVtitle={
(*1:*)"tree,uds",(*2:*)"tree,u",(*3:*)"tree,d",(*4:*)"tree,s",
(*5:*)"loop,uds",(*6:*)"loop,u",(*7:*)"loop,d",(*8:*)"loop,s",
(*9:*)"quench,u",(*10*)"quench d",(*11:*)"quench,s",
(*12:*)"valence,u",(*13:*)"valence,d",(*14:*)"valence,s",
(*15:*)"sea,u",(*16:*)"sea,d",(*17:*)"sea,s",(*18:*)"tree+loop,uds",
(*19:*)"exprmt.",(*20:*)"lattice",(*21:*)"paper"
};
treeGegm=dataSeriesRaw[[conf=All,gegm=All,io=All,seva=1;;4]];
(*\:8ba1\:7b97 total \:8d21\:732e\:65f6\:ff0c\:7528treeGegmRencon2\:66f4\:65b9\:4fbf*)
treeGegmRencon2=Table[
treeGegm[[conf,gegm,io,seva]]*rencon[[conf,io]]
,{conf,1,3,1}
,{gegm,1,2,1}
,{io,1,8,1}
,{seva,1,4,1}
];
(*\:8ba1\:7b97 loop \:8d21\:732e\:65f6\:ff0c\:7528treeGegmRencon3\:66f4\:65b9\:4fbf*)
treeGegmRencon3=Table[
treeGegm[[conf,gegm,io,seva]]*(rencon[[conf,io]]-1)
,{conf,1,3,1}
,{gegm,1,2,1}
,{io,1,8,1}
,{seva,1,4,1}
];
(*\:5708\:56fe\:7684\:503c\:ff0c\:6309\:7167loop,quench, sea, valence \:6392\:5e8f*)
loopGegm=dataSeriesRaw[[conf=All,gegm=All,io=All,seva=5;;17]];
(*\:7ed9\:51fa\:5708\:56fe\:7684\:96f6\:70b9\:503c,total = tree +(Z-1)*tree+loop*)
(*treeGegm//Dimensions
treeGegmRencon2//Dimensions
treeGegmRencon3//Dimensions
loopGegm//Dimensions*)


reSevaGegm=Transpose[{
treeGegmRencon2[[All,All,All,1]],(*1;Z*tree,uds*)
treeGegmRencon2[[All,All,All,2]],(*2;Z*tree,u*)
treeGegmRencon2[[All,All,All,3]],(*3;Z*tree,d*)
treeGegmRencon2[[All,All,All,4]],(*4;Z*tree,s*)

loopGegm[[All,All,All,1]],(*5;loop,uds*)
loopGegm[[All,All,All,2]],(*6;loop,u*)
loopGegm[[All,All,All,3]],(*7;loop,d*)
loopGegm[[All,All,All,4]],(*8;loop,s*)

loopGegm[[All,All,All,5]],(*9;quench,u*)
loopGegm[[All,All,All,6]],(*10;quench,d*)
loopGegm[[All,All,All,7]],(*11;quench,s*)

loopGegm[[All,All,All,8]],(*12;valence,u*)
loopGegm[[All,All,All,9]],(*13;valence,d*)
loopGegm[[All,All,All,10]],(*14;valence,s*)

loopGegm[[All,All,All,11]],(*15;sea,u,*)
loopGegm[[All,All,All,12]],(*16;sea,d*)
loopGegm[[All,All,All,13]],(*17;sea,s*)

treeGegmRencon2[[All,All,All,1]]+loopGegm[[All,All,All,1]],(*18;Z*tree+loop,uds total*)
treeGegmRencon2[[All,All,All,2]]+loopGegm[[All,All,All,2]],(*19;Z*tree+loop,u*)
treeGegmRencon2[[All,All,All,3]]+loopGegm[[All,All,All,3]],(*20;Z*tree+loop,d*)
treeGegmRencon2[[All,All,All,4]]+loopGegm[[All,All,All,4]],(*21;Z*tree+loop,s*)

treeGegmRencon3[[All,All,All,1]]+loopGegm[[All,All,All,1]],(*22;(Z-1)tree+loop,uds total*)
treeGegmRencon3[[All,All,All,2]]+loopGegm[[All,All,All,2]],(*23;(Z-1)tree+loop,u*)
treeGegmRencon3[[All,All,All,3]]+loopGegm[[All,All,All,3]],(*24;(Z-1)tree+loop,d*)
treeGegmRencon3[[All,All,All,4]]+loopGegm[[All,All,All,4]],(*25;(Z-1)tree+loop,s*)

loopGegm[[All,All,All,5]]+loopGegm[[All,All,All,8]],(*26;quench+valence,u,*)
loopGegm[[All,All,All,6]]+loopGegm[[All,All,All,9]],(*27;quench+valence,d,*)
loopGegm[[All,All,All,7]]+loopGegm[[All,All,All,10]],(*28;quench+valence,s,*)

treeGegmRencon2[[All,All,All,2]]+loopGegm[[All,All,All,5]]+loopGegm[[All,All,All,8]],(*29;Z*tree+quench+loop,u*)
treeGegmRencon2[[All,All,All,3]]+loopGegm[[All,All,All,6]]+loopGegm[[All,All,All,9]],(*30;Z*tree+quench+loop,d*)
treeGegmRencon2[[All,All,All,4]]+loopGegm[[All,All,All,7]]+loopGegm[[All,All,All,10]],(*31;Z*tree+quench+loop,s*)

treeGegmRencon3[[All,All,All,2]]+loopGegm[[All,All,All,5]]+loopGegm[[All,All,All,8]],(*32;Z*tree+quench+loop,u*)
treeGegmRencon3[[All,All,All,3]]+loopGegm[[All,All,All,6]]+loopGegm[[All,All,All,9]],(*33;Z*tree+quench+loop,d*)
treeGegmRencon3[[All,All,All,4]]+loopGegm[[All,All,All,7]]+loopGegm[[All,All,All,10]],(*34;Z*tree+quench+loop,s*)

dataSeriesRaw[[All,All,All,19]],(*35,exprmt*)
dataSeriesRaw[[All,All,All,20]],(*36,lattice*)
dataSeriesRaw[[All,All,All,21]](*37,paper*)
}
,{4,1,2,3}
];
(*reSevaGegm//Dimensions
{conf,gegm,io,seva},{3,2,8,37}*)


(* ::Section:: *)
(*\:8ba1\:7b97\:8bef\:5dee*)


(*dataSeriesRaw,{3,2,8,37},{conf,gegm,io,seva}
\:5728\:8fd9\:91cc\:6307\:5b9a\:4f5c\:56fe\:9009\:7528\:7684\:6570\:636e\:96c6\:ff0cci=1.0\:ff0cor\:ff0cci=1.5
\:6307\:5b9a\:4e2d\:5fc3\:6570\:636e\:70b9\:ff0c\:7136\:540e\:7ed9\:5b83\:52a0\:4e0a\:4e0b errorbar
\:4e2d\:5fc3\:6570\:636e\:70b9\:7684\:6307\:6807\:4e3a2*)
(*dataSeries//Dimensions
{2,8,37},{gegm,io,seva}*)
Module[{teData},(*\:5bf9\:4e8e\:603b\:8d21\:732e\:7684seva\:ff0c\:6539\:5199\:6210\:6709\:8bef\:5dee\:5e26\:7684\:5f62\:5f0f*)
gegm=2;io=1;seva=18;(*seva 18 \:662f\:603b\:8d21\:732e\:7684\:4f4d\:7f6e*)
dataSeries=Table[
teData=reSevaGegm[[All,gegm,io,seva]];
teData[[2]]\[PlusMinus]Mean[Abs[teData[[{1,3}]]-teData[[2]]]]
,{gegm,1,2}
,{io,1,8}
,{seva,1,37}
];
]
choplimit=10^-8;(*\:5bf9\:6570\:636e\:663e\:793a\:683c\:5f0f\:5316\:7684\:7cbe\:786e\:5ea6\:63a7\:5236*)
dataSeriesTrim=Map[NumberForm[Chop[#1,choplimit],{7,6}]&,dataSeries,{-1}];
(*dataSeriesTrim//Dimensions
{2,8,37},{gegm,io,seva}*)


(* ::Chapter:: *)
(*Q2tableStyle 2*)


Q2tableRearrange=Function[{namesHorizontal,namesVertical,dataList,backGround},
Grid[(*grid start*)
(Prepend[(*add names row*)
MapThread[Prepend,
{(*add names column*)
dataList,(*add the data to display*)
namesVertical (*prepend names aligned in vertical *)
}
],
namesHorizontal(* prepend names aligned in horizontal, should +1, for vertical names place*)
])
,Frame->{All,All}
,Spacings->{2,2}
,Background->backGround
,ItemSize->Full
](*grid end*)
];


namesVertical={"\[CapitalSigma]m","\[CapitalSigma]0","\[CapitalSigma]p","pr","ne","\[CapitalXi]m","\[CapitalXi]0","\[CapitalLambda]"};(*octet \:540d\:79f0\:7f29\:5199*)
namesHorizontal1={
(*1:*)"Z*tree,uds",(*2:*)"Z*tree,u",(*3:*)"Z*tree,d",(*4:*)"Z*tree,s",
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
namesHorizontal[gegm_,seva_]:=Join[{{"<\!\(\*SuperscriptBox[SubscriptBox[\(r\), \(E\)], \(2\)]\)>"},{"<\!\(\*SuperscriptBox[SubscriptBox[\(r\), \(M\)], \(2\)]\)>"}}[[gegm]],namesHorizontal1[[seva]]];
dataBackground={
None,(* color horizontal: x1, x2, x3...*)
{
LightCyan,{None,LightBlue}
}(* color vertical: y1, y2, y3...*)
};


(*Q2tableRearrange=Function[{namesHorizontal,namesVertical,dataList,backGround},*)
tabFontsize=12;(*\:8868\:683c\:5b57\:4f53\:5c3a\:5bf8*)gegm=1;io=All;seva={1,5,18,15,16,17,26,27,28,35};
seriesGeTotal=Style[
Multicolumn[
{(* paras of column need an {} *)
(*+++++++++++++++++++++++++sea-valence part  +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++*)
Q2tableRearrange[(*legend name*)
namesHorizontal[gegm,seva],(*\:6a2a\:7740\:7684\:540d\:79f0*)
namesVertical,(*\:7ad6\:7740\:7684\:540d\:79f0*)
(*****************************data list start********************************)
dataSeriesTrim[[gegm,io,seva]],(*\:8ba1\:7b97\:51fa\:7684\:6570\:636e\:ff0cgegm,io,seva*)
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


tabFontsize=12;(*\:8868\:683c\:5b57\:4f53\:5c3a\:5bf8*)gegm=2;io=All;seva={1,5,18,15,16,17,26,27,28,35};
seriesGmTotal=Style[
Multicolumn[
{(* paras of column need an {} *)
(*+++++++++++++++++++++++++sea-valence part  +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++*)
Q2tableRearrange[(*legend name*)
namesHorizontal[gegm,seva],(*\:6a2a\:7740\:7684\:540d\:79f0*)
namesVertical,(*\:7ad6\:7740\:7684\:540d\:79f0*)
(*****************************data list start********************************)
dataSeriesTrim[[gegm,io,seva]],(*\:8ba1\:7b97\:51fa\:7684\:6570\:636e\:ff0cgegm,io,seva*)
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
FileNameJoin[{outputDir,StringJoin[{"Ge_",cFittingStr,"_rela_",errorbarQStr,"_series_",parOrderStr,"_L_",parLambda0Str,"_ci_",parciStr,".pdf"}]}]->seriesGeTotal,
FileNameJoin[{outputDir,StringJoin[{"Gm_",cFittingStr,"_rela_",errorbarQStr,"_series_",parOrderStr,"_L_",parLambda0Str,"_ci_",parciStr,".pdf"}]}]->seriesGmTotal
(*++++++++++++++++*)
|>;
echo["output status"];
KeyValueMap[Export,outputAssoc]
