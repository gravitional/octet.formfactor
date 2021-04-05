(* ::Package:: *)

(* ::Title:: *)
(*f.table.series-o0.rencon3.strange.baryons-all.wl*)


(* ::Chapter:: *)
(*initial 1*)


(* ::Text:: *)
(*\:8ba1\:7b97\:73af\:5883\:53c2\:91cf\:ff0c\:6bd4\:5982\:8def\:5f84*)


git`remote`name="octet.formfactor";(*\:7ed9\:51fa\:8fdc\:7a0bgit\:4ed3\:5e93\:7684\:540d\:5b57*)
boole`incmd=Not[$Notebooks];(*\:811a\:672c\:7684\:8fd0\:884c\:6a21\:5f0f\:5224\:65ad\:ff0cTrue\:4ee3\:8868\:547d\:4ee4\:884c\:ff0cFalse\:4ee3\:8868\:524d\:7aef*)
filename=If[Not[boole`incmd],NotebookFileName[],$InputFileName](*\:7ed9\:51fa\:7b14\:8bb0\:672c\:7684\:7edd\:5bf9\:8def\:5f84*)


(* ::Text:: *)
(*\:5b9a\:4e49\:4e00\:4e9b\:5e38\:7528\:7684\:51fd\:6570*)


forcestr[x__]:=StringJoin[ToString[#1]&/@Flatten[{x}]](*\:5b9a\:4e49\:4e00\:4e2a\:786e\:4fdd\:5b57\:7b26\:4e32\:7684\:51fd\:6570*)


If[boole`incmd,
echo[x__]:=Print["----------------------------","\n\033[1;44m\033[1;37m",forcestr[x],"\033[0;0m\n","----------------------------"],(*\:5b9a\:4e49\:7ec8\:7aef\:7684\:6253\:5370\:51fd\:6570*)
echo[x__]:=Print[x](*\:5b9a\:4e49\:7b14\:8bb0\:672c\:7684\:6253\:5370\:51fd\:6570*)
]


(*\:5982\:679c\:5728\:524d\:7aef\:6267\:884c\:ff0c\:5c31\:5237\:65b0\:7b14\:8bb0\:672c\:7684\:540d\:5b57*)
Once[If[
(* if $ScriptCommandLine==={}, the environment is frontend*)
Not[boole`incmd],
(*if execute in the frontend mode, refresh the title name*)
CompoundExpression[
cell`title=(Cells[][[1]]),(*\:5355\:5143\:5bf9\:8c61,\:7b2c\:4e00\:4e2a\:5355\:5143*)
NotebookWrite[cell`title,Cell[FileNameSplit[filename][[-1]],"Title"]](*\:5237\:65b0\:7b2c\:4e00\:4e2a\:5355\:5143\:7684\:540d\:5b57*)
]
]];
If[boole`incmd,echo["Ready to execute this script"]](*\:5982\:679c\:5728\:547d\:4ee4\:884c\:6267\:884c\:ff0c\:5c31\:6253\:5370\:63d0\:793a\:4fe1\:606f*)


(* ::Text:: *)
(*\:5b9a\:4e49\:672c\:5730git\:76ee\:5f55\:ff0c\:4e5f\:5c31\:662f\:7a0b\:5e8f\:7684\:6839\:76ee\:5f55*)


echo["the git`local`name is"]
git`local`name=FileNameJoin[Append[TakeWhile[FileNameSplit[ExpandFileName[filename]],UnsameQ[#1,git`remote`name]&],git`remote`name]]


(* ::Text:: *)
(*********************************** notebook \:5907\:5fd8\:5f55*)


(* ::Text:: *)
(*series full calc scripts*)


(* ::Chapter:: *)
(*initial parameters*)


(* ::Text:: *)
(*++++++++++++++++++++++++++++++++++++++++++++*)


(* ::Text:: *)
(*\:6a21\:62df\:547d\:4ee4\:884c\:8f93\:5165\:ff0c\:8c03\:8bd5\:4f7f\:7528*)


input`simulation={"/home/tom/octet.formfactor/f.table.series-o0.rencon3.strange.baryons-all.wl",
"o0",0.90,1.00};


(* ::Text:: *)
(*++++++++++++++++++++++++++++++++++++++++*)


If[boole`incmd,
input`cml=$ScriptCommandLine,(*\:5982\:679c\:5728\:547d\:4ee4\:884c\:6267\:884c\:ff0c\:5c31\:91c7\:7528\:547d\:4ee4\:884c\:53c2\:6570*)
input`cml=input`simulation(*\:5982\:679c\:5728\:7b14\:8bb0\:672c\:6267\:884c\:ff0c\:5c31\:91c7\:7528\:6a21\:62df\:53c2\:6570*)
];


(* ::Text:: *)
(*+++++++++++++++++++++++++++++++++*)


echo["the parameter order, lambda, ci is"];


{file`name,parameter`order,parameter`lambda0,parameter`ci}={
input`cml[[1]],input`cml[[2]],
ToExpression[input`cml[[3]]],
ToExpression[input`cml[[4]]]
}


echo["the parameter order, lambda, ci,"];


parameter`order`string=ToString[parameter`order]
parameter`lambda0`string=ToString[NumberForm[parameter`lambda0,{3,2}]]
parameter`ci`string=ToString[NumberForm[parameter`ci,{3,2}]]


(* ::Chapter:: *)
(*import *)


(* ::Section:: *)
(*import origin data*)


input`dir=FileNameJoin[{git`local`name,"/expression-mfiles/"}]


parameter`lambda0`group`string=If[
StringMatchQ[parameter`lambda0`string,"0.90"] && StringMatchQ[parameter`ci`string,("1.00"|"1.50")],
{
ToString[NumberForm[parameter`lambda0-0.1,{3,2}]],(*\:5bf9\:4e8e0.90\:4e2d\:5fc3\:503c\:7684\:60c5\:51b5\:ff0c\:8003\:8651\:504f\:5dee0.1\:7684\:53e6\:5916\:4e24\:4e2a\:914d\:7f6e*)
ToString[NumberForm[parameter`lambda0,{3,2}]],
ToString[NumberForm[parameter`lambda0+0.1,{3,2}]]
},
{
ToString[NumberForm[parameter`lambda0,{3,2}]],(*\:5bf9\:4e8e\:975e\:4e2d\:5fc3\:503c\:7684\:60c5\:51b5\:ff0c\:505a\:6210\:76f8\:540c\:7684\:6570\:636e\:7ed3\:6784*)
ToString[NumberForm[parameter`lambda0,{3,2}]],
ToString[NumberForm[parameter`lambda0,{3,2}]]
}
]


Module[{tename1},

mfile`baryons`series=If[
StringMatchQ[parameter`lambda0`string,"0.90"] && StringMatchQ[parameter`ci`string,("1.00"|"1.50")],

FileNames[StartOfString~~"data.baryons.series-"~~
parameter`order`string~~
".L-"~~parameter`lambda0`group`string~~".ci-"~~parameter`ci`string~~".m",
input`dir],

tename1=First[
FileNames[StartOfString~~"data.baryons.series-"~~
parameter`order`string~~
".L-"~~parameter`lambda0`group`string~~".ci-"~~parameter`ci`string~~".m",
input`dir]
];
{tename1,tename1,tename1}

]
];
(*++++++++++++++++++++display+++++++++++++++++++++*)
echo[".m files list"];
echo[mfile`baryons`series]


(data`baryons`series`raw=Map[Get,mfile`baryons`series,{-1}]);


data`baryons`series`raw//Dimensions


(* ::DisplayFormula:: *)
(*data`baryons`series`raw,{3,2,8,31},{conf,gegm,io,seva}*)


(* ::Chapter:: *)
(*formatting*)


(* ::DisplayFormula:: *)
(*data`baryons`series,{3,2,8,6},{conf,gegm,io,seva}*)


(* ::Text:: *)
(*\:5728\:8fd9\:91cc\:6307\:5b9a\:4f5c\:56fe\:9009\:7528\:7684\:6570\:636e\:96c6\:ff0cci=1.0\:ff0cor\:ff0cci=1.5*)


(* ::Text:: *)
(*\:6307\:5b9a\:4e2d\:5fc3\:6570\:636e\:70b9\:ff0c\:7136\:540e\:7ed9\:5b83\:52a0\:4e0a\:4e0b errorbar*)


(* ::Text:: *)
(*\:4e2d\:5fc3\:6570\:636e\:70b9\:7684\:6307\:6807\:4e3a2*)


data`center=2;


data`baryons`series=data`baryons`series`raw[[data`center]];


(* ::DisplayFormula:: *)
(*data`baryons`series//Dimensions*)
(*data`baryons`series,{2,8,31},{gegm,io,seva}*)


Module[{te`data},(*\:5bf9\:4e8e\:603b\:8d21\:732e\:7684seva\:ff0c\:6539\:5199\:6210\:6709\:8bef\:5dee\:5e26\:7684\:5f62\:5f0f*)

gegm=2;io=1;seva=13;(*seva 13 \:662f\:603b\:8d21\:732e\:7684\:4f4d\:7f6e*)
data`baryons`series[[All,All,seva]]=Table[

te`data=data`baryons`series`raw[[All,gegm,io,seva]];
PlusMinus[te`data[[2]],Mean[Abs[te`data[[{1,3}]]-te`data[[2]]]]]

,{gegm,1,2,1}
,{io,1,8,1}
];

]


(* ::DisplayFormula:: *)
(*data`baryons`series//Dimensions*)
(*data`baryons`series,{2,8,31},{gegm,io,seva}*)


(* ::Text:: *)
(*\:5bf9\:6570\:636e\:663e\:793a\:683c\:5f0f\:5316\:7684\:7cbe\:786e\:5ea6\:63a7\:5236*)


choplimit=10^-8;


data`baryons`series`trim=Map[NumberForm[Chop[#1,choplimit],{6,3}]&,data`baryons`series,{-1}];


(* ::DisplayFormula:: *)
(*data`baryons`series`trim//Dimensions*)
(*{2,8,31}*)


(* ::Section:: *)
(*Q2table`style 2*)


fun`Q2table`rearrange=Function[{names`horizontal,names`vertical,data`list,background},
Grid[(*grid start*)
(Prepend[(*add names row*)
MapThread[Prepend,
{(*add names column*)
data`list,(*add the data to display*)
names`vertical (*prepend names aligned in vertical *)
}
],
names`horizontal(* prepend names aligned in horizontal, should +1, for vertical names place*)
])
,Frame->{All,All}
,Spacings->{2,2}
,Background->background
,ItemSize->Full
](*grid end*)
];


names`vertical={"\[CapitalSigma]m","\[CapitalSigma]0","\[CapitalSigma]p","pr","ne","\[CapitalXi]m","\[CapitalXi]0","\[CapitalLambda]"};(*octet abbreviations*)


names`horizontal={
{"Ge",
"tr uds","tr u","tr d","tr s",(*1,4*)
"lo,re2,uds","lo,re2,u","lo,re2,d","lo,re2,s",(*5,8*)
"lo,re3,uds","lo,re3,u","lo,re3,d","lo,re3,s",(*9,12*)
"lt uds","lt u","lt d","lt s",(*13,16*)
"qch u","qch d","qch s",(*17,19*)
"val u","val d","val s",(*20,22*)
"valtot u","valtot d","valtot s",(*23,25*)
"sea u","sea d","sea s",(*26,28*)
"exp.","Lattice","paper"(*29,31*)
},
{"\[Mu]",
"tr uds","tr u","tr d","tr s",(*1,4*)
"lo,re2,uds","lo,re2,u","lo,re2,d","lo,re2,s",(*5,8*)
"lo,re3,uds","lo,re3,u","lo,re3,d","lo,re3,s",(*9,12*)
"lt uds","lt u","lt d","lt s",(*13,16*)
"qch u","qch d","qch s",(*17,19*)
"val u","val d","val s",(*20,22*)
"valtot u","valtot d","valtot s",(*23,25*)
"sea u","sea d","sea s",(*26,28*)
"exp.","Lattice","paper"(*29,31*)
}
};


data`background={
None,(* color horizontal: x1, x2, x3...*)
{
LightCyan,{None,LightBlue}
}(* color vertical: y1, y2, y3...*)
};


(* ::DisplayFormula:: *)
(*fun`Q2table`rearrange=Function[{names`horizontal,names`vertical,data`list,background},*)


(* ::DisplayFormula:: *)
(*data`baryons`series,{2,8,6},{gegm,io,seva}*)


(* ::Text:: *)
(*\:8868\:683c\:5b57\:4f53\:5c3a\:5bf8*)


tab`fontsize=12;


gegm=1;
series`ge`total=Style[
Multicolumn[
{(* paras of column need an {} *)
(*+++++++++++++++++++++++++sea-valence part  +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++*)
fun`Q2table`rearrange[(*legend name*)
names`horizontal[[gegm]],(*column name*)
names`vertical,(*row name*)
(*****************************data list start********************************)
data`baryons`series`trim[[gegm]],
(********************************start background*******************************************)
data`background
]
(*+++++++++++++++++++++++++sea-valence part  +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++*)
}
,1
]
,FontSize->tab`fontsize
];


gegm=2;
series`gm`total=Style[
Multicolumn[
{(* paras of column need an {} *)
(*+++++++++++++++++++++++++sea-valence part  +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++*)
fun`Q2table`rearrange[(*legend name*)
names`horizontal[[gegm]],(*column name*)
names`vertical,(*row name*)
(*****************************data list start********************************)
data`baryons`series`trim[[gegm]],
(********************************start background*******************************************)
data`background
]
(*+++++++++++++++++++++++++sea-valence part  +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++*)
}
,1
]
,FontSize->tab`fontsize
];


(* ::Chapter:: *)
(*storage*)


echo["output directory"];
output`dir=FileNameJoin[{git`local`name,"/expression-results/"}]


echo["files to export"];(*\:8981\:5bfc\:51fa\:7684\:6587\:4ef6,\:5173\:8054\:7684\:5f62\:5f0f\:ff0c\:4fdd\:5b58\:7528\:7684\:6587\:4ef6\:540d\[Rule]\:5bf9\:5e94\:7684\:6587\:4ef6*)
output`assoc=<|
(*++++++++++++++++*)
FileNameJoin[{output`dir,"series."<>parameter`order<>".ge.L-"<>parameter`lambda0`string<>".ci-"<>parameter`ci`string<>".pdf"}]->series`ge`total,
FileNameJoin[{output`dir,"series."<>parameter`order<>".gm.L-"<>parameter`lambda0`string<>".ci-"<>parameter`ci`string<>".pdf"}]->series`gm`total
(*++++++++++++++++*)
|>;


echo["output status"];
KeyValueMap[Export,output`assoc]
