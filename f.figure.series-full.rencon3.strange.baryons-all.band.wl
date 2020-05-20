(* ::Package:: *)

(* ::Title:: *)
(*f.figure.series-full.rencon3.strange.baryons-all.band.wl*)


(* ::Chapter:: *)
(*initial 1*)


(* ::Text:: *)
(*\:538b\:5236\:62a5\:9519\:ff1a\:6ca1\:6709\:5f00\:542f\:524d\:7aef*)


Off[FrontEndObject::notavail]


(* ::Text:: *)
(*\:6587\:4ef6\:7edd\:5bf9\:8def\:5f84*)


filename=NotebookFileName[]


(* ::Text:: *)
(*\:5355\:5143\:5bf9\:8c61\:ff1a\:7b2c\:4e00\:4e2a\:5355\:5143*)


cell`title=Cells[][[1]];


(* ::Text:: *)
(*\:5237\:65b0\:7b2c\:4e00\:4e2a\:5355\:5143\:7684\:540d\:5b57*)


NotebookWrite[cell`title,Cell[FileNameSplit[filename][[-1]],"Title"]]


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


input`simulation={"C:\\octet.formfactor\\Numeric.series-o1.rencon3\\
f.figure.series-full.rencon3.strange.baryons-all.band.wl",
"full",0.90,1.50};


(* ::Text:: *)
(*++++++++++++++++++++++++++++++++++++++++*)


(* ::Text:: *)
(*\:5f15\:5165\:547d\:4ee4\:884c\:53c2\:6570, 1 \:7528\:4f5c\:5b9e\:9645\:811a\:672c\:8fd0\:884c, 2\:7528\:4f5c\:8c03\:8bd5*)


input`cml={$ScriptCommandLine,input`simulation}[[2]];


(* ::Text:: *)
(*+++++++++++++++++++++++++++++++++*)


Print["----------------------------","\n","the parameter order, lambda, ci is","\n","----------------------------"];


{file`name,parameter`order,
parameter`lambda0,parameter`ci
}={
input`cml[[1]],input`cml[[2]],
ToExpression[input`cml[[3]]],
ToExpression[input`cml[[4]]]
}


Print["----------------------------"];


git`root`dir=StringCases[ExpandFileName[file`name],StartOfString~~((WordCharacter|":"|"\\")..)~~"octet.formfactor"][[1]]


parameter`order`string=ToString[parameter`order]
parameter`lambda0`string=ToString[NumberForm[parameter`lambda0,{3,2}]]
parameter`ci`string=ToString[NumberForm[parameter`ci,{2,1}]]


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


directory`fig=FileNameJoin[{git`root`dir,"/expression-mfiles/"}]


parameter`lambda0`group`string=If[parameter`lambda0`string==="0.90",
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


nb`list={
FileNames[StartOfString~~"fig.calc.baryons.ge.tot.L-"~~parameter`lambda0`group`string~~".ci-"~~parameter`ci`string~~".m",
directory`fig],
FileNames[StartOfString~~"fig.calc.baryons.gm.tot.L-"~~parameter`lambda0`group`string~~".ci-"~~parameter`ci`string~~".m",
directory`fig]
};
TableForm[nb`list,TableHeadings->Automatic,TableDirections->Row]


(fig`baryons`origin=Map[Get,nb`list,{-1}]);


(* ::DisplayFormula:: *)
(*fig`baryons`origin,{2,3,8,3},{gegm,conf,io,trlp}*)


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


errorbar`interp=Table[

Interpolation[data`baryons[[gegm,conf,io,trlp]]]

,{gegm,1,2,1}
,{conf,{1,3}}
,{io,1,8,1}
,{trlp,1,3,1}
];


(* ::DisplayFormula:: *)
(*errorbar`interp,{2,2,8,3},{gegm,config,io,trlp}*)


value`center=data`baryons[[All,2,All,All,All,2]];


(* ::DisplayFormula:: *)
(*value`center,{2,8,3},{gegm,io,trlp}*)


value`asy=Table[

errorbar`interp[[gegm,conf,io,trlp]][positions`center[[gegm,io,trlp]]]

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


data`interval=Table[

{
positions`center[[gegm,io,trlp,point]],
Around[
value`center[[gegm,io,trlp,point]],
errorbar`sym[[gegm,io,trlp,point]]
]
}

,{gegm,1,2,1}
,{io,1,8,1}
,{trlp,1,3,1}
,{point,1,Length[positions`center[[gegm,io,trlp]]],1}
];


(* ::DisplayFormula:: *)
(*data`interval,{2,8,3,2},{gegm,io,trlp,point}*)


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


style`colors = {
(*1*)style`colors`theme[[1]],
(*2*)style`colors`theme[[1]],
(*3*)style`colors`theme[[2]],
(*4*)style`colors`theme[[3]],
(*5*)style`colors`theme[[2]],
(*6*)style`colors`theme[[4]],
(*7*)style`colors`theme[[3]],
(*8*)style`colors`theme[[4]]
};


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


legend`markersize={{50,15}};


legend`text`size=16;


(* ::Text:: *)
(*\:9ed8\:8ba4\:7684\:66f2\:7ebf\:95f4\:586b\:5145\:900f\:660e\:5ea6*)


style`opacity=Opacity[0];


(* ::Text:: *)
(*\:9ed8\:8ba4\:7ebf\:5bbd*)


style`line`thick=AbsoluteThickness[2];


(* ::Text:: *)
(*\:7ebf\:578b,Dashing[{}]\:6307\:5b9a\:7ebf\:4e3a\:5b9e\:7ebf*)


style`line`type={Dashing[{}],Dashing[Medium],Dashing[{0.001, 0.014}],DotDashed};


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
(*1*)fun`style`line[3,1,1],
(*3*)fun`style`line[2,2,1],
(*4*)fun`style`line[1,3,1],
(*6*)fun`style`line[4,4,1]
};

style`line[[{2,5,7,8}]]={
(*2*)fun`style`line[2,2,1],
(*5*)fun`style`line[1,3,1],
(*7*)fun`style`line[4,4,1],
(*8*)fun`style`line[3,1,1]
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


fig`interval=Table[

ListLinePlot[
data`interval[[gegm,io,trlp]],
PlotStyle->style`line[[io]],
PlotRange->{Full,Full},
IntervalMarkers->"Bars",
IntervalMarkersStyle->None
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
PlotRange->All,
PlotRangePadding->{{0,0},{Scaled[0.09],Scaled[0.09]}},
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


(* ::DisplayFormula:: *)
(*fun`fig`gegm`cn[*)
(*baryons`band[[1,{1,3,4,6}]],(*data, generate band figure using data of ge or gm *)*)
(* framelabel_,(*framelabel of ge or gm*)*)
(* legend`text_,(*legend text*)*)
(* legend`ps_: legend`position(*legend position*)*)
(* ]*)


(* ::Text:: *)
(*legend text and legend position*)


(* ::Text:: *)
(*\:6309\:7167 pr, \[CapitalSigma]p, \[CapitalSigma]m, \[CapitalXi]m, {4,3,1,6}*)


(* ::Text:: *)
(*\:6309\:7167 ne, \[CapitalSigma]0, \[CapitalLambda], \[CapitalXi]0, {5,2,8,7}*)


legend`t1={"p","\!\(\*SuperscriptBox[\(\[CapitalSigma]\), \(+\)]\)","\!\(\*SuperscriptBox[\(\[CapitalSigma]\), \(-\)]\)","\!\(\*SuperscriptBox[\(\[CapitalXi]\), \(-\)]\)"};


legend`ps1={
  {0.78,0.64},(*anchor position*)
  {0.,0.}(*legend anchor*)
};


fig`baryons`ge`charge=fun`fig`gegm`cn[
fig`interval`modi[[1,{4,1,3,6},3]],
framelabel`ge,
legend`t1,
legend`ps1,
style`legend1
]


(* ::Subsection:: *)
(*ge`neutral*)


(* ::Text:: *)
(*legend text and legend position*)


(* ::Text:: *)
(*\:6309\:7167 ne, \[CapitalSigma]0, \[CapitalLambda], \[CapitalXi]0, {5,2,8,7}*)


legend`t2={"n","\!\(\*SuperscriptBox[\(\[CapitalSigma]\), \(0\)]\)","\[CapitalLambda]","\!\(\*SuperscriptBox[\(\[CapitalXi]\), \(0\)]\)"};


legend`ps2= {
  {0.78,0.64},(*anchor position*)
  {0.,0.}(*legend anchor*)
  };


fig`baryons`ge`neutral=fun`fig`gegm`cn[
fig`interval`modi[[1,{2,5,7,8},3]],
framelabel`ge,
legend`t2,
legend`ps2,
style`legend2
]


(* ::Subsection:: *)
(*gm`charge*)


(* ::Text:: *)
(*gm`charge: octet: 1 3 4 6, line, Dashing, Dotted, DotDashed*)


(* ::DisplayFormula:: *)
(*legend`t1={"\!\(\*SuperscriptBox[\(\[CapitalSigma]\), \(-\)]\)","\!\(\*SuperscriptBox[\(\[CapitalSigma]\), \(+\)]\)","p","\!\(\*SuperscriptBox[\(\[CapitalXi]\), \(-\)]\)"};*)


legend`ps3= {
  {0.78,0.64},(*anchor position*)
  {0.,0.}(*legend anchor*)
  };


fig`baryons`gm`charge=fun`fig`gegm`cn[
fig`interval`modi[[2,{4,1,3,6},3]],
framelabel`gm,
legend`t1,
legend`ps3,
style`legend1
]


(* ::Subsection:: *)
(*gm`neutral*)


(* ::Text:: *)
(*gm`neutral: octet: 2 5 7 8, line, Dashing, Dotted, DotDashed*)


(* ::DisplayFormula:: *)
(*legend`t2={"\!\(\*SuperscriptBox[\(\[CapitalSigma]\), \(0\)]\)","n","\!\(\*SuperscriptBox[\(\[CapitalXi]\), \(0\)]\)","\[CapitalLambda]"};*)


legend`ps4= {
  {0.78,0.64},(*anchor position*)
  {0.,0.}(*legend anchor*)
  };


fig`baryons`gm`neutral=fun`fig`gegm`cn[
fig`interval`modi[[2,{2,5,7,8},3]],
framelabel`gm,
legend`t2,
legend`ps4,
style`legend2
]


(* ::Chapter:: *)
(*export*)


(* ::DisplayFormula:: *)
(*parameter`ci`string*)
(*parameter`lambda0`string*)


output`dir=FileNameJoin[{git`root`dir,"/expression-results/"}]


(
output`name`list={
FileNameJoin[{output`dir,
"fig`baryons`ge`charge.L-"<>
parameter`lambda0`string<>
".ci-"<>
parameter`ci`string<>
".pdf"
}],
FileNameJoin[{output`dir,
"fig`baryons`ge`neutral.L-"<>
parameter`lambda0`string<>
".ci-"<>
parameter`ci`string<>
".pdf"
}],
FileNameJoin[{output`dir,
"fig`baryons`gm`charge.L-"<>
parameter`lambda0`string<>
".ci-"<>
parameter`ci`string<>
".pdf"
}],
FileNameJoin[{output`dir,
"fig`baryons`gm`neutral.L-"<>
parameter`lambda0`string<>
".ci-"<>
parameter`ci`string<>
".pdf"
}]
}
)//TableForm


output`file`list={fig`baryons`ge`charge,fig`baryons`ge`neutral,fig`baryons`gm`charge,fig`baryons`gm`neutral};


Table[
Export[output`name`list[[i]],output`file`list[[i]]]
,{i,1,Length[output`file`list],1}];
