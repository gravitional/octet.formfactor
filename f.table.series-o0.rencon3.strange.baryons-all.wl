(* ::Package:: *)

(* ::Title:: *)
(*f.table.series-o0.rencon3.strange.baryons-all.wl*)


(* ::Chapter:: *)
(*initial 1*)


Once[
If[
(* if $ScriptCommandLine==={}, the environment is frontend*)
SameQ[$ScriptCommandLine,{}],
(*if execute in the frontend mode, refresh the title name*)
CompoundExpression[
(*\:6587\:4ef6\:7edd\:5bf9\:8def\:5f84*)
filename=NotebookFileName[],
(*\:5355\:5143\:5bf9\:8c61,\:7b2c\:4e00\:4e2a\:5355\:5143*)
cell`title=Cells[][[1]],
(*\:5237\:65b0\:7b2c\:4e00\:4e2a\:5355\:5143\:7684\:540d\:5b57*)
NotebookWrite[cell`title,Cell[FileNameSplit[filename][[-1]],"Title"]],
(*if execute in commandline mode, print a ready message*)
git`root`dir=StringCases[NotebookDirectory[],StartOfString~~((WordCharacter|":"|"\\")..)~~"octet.formfactor"][[1]]
(*add the base git root dir*)
],
CompoundExpression[
Print["Ready to execute this script"]
]
]
]


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


input`simulation={"C:\\octet.formfactor\\Numeric.series-o1.rencon3\\
f.table.series-o1.rencon3.strange.baryons-all.wl",
"o0",0.80,1.50};


(* ::Text:: *)
(*++++++++++++++++++++++++++++++++++++++++*)


(* ::Text:: *)
(*\:5f15\:5165\:547d\:4ee4\:884c\:53c2\:6570, 1 \:7528\:4f5c\:5b9e\:9645\:811a\:672c\:8fd0\:884c, 2\:7528\:4f5c\:8c03\:8bd5*)


input`cml={$ScriptCommandLine,input`simulation}[[1]];


(* ::Text:: *)
(*+++++++++++++++++++++++++++++++++*)


Print["----------------------------","\n","the parameter order, lambda, ci is","\n","----------------------------"];


{file`name,parameter`order,parameter`lambda0,parameter`ci}={
input`cml[[1]],input`cml[[2]],
ToExpression[input`cml[[3]]],
ToExpression[input`cml[[4]]]
}


Print["----------------------------"];


git`root`dir=StringCases[ExpandFileName[file`name],StartOfString~~((WordCharacter|":"|"\\")..)~~"octet.formfactor"][[1]]


parameter`order`string=ToString[parameter`order]
parameter`lambda0`string=ToString[NumberForm[parameter`lambda0,{3,2}]]
parameter`ci`string=ToString[NumberForm[parameter`ci,{3,2}]]


(* ::Chapter:: *)
(*import *)


(* ::Section:: *)
(*import origin data*)


input`dir=FileNameJoin[{git`root`dir,"/expression-mfiles/"}]


parameter`lambda0`group`string=If[
StringMatchQ[parameter`lambda0`string,"0.90"] && StringMatchQ[parameter`ci`string,("1.00"|"1.50")],
{
ToString[NumberForm[parameter`lambda0-0.1,{3,2}]],
ToString[NumberForm[parameter`lambda0,{3,2}]],
ToString[NumberForm[parameter`lambda0+0.1,{3,2}]]
},
{
ToString[NumberForm[parameter`lambda0,{3,2}]],
ToString[NumberForm[parameter`lambda0,{3,2}]],
ToString[NumberForm[parameter`lambda0,{3,2}]]
}
]


(* ::DisplayFormula:: *)
(*C:\\ octet.formfactor\\ expression-mfiles \\ data`baryons`series-o1`L-0.90`ci-1.50.m*)


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
Print["----------------------------","\n",".m files list","\n","----------------------------"];
StringRiffle[mfile`baryons`series]


(data`baryons`series`raw=Map[Get,mfile`baryons`series,{-1}]);


data`baryons`series`raw//Dimensions


(* ::DisplayFormula:: *)
(*data`baryons`series`raw,{3,2,8,6},{conf,gegm,io,clus}*)


(* ::Chapter:: *)
(*formatting*)


(* ::DisplayFormula:: *)
(*data`baryons`series,{3,2,8,6},{conf,gegm,io,clus}*)


(* ::Text:: *)
(*\:5728\:8fd9\:91cc\:6307\:5b9a\:4f5c\:56fe\:9009\:7528\:7684\:6570\:636e\:96c6\:ff0cci=1.0\:ff0cor\:ff0cci=1.5*)


(* ::Text:: *)
(*\:6307\:5b9a\:4e2d\:5fc3\:6570\:636e\:70b9\:ff0c\:7136\:540e\:7ed9\:5b83\:52a0\:4e0a\:4e0b errorbar*)


(* ::Text:: *)
(*\:4e2d\:5fc3\:6570\:636e\:70b9\:7684\:6307\:6807\:4e3a2*)


data`center=2;


data`baryons`series=data`baryons`series`raw[[data`center]];


(* ::Input:: *)
(*data`baryons`series//Dimensions*)


(* ::DisplayFormula:: *)
(*data`baryons`series,{2,8,6},{gegm,io,clus}*)


Module[{te`data},

gegm=2;io=1;clus=3;(*clus 3 is the calculated total value *)
data`baryons`series[[All,All,clus]]=Table[

te`data=data`baryons`series`raw[[All,gegm,io,clus]];
PlusMinus[te`data[[2]],Mean[Abs[te`data[[{1,3}]]-te`data[[2]]]]]

,{gegm,1,2,1}
,{io,1,8,1}
];

]


(* ::Input:: *)
(*data`baryons`series//Dimensions*)


(* ::DisplayFormula:: *)
(*data`baryons`series,{2,8,6},{gegm,io,cluster}*)


(* ::Text:: *)
(*\:5bf9\:6570\:636e\:663e\:793a\:683c\:5f0f\:5316\:7684\:7cbe\:786e\:5ea6\:63a7\:5236*)


choplimit=10^-8;


data`baryons`series`trim=Map[NumberForm[Chop[#1,choplimit],{6,3}]&,data`baryons`series,{-1}];


(* ::Input:: *)
(*data`baryons`series`trim//Dimensions*)


(* ::DisplayFormula:: *)
(*data`baryons`series`trim,{2,8,6},{gegm,io,cluster}*)


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
](*grid end*)
];


names`vertical={"\[CapitalSigma]m","\[CapitalSigma]0","\[CapitalSigma]p","pr","ne","\[CapitalXi]m","\[CapitalXi]0","\[CapitalLambda]"};(*octet abbreviations*)


names`horizontal={
{
"Q","tree","loop","total",
"exp.","Lattice","paper"
},
{
"\[Mu]","tree","loop","total",
"exp.","Lattice","paper"
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
(*data`baryons`series,{2,8,6},{gegm,io,cluster}*)


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


Print["----------------------------","\n","output directory","\n","----------------------------"];


output`dir=FileNameJoin[{git`root`dir,"/expression-results/"}]


Print["----------------------------","\n","output file name","\n","----------------------------"];


output`name`list={
(*++++++++++++++++*)
FileNameJoin[{output`dir,
"series."<>
parameter`order<>
".ge.L-"<>
parameter`lambda0`string<>
".ci-"<>
parameter`ci`string<>
".pdf"
}],
FileNameJoin[{output`dir,
"series."<>
parameter`order<>
".gm.L-"<>
parameter`lambda0`string<>
".ci-"<>
parameter`ci`string<>
".pdf"
}]
(*++++++++++++++++*)
}


output`file`list={
(*+++++++++++++++++++++*)
series`ge`total,
series`gm`total
(*+++++++++++++++++++++*)
};


(* ::Text:: *)
(*********************************************************************************)


Print["----------------------------","\n","output status","\n","----------------------------"];


Table[
Export[output`name`list[[i]],output`file`list[[i]]]
,{i,1,Length[output`file`list],1}]
