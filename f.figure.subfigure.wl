(* ::Package:: *)

(* ::Title:: *)
(*f.figure.series-full.rencon3.strange.baryons-all.band.wl*)


(* ::Chapter:: *)
(*initial 1*)


Once[
git`remote`name="octet.formfactor";
(*\:7ed9\:51fa\:8fdc\:7a0bgit\:4ed3\:5e93\:7684\:540d\:5b57*)
If[
(* if $ScriptCommandLine==={}, the environment is frontend*)
SameQ[$ScriptCommandLine,{}],
(*if execute in the frontend mode, refresh the title name*)
CompoundExpression[
(*\:6587\:4ef6\:7edd\:5bf9\:8def\:5f84*)
filename=NotebookFileName[],
(*\:5355\:5143\:5bf9\:8c61,\:7b2c\:4e00\:4e2a\:5355\:5143*)
cell`title=(Cells[][[1]]),
(*\:5237\:65b0\:7b2c\:4e00\:4e2a\:5355\:5143\:7684\:540d\:5b57*)
NotebookWrite[cell`title,Cell[FileNameSplit[filename][[-1]],"Title"]],
(*if execute in commandline mode, print a ready message*)
git`local`name=FileNameJoin[Append[TakeWhile[FileNameSplit[NotebookDirectory[]],UnsameQ[#1,git`remote`name]&],git`remote`name]]
(*add the base git root dir*)
],
CompoundExpression[
Print["Ready to execute this script"]
]
]
]
(*\:5b9a\:4e49\:4e00\:4e2a\:5e38\:7528\:7684\:6253\:5370\:51fd\:6570*)
echo[x_]:=Print["----------------------------","\n",ToString[x],"\n","----------------------------"];


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
(*calc`point`opacity,calc`errobar`marker,calc`errobar`opacity,*)
(*expr`errobar`style,expr`opacity*)
(*whether`normal*)


input`simulation={"/home/tom/octet.formfactor/Numeric.series-o1.rencon3/
f.figure.series-full.rencon3.strange.baryons-all.band.wl","full",0.90,1.50,
1,"Bands","{0,0,0,0.1,0.1,0,0,0}",
3,1,
"unnormal"(*\:662f\:5426\:5bf9\:6570\:636e\:8fdb\:884c\:5f52\:4e00\:5316*)
};


(* ::Text:: *)
(*++++++++++++++++++++++++++++++++++++++++*)


(* ::Text:: *)
(*\:5f15\:5165\:547d\:4ee4\:884c\:53c2\:6570, \:81ea\:52a8\:5224\:65ad\:662f\:5728\:547d\:4ee4\:884c\:4e0b\:8fd0\:884c\:ff0c\:8fd8\:662f\:5728\:7b14\:8bb0\:672c\:4e2d\:8fd0\:884c*)


If[
SameQ[$ScriptCommandLine,{}],
(*if execute in the frontend mode, refresh the title name*)
input`cml=input`simulation,
(*if execute in commandline mode, use $ScriptCommandLine as parameters*)
input`cml=$ScriptCommandLine
];


(* ::Text:: *)
(*+++++++++++++++++++++++++++++++++*)


echo["the parameter order, lambda, ci is"]


{
file`name,parameter`order,parameter`lambda0,parameter`ci,
calc`point`opacity,calc`errobar`style,calc`errobar`opacity,
expr`errobar`style,expr`opacity,
whether`normal
}={
input`cml[[1]],input`cml[[2]],ToExpression[input`cml[[3]]],ToExpression[input`cml[[4]]],
ToExpression[input`cml[[5]]],ToString[input`cml[[6]]],ToExpression[input`cml[[7]]],
ToExpression[input`cml[[8]]],ToExpression[input`cml[[9]]],
ToString[input`cml[[10]]]
}


echo["----------------------------"]


git`local`name=FileNameJoin[Append[TakeWhile[FileNameSplit[ExpandFileName[file`name]],UnsameQ[#1,git`remote`name]&],git`remote`name]]


parameter`order`string=ToString[parameter`order]
parameter`lambda0`string=ToString[NumberForm[parameter`lambda0,{3,2}]]
parameter`ci`string=ToString[NumberForm[parameter`ci,{3,2}]]


(* ::Chapter:: *)
(*import *)


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


parameter`lambda0`group`string=If[parameter`lambda0`string==="0.90"&&parameter`ci`string==="1.50",
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

nb`list=If[parameter`lambda0`string==="0.90"&&parameter`ci`string==="1.50",
{
FileNames[StartOfString~~"fig.calc.baryons.ge.tot.L-"~~parameter`lambda0`group`string~~".ci-"~~parameter`ci`string~~".m",
directory`fig],
FileNames[StartOfString~~"fig.calc.baryons.gm.tot.L-"~~parameter`lambda0`group`string~~".ci-"~~parameter`ci`string~~".m",
directory`fig]
},

{
tename1=First[FileNames[StartOfString~~"fig.calc.baryons.ge.tot.L-"~~parameter`lambda0`group`string~~".ci-"~~parameter`ci`string~~".m",
directory`fig]];
{tename1,tename1,tename1},

tename2=First[FileNames[StartOfString~~"fig.calc.baryons.gm.tot.L-"~~parameter`lambda0`group`string~~".ci-"~~parameter`ci`string~~".m",
directory`fig]];
{tename2,tename2,tename2}

}
]
];
(*++++++++++++++++++++display+++++++++++++++++++++*)
echo[".m files list"]
StringRiffle[nb`list]


(fig`baryons`origin=Map[Get,nb`list,{-1}]);


(* ::DisplayFormula:: *)
(*fig`baryons`origin,{2,3,8,3},{gegm,conf,io,trlp}*)


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
(*series`baryons`origin,{3,2,8,6},{conf,gegm,io,clas}*)


(* ::Text:: *)
(*\:6700\:540e\:4e00\:4e2a\:6307\:6807\:662f\:6570\:636e\:7684\:7c7b\:522b\:ff0ctree, loop,total,experiment,\:4ee5\:53ca\:6587\:732e\:91cc\:7684\:6570\:503c*)


(* ::Text:: *)
(*\:63d0\:53d6\:51fa\:5404\:4e2a\:914d\:7f6e\:4e0b\:78c1\:77e9\:7684\:503c\:ff0c\:53ea\:8981\:8ba1\:7b97\:7684total\:503c\:ff0cclass=3*)


series`baryons`im1=series`baryons`origin[[All,2,All,(clas=3)]];


(* ::Text:: *)
(*series`baryons`im1,{conf,io},{3,8}*)


series`baryons=series`baryons`im1;


(* ::Section:: *)
(*amp`gegm`calc*)


(* ::Text:: *)
(*\:8fd9\:91cc\:7ed9\:51fagegm\:7684\:5e45\:503c\:ff0c\:540e\:9762\:662f\:5426\:5bf9\:56fe\:7684\:6570\:636e\:8fdb\:884c\:5f52\:4e00\:5316\:4f1a\:7528\:5230*)


amp`gegm`calc=<|
"normal"->{
ConstantArray[1,{3,8}],
ConstantArray[1,{3,8}]
},
"unnormal"->{
ConstantArray[1,{3,8}],
Abs[series`baryons]
}
|>;


(* ::Text:: *)
(*amp`gegm`calc[whether`normal][[gegm,conf,io]],{2,3,8}*)


(* ::Chapter:: *)
(*extract data*)


{data`f1[x_],data`f1[y_]}^:=data`f2[Join[x,y]]


{data`f1[x_]}^:=data`f2[x]


(* ::DisplayFormula:: *)
(*\:5c06Line\:4e2d\:51fa\:73b0\:7684\:6570\:636e\:7528data`f1\:505atag,\:5e76\:4e14\:901a\:8fc7\:8d4b\:4e0a\:503c\:7684\:65b9\:5f0f\:5408\:5e76\:5230data`f2*)


(* ::DisplayFormula:: *)
(*f \:662fformat\:7684\:610f\:601d*)


(* ::DisplayFormula:: *)
(*fig`baryons`origin,{2,6,8,3},{gegm,conf,io,trlp}*)


fun`data`extract[fig`baryons`origin_]:=Table[

Cases[
fig`baryons`origin[[gegm,conf,io,trlp]]
,Line[x_]:>data`f1[x],10(*level*)
]

,{gegm,1,2,1}
,{conf,1,3,1}
,{io,1,8,1}
,{trlp,1,3,1}
]


(data`baryons`raw=fun`data`extract[fig`baryons`origin]);


(* ::DisplayFormula:: *)
(*data`baryons`raw,{2,3,8,3},{gegm,conf,io,trlp}*)


(* ::Text:: *)
(*\:53bb\:9664\:91cd\:590d\:7684\:91c7\:6837\:70b9*)


data`baryons=Table[

DeleteDuplicates[data`baryons`raw[[gegm,conf,io,trlp]]/.data`f2->Identity]

,{gegm,1,2,1}
,{conf,1,3,1}
,{io,1,8,1}
,{trlp,1,3,1}
];


(* ::DisplayFormula:: *)
(*data`baryons,{2,3,8,3},{gegm,conf,io,trlp}*)


(* ::Chapter:: *)
(*Interpolation*)


(* ::DisplayFormula:: *)
(*data`baryons,{2,3,8,3},{gegm,conf,io,trlp}*)


positions`center=data`baryons[[All,2,All,All,All,1]];


(* ::DisplayFormula:: *)
(*positions`center,{2,8,3},{gegm,io,trlp}*)


(* ::Text:: *)
(*\:83b7\:5f97\:8bef\:5dee\:6570\:636e\:7684\:63d2\:503c\:51fd\:6570*)


errorbar`interp=Table[

Interpolation[data`baryons[[gegm,conf,io,trlp]]]

,{gegm,1,2,1}
,{conf,{1,3}}
,{io,1,8,1}
,{trlp,1,3,1}
];


(* ::DisplayFormula:: *)
(*errorbar`interp,{2,2,8,3},{gegm,config,io,trlp}*)


(* ::Text:: *)
(*\:83b7\:5f97\:4e2d\:5fc3\:70b9\:7684\:503c*)


value`center`im1=data`baryons[[All,2,All,All,All,2]];


(* ::DisplayFormula:: *)
(*value`center,{2,8,3},{gegm,io,trlp}*)


(* ::Text:: *)
(*\:5c06\:4e2d\:5fc3\:70b9\:7684\:503c\:4e58\:4e0a\:5f52\:4e00\:5316\:7684\:5e45\:5ea6\:ff0c\:4e2d\:5fc3\:70b9\:7684\:914d\:7f6e\:662f2*)


(* ::Text:: *)
(*amp`gegm`calc[whether`normal],{gegm,conf,io},{2,3,8}*)


echo["wheather the calc data normalized, print here"]


amp`gegm`calc[whether`normal]


value`center=Table[
amp`gegm`calc[whether`normal][[gegm,2,io]]*value`center`im1[[gegm,io,trlp]]
,{gegm,1,2,1}
,{io,1,8,1}
,{trlp,1,3,1}
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

amp`gegm`calc`error[[gegm,conf,io]]*(errorbar`interp[[gegm,conf,io,trlp]][positions`center[[gegm,io,trlp]]])

,{gegm,1,2,1}
,{conf,1,2,1}
,{io,1,8,1}
,{trlp,1,3,1}
];


(* ::DisplayFormula:: *)
(*value`asy,{2,2,8,3},{gegm,io,trlp}*)


errorbar`asy=Table[

value`asy[[gegm,conf,io,trlp]]-value`center[[gegm,io,trlp]]

,{gegm,1,2,1}
,{conf,1,2,1}
,{io,1,8,1}
,{trlp,1,3,1}
];


(* ::DisplayFormula:: *)
(*errorbar`asy,{2,2,8,3},{gegm,conf,io,trlp}*)


errorbar`sym=Table[

Mean[Abs[errorbar`asy[[gegm,All,io,trlp]]]]

,{gegm,1,2,1}
,{io,1,8,1}
,{trlp,1,3,1}
];


(* ::DisplayFormula:: *)
(*errorbar`sym,{2,8,3},{gegm,io,trlp}*)


(* ::Chapter:: *)
(*errorbar*)


(* ::Text:: *)
(*\:6307\:5b9a\:4e2d\:5fc3\:6570\:636e\:70b9,\:7136\:540e\:7ed9\:5b83\:52a0\:4e0a Errobar*)


(* ::DisplayFormula:: *)
(*positions`center,{2,8,3},{gegm,io,trlp}*)


(* ::DisplayFormula:: *)
(*value`center,{2,8,3},{gegm,io,trlp}*)


(* ::DisplayFormula:: *)
(*errorbar`asy,{2,8,3},{gegm,io,trlp}*)


(* ::Section:: *)
(*formatting*)


data`precision=10^-14;


(* ::Text:: *)
(*\:8fd9\:91cc\:51fa\:73b0\:7684\:662f\:5f52\:4e00\:5316\:4e4b\:540e\:7684\:8ba1\:7b97\:6570\:636e*)


Module[{tea},
data`interval`im1=Table[
{(*\:6a2a\:5750\:6807\:7684\:6570\:636e\:70b9*)
positions`center[[gegm,io,trlp,point]],
(*\:7eb5\:5750\:6807\:7684\:6570\:636e\:70b9*)
Around[
(*\:7eb5\:5750\:6807\:7684\:4e2d\:5fc3\:70b9*)
value`center[[gegm,io,trlp,point]],

tea=errorbar`sym[[gegm,io,trlp,point]];
(*\:52a0\:5165\:4e00\:4e2a\:5224\:65ad\:ff0c\:5e76\:7ed9\:6570\:636e\:4e58\:4e0a\:5e45\:5ea6*)
If[tea>data`precision,
tea,
data`precision
]
(*\:5982\:679c\:8bef\:5dee\:4e3a0\:7684\:8bdd\:ff0c\:4e3a\:4e86\:907f\:514daround\:81ea\:52a8\:53bb\:6389\:ff0c\:628a\:8bef\:5dee\:6539\:6210\:4e00\:4e2a\:975e\:5e38\:5c0f\:7684\:6570\:5b57*)
]
}

,{gegm,1,2,1}
,{io,1,8,1}
,{trlp,1,3,1}
,{point,1,Length[positions`center[[gegm,io,trlp]]],1}
];
];


(* ::DisplayFormula:: *)
(*data`interval`im1,{2,8,3,2},{gegm,io,trlp,point}*)


(* ::Text:: *)
(*\:4e0b\:9762\:4e24\:6bb5\:5c06\:6570\:636e\:6539\:9020\:6210\:5173\:8054\:7684\:5f62\:5f0f\:ff0c\:65b9\:4fbf\:5bf9values\:8fdb\:884c\:64cd\:4f5c*)


data`interval`im2=Map[Association[#1[[1]]->#1[[2]]]&,
data`interval`im1,
{-3}];


data`interval`im3=Map[Merge[#1,First]&,
data`interval`im2,
{-4}];


(* ::Text:: *)
(*data`interval`im3,{2,8,3},{gegm,io,conf}*)


data`interval=data`interval`im3;


(* ::Chapter:: *)
(*experiment*)


(* ::Section:: *)
(*import experiment data*)


dir`expr=FileNameJoin[{git`local`name,"/experiment/"}]


Module[{tename1,tename2},

file`list=FileNames[StartOfString~~__~~".m",
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
(*\:6570\:636e\:7684\:6b21\:5e8f\:662f*)


(* ::DisplayFormula:: *)
(*ge.n,ge.p,gm.n,gm.p*)


(* ::Text:: *)
(*\:8fd9\:91cc\:7ed9\:51fagegm\:7684\:5e45\:503c\:ff0c\:6765\:4e0d\:5f52\:4e00\:5316\:4f5c\:4f5c\:56fe\:3002*)


amp`gegm`expr=<|
"normal"->{
1,1,1,1
},
"unnormal"->{
1,1,Abs[\[Minus]1.9130427],Abs[2.7928473446]
}
|>;


(* ::Text:: *)
(*\:5728\:8fd9\:91cc\:8bbe\:8ba1\:4e00\:4e2a\:662f\:5426\:8fdb\:884c\:5f52\:4e00\:5316\:7684\:5f00\:5173*)


echo["wheather the experiment data normalized, print here"]


amp`gegm`expr[whether`normal]


assoc`expr=Table[
amp`gegm`expr[whether`normal][[ord]]*assoc`expr`im2[[ord]]
,{ord,1,4,1}
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
(*\:8fb9\:6846\:6587\:5b57\:7684\:5927\:5c0f*)


fontsize`frame`text=18;


(* ::Text:: *)
(*\:56fe\:50cf\:7684\:5927\:5c0f*)


imagesize=Scaled[.6];


(* ::Text:: *)
(*\:8fb9\:6846\:523b\:5ea6\:7ebf\:7684\:7c97\:7ec6*)


fontsize`frame`tick=AbsoluteThickness[1.5];


(* ::Text:: *)
(*\:56fe\:4f8b\:7684\:7f29\:653e\:6bd4\:4f8b*)


fig`legend`magni=1;


legend`markersize={40,4};


(* ::Text:: *)
(*\:56fe\:4f8b\:7684\:6587\:5b57\:5927\:5c0f*)


legend`text`size=10;


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
(*\:8bbe\:5b9a\:516b\:91cd\:6001\:66f2\:7ebfstyle*)


style`line=Range[8];
style`line[[{1,3,4,6}]]={
(*1*)fun`style`line[3,1,calc`point`opacity],
(*3*)fun`style`line[2,2,calc`point`opacity],
(*4*)fun`style`line[1,3,calc`point`opacity],
(*6*)fun`style`line[4,4,calc`point`opacity]
};

style`line[[{2,5,7,8}]]={
(*2*)fun`style`line[2,2,calc`point`opacity],
(*5*)fun`style`line[1,3,calc`point`opacity],
(*7*)fun`style`line[4,4,calc`point`opacity],
(*8*)fun`style`line[3,1,calc`point`opacity]
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
(*\:56fe\:4f8b\:7684\:4f4d\:7f6e*)


legend`position`calc={
  {0.75,0.65},(*anchor position*)
  {0.,0.}(*legend anchor*)
};


(* ::Text:: *)
(*\:6309\:7167 ge.n, ge.p, gm.n, gm.p \:7684\:6b21\:5e8f*)


legend`position`expr={
{
   {0.40,0.65},(*anchor position*)
   {0,0}(*legend anchor*)
},

{
   {0.256,0.74},(*anchor position*)
   {0,0}(*legend anchor*)
},

{
   {0.40,0.65},(*anchor position*)
   {0,0}(*legend anchor*)
},

{
   {0.40,0.70},(*anchor position*)
   {0,0}(*legend anchor*)
}

};


(* ::Text:: *)
(*\:5bf9\:5b9e\:9a8c\:6570\:636e\:4f5c\:56fe\:ff0c\:5bf9\:5b9e\:9a8c\:6570\:636e\:4e0a\:6807\:8bb0*)


marker`expr`sequence[style_,inde_]:=
Part[
{
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

{
PlotMarkers->Automatic,
IntervalMarkers->Automatic,
IntervalMarkersStyle->Automatic,
PlotLegends->Placed[
(Style[#1,FontFamily->"Times New Roman",FontSize->10]&)/@Keys[assoc`expr[[inde]]],
legend`position`expr[[inde]]
]
}
},
style
];


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


fig`interval=Table[

ListLinePlot[
data`interval[[gegm,io,trlp]],
PlotStyle->style`line[[io]],
PlotRange->{Full,Full},
AxesOrigin->{0,0},
PlotRangePadding->{{0,0},{Scaled[0.09],Scaled[0.12]}},
IntervalMarkers->calc`errobar`style,
IntervalMarkersStyle-> Directive[Opacity[calc`errobar`opacity[[io]]]]
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


fig`interval`modi=Transpose[
Table[fig`interval[[All,io,All]]/.rule`curve[[io]],{io,1,8,1}]
,{2,1,3}
];


(* ::DisplayFormula:: *)
(*fig`interval`modi,{2,8,3},{gegm,conf,trlp}*)


(* ::Text:: *)
(*******************************************)


(* ::Text:: *)
(*\:6a2a\:7eb5\:8f74\:7ebf\:6807\:8bb0*)


framelabel`ge={
{Style["\!\(\*SubsuperscriptBox[\(G\), \(E\), \(B\)]\)(\!\(\*SuperscriptBox[\(Q\), \(2\)]\))",FontFamily->"Times New Roman",FontSize->fontsize`frame`text],None},
{Style["\!\(\*SuperscriptBox[\(Q\), \(2\)]\)(\!\(\*SuperscriptBox[\(GeV\), \(2\)]\))",FontFamily->"Times New Roman",FontSize->fontsize`frame`text],None}
};


framelabel`gm={
{Style["\!\(\*SubsuperscriptBox[\(G\), \(M\), \(B\)]\)(\!\(\*SuperscriptBox[\(Q\), \(2\)]\))",FontFamily->"Times New Roman",FontSize->fontsize`frame`text],None},
{Style["\!\(\*SuperscriptBox[\(Q\), \(2\)]\)(\!\(\*SuperscriptBox[\(GeV\), \(2\)]\))",FontFamily->"Times New Roman",FontSize->fontsize`frame`text],None}
};


(* ::Text:: *)
(*\:5bf9\:56fe\:5f62\:7684\:7ec6\:8282\:8fdb\:884c\:8c03\:6574*)


fun`fig`gegm`cn[
fig`interval`modi_,(*function, generate band figure using data of ge or gm *)
framelabel_,(*framelabel of ge or gm*)
legend`text_,(*legend text*)
legend`ps_:legend`position,(*legend position*)
style`legend_
]:=Legended[
Show[
(Sequence@@fig`interval`modi),
(*Show \:63a5\:53d7sequence \:5e8f\:5217*) 
ImageSize->Large,
PlotRange->{{0,1},All},
AxesOrigin->{0,0},
PlotRangePadding->{{0,0},{Scaled[0.09],Scaled[0.12]}},
Frame->True,
FrameLabel->framelabel,
FrameStyle->style`frame

],
(*++++++++++++++++++++++++++++++*)
Placed[
Style[
LineLegend[style`legend,
(Style[#1,FontFamily->"Times New Roman",FontSize->legend`text`size]&)/@legend`text,
(*,LegendFunction\[Rule]Framed*)
LegendMarkerSize->legend`markersize
],
Magnification->fig`legend`magni
],
legend`ps
]
];


(* ::Section:: *)
(*fun apply*)


(* ::Subsection:: *)
(*ge`charge*)


(* ::Text:: *)
(*legend text and legend position*)


(* ::Text:: *)
(*\:6309\:7167 pr, \[CapitalSigma]p, \[CapitalSigma]m, \[CapitalXi]m, {4,3,1,6}*)


(* ::Text:: *)
(*\:6309\:7167 ne, \[CapitalSigma]0, \[CapitalLambda], \[CapitalXi]0, {5,2,8,7}*)


(* ::Text:: *)
(*\:56fe\:4f8b\:7684\:4f4d\:7f6e*)


(* ::DisplayFormula:: *)
(*legend`position`calc={*)
(*  {0.75,0.68},(*anchor position*)*)
(*  {0.,0.}(*legend anchor*)*)
(*};*)


(* ::Text:: *)
(*************************************)


legend`t1={"p","\!\(\*SuperscriptBox[\(\[CapitalSigma]\), \(+\)]\)","\!\(\*SuperscriptBox[\(\[CapitalSigma]\), \(-\)]\)","\!\(\*SuperscriptBox[\(\[CapitalXi]\), \(-\)]\)"};


inde=2;
fig`baryons`ge`charge=fun`fig`gegm`cn[
Join[
fig`interval`modi[[1,{4,3,6,1},3]],
{fig`expr[[inde]]}
],
framelabel`ge,
legend`t1,
legend`position`calc,
style`legend1
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
fig`interval`modi[[1,{2,5,7,8},3]],
{fig`expr[[inde]]}
],
framelabel`ge,
legend`t2,
legend`position`calc,
style`legend2
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
fig`interval`modi[[2,{4,3,6,1},3]],
{fig`expr[[inde]]}
],
framelabel`gm,
legend`t1,
legend`position`calc,
style`legend1
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
fig`interval`modi[[2,{2,5,7,8},3]],
{fig`expr[[inde]]}
],
framelabel`gm,
legend`t2,
legend`position`calc,
style`legend2
];


(* ::Chapter:: *)
(*export*)


(* ::DisplayFormula:: *)
(*parameter`ci`string*)
(*parameter`lambda0`string*)


output`dir=FileNameJoin[{git`local`name,"/expression-results/"}]


Print["----------------------------","\n","the output name list","\n","----------------------------"];


(
output`name`list={
FileNameJoin[{output`dir,
"fig.baryons.ge.charge.L-"<>
parameter`lambda0`string<>
".ci-"<>
parameter`ci`string<>
".pdf"
}],
FileNameJoin[{output`dir,
"fig.baryons.ge.neutral.L-"<>
parameter`lambda0`string<>
".ci-"<>
parameter`ci`string<>
".pdf"
}],
FileNameJoin[{output`dir,
"fig.baryons.gm.charge.L-"<>
parameter`lambda0`string<>
".ci-"<>
parameter`ci`string<>
".pdf"
}],
FileNameJoin[{output`dir,
"fig.baryons.gm.neutral.L-"<>
parameter`lambda0`string<>
".ci-"<>
parameter`ci`string<>
".pdf"
}]
}
)


output`file`list={fig`baryons`ge`charge,fig`baryons`ge`neutral,fig`baryons`gm`charge,fig`baryons`gm`neutral};


Print["----------------------------","\n","output status","\n","----------------------------"];


Table[
Export[output`name`list[[i]],output`file`list[[i]]]
,{i,1,Length[output`file`list],1}]
