(* ::Package:: *)

(* ::Title:: *)
(*f.figure.subfigure.wl*)


(* ::Chapter:: *)
(*initial*)


(* ::Text:: *)
(*\:5b9a\:4e49\:4e00\:4e9b\:5e38\:7528\:7684\:51fd\:6570*)


(*\:5b9a\:4e49\:4e00\:4e2a\:786e\:4fdd\:5b57\:7b26\:4e32\:7684\:51fd\:6570*)
forcestr[x_,form_:InputForm]:=If[StringQ[x],x,ToString[x,form]]


(*\:5b9a\:4e49\:4e00\:4e2a\:6253\:5370\:51fd\:6570*)
echo[x_]:=Print["----------------------------","\n",forcestr[x],"\n","----------------------------"];


(* ::Text:: *)
(*\:8ba1\:7b97\:73af\:5883\:53c2\:91cf\:ff0c\:6bd4\:5982\:8def\:5f84*)


(*\:7ed9\:51fa\:8fdc\:7a0bgit\:4ed3\:5e93\:7684\:540d\:5b57*)
git`remote`name="octet.formfactor";
(*\:811a\:672c\:7684\:8fd0\:884c\:6a21\:5f0f\:5224\:65ad\:ff0cTrue\:4ee3\:8868\:547d\:4ee4\:884c\:ff0cFalse\:4ee3\:8868\:524d\:7aef*)
boole`incmd=Not[SameQ[$ScriptCommandLine,{}]];


(*\:7ed9\:51fa\:7b14\:8bb0\:672c\:7684\:7edd\:5bf9\:8def\:5f84*)
filename=If[Not[boole`incmd],NotebookFileName[],$ScriptCommandLine[[1]]]


(*\:5982\:679c\:5728\:524d\:7aef\:6267\:884c\:ff0c\:5c31\:5237\:65b0\:7b14\:8bb0\:672c\:7684\:540d\:5b57*)
Once[If[
(* if $ScriptCommandLine==={}, the environment is frontend*)
Not[boole`incmd],
(*if execute in the frontend mode, refresh the title name*)
CompoundExpression[
(*\:5355\:5143\:5bf9\:8c61,\:7b2c\:4e00\:4e2a\:5355\:5143*)
cell`title=(Cells[][[1]]),
(*\:5237\:65b0\:7b2c\:4e00\:4e2a\:5355\:5143\:7684\:540d\:5b57*)
NotebookWrite[cell`title,Cell[FileNameSplit[filename][[-1]],"Title"]]
]
]];
(*\:5982\:679c\:5728\:547d\:4ee4\:884c\:6267\:884c\:ff0c\:5c31\:6253\:5370\:63d0\:793a\:4fe1\:606f*)
If[boole`incmd,echo["Ready to execute this script"]]


(* ::Text:: *)
(*\:5b9a\:4e49\:672c\:5730git\:76ee\:5f55\:ff0c\:4e5f\:5c31\:662f\:7a0b\:5e8f\:7684\:6839\:76ee\:5f55*)


echo["the git`local`name is"]


git`local`name=FileNameJoin[Append[TakeWhile[FileNameSplit[ExpandFileName[filename]],UnsameQ[#1,git`remote`name]&],git`remote`name]]


(* ::Text:: *)
(*\:5982\:679c\:5728\:547d\:4ee4\:884c\:6267\:884c\:ff0c\:5c31\:76f4\:63a5\:63a5\:53d7\:547d\:4ee4\:884c\:53d8\:91cf*)


(* ::Text:: *)
(*\:5982\:679c\:5728\:524d\:7aef\:6267\:884c\:ff0c\:5c31\:6a21\:62df\:547d\:4ee4\:884c\:8f93\:5165\:ff0c\:8ba1\:7b97\:6a21\:62df\:53d8\:91cf\:7684\:5b57\:7b26\:4e32\:5f62\:5f0f\:3002\:56e0\:4e3a\:547d\:4ee4\:884c\:4f20\:5165\:7684\:4e00\:822c\:662f\:5b57\:7b26\:4e32\:ff0c\:8fd9\:6837\:53ef\:4ee5\:7edf\:4e00\:5f62\:5f0f\:3002*)


If[boole`incmd,
(*\:5982\:679c\:5728\:547d\:4ee4\:884c\:6267\:884c*)
input`cml=$ScriptCommandLine,
(*++++++++++++++++++++++++++++++++++++++++*)
(*\:5982\:679c\:5728\:524d\:7aef\:6267\:884c*)
input`cml={filename,(*\:547d\:4ee4\:884c\:7b2c\:4e00\:4e2a\:53c2\:6570\:6c38\:8fdc\:662f\:6b64\:811a\:672c\:7684\:7edd\:5bf9\:8def\:5f84*)
(*\:5176\:4ed6\:53c2\:6570*)
input`simulation=forcestr[
(*\:5728\:8fd9\:91cc\:7ed9\:51fa\:5176\:4ed6\:53c2\:6570\:5728mathematica\:8bed\:6cd5\:4e0b\:7684\:5f62\:5f0f\:ff0c\:5916\:9762\:7684ToString\:4f1a\:81ea\:52a8\:8f6c\:6362*)
(*\:5c3d\:91cf\:591a\:4f7f\:7528Association\:7ed3\:6784*)
<|"unmerge"-><|
"normal"-><|"ge_charge"->"fig.baryons.normal.ge.charge.L-0.90.ci-1.50.m",
"ge_neutral"->"fig.baryons.normal.ge.neutral.L-0.90.ci-1.50.m"|>
|>,
(*++++++++++++++++++++++++++++*)
"merge"-><|
"normal"-><|
"gm_charge"->"fig.baryons.normal.gm.charge.L-0.90.ci-1.50.m",
"gm_neutral"->"fig.baryons.normal.gm.neutral.L-0.90.ci-1.50.m"
|>,
"unnormal"-><|
"gm_charge"->"fig.baryons.unnormal.gm.charge.L-0.90.ci-1.50.m",
"gm_neutral"->"fig.baryons.unnormal.gm.neutral.L-0.90.ci-1.50.m"
|>
|>
|>
(*\:5728\:8fd9\:91cc\:7ed9\:51fa\:5176\:4ed6\:53c2\:6570\:5728mathematica\:8bed\:6cd5\:4e0b\:7684\:5f62\:5f0f\:ff0c\:5916\:9762\:7684ToString\:4f1a\:81ea\:52a8\:8f6c\:6362*)
,InputForm]
}
];


input`cml


(* ::Section:: *)
(*notebook \:5907\:5fd8\:5f55*)


(* ::Text:: *)
(*\:5c06\:56fe\:5f62\:5408\:5e76\:6216\:8005\:4e0d\:5408\:5e76\:8f93\:51fa\:7684\:811a\:672c*)


(* ::Section:: *)
(*formatting parameters*)


(* ::Text:: *)
(*\:5c06\:7b2c\:4e8c\:4e2a\:53c2\:6570\:8f6c\:6362\:6210\:5408\:6cd5\:7684\:8868\:8fbe\:5f0f*)


echo["the input parameter mfile list is:"]


mfiles`list=ToExpression[input`cml[[2]]]


(* ::Text:: *)
(*\:811a\:672c\:5185\:7f6e\:9884\:5b9a\:4e49\:53c2\:6570*)


parameter`order`string="full"
parameter`lambda0`string=ToString[NumberForm[0.90,{3,2}]]
parameter`ci`string=ToString[NumberForm[1.50,{3,2}]]


(* ::Section:: *)
(*export`vars*)


(* ::DisplayFormula:: *)
(*parameter`ci`string*)
(*parameter`lambda0`string*)


(* ::Text:: *)
(*\:521d\:59cb\:5316\:7528\:6765\:8f93\:51fa\:7684\:5173\:8054*)


export`vars=<||>


(* ::Chapter:: *)
(*import figs*)


(* ::Section:: *)
(*import origin figs*)


(* ::Text:: *)
(*************unmerge*)


(* ::DisplayFormula:: *)
(*"fig.baryons.normal.ge.charge.L-0.90.ci-1.50.m"*)
(*"fig.baryons.normal.ge.neutral.L-0.90.ci-1.50.m"*)


(* ::Text:: *)
(****************merge*)


(* ::DisplayFormula:: *)
(*"fig.baryons.normal.gm.charge.L-0.90.ci-1.50.m"*)
(*"fig.baryons.normal.gm.neutral.L-0.90.ci-1.50.m"*)


(* ::DisplayFormula:: *)
(*"fig.baryons.unnormal.gm.charge.L-0.90.ci-1.50.m"*)
(*"fig.baryons.unnormal.gm.neutral.L-0.90.ci-1.50.m"*)


dir`mfiles=FileNameJoin[{git`local`name,"/expression-mfiles/"}]


(* ::DisplayFormula:: *)
(*mfiles`list,\:6240\:9700\:8981\:7684\:5173\:8054\:5217\:8868*)


mfiles`list`fpath=Map[FileNames[#1,dir`mfiles]&,mfiles`list,{-1}]


fig`origin=Map[Get,mfiles`list`fpath,{-1}];


(* ::DisplayFormula:: *)
(*fig`baryons`origin \:662f\:4e00\:4e2a\:5173\:8054\:5217\:8868*)


(* ::Chapter:: *)
(*merge*)


(* ::Text:: *)
(*\:4f7f\:7528Inset\:6765\:8fbe\:5230\:63d2\:56fe\:7684\:6548\:679c*)


(* ::DisplayFormula:: *)
(*Inset[obj\:ff1a\:63d2\:5165\:5bf9\:8c61,pos\:ff1a\:63d2\:5165\:4f4d\:7f6e,opos\:ff1a\:63d2\:5165\:951a\:70b9,size\:ff1a\:5927\:5c0f\:63a7\:5236],*)


(* ::Text:: *)
(*specifies the size of the inset in the coordinate system of the enclosing graphic. *)


(* ::Text:: *)
(*\:5b9a\:4e49\:4e00\:4e2a\:63d2\:5165\:7528\:7684\:51fd\:6570*)


fun`inset[base_,inset_,pos`infun_,inset`pos_,inset`opos_,inset`size_]:=Insert[base,
Inset[
inset,inset`pos,inset`opos,inset`size
],
pos`infun
]


(* ::Text:: *)
(*\:5b9a\:4e49\:4e00\:4e2a\:8ba1\:7b97\:51fd\:6570\:5934Graphics\:4f4d\:7f6efun`pos`graph\:7684\:51fd\:6570*)


fun`pos`graph[base_]:=FirstPosition[base,
x_Graphics,
"Missing",6]


(* ::Text:: *)
(*\:5b9a\:4e49\:4e00\:4e2a\:63d0\:53d6\:51fd\:6570\:5934Graphics\:4f4d\:7f6efun`extrct`graph\:7684\:51fd\:6570*)


fun`extrct`graph[base_]:=FirstCase[base,
x_Graphics,
"Missing",6]


(* ::Text:: *)
(*\:8fd0\:7528\:51fd\:6570\:63d2\:5165\:56fe\:7247*)


(* ::DisplayFormula:: *)
(*fun`inset[base_,inset_,pos`infun_,inset`pos_,inset`opos_,inset`size_]*)


inset`pos=Scaled[{.5,.5}];
inset`opos=Scaled[{0,0}];
inset`size=Scaled[{.62,.62}];


(* ::Section:: *)
(*gm_charge*)


Block[{name,fig`base,fig`inset},
name="gm_charge";
fig`base=First[fig`origin[["merge","normal",name]]];
fig`inset=First[fig`origin[["merge","unnormal",name]]];

export`vars[name]=fun`inset[
(*\:63d2\:5165\:7684base\:56fe*)
fig`base,
(*\:63d0\:53d6\:51fa\:8981\:63d2\:5165\:7684\:56fe\:50cf*)
fun`extrct`graph[fig`inset],
(*\:8ba1\:7b97\:51fainset\:8981\:63d2\:5165\:7684\:4f4d\:7f6e*)
Join[fun`pos`graph[fig`base],{1,1}],
(*\:4e0b\:9762\:7ed9\:51fa\:63d2\:5165\:7684\:5177\:4f53\:4f4d\:7f6e\:548c\:5927\:5c0f*)
inset`pos,
inset`opos,
inset`size
]
];


(* ::Section:: *)
(*gm_neutral*)


Block[{name,fig`base,fig`inset},
name="gm_neutral";
fig`base=First[fig`origin[["merge","normal",name]]];
fig`inset=First[fig`origin[["merge","unnormal",name]]];

export`vars[name]=fun`inset[
(*\:63d2\:5165\:7684base\:56fe*)
fig`base,
(*\:63d0\:53d6\:51fa\:8981\:63d2\:5165\:7684\:56fe\:50cf*)
fun`extrct`graph[fig`inset],
(*\:8ba1\:7b97\:51fainset\:8981\:63d2\:5165\:7684\:4f4d\:7f6e*)
Join[fun`pos`graph[fig`base],{1,1}],
(*\:4e0b\:9762\:7ed9\:51fa\:63d2\:5165\:7684\:5177\:4f53\:4f4d\:7f6e\:548c\:5927\:5c0f*)
inset`pos,
inset`opos,
inset`size
]
];


(* ::Chapter:: *)
(*unmerge*)


Block[{name},
name="ge_charge";
export`vars[name]=(fig`origin[["unmerge","normal",name]]//First);
]


Block[{name},
name="ge_neutral";
export`vars[name]=(fig`origin[["unmerge","normal",name]]//First);
]


(* ::Chapter:: *)
(*export*)


(*\:8f93\:51fa\:76ee\:5f55*)
export`dir=FileNameJoin[{git`local`name,"/expression-results/"}]


echo["the output name list"]


(*\:5bfc\:51fa\:5230\:786c\:76d8\:7684\:6587\:4ef6\:540d\:79f0*)
export`name`list=<|
"ge_charge"->FileNameJoin[{export`dir,
"fig.baryons.ge.charge.L-"<>
parameter`lambda0`string<>
".ci-"<>
parameter`ci`string<>
".pdf"
}],

"ge_neutral"->FileNameJoin[{export`dir,
"fig.baryons.ge.neutral.L-"<>
parameter`lambda0`string<>
".ci-"<>
parameter`ci`string<>
".pdf"
}],

"gm_charge"->FileNameJoin[{export`dir,
"fig.baryons.gm.charge.L-"<>
parameter`lambda0`string<>
".ci-"<>
parameter`ci`string<>
".pdf"
}],

"gm_neutral"->FileNameJoin[{export`dir,
"fig.baryons.gm.neutral.L-"<>
parameter`lambda0`string<>
".ci-"<>
parameter`ci`string<>
".pdf"
}]
|>


Print["----------------------------","\n","output status","\n","----------------------------"];


(*\:5185\:5b58\:4e2d\:4fdd\:5b58\:6570\:636e\:7684\:5173\:8054*)
export`vars//Keys


Module[{namelists},
namelists=Keys[export`vars];

Do[
Export[export`name`list[name],export`vars[name]];

If[SameQ[name,Last[namelists]],
echo["Done"]
]
,{name,namelists}
]

]
