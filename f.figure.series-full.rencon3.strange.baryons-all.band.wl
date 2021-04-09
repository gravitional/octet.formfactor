(* ::Package:: *)

(* ::Title:: *)
(*f.figure.series-full.rencon3.strange.baryons-all.band.wl*)


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
(*\:6a21\:62df\:547d\:4ee4\:884c\:8f93\:5165,\:8c03\:8bd5\:4f7f\:7528*)


(* ::Text:: *)
(*parameter`marker, "Bars","Fences","Points", "Ellipses","Bands"*)


(* ::DisplayFormula:: *)
(*file`name,parameter`order,parameter`lambda0,parameter`ci,*)
(*calc`point`opacity,calc`errobar`marker,calc`errobar`opacity[[gegm,io]],*)
(*expr`errobar`style,expr`opacity*)
(*whether`normal*)


input`simulation={"/home/tom/octet.formfactor/f.figure.series-full.rencon3.strange.baryons-all.band.wl",
"full",0.90,1.50,
"{1,1,1,1,1,1,1,1}","Bands","{{0.2,0.2,0.2,0.2,0.2,0.2,0.2,0.2},{0.2,0.2,0.2,0.2,0.2,0.2,0.2,0.2}}",
4,1,
"normal"(*\:662f\:5426\:5bf9\:6570\:636e\:8fdb\:884c\:5f52\:4e00\:5316*)
};


(* ::Text:: *)
(*++++++++++++++++++++++++++++++++++++++++*)


(* ::Text:: *)
(*\:5f15\:5165\:547d\:4ee4\:884c\:53c2\:6570, \:81ea\:52a8\:5224\:65ad\:662f\:5728\:547d\:4ee4\:884c\:4e0b\:8fd0\:884c\:ff0c\:8fd8\:662f\:5728\:7b14\:8bb0\:672c\:4e2d\:8fd0\:884c*)


If[boole`incmd,
input`cml=$ScriptCommandLine,(*\:5982\:679c\:5728\:547d\:4ee4\:884c\:6267\:884c\:ff0c\:5c31\:91c7\:7528\:547d\:4ee4\:884c\:53c2\:6570*)
input`cml=input`simulation(*\:5982\:679c\:5728\:7b14\:8bb0\:672c\:6267\:884c\:ff0c\:5c31\:91c7\:7528\:6a21\:62df\:53c2\:6570*)
];


(* ::Text:: *)
(*+++++++++++++++++++++++++++++++++*)


echo["the parameter order, lambda, ci is"]


{file`name,
parameter`order,parameter`lambda0,parameter`ci,
calc`point`opacity,calc`errobar`style,calc`errobar`opacity,
expr`errobar`style,expr`opacity,
whether`normal
}={input`cml[[1]],
input`cml[[2]],ToExpression[input`cml[[3]]],ToExpression[input`cml[[4]]],
ToExpression[input`cml[[5]]],ToString[input`cml[[6]]],ToExpression[input`cml[[7]]],
ToExpression[input`cml[[8]]],ToExpression[input`cml[[9]]],
ToString[input`cml[[10]]]
}


echo["the parameter order, lambda, ci,"];


parameter`order`string=ToString[parameter`order]
parameter`lambda0`string=ToString[NumberForm[parameter`lambda0,{3,2}]]
parameter`ci`string=ToString[NumberForm[parameter`ci,{3,2}]]


(* ::Section:: *)
(*import origin figs*)


(* ::DisplayFormula:: *)
(*{\[CapitalLambda], ci}->*)


(* ::DisplayFormula:: *)
(*{0.8,1.0} ,{0.9,1.0} ,*)


(* ::DisplayFormula:: *)
(*{1.0,1.0},{0.8,1.5} ,*)


(* ::DisplayFormula:: *)
(*{0.9,1.5},{1.0,1.5}*)


directory`fig=FileNameJoin[{git`local`name,"/expression-mfiles/"}]


parameter`lambda0`group`string=If[parameter`lambda0`string==="0.90"&&parameter`ci`string==="1.50",(*\:5bf9\:4e8e\:4e2d\:5fc3\:503c\:7684\:60c5\:5f62\:ff0c\:52a0\:4e0a\:8bef\:5dee\:5e26*)
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


Module[{tename1,tename2},

nb`list=If[parameter`lambda0`string==="0.90"&&parameter`ci`string==="1.50",(*\:5bf9\:4e8e\:4e2d\:5fc3\:503c\:7684\:60c5\:5f62\:ff0c\:505a\:6210\:4e09\:91cd\:6570\:636e\:5e76\:5217\:7684\:683c\:5f0f*)
FileNames[StartOfString~~"fig_calc_baryons_gegm_L-"~~parameter`lambda0`group`string~~"_ci-"~~parameter`ci`string~~".m",directory`fig],

tename1=First[FileNames[StartOfString~~"fig_calc_baryons_gegm_L-"~~parameter`lambda0`group`string~~"_ci-"~~parameter`ci`string~~".m",directory`fig]];
{tename1,tename1,tename1}(*\:5bf9\:4e8e\:975e\:4e2d\:5fc3\:503c\:7684\:60c5\:5f62\:ff0c\:4e5f\:505a\:6210\:4e09\:91cd\:6570\:636e\:5e76\:5217\:7684\:683c\:5f0f*)
]
];
(*++++++++++++++++++++display+++++++++++++++++++++*)
echo[".m files list"]
echo[nb`list]


(fig`baryons`origin=Map[Get,nb`list,{-1}]);


(* ::DisplayFormula:: *)
(*fig`baryons`origin//Dimensions*)
(*{3,2,28,8},{conf,gegm,seva,io}*)


(* ::Section:: *)
(*import series-o0*)


(* ::Text:: *)
(*\:5bfc\:5165\:96f6\:70b9\:503c\:7684\:6587\:4ef6*)


(* ::DisplayFormula:: *)
(*{\[CapitalLambda], ci}->*)


(* ::DisplayFormula:: *)
(*{0.8,1.0} ,{0.9,1.0} ,*)


(* ::DisplayFormula:: *)
(*{1.0,1.0},{0.8,1.5} ,*)


(* ::DisplayFormula:: *)
(*{0.9,1.5},{1.0,1.5}*)


directory`series`o0=FileNameJoin[{git`local`name,"/expression-mfiles/"}]


(* ::Text:: *)
(*parameter`lambda0`group`string =={0.80,0.90,1.00}*)


Module[{tename1,tename2},

nb`list=If[parameter`lambda0`string==="0.90"&&parameter`ci`string==="1.50",
(*\:5982\:679c\:662fpaper\:4e2d\:7684\:914d\:7f6e\:ff0c\:90a3\:4e48\:9700\:8981\:8ba1\:7b97band\:ff0c\:5bfc\:5165\:76f8\:90bb\:914d\:7f6e\:7684\:503c*)
FileNames[StartOfString~~"data.baryons.series-o0.L-"~~parameter`lambda0`group`string~~".ci-"~~parameter`ci`string~~".m",
directory`series`o0],
(*\:5982\:679c\:4e0d\:662fpaper\:4e2d\:7684\:914d\:7f6e\:ff0c\:4e0d\:4e00\:5b9a\:8ba1\:7b97\:4e86band\:ff0c\:6240\:4ee5\:5bfc\:5165\:7684band\:662f\:81ea\:5df1\:ff0c\:6700\:540ebanb\:4e3a0\:5bbd\:5ea6*)
tename1=First[FileNames[StartOfString~~"data.baryons.series-o0.L-"~~parameter`lambda0`group`string~~".ci-"~~parameter`ci`string~~".m",
directory`fig]];
{tename1,tename1,tename1}
]
];
(*++++++++++++++++++++display+++++++++++++++++++++*)
echo[".m files list"]
StringRiffle[nb`list]


(series`baryons`origin=Map[Get,nb`list,{-1}]);


(* ::DisplayFormula:: *)
(*series`baryons`origin//Dimensions*)
(*{3,2,8,31}\:ff0c{conf,gegm,io,seva}*)
(*\:6700\:540e\:4e00\:4e2a\:6307\:6807\:662f\:6570\:636e\:7684\:7c7b\:522b\:ff0ctree,loop,total,experiment,\:4ee5\:53ca\:6587\:732e\:91cc\:7684\:6570\:503c*)


(* ::Text:: *)
(*\:63d0\:53d6\:51fa\:5404\:4e2a\:914d\:7f6e\:4e0b\:78c1\:77e9\:7684\:503c\:ff0c\:53ea\:8981\:8ba1\:7b97\:7684total\:503c\:ff0cseva=13*)


series`baryons`im1=series`baryons`origin[[All,2,All,(seva=13)]];
series`baryons=series`baryons`im1;


(* ::DisplayFormula:: *)
(*series`baryons//Dimensions*)
(*{3,8}*)


(* ::Section:: *)
(*gegm \:5f52\:4e00\:5316*)


(* ::Text:: *)
(*\:8fd9\:91cc\:7ed9\:51fagegm\:7684\:5e45\:503c\:ff0c\:540e\:9762\:662f\:5426\:5bf9\:56fe\:7684\:6570\:636e\:8fdb\:884c\:5f52\:4e00\:5316\:4f1a\:7528\:5230*)


amp`gegm`calc=<|
"normal"->{ConstantArray[1,{3,8}],ConstantArray[1,{3,8}]},(*\:5f52\:4e00\:5316\:7684\:96f6\:70b9\:503c*)
"unnormal"->{ConstantArray[1,{3,8}],Identity[series`baryons]}(*\:4e0d\:5f52\:4e00\:5316\:7684\:96f6\:70b9\:503c*)
|>;


(* ::DisplayFormula:: *)
(*amp`gegm`calc[whether`normal]//Dimensions*)
(*{2,3,8},[[gegm,conf,io]]*)


(* ::Section:: *)
(*extract data*)


(* ::DisplayFormula:: *)
(*fig`baryons`origin//Dimensions*)
(*{3,2,28,8},{conf,gegm,seva,io}*)


fun`data`extract[fig`baryons`origin_]:=Table[

(data@@Cases[fig`baryons`origin[[conf,gegm,seva,io]],_Line,Infinity])/.Line->Apply[Sequence]
(*\:63d0\:53d6\:51fa\:753b\:56fe\:4f7f\:7528\:7684\:5ea7\:6807\:70b9\:ff0c\:5c06\:5934\:90e8\:7684Line \:66ff\:6362\:6210 Sequence,\:6700\:5916\:5c42\:4f7f\:7528 data \:4fdd\:62a4*)
,{conf,1,3,1}
,{gegm,1,2,1}
,{seva,1,28,1}
,{io,1,8,1}
](*\:63d0\:53d6\:51fa\:539f\:59cb\:56fe\:5f62\:6570\:636e\:4e2d\:7684\:5ea7\:6807\:70b9\:4f4d\:7f6e*)


data`baryons`raw=fun`data`extract[fig`baryons`origin];


(* ::DisplayFormula:: *)
(*data`baryons`raw//Dimensions*)
(*{3,2,28,8},{conf,gegm,seva,io}*)


(* ::Text:: *)
(*\:53bb\:9664\:91cd\:590d\:7684\:91c7\:6837\:70b9*)


data`baryons=Table[

DeleteDuplicates[data`baryons`raw[[conf,gegm,seva,io]]/.data->List](*\:5229\:7528data`f2\:89c4\:8303\:6570\:636e\:683c\:5f0f*)

,{conf,1,3,1}
,{gegm,1,2,1}
,{seva,1,28,1}
,{io,1,8,1}
];


(* ::DisplayFormula:: *)
(*data`baryons//Dimensions*)
(*{3,2,28,8},{conf,gegm,seva,io}*)


(* ::Chapter:: *)
(*Interpolation*)


(* ::Text:: *)
(*\:5bf9\:6570\:636e\:4f5c\:5185\:63d2\:662f\:56e0\:4e3a\:4e2d\:5fc3\:503c\:548c\:8bef\:5dee\:5e26\:7684\:91c7\:70b9\:4f4d\:7f6e\:5e76\:4e0d\:76f8\:540c \:ff0c\:6240\:4ee5\:9700\:8981\:6309\:7167\:4e2d\:5fc3\:503c\:6570\:636e\:70b9\:7684\:4f4d\:7f6e\:4f5c\:5185\:63d2\:3002*)


(* ::DisplayFormula:: *)
(*data`baryons//Dimensions*)
(*{3,2,28,8},{conf,gegm,seva,io}*)


positions`center=data`baryons[[
2,All,All,All,(*\:4e2d\:5fc3\:914d\:7f6e*)
All,1(*\:8fd9\:4e2a\:6307\:6807\:63d0\:53d6\:5230\:7684\:662f\:4e2d\:5fc3\:70b9\:7684\:6a2a\:5750\:6807*)
]];


(* ::DisplayFormula:: *)
(*positions`center//Dimensions*)
(*{2,28,8},{gegm,seva,io}*)


(* ::Text:: *)
(*\:83b7\:5f97\:8bef\:5dee\:6570\:636e\:7684\:63d2\:503c\:51fd\:6570*)


errorbar`interp=Table[
Interpolation[data`baryons[[conf,gegm,seva,io]]]
,{conf,{1,3}}
,{gegm,1,2,1}
,{seva,1,28,1}
,{io,1,8,1}
];


(* ::DisplayFormula:: *)
(*errorbar`interp//Dimensions*)
(*{2,2,28,8},{conf,gegm,seva,io}*)


(* ::Text:: *)
(*\:83b7\:5f97\:4e2d\:5fc3\:70b9\:7684\:503c*)


value`center`im1=data`baryons[[
2,All,All,All,
All,2(*\:8fd9\:4e2a\:6307\:6807\:63d0\:53d6\:5230\:7684\:662f\:4e2d\:5fc3\:70b9\:7684\:7eb5\:5750\:6807*)
]];


(* ::DisplayFormula:: *)
(*value`center`im1//Dimensions*)
(*{2,28,8},{gegm,seva,io}*)


(* ::Text:: *)
(*\:5c06\:4e2d\:5fc3\:70b9\:7684\:503c\:4e58\:4e0a\:5f52\:4e00\:5316\:7684\:5e45\:5ea6\:ff0c\:4e2d\:5fc3\:70b9\:7684config\:662f2*)


(* ::Text:: *)
(*amp`gegm`calc[whether`normal],{gegm,conf,io},{2,3,8}*)


echo["wheather the calc data normalized"]
amp`gegm`calc[whether`normal]


value`center=Table[
amp`gegm`calc[whether`normal][[gegm,(conf=2),io]]*value`center`im1[[gegm,seva,io]]
,{gegm,1,2,1}
,{seva,1,28,1}
,{io,1,8,1}
];


(* ::Text:: *)
(*\:5173\:95ed\:5916\:63d2\:6cd5\:63d0\:793a*)


Off[InterpolatingFunction::dmval]


(* ::Text:: *)
(*\:5bf9\:4e24\:4e2a\:8bef\:5dee\:4e0a\:4e0b\:9650\:ff0c\:8fdb\:884c\:63d2\:503c\:5904\:7406\:ff0c*)


(* ::Text:: *)
(*\:5e76\:4e14\:5c06\:8bef\:5dee\:6570\:636e\:4e58\:4e0a\:5f52\:4e00\:5316\:7684\:5e45\:5ea6\:ff0c\:8bef\:5dee\:6570\:636e\:7684\:914d\:7f6e\:6307\:6807\:662f{1,3},\:7528\:4e0b\:5f0f\:53d6\:51fa\:8bef\:5dee\:6570\:636e\:7684\:5e45\:5ea6*)


amp`gegm`calc`error=amp`gegm`calc[whether`normal][[All,{1,3},All]];


value`asy=Table[

amp`gegm`calc`error[[gegm,conf,io]]*(errorbar`interp[[conf,gegm,seva,io]][positions`center[[gegm,seva,io]]])

,{conf,1,2,1}
,{gegm,1,2,1}
,{seva,1,28,1}
,{io,1,8,1}
];


(* ::DisplayFormula:: *)
(*value`asy//Dimensions*)
(*{2,2,28,8},{conf,gegm,seva,io}*)


errorbar`asy=Table[

value`asy[[conf,gegm,seva,io]]-value`center[[gegm,seva,io]]

,{conf,1,2,1}
,{gegm,1,2,1}
,{seva,1,28,1}
,{io,1,8,1}
];


(* ::DisplayFormula:: *)
(*errorbar`asy//Dimensions*)
(*{2,2,28,8},{conf,gegm,seva,io}*)


errorbar`sym=Table[

Mean[Abs[errorbar`asy[[All,gegm,seva,io]]]]

,{gegm,1,2,1}
,{seva,1,28,1}
,{io,1,8,1}
];


(* ::DisplayFormula:: *)
(*errorbar`sym//Dimensions*)
(*{2,28,8},{gegm,seva,io}*)


(* ::Chapter:: *)
(*errorbar*)


(* ::Text:: *)
(*\:6307\:5b9a\:4e2d\:5fc3\:6570\:636e\:70b9,\:7136\:540e\:7ed9\:5b83\:52a0\:4e0a Errobar*)


(* ::DisplayFormula:: *)
(*positions`center,{2,28,8},{gegm,seva,io}*)
(*value`center,{2,28,3},{gegm,seva,io}*)
(*errorbar`sym,{2,28,8},{gegm,seva,io}*)


(* ::Section:: *)
(*\:8ba1\:7b97\:6570\:636e\:683c\:5f0f\:5316*)


data`precision=10^(-14);


(* ::Text:: *)
(*\:8fd9\:91cc\:51fa\:73b0\:7684\:662f\:5f52\:4e00\:5316\:4e4b\:540e\:7684\:8ba1\:7b97\:6570\:636e*)


Module[{tea},
data`interval`im1=Table[
{(*\:6a2a\:5750\:6807\:7684\:6570\:636e\:70b9*)
positions`center[[gegm,seva,io,point]],
(*\:7eb5\:5750\:6807\:7684\:6570\:636e\:70b9*)
Around[
(*\:7eb5\:5750\:6807\:7684\:4e2d\:5fc3\:70b9*)
value`center[[gegm,seva,io,point]],

tea=errorbar`sym[[gegm,seva,io,point]];
(*\:52a0\:5165\:4e00\:4e2a\:5224\:65ad\:ff0c\:5e76\:7ed9\:6570\:636e\:4e58\:4e0a\:5e45\:5ea6*)
If[tea>data`precision,
tea,
data`precision
]
(*\:5982\:679c\:8bef\:5dee\:4e3a0\:7684\:8bdd\:ff0c\:4e3a\:4e86\:907f\:514daround\:81ea\:52a8\:53bb\:6389\:ff0c\:628a\:8bef\:5dee\:6539\:6210\:4e00\:4e2a\:975e\:5e38\:5c0f\:7684\:6570\:5b57*)
]
}

,{gegm,1,2,1}
,{seva,1,28,1}
,{io,1,8,1}
,{point,1,Length[positions`center[[gegm,seva,io]]],1}
];
];


(* ::DisplayFormula:: *)
(*data`interval`im1//Dimensions*)
(*{2,28,8},{gegm,seva,io,points}*)


(* ::Text:: *)
(*\:4e0b\:9762\:4e24\:6bb5\:5c06\:6570\:636e\:6539\:9020\:6210\:5173\:8054\:7684\:5f62\:5f0f\:ff0c\:65b9\:4fbf\:5bf9values\:8fdb\:884c\:64cd\:4f5c*)


data`interval`im2=Map[Association[#1[[1]]->#1[[2]]]&,data`interval`im1,{-3}];


data`interval`im3=Map[Merge[#1,First]&,data`interval`im2,{-4}];


(* ::Text:: *)
(*data`interval`im3,{2,8,3},{gegm,io,conf}*)


data`interval=data`interval`im3;


(* ::Chapter::Closed:: *)
(*experiment*)


(* ::Section:: *)
(*import experiment data*)


dir`expr=FileNameJoin[{git`local`name,"/experiment/"}]


(* ::Text:: *)
(*\:6309\:7167\:53c2\:8003\:6587\:732e\:51fa\:73b0\:987a\:5e8f\:4f5c\:4e3alabel\:7684\:6570\:636e*)


(* ::Text:: *)
(*nucleon_assoc _data _reforder.m*)
(*nucleon_assoc_data_authyear.m*)


Module[{tename1,tename2},

file`list=FileNames[StartOfString~~__~~"data_authyear.m",
dir`expr
]


];
(*++++++++++++++++++++display+++++++++++++++++++++*)
echo["import experiment data"]
StringRiffle[file`list]


(assoc`expr`raw=Map[Get,file`list,{-1}]//First);


echo["the dimensions of exper raw data"]
assoc`expr`raw//Dimensions


(* ::DisplayFormula:: *)
(*assoc`expr`raw,{4},{ge.n,ge.p,gm.n,gm.p}*)


(* ::Text:: *)
(*\:628a\:5b9e\:9a8c\:6587\:732e\:4e2d\:7684\:6570\:636e\:6539\:6210association\:7684\:683c\:5f0f*)


assoc`expr`im1=Map[Association[#1[[1]]->#1[[2]]]&,
assoc`expr`raw,
{-4}];


(* ::Text:: *)
(*\:628aassociation\:8054\:7ed3\:8d77\:6765*)


assoc`expr`im2=Map[Merge[#1,First]&,
assoc`expr`im1,
{2}];


(* ::Section:: *)
(*experiment amplitude*)


(* ::Text:: *)
(*\:6570\:636e\:7684\:6b21\:5e8f\:662f ge.n,ge.p,gm.n,gm.p*)


(* ::Text:: *)
(*\:8fd9\:91cc\:7ed9\:51fagegm\:7684\:5e45\:503c\:ff0c\:6765\:4e0d\:5f52\:4e00\:5316\:4f5c\:4f5c\:56fe\:3002*)


amp`gegm`expr=<|
"normal"->{
1,1,1,1
},
"unnormal"->{
1,1,Identity[\[Minus]1.9130427],Identity[2.7928473446]
}
|>;


(* ::Text:: *)
(*\:5728\:8fd9\:91cc\:8bbe\:8ba1\:4e00\:4e2a\:662f\:5426\:8fdb\:884c\:5f52\:4e00\:5316\:7684\:5f00\:5173*)


echo["wheather the experiment data normalized, print here"]


amp`gegm`expr[whether`normal]


assoc`expr=Table[
amp`gegm`expr[whether`normal][[inde]]*assoc`expr`im2[[inde]]
,{inde,1,4,1}
];


(* ::Chapter:: *)
(*draw*)


(* ::Section:: *)
(*initial*)


(* ::Text:: *)
(*\:7ed9\:5b9a\:989c\:8272\:548c\:7ebf\:578b\:65b9\:6848,\:5e26\:7535\:7c92\:5b504\:4e2a,\:4e2d\:6027\:7c92\:5b504\:4e2a,\:540c\:6837\:7684\:6392\:5217*)


(* ::Text:: *)
(*mma \:9ed8\:8ba4\:7684\:56fe\:5f62\:989c\:8272*)


style`exp={
AbsoluteThickness[_]-> AbsoluteThickness[.8],
PointSize[_]->PointSize[0.02]
};


color`default = RGBColor[0.368417, 0.506779, 0.709798];


(* ::DisplayFormula:: *)
(*1,3,4,6;2,5,7,8*)


style`colors`theme={Blue,Green,Red,Black};


(* ::DisplayFormula:: *)
(*style`colors = {*)
(*(*1*)style`colors`theme[[1]],*)
(*(*2*)style`colors`theme[[1]],*)
(*(*3*)style`colors`theme[[2]],*)
(*(*4*)style`colors`theme[[3]],*)
(*(*5*)style`colors`theme[[2]],*)
(*(*6*)style`colors`theme[[4]],*)
(*(*7*)style`colors`theme[[3]],*)
(*(*8*)style`colors`theme[[4]]*)
(*};*)


(* ::Text:: *)
(*\:8ba1\:7b97\:6570\:636e\:8fb9\:6846\:6587\:5b57\:7684\:5927\:5c0f*)


font`whether`nomral=<|"normal"->18,"unnormal"->12|>;


(* ::Text:: *)
(*\:6839\:636e\:662f\:5426\:4f5c\:56fe\:6570\:636e\:662f\:5426\:5f52\:4e00\:5316\:ff0c\:9009\:62e9\:6587\:5b57\:7684\:5927\:5c0f*)


fontsize`frame`text=font`whether`nomral[whether`normal];


(* ::Text:: *)
(*\:56fe\:50cf\:7684\:5927\:5c0f*)


imagesize=Scaled[.6];


(* ::Text:: *)
(*\:8fb9\:6846\:523b\:5ea6\:7ebf\:7684\:7c97\:7ec6*)


fontsize`frame`tick=AbsoluteThickness[1.5];


(* ::Section:: *)
(*legend\:56fe\:4f8b\:76f8\:5173*)


(* ::Text:: *)
(*\:56fe\:4f8b\:7684\:7f29\:653e\:6bd4\:4f8b*)


fig`legend`magni=1;


(* ::Text:: *)
(*\:56fe\:4f8b\:6587\:5b57\:7684\:5927\:5c0f*)


legend`calc`text`size=10;
legend`expr`text`size=10;


(* ::Text:: *)
(*\:5b9e\:9a8c\:56fe\:4f8b\:7684\:5e03\:5c40\:51fd\:6570\:ff0c\:4e00\:822c\:6307\:5b9a\:51e0\:884c\:51e0\:5217\:5373\:53ef\:ff1a*)


(* ::DisplayFormula:: *)
(*SwatchLegend[63,Range[5],LegendLayout->(Map[(If[ListQ[#],Row[#,"  "]]&),Multicolumn[##,4],{3}]&)]*)


(*\:4ea7\:751f\:4e00\:4e2a\:51fd\:6570\:ff0c\:53ef\:4ee5\:628a\:56fe\:4f8b\:6392\:5217\:6210n\:5217,\:4f7f\:7528Row\:662f\:56e0\:4e3a\:4f20\:9012\:8fc7\:6765\:7684\:53c2\:6570\:4f1a\:5e26\:6709\:62ec\:53f7\:ff0c\:91cd\:6392\:65f6\:7f3a\:5c11\:7684\:4f1a\:7528\:7a7a\:5b57\:7b26\:8865\:5145\:ff0c\:6ca1\:6709\:5217\:8868\:5934\:90e8*)
fun`legend`layout[n_]:=(Map[(If[ListQ[#],Row[#,"  "]]&),Multicolumn[##,n,Alignment->Left,Appearance->"Horizontal"],{3}]&)


legend`expr`layout={
fun`legend`layout[3],(*ge.n*)
fun`legend`layout[3],(*ge.p*)
fun`legend`layout[3],(*gm.n*)
fun`legend`layout[3](*gm.p*)
};


(* ::Text:: *)
(*\:6307\:5b9a\:56fe\:4f8b\:4e2d\:6bcf\:4e2a\:5143\:7d20\:7684\:5927\:5c0f,\:6309\:7167 ge.n, ge.p, gm.n, gm.p \:7684\:6b21\:5e8f\:ff0c*)


(* ::Text:: *)
(*\:8ba1\:7b97\:6570\:636e\:7684\:ff1a*)


legend`calc`totalsize={
{28,2}, (*ge.n*)
{28,2},(*ge.p*)
{28,2},(*gm.n*)
{28,2}(*gm.p*)
};


(* ::Text:: *)
(*\:5b9e\:9a8c\:6570\:636e\:7684\:ff1a*)


legend`expr`totalsize={
{10,10}, (*ge.n*)
{10,10},(*ge.p*)
{10,10},(*gm.n*)
{10,10}(*gm.p*)
};


(* ::Text:: *)
(*\:56fe\:4f8b\:7684\:4f4d\:7f6e\:ff0c\:5206\:6210\:81ea\:5df1\:8ba1\:7b97\:7684\:ff0c\:548c\:53c2\:8003\:7684\:5b9e\:9a8c\:6570\:636e\:ff0c\:6309\:7167 ge.n, ge.p, gm.n, gm.p \:7684\:6b21\:5e8f\:ff0c*)


(* ::Text:: *)
(*\:5b9e\:9a8c\:6570\:636e\:7684\:56fe\:4f8b\:ff1a*)


legend`position`expr={
{(*ge.n*) Scaled[{0.40,0.70}],(*anchor position*)
   {0,0}(*legend anchor*)},

{(*ge.p*)Scaled[{0.40,0.05}],(*anchor position*)
   {0,0}(*legend anchor*)},

{(*gm.n*){0.05,0.02},(*anchor position*)
   {0,0}(*legend anchor*)},

{(*gm.p*){0.05,0.05},(*anchor position*)
   {0,0}(*legend anchor*)}
   };


legend`position`calc={
{(*ge.n*){0.04,0.65},(*anchor position*)
   {0,0}(*legend anchor*)},

{(*ge.p*)Scaled[{0.80,0.625}],(*anchor position*)
   {0,0}(*legend anchor*)},

{(*gm.n*){0.20,0.65},(*anchor position*)
   {0,0}(*legend anchor*)},

{(*gm.p*){0.20,0.65},(*anchor position*)
   {0,0}(*legend anchor*)}
   };


(* ::Text:: *)
(*\:6307\:5b9a\:7eb5\:8f74\:8303\:56f4\:ff0ccalc and expr \:90fd\:751f\:6548*)


fig`range=<|
"normal"->{
{{0,1},All},(*ge.n*)
{{0,1},All},(*ge.p*)
{{0,1},All},(*gm.n*)
{{0,1},All}(*gm.p*)
},
"unnormal"->{
{{0,1},All},(*ge.n*)
{{0,1},All},(*ge.p*)
{{0,1},{-2.5,0}},(*gm.n*)
{{0,1},{0,3.2}}(*gm.p*)
}
|>;


(* ::Text:: *)
(*\:6307\:5b9a\:56fe\:50cf\:7a7a\:767d\:586b\:5145\:8303\:56f4\:ff0ccalc and expr \:90fd\:751f\:6548*)


fig`padding=<|
"normal"->{
{{0,0},{Scaled[0.09],Scaled[0.12]}},(*ge.n*)
{{0,0},{Scaled[0.09],Scaled[0.12]}},(*ge.p*)
{{0,0},{Scaled[0.09],Scaled[0.12]}},(*gm.n*)
{{0,0},{Scaled[0.09],Scaled[0.12]}}(*gm.p*)
},
"unnormal"->{
{{0,0},{0,0}},(*ge.n*)
{{0,0},{0,0}},(*ge.p*)
{{0,0},{0,0}},(*gm.n*)
{{0,0},{0,0}}(*gm.p*)
}
|>;


(* ::Section:: *)
(*others*)


(* ::Text:: *)
(*\:9ed8\:8ba4\:7ebf\:5bbd*)


style`line`thick=AbsoluteThickness[2];


(* ::Text:: *)
(*\:7ebf\:578b,Dashing[{}]\:6307\:5b9a\:7ebf\:4e3a\:5b9e\:7ebf*)


style`line`type={AbsoluteDashing[{}],AbsoluteDashing[6],AbsoluteDashing[{1,6}],
AbsoluteDashing[{1,6,6,6}]
};


(* ::Text:: *)
(*\:7ebf\:578b\:548c\:989c\:8272\:7ec4\:5408*)


(* ::DisplayFormula:: *)
(*style`line`type={Dashing[{}],Dashing[Medium],Dotted,DotDashed};*)


(* ::DisplayFormula:: *)
(*style`colors`theme={Blue,Green,Red,Black};*)


fun`style`line[a_,b_,c_]:=Directive[style`line`thick,style`line`type[[a]],style`colors`theme[[b]],Opacity[c]]


(* ::Text:: *)
(*\:8bbe\:5b9a\:516b\:91cd\:6001\:66f2\:7ebfstyle\:ff0c\:5305\:62ec\:900f\:660e\:5ea6\:ff0cstyle`line[[{1,3,4,6}]]\:4e2d\:7684\:662f\:516b\:91cd\:6001\:7f16\:53f7*)


style`line=Range[8];
style`line[[{1,3,4,6}]]={
(*1*)fun`style`line[3,1,calc`point`opacity[[1]]],
(*3*)fun`style`line[2,2,calc`point`opacity[[3]]],
(*4*)fun`style`line[1,3,calc`point`opacity[[4]]],
(*6*)fun`style`line[4,4,calc`point`opacity[[6]]]
};

style`line[[{2,5,7,8}]]={
(*2*)fun`style`line[2,2,calc`point`opacity[[2]]],
(*5*)fun`style`line[1,3,calc`point`opacity[[5]]],
(*7*)fun`style`line[4,4,calc`point`opacity[[7]]],
(*8*)fun`style`line[3,1,calc`point`opacity[[8]]]
};



(* ::Text:: *)
(******************************************************  legend*)


(* ::Text:: *)
(*\:8bbe\:7f6e\:56fe\:4f8b\:6837\:5f0f*)


(* ::Text:: *)
(*\:6309\:7167 pr, \[CapitalSigma]p, \[CapitalSigma]m, \[CapitalXi]m, {4,3,1,6}*)


(* ::Text:: *)
(*\:6309\:7167 ne, \[CapitalSigma]0, \[CapitalLambda], \[CapitalXi]0, {5,2,8,7}*)


style`legend1=style`line[[{4,3,1,6}]];


style`legend2=style`line[[{5,2,8,7}]];


(* ::Text:: *)
(*\:8bbe\:7f6e\:6846\:67b6\:6837\:5f0f*)


style`frame={
{
Directive[fontsize`frame`tick,FontSize->fontsize`frame`text,Black],
Directive[fontsize`frame`tick,FontSize->fontsize`frame`text,Black]
},
{
Directive[fontsize`frame`tick,FontSize->fontsize`frame`text,Black],
Directive[fontsize`frame`tick,FontSize->fontsize`frame`text,Black]
}
};


(* ::Section:: *)
(*functions to draw*)


(* ::DisplayFormula:: *)
(*data`interval,{2,8,3,2},{gegm,io,trlp,point}*)


(* ::Text:: *)
(************************************)


(* ::Text:: *)
(*\:7ed8\:5236\:5b9e\:9a8c\:6570\:636e\:7684\:6563\:70b9\:56fe\:ff0c\:53ef\:4ee5\:8bbe\:7f6e\:70b9\:7684\:6837\:5f0f*)


(* ::DisplayFormula:: *)
(*assoc`expr,{4}*)


(* ::DisplayFormula:: *)
(*PlotLegends->Placed[*)
(*(Style[#1,FontFamily->"Times New Roman",FontSize->10]&)/@Keys[assoc`expr[[inde]]],*)
(*{*)
(*{0.5,0.5},*)
(*{0,0}*)
(*}*)


expr`color={Opacity[expr`opacity],Black};


marker`expr`point={
Graphics[Circle[{0,0},1]],
Graphics[Disk[{0,0},1]],
Graphics[Line[{{-0.5,-0.5},{0.5,-0.5},{0.5,0.5},{-0.5,0.5},{-0.5,-0.5}}]],
Graphics[{Sequence@@expr`color,Polygon[{{-0.5,-0.5},{0.5,-0.5},{0.5,0.5},{-0.5,0.5}}]}]
};


marker`exper`errobar=<|
"WhiskerStyle"->Directive[Sequence@@expr`color,AbsoluteThickness[1.0]],(*\:7ad6\:7ebf\:7684style*)
"FenceStyle"->Directive[Sequence@@expr`color,AbsoluteThickness[1.0]](*\:6a2a\:7ebffence \:7684style*)
|>;


(* ::Text:: *)
(*\:5b9e\:9a8c\:6570\:636e\:7684\:56fe\:4f8b\:ff0c\:6309\:7167 ge.n, ge.p, gm.n, gm.p \:7684\:6b21\:5e8f\:ff0c*)


(* ::Text:: *)
(*\:4e4b\:524d\:7684\:914d\:7f6e*)


(* ::DisplayFormula:: *)
(*legend`position`expr={*)
(*{*)
(*   {0.40,0.65},(*anchor position*)*)
(*   {0,0}(*legend anchor*)*)
(*},*)
(**)
(*{*)
(*   {0.256,0.74},(*anchor position*)*)
(*   {0,0}(*legend anchor*)*)
(*},*)
(**)
(*{*)
(*   {0.40,0.65},(*anchor position*)*)
(*   {0,0}(*legend anchor*)*)
(*},*)
(**)
(*{*)
(*   {0.40,0.70},(*anchor position*)*)
(*   {0,0}(*legend anchor*)*)
(*}*)
(**)
(*};*)


(* ::Text:: *)
(*\:5bf9\:5b9e\:9a8c\:6570\:636e\:4f5c\:56fe\:ff0c\:5bf9\:5b9e\:9a8c\:6570\:636e\:4e0a\:6807\:8bb0\:ff0c\:9884\:7f6e\:4e86\:591a\:79cd\:6837\:5f0f*)


(* ::Text:: *)
(*\:9996\:5148\:5b9a\:4e00\:4e2a\:5b9e\:9a8c\:6570\:636e\:56fe\:4f8b\:7684\:51fd\:6570*)


(* ::DisplayFormula:: *)
(*fun`legend`bg=Framed[#1,RoundingRadius->4,FrameStyle->LightGray,Background->White]&;*)


fun`legend`bg=Identity;


marker`expr`sequence[style_,inde_]:={
{
PlotMarkers->{marker`expr`point[[4]],Offset[2]},
IntervalMarkers->"Fences",
IntervalMarkersStyle-> marker`exper`errobar
},

{
PlotMarkers->Automatic,
IntervalMarkers->Automatic,
IntervalMarkersStyle->Automatic
},

(*\:4e0b\:9762\:662f\:4e4b\:524d\:5e94\:7528\:6210\:529f\:7684\:56fe\:4f8b*)
{
PlotMarkers->Automatic,
IntervalMarkers->Automatic,
IntervalMarkersStyle->Automatic,
PlotLegends->Placed[
(Style[#1,FontFamily->"Times New Roman",FontSize->legend`expr`text`size]&)/@Keys[assoc`expr[[inde]]],
legend`position`expr[[inde]]
]
},

{
PlotMarkers->Automatic,
IntervalMarkers->Automatic,
IntervalMarkersStyle->Automatic,
PlotLegends->Placed[
PointLegend[
(Style[#1,FontFamily->"Times New Roman",FontSize->legend`expr`text`size]&)/@Keys[assoc`expr[[inde]]],
(*\:51b3\:5b9a\:56fe\:4f8b\:7684\:6392\:5217\:65b9\:5f0f*)
LegendLayout->legend`expr`layout[[inde]],
LegendMarkerSize->legend`expr`totalsize[[inde]],
LegendFunction->fun`legend`bg
],
(*\:56fe\:4f8b\:51fd\:6570\:ff0c\:5e94\:7528\:5230\:6bcf\:4e2a\:56fe\:4f8b\:4e0a*)
legend`position`expr[[inde]]
]
}

}[[style]];


(* ::Text:: *)
(*\:5bf9\:5b9e\:9a8c\:6570\:636e\:4f5c\:56fe*)


fig`expr=Table[

ListPlot[
Values[assoc`expr[[inde]]],
PlotRange->{Full,Full},
AxesOrigin->{0,0},
PlotRangePadding->{{0,0},{Scaled[0.09],Scaled[0.12]}},
PlotRangeClipping->True,
ClippingStyle->Automatic,
Sequence@@marker`expr`sequence[expr`errobar`style,inde]
]

,{inde,1,4,1}
];


(* ::Text:: *)
(*\:7ed8\:5236\:8ba1\:7b97\:6570\:636e\:7684\:5e26\:72b6\:56fe\:ff0cerrobar \:53ef\:4ee5\:901a\:8fc7\:8bbe\:7f6e\:900f\:660e\:5ea6\:4e0d\:663e\:793a*)


fig`calc`interval`im1=Table[

ListLinePlot[
data`interval[[gegm,io,trlp]],
PlotStyle->style`line[[io]],
PlotRange->{Full,Full},
AxesOrigin->{0,0},
PlotRangePadding->{{0,0},{Scaled[0.09],Scaled[0.12]}},
IntervalMarkers->calc`errobar`style,
IntervalMarkersStyle-> Directive[Opacity[calc`errobar`opacity[[gegm,io]]]]
]

,{gegm,1,2,1}
,{io,1,8,1}
,{trlp,1,3,1}
];


(* ::Text:: *)
(*****************************************)


(* ::Text:: *)
(*\:5bf9octet FF \:66f2\:7ebf\:4e2d\:7684\:70b9\:7684\:540e\:7eed\:5904\:7406*)


(* ::DisplayFormula:: *)
(*{AbsoluteThickness[_]->AbsoluteThickness[2.5]}*)
(*{PointSize[_]->PointSize[0.007],Line->Point},*)


rule`curve={
{(*PointSize[_]\[Rule]PointSize[0.007],Line\[Rule]Point*)},{},{},
{},{},
{},{},
{(*PointSize[_]\[Rule]PointSize[0.007],Line\[Rule]Point*)}
};


fig`calc`interval=Transpose[
Table[fig`calc`interval`im1[[All,io,All]]/.rule`curve[[io]],{io,1,8,1}]
,{2,1,3}
];


(* ::DisplayFormula:: *)
(*fig`calc`interval,{2,8,3},{gegm,conf,trlp}*)


(* ::Text:: *)
(*******************************************)


(* ::Text:: *)
(*\:6a2a\:7eb5\:8f74\:7ebf\:6807\:8bb0*)


(* ::DisplayFormula:: *)
(*\*input  \:6784\:5efa\:6765\:81ea input \:7684\:6846\:7b26*)


framelabel`gegm=<|
(*\:6570\:636e\:7684\:6b21\:5e8f\:662f ge.n, ge.p, gm.n, gm.p*)
(*\:5f52\:4e00\:5316\:7684\:65f6\:5019\:ff0c\:90fd\:662f\:7528GEB GMB*)
"normal"->{
{
{Style["\*SubsuperscriptBox[\(G\), \(E\), \(B\)](\*SuperscriptBox[\(Q\), \(2\)])",FontFamily->"Times New Roman",
FontSize->fontsize`frame`text],None},
{Style["\*SuperscriptBox[\(Q\), \(2\)](\*SuperscriptBox[\(GeV\), \(2\)])",FontFamily->"Times New Roman",
FontSize->fontsize`frame`text],None}
},
{
{Style["\*SubsuperscriptBox[\(G\), \(E\), \(B\)](\*SuperscriptBox[\(Q\), \(2\)])",FontFamily->"Times New Roman",
FontSize->fontsize`frame`text],None},
{Style["\*SuperscriptBox[\(Q\), \(2\)](\*SuperscriptBox[\(GeV\), \(2\)])",FontFamily->"Times New Roman",
FontSize->fontsize`frame`text],None}
},
{
{Style["\!\(\*SubsuperscriptBox[\(G\), \(M\), \(B\)]\)(\!\(\*SuperscriptBox[\(Q\), \(2\)]\))/\!\(\*SubscriptBox[\(\[Mu]\), \(B\)]\)",FontFamily->"Times New Roman",
FontSize->fontsize`frame`text],None},
{Style["\*SuperscriptBox[\(Q\), \(2\)](\*SuperscriptBox[\(GeV\), \(2\)])",FontFamily->"Times New Roman",
FontSize->fontsize`frame`text],None}
},
{
{Style["\!\(\*SubsuperscriptBox[\(G\), \(M\), \(B\)]\)(\!\(\*SuperscriptBox[\(Q\), \(2\)]\))/\!\(\*SubscriptBox[\(\[Mu]\), \(B\)]\)",FontFamily->"Times New Roman",
FontSize->fontsize`frame`text],None},
{Style["\*SuperscriptBox[\(Q\), \(2\)](\*SuperscriptBox[\(GeV\), \(2\)])",FontFamily->"Times New Roman",
FontSize->fontsize`frame`text],None}
}
},
(*\:4e0d\:5f52\:4e00\:5316\:7684\:65f6\:5019\:ff0c\:7528\:7684\:662fGE/Mp\:548cGE/Mn*)
(*\:6570\:636e\:7684\:6b21\:5e8f\:662f ge.n, ge.p, gm.n, gm.p*)
"unnormal"->{
{
{Style["\*SubsuperscriptBox[\(G\), \(E\), \(n\)](\*SuperscriptBox[\(Q\), \(2\)])",FontFamily->"Times New Roman",
FontSize->fontsize`frame`text],None},
{Style["\*SuperscriptBox[\(Q\), \(2\)](\*SuperscriptBox[\(GeV\), \(2\)])",FontFamily->"Times New Roman",
FontSize->fontsize`frame`text],None}
},
{
{Style["\*SubsuperscriptBox[\(G\), \(E\), \(p\)](\*SuperscriptBox[\(Q\), \(2\)])",FontFamily->"Times New Roman",
FontSize->fontsize`frame`text],None},
{Style["\*SuperscriptBox[\(Q\), \(2\)](\*SuperscriptBox[\(GeV\), \(2\)])",FontFamily->"Times New Roman",
FontSize->fontsize`frame`text],None}
},
{
{Style["\*SubsuperscriptBox[\(G\), \(M\), \(n\)](\*SuperscriptBox[\(Q\), \(2\)])",FontFamily->"Times New Roman",
FontSize->fontsize`frame`text],None},
{Style["\*SuperscriptBox[\(Q\), \(2\)](\*SuperscriptBox[\(GeV\), \(2\)])",FontFamily->"Times New Roman",
FontSize->fontsize`frame`text],None}
},
{
{Style["\*SubsuperscriptBox[\(G\), \(M\), \(p\)](\*SuperscriptBox[\(Q\), \(2\)])",FontFamily->"Times New Roman",
FontSize->fontsize`frame`text],None},
{Style["\*SuperscriptBox[\(Q\), \(2\)](\*SuperscriptBox[\(GeV\), \(2\)])",FontFamily->"Times New Roman",
FontSize->fontsize`frame`text],None}
}
}
|>;


(* ::Text:: *)
(*\:5bf9\:56fe\:5f62\:7684\:7ec6\:8282\:8fdb\:884c\:8c03\:6574*)


fun`fig`gegm`cn[
fig`calc`interval_,(*function, generate band figure using data of ge or gm *)
framelabel_,(*framelabel of ge or gm*)
legend`text_,(*legend text*)
legend`ps_:legend`position,(*legend position*)
style`legend_,
legend`calc`totalsize_,
fig`range_,
fig`padding_
]:=Legended[(*\:8bbe\:7f6e\:8ba1\:7b97\:66f2\:7ebf\:7684\:56fe\:4f8b*)
Show[
(Sequence@@fig`calc`interval),
(*Show \:63a5\:53d7sequence \:5e8f\:5217*) 
ImageSize->Large,
PlotRange->fig`range,
AxesOrigin->{0,0},
PlotRangePadding->fig`padding,
Frame->True,
FrameLabel->framelabel,
FrameStyle->style`frame

],
(*++++++++++++++++++++++++++++++*)
Placed[
Style[
LineLegend[style`legend,
(Style[#1,FontFamily->"Times New Roman",FontSize->legend`calc`text`size]&)/@legend`text,
LegendMarkerSize->legend`calc`totalsize,
(*\:8ba1\:7b97\:6570\:636e\:7684\:56fe\:4f8b\:51fd\:6570*)
LegendFunction->fun`legend`bg
],
(*\:8ba1\:7b97\:6570\:636e\:56fe\:4f8b\:7684\:653e\:5927\:500d\:6570*)
Magnification->fig`legend`magni
],
legend`ps
]
];


(* ::Section:: *)
(*fun apply*)


(* ::DisplayFormula:: *)
(*fun`fig`gegm`cn[*)
(*fig`calc`interval_,(*function, generate band figure using data of ge or gm *)*)
(*framelabel_,(*framelabel of ge or gm*)*)
(*legend`text_,(*legend text*)*)
(*legend`ps_:legend`position,(*legend position*)*)
(*style`legend_,*)
(*legend`calc`totalsize*)
(*]*)


(* ::Text:: *)
(*\:56fe\:4f8b\:7684\:4f4d\:7f6e\:ff0c\:4e4b\:524d\:7684\:4f4d\:7f6e*)


(* ::DisplayFormula:: *)
(*legend`position`calc={*)
(*  {0.78,0.72},(*anchor position*)*)
(*  {0.,0.}(*legend anchor*)*)
(*};*)


(* ::Subsection:: *)
(*ge`charge*)


(* ::Text:: *)
(*legend text and legend position*)


(* ::Text:: *)
(*\:6309\:7167 pr, \[CapitalSigma]p, \[CapitalSigma]m, \[CapitalXi]m, {4,3,1,6}*)


(* ::Text:: *)
(*\:6309\:7167 ne, \[CapitalSigma]0, \[CapitalLambda], \[CapitalXi]0, {5,2,8,7}*)


(* ::Text:: *)
(*************************************)


legend`t1={"p","\!\(\*SuperscriptBox[\(\[CapitalSigma]\), \(+\)]\)","\!\(\*SuperscriptBox[\(\[CapitalSigma]\), \(-\)]\)","\!\(\*SuperscriptBox[\(\[CapitalXi]\), \(-\)]\)"};


legend`ps1= {
  {0.78,0.72},(*anchor position*)
  {0.,0.}(*legend anchor*)
  };


inde=2;
fig`baryons`ge`charge=fun`fig`gegm`cn[
Join[
fig`calc`interval[[1,{4,3,6,1},3]],
{fig`expr[[inde]]}
],
framelabel`gegm[whether`normal][[inde]],
legend`t1,
legend`position`calc[[inde]],
style`legend1,
legend`calc`totalsize[[inde]],
fig`range[whether`normal][[inde]],
fig`padding[whether`normal][[inde]]
];


(* ::Subsection:: *)
(*ge`neutral*)


(* ::Text:: *)
(*legend text and legend position*)


(* ::Text:: *)
(*\:6309\:7167 ne, \[CapitalSigma]0, \[CapitalLambda], \[CapitalXi]0, {5,2,8,7}*)


legend`t2={"n","\!\(\*SuperscriptBox[\(\[CapitalSigma]\), \(0\)]\)","\[CapitalLambda]","\!\(\*SuperscriptBox[\(\[CapitalXi]\), \(0\)]\)"};


legend`ps2= {
  {0.78,0.72},(*anchor position*)
  {0.,0.}(*legend anchor*)
  };


inde=1;
fig`baryons`ge`neutral=fun`fig`gegm`cn[
Join[
fig`calc`interval[[1,{2,5,7,8},3]],
{fig`expr[[inde]]}
],
framelabel`gegm[whether`normal][[inde]],
legend`t2,
legend`position`calc[[inde]],
style`legend2,
legend`calc`totalsize[[inde]],
fig`range[whether`normal][[inde]],
fig`padding[whether`normal][[inde]]
];


(* ::Subsection:: *)
(*gm`charge*)


(* ::Text:: *)
(*gm`charge: octet: 1 3 4 6, line, Dashing, Dotted, DotDashed*)


(* ::DisplayFormula:: *)
(*legend`t1={"\!\(\*SuperscriptBox[\(\[CapitalSigma]\), \(-\)]\)","\!\(\*SuperscriptBox[\(\[CapitalSigma]\), \(+\)]\)","p","\!\(\*SuperscriptBox[\(\[CapitalXi]\), \(-\)]\)"};*)


legend`ps3= {
  {0.78,0.72},(*anchor position*)
  {0.,0.}(*legend anchor*)
  };


inde=4;
fig`baryons`gm`charge=fun`fig`gegm`cn[
Join[
fig`calc`interval[[2,{4,3,6,1},3]],
{fig`expr[[inde]]}
],
framelabel`gegm[whether`normal][[inde]],
legend`t1,
legend`position`calc[[inde]],
style`legend1,
legend`calc`totalsize[[inde]],
fig`range[whether`normal][[inde]],
fig`padding[whether`normal][[inde]]
];


(* ::Subsection:: *)
(*gm`neutral*)


(* ::Text:: *)
(*gm`neutral: octet: 2 5 7 8, line, Dashing, Dotted, DotDashed*)


(* ::DisplayFormula:: *)
(*legend`t2={"\!\(\*SuperscriptBox[\(\[CapitalSigma]\), \(0\)]\)","n","\!\(\*SuperscriptBox[\(\[CapitalXi]\), \(0\)]\)","\[CapitalLambda]"};*)


legend`ps4= {
  {0.78,0.72},(*anchor position*)
  {0.,0.}(*legend anchor*)
  };


inde=3;
fig`baryons`gm`neutral=fun`fig`gegm`cn[
Join[
fig`calc`interval[[2,{2,5,7,8},3]],
{fig`expr[[inde]]}
],
framelabel`gegm[whether`normal][[inde]],
legend`t2,
legend`position`calc[[inde]],
style`legend2,
legend`calc`totalsize[[inde]],
fig`range[whether`normal][[inde]],
fig`padding[whether`normal][[inde]]
];


(* ::Chapter:: *)
(*export*)


(* ::DisplayFormula:: *)
(*parameter`ci`string*)
(*parameter`lambda0`string*)


echo["does the outputdir exists?"]


output`dir=FileNameJoin[{git`local`name,"/expression-mfiles/"}]


DirectoryQ[output`dir]


echo["the output name list"]


(* ::Text:: *)
(*export \:4f1a\:81ea\:52a8\:8bc6\:522b\:6587\:4ef6\:7684\:62d3\:5c55\:540d*)


ext`export=".m";


(
output`name`list={
FileNameJoin[{output`dir,"fig.baryons."<>whether`normal<>".ge.charge.L-"<>parameter`lambda0`string<>".ci-"<>parameter`ci`string<>ext`export}],
FileNameJoin[{output`dir,"fig.baryons."<>whether`normal<>".ge.neutral.L-"<>parameter`lambda0`string<>".ci-"<>parameter`ci`string<>ext`export}],
FileNameJoin[{output`dir,"fig.baryons."<>whether`normal<>".gm.charge.L-"<>parameter`lambda0`string<>".ci-"<>parameter`ci`string<>ext`export}],
FileNameJoin[{output`dir,"fig.baryons."<>whether`normal<>".gm.neutral.L-"<>parameter`lambda0`string<>".ci-"<>parameter`ci`string<>ext`export}]
}
)


output`file`list={fig`baryons`ge`charge,fig`baryons`ge`neutral,fig`baryons`gm`charge,fig`baryons`gm`neutral};


echo["output status"]


Block[{leng},
leng=Length[output`file`list];
Do[
Export[output`name`list[[i]],output`file`list[[i]]];
If[i==leng,
Return["Done"]
]
,{i,1,leng,1}
]
]
