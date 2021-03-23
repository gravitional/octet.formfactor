(* ::Package:: *)

(* ::Title:: *)
(*e.Numeric.series-full.rencon3.strange.wl*)


(* ::Title:: *)
(*initial*)


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
(*\:5982\:679c\:5728\:547d\:4ee4\:884c\:6267\:884c\:ff0c\:5c31\:76f4\:63a5\:63a5\:53d7\:547d\:4ee4\:884c\:53d8\:91cf*)


(* ::Text:: *)
(*\:5982\:679c\:5728\:524d\:7aef\:6267\:884c\:ff0c\:5c31\:6a21\:62df\:547d\:4ee4\:884c\:8f93\:5165\:ff0c\:8ba1\:7b97\:6a21\:62df\:53d8\:91cf\:7684\:5b57\:7b26\:4e32\:5f62\:5f0f\:3002\:56e0\:4e3a\:547d\:4ee4\:884c\:4f20\:5165\:7684\:4e00\:822c\:662f\:5b57\:7b26\:4e32\:ff0c\:8fd9\:6837\:53ef\:4ee5\:7edf\:4e00\:5f62\:5f0f\:3002*)


(* ::Chapter:: *)
(*initial parameters*)


(* ::Text:: *)
(*++++++++++++++++++++++++++++++++++++++++++++*)


(* ::Text:: *)
(*\:6a21\:62df\:547d\:4ee4\:884c\:8f93\:5165\:ff0c\:8c03\:8bd5\:4f7f\:7528*)


input`simulation={"/home/tom/octet.formfactor/Numeric.series-full.rencon3/e.Numeric.series-full.rencon3.strange.wl",
"full",0.90,1.50};


(* ::Text:: *)
(*++++++++++++++++++++++++++++++++++++++++*)


(* ::Text:: *)
(*\:5f15\:5165\:547d\:4ee4\:884c\:53c2\:6570, 1 \:7528\:4f5c\:5b9e\:9645\:811a\:672c\:8fd0\:884c, 2\:7528\:4f5c\:8c03\:8bd5*)


If[boole`incmd,
input`cml=$ScriptCommandLine,(*\:5982\:679c\:5728\:547d\:4ee4\:884c\:6267\:884c\:ff0c\:5c31\:91c7\:7528\:547d\:4ee4\:884c\:53c2\:6570*)
input`cml=input`simulation(*\:5982\:679c\:5728\:7b14\:8bb0\:672c\:6267\:884c\:ff0c\:5c31\:91c7\:7528\:6a21\:62df\:53c2\:6570*)
];


(* ::Text:: *)
(*+++++++++++++++++++++++++++++++++*)


{file`name,parameter`order,parameter`lambda0,parameter`ci}={
input`cml[[1]],input`cml[[2]],
ToExpression[input`cml[[3]]],
ToExpression[input`cml[[4]]]
};


echo["the parameter order, lambda, ci,"];


parameter`order`string=ToString[parameter`order]
parameter`lambda0`string=ToString[NumberForm[parameter`lambda0,{3,2}]]
parameter`ci`string=ToString[NumberForm[parameter`ci,{3,2}]]


(* ::Chapter:: *)
(*Initial*)


(* ::Text:: *)
(*inital by hand*)


<<X`


choplimit=10^-10;


(* ::Chapter:: *)
(*coefficients & mass constants*)


(* ::Text:: *)
(*a 4 component list, contain all, u,d,s*)


(* ::Section:: *)
(*coe list and mass rule get*)


echo["start import analytic and coes "];


analytic`dir=FileNameJoin[{git`local`name,"analytic-storage.strange.series-"<>parameter`order`string}]


zero`directory=FileNameJoin[{git`local`name,"analytic-storage.strange.series-o0"}]


coe`directory=FileNameJoin[{git`local`name,"expression-coes"}]


fucoeandmrrlnm={
FileNameJoin[{coe`directory,"fu.coeandmassrrl.consti.all.m"}],
FileNameJoin[{coe`directory,"fu.coeandmassrrl.consti.u.m"}],
FileNameJoin[{coe`directory,"fu.coeandmassrrl.consti.d.m"}],
FileNameJoin[{coe`directory,"fu.coeandmassrrl.consti.s.m"}]
};


Once[chpt`qfb`quench`coemass`masslimit=Get[FileNameJoin[{coe`directory,"chpt`qfb`quench`coemass`masslimit.m"}]]];
Once[chpt`qfa`sea`coemass`masslimit=Get[FileNameJoin[{coe`directory,"chpt`qfa`sea`coemass`masslimit.m"}]]];
Once[chpt`qfa`valence`coemass`masslimit=Get[FileNameJoin[{coe`directory,"chpt`qfa`valence`coemass`masslimit.m"}]]];


Once[
fucoeandmrrlraw=Map[Get,fucoeandmrrlnm,1]
];


Once[
fucoeandmrrl=Join[fucoeandmrrlraw,
Transpose[chpt`qfb`quench`coemass`masslimit,{2,3,1}],
Transpose[chpt`qfa`valence`coemass`masslimit,{2,3,1}],
Transpose[chpt`qfa`sea`coemass`masslimit,{2,3,1}]
]
];


(* ::DisplayFormula:: *)
(*fucoeandmrrlraw//Dimensions*)
(*fucoeandmrrl//Dimensions*)


(* ::Section:: *)
(*mass constant*)


(* ::Subsection:: *)
(*order*)


(* ::DisplayFormula:: *)
(*conmo={1\[CapitalSigma],2Neu,3\[CapitalXi],4\[CapitalLambda]}--{1\[CapitalSigma]m,2\[CapitalSigma]0,3\[CapitalSigma]p,4pr,5ne,6\[CapitalXi]m,7\[CapitalXi]0,8\[CapitalLambda]}*)


(* ::DisplayFormula:: *)
(*conmm={1\[Pi],2Ki,3\[Eta]},*)


(* ::DisplayFormula:: *)
(*conmd={1\[CapitalDelta],2\[CapitalSigma]s,3\[CapitalXi]s,4\[CapitalOmega]}*)


(* ::Subsection:: *)
(*assign value*)


{conm\[Pi],conmKi,conm\[Eta],conmEtas}={
0.1381`20,
0.4956`20,
0.5693`20,
0.9452`20
};


{conm\[CapitalSigma],conmN,conm\[CapitalXi],conm\[CapitalLambda],conm\[CapitalLambda]\[CapitalSigma],
conmUUU,conmDDD,conmSSS(* the symmetric terms *)
}={
1.193`20,0.939`20,1.315`20,1.116`20,1.155`20,
0.939`20,0.939`20,1.315`20
};


{conm\[CapitalDelta],conm\[CapitalSigma]s,conm\[CapitalXi]s,conm\[CapitalOmega]}={
1.232`20,
1.385`20,
1.530`20,
1.672`20
};


(* ::DisplayFormula:: *)
(*{conmN,conm\[Eta],conm\[CapitalXi]s}*)


(* ::Section:: *)
(*fu Coefficients mass rules reduce*)


(* ::Subsection:: *)
(*fu Coefficients*)


(* ::DisplayFormula:: *)
(*in {4,9} external sign[-]*)


(* ::DisplayFormula:: *)
(*fusign8,fusign9*)


fucoepresign={
(*+++++++++++++++++++111++++++++++++++++++++++++++++++++++++++*)
{1,1,1,
-1,(*4*)-1,(*5*)
1,1,fusign8,(*8*)fusign9,(*9*)
1,1(*11*)},
(*+++++++++++++++++++222++++++++++++++++++++++++++++++++++++++*)
{
-1,-1,-1,
-1,(*4*)-1,(*5*)
1,1,-1,(*8*)-1,(*9*)
1,1(*11*)},
(*+++++++++++++++++++333++++++++++++++++++++++++++++++++++++++*)
{1,1,1,(*3*)
-1,(*4*)-1,(*5*)
1,1,-1,(*8*)-1,(*9*)
1,1(*11*)}(*fch's sign*)
}[[3]];


(* ::Text:: *)
(*1 for fitting, 2 for calc/test,*)


echo["start combine coes and presigns"];


(*fucoeandmrrlraw [consti,figure,octet][4*11*8]*)
fucoe=Table[
Simplify[
fucoepresign*Values[fucoeandmrrl[[seva]]]
]
,{seva,1,13,1}
];//AbsoluteTiming


(* ::Section:: *)
(*fu mass rules*)


fumass=Keys[fucoeandmrrl];


(* ::DisplayFormula:: *)
(*fucoe//Dimensions*)
(*fumass//Dimensions*)


(* ::Section:: *)
(*rule lists*)


constmo={
(*1*)conm\[CapitalSigma],(*2*)conm\[CapitalSigma],(*3*)conm\[CapitalSigma],
(*4*)conmN,(*5*)conmN,
(*6*)conm\[CapitalXi],(*7*)conm\[CapitalXi],
(*8*)conm\[CapitalLambda]
};


baselist1={
{mN->conm\[CapitalSigma]},{mN->conm\[CapitalSigma]},{mN->conm\[CapitalSigma]},
{mN->conmN},{mN->conmN},
{mN->conm\[CapitalXi]},{mN->conm\[CapitalXi]},
{mN->conm\[CapitalLambda]}
};


(* ::DisplayFormula:: *)
(*c1->2.081,c2->(2/3 c1-1),c3->(-1/3 c1-1)*)


(* ::DisplayFormula:: *)
(*c1->2.081,c2->(2/3 c1-1),c3->(-1/3 c1-1)*)


c3 = c2 - c1;


config`c1c2=<|
(*here is the test configuration*)
{"0.90","1.05"}->{c1->1.6953280353951576,c2->0.3310658564719022},
{"0.90","1.10"}->{c1->1.6542713327732161,c2->0.33436637472152625},
{"0.90","1.15"}->{c1->1.6123731286405323,c2->0.3391546182014223},
{"0.90","1.20"}->{c1->1.5695553824090447,c2->0.34549380908051003},
{"0.90","1.25"}->{c1->1.52573376001649,c2->0.3534520015169396},
{"0.90","1.30"}->{c1->1.4808169080281381,c2->0.36310264571922746},
{"0.90","1.35"}->{c1->1.4347058513175641,c2->0.3745252303880658},
{"0.90","1.40"}->{c1->1.3872930796528253,c2->0.38780603182458356},
{"0.90","1.45"}->{c1->1.3384617392686042,c2->0.40303891974480227},
(*here is the errorbar configuration*)
{"0.80","1.00"}->{c1->1.735615447693526,c2->0.3291941389962671},
{"0.82","1.00"}->{c1->1.735615447693526,c2->0.3291941389962671},
{"0.84","1.00"}->{c1->1.735615447693526,c2->0.3291941389962671},
{"0.86","1.00"}->{c1->1.735615447693526,c2->0.3291941389962671},
{"0.88","1.00"}->{c1->1.735615447693526,c2->0.3291941389962671},
{"0.90","1.00"}->{c1->1.735615447693526,c2->0.3291941389962671},
{"0.92","1.00"}->{c1->1.735615447693526,c2->0.3291941389962671},
{"0.94","1.00"}->{c1->1.735615447693526,c2->0.3291941389962671},
{"0.96","1.00"}->{c1->1.735615447693526,c2->0.3291941389962671},
{"0.98","1.00"}->{c1->1.735615447693526,c2->0.3291941389962671},
{"1.00","1.00"}->{c1->1.735615447693526,c2->0.3291941389962671},
(*here is the errorbar configuration*)
{"0.80","1.50"}->{c1->1.2880845603299935,c2->0.4203262639322895},
{"0.82","1.50"}->{c1->1.2880845603299935,c2->0.4203262639322895},
{"0.84","1.50"}->{c1->1.2880845603299935,c2->0.4203262639322895},
{"0.86","1.50"}->{c1->1.2880845603299935,c2->0.4203262639322895},
{"0.88","1.50"}->{c1->1.2880845603299935,c2->0.4203262639322895},
{"0.90","1.50"}->{c1->1.2880845603299935,c2->0.4203262639322895},
{"0.92","1.50"}->{c1->1.2880845603299935,c2->0.4203262639322895},
{"0.94","1.50"}->{c1->1.2880845603299935,c2->0.4203262639322895},
{"0.96","1.50"}->{c1->1.2880845603299935,c2->0.4203262639322895},
{"0.98","1.50"}->{c1->1.2880845603299935,c2->0.4203262639322895},
{"1.00","1.50"}->{c1->1.2880845603299935,c2->0.4203262639322895}
|>;


baselist2=Join[
{
f->0.093`20,
zi->-1,
di->0.76`20,fi->0.50`20,
ci->SetPrecision[parameter`ci,20],
\[CapitalLambda]0->SetPrecision[parameter`lambda0,20]
},
config`c1c2[{parameter`lambda0`string,parameter`ci`string}]
];


(* ::Text:: *)
(*for neutron pull-apart, best octet fit \[CapitalLambda]0\[TildeTilde]1~0.1*)


baselist=Table[
Join[baselist1[[io]],baselist2]
,{io,1,8,1}
];


(* ::Section::Closed:: *)
(*para-c1c2.sum-square.all-baryons.rencon2*)


(* ::Text:: *)
(***********************************************************************)


(* ::DisplayFormula:: *)
(*ci->1,\[CapitalLambda]0->0.7,*)
(*{0.140654,{c1->2.01272,c2->0.477586}}*)


(* ::DisplayFormula:: *)
(*ci->1,\[CapitalLambda]0->0.75,*)
(*{0.132188,{c1->1.95069,c2->0.441996}}*)


(* ::DisplayFormula:: *)
(*ci->1,\[CapitalLambda]0->0.8,*)
(*{0.126797,{c1->1.88383,c2->0.405126}}*)


(* ::DisplayFormula:: *)
(*ci->1,\[CapitalLambda]0->0.85,*)
(*{0.123918,{c1->1.81213,c2->0.36732}}*)


(* ::DisplayFormula:: *)
(*ci->1,\[CapitalLambda]0->0.90,*)
(*{0.123053,{c1->1.73562,c2->0.329194}}*)


(* ::DisplayFormula:: *)
(*ci->1,\[CapitalLambda]0->0.95,*)
(*{0.123788,{c1->1.65425,c2->0.291768}}*)


(* ::DisplayFormula:: *)
(*ci->1,\[CapitalLambda]0->1.0,*)
(*{0.125804,{c1->1.56783,c2->0.256696}}*)


(* ::DisplayFormula:: *)
(*ci->1,\[CapitalLambda]0->1.05,*)
(*{0.128887,{c1->1.4758,c2->0.226666}}*)


(* ::DisplayFormula:: *)
(*ci->1,\[CapitalLambda]0->1.1,*)
(*{0.132961,{c1->1.37675,c2->0.206175}}*)


(* ::Text:: *)
(************************************************************************************)


(* ::DisplayFormula:: *)
(*ci->1,\[CapitalLambda]0->0.90,*)
(*{0.123053,{c1->1.73562,c2->0.329194}}*)


(* ::DisplayFormula:: *)
(*\[CapitalLambda]0->0.90,ci->1.05,*)
(*{0.114994,{c1->1.69533,c2->0.331066}}*)


(* ::DisplayFormula:: *)
(*\[CapitalLambda]0->0.90,ci->1.1,*)
(*{0.107251,{c1->1.65427,c2->0.334366}}*)


(* ::DisplayFormula:: *)
(*\[CapitalLambda]0->0.90,ci->1.15,*)
(*{0.099849,{c1->1.61237,c2->0.339155}}*)


(* ::DisplayFormula:: *)
(*\[CapitalLambda]0->0.90,ci->1.2,*)


(* ::DisplayFormula:: *)
(*{0.0928122,{c1->1.56956,c2->0.345494}}*)


(* ::DisplayFormula:: *)
(*\[CapitalLambda]0->0.90,ci->1.25,*)
(*{0.0861669,{c1->1.52573,c2->0.353452}}*)


(* ::DisplayFormula:: *)
(*\[CapitalLambda]0->0.90,ci->1.3,*)
(*{0.0799395,{c1->1.48082,c2->0.363103}}*)


(* ::DisplayFormula:: *)
(*\[CapitalLambda]0->0.90,ci->1.35,*)


(* ::DisplayFormula:: *)
(*{0.0741573,{c1->1.43471,c2->0.374525}}*)


(* ::DisplayFormula:: *)
(*\[CapitalLambda]0->0.90,ci->1.40,*)
(*{0.0688482,{c1->1.38729,c2->0.387806}}*)


(* ::DisplayFormula:: *)
(*\[CapitalLambda]0->0.90,ci->1.45,*)
(*{0.0640414,{c1->1.33846,c2->0.403039}}*)


(* ::DisplayFormula:: *)
(*\[CapitalLambda]0->0.90,ci->1.5,*)
(*{0.0597673,{c1->1.28808,c2->0.420326}}*)


(* ::Text:: *)
(***************************************************************************)


(* ::DisplayFormula:: *)
(*\[CapitalLambda]0->0.80,ci->1,*)
(*{0.126797,{c1->1.88383,c2->0.405126}}*)


(* ::DisplayFormula:: *)
(*\[CapitalLambda]0->0.80,ci->1.05,*)
(*{0.119196,{c1->1.85488,c2->0.403562}}*)


(* ::DisplayFormula:: *)
(*\[CapitalLambda]0->0.80,ci->1.1,*)
(*{0.111782,{c1->1.82541,c2->0.402675}}*)


(* ::DisplayFormula:: *)
(*\[CapitalLambda]0->0.80,ci->1.15,*)
(*{0.104581,{c1->1.79539,c2->0.402487}}*)


(* ::DisplayFormula:: *)
(*\[CapitalLambda]0->0.80,ci->1.2,*)


(* ::DisplayFormula:: *)
(*{0.097619,{c1->1.7648,c2->0.403024}}*)


(* ::DisplayFormula:: *)
(*\[CapitalLambda]0->0.80,ci->1.25,*)
(*{0.0909201,{c1->1.73361,c2->0.40431}}*)


(* ::DisplayFormula:: *)
(*\[CapitalLambda]0->0.80,ci->1.3,*)
(*{0.0845108,{c1->1.70178,c2->0.406373}}*)


(* ::DisplayFormula:: *)
(*\[CapitalLambda]0->0.80,ci->1.35,*)


(* ::DisplayFormula:: *)
(*{0.0784171,{c1->1.6693,c2->0.409241}}*)


(* ::DisplayFormula:: *)
(*\[CapitalLambda]0->0.80,ci->1.40,*)
(*{0.0726658,{c1->1.63611,c2->0.412944}}*)


(* ::DisplayFormula:: *)
(*\[CapitalLambda]0->0.80,ci->1.45,*)
(*{0.0672835,{c1->1.60219,c2->0.417514}}*)


(* ::DisplayFormula:: *)
(*\[CapitalLambda]0->0.80,ci->1.5,*)
(*{0.0622978,{c1->1.56749,c2->0.422984}}*)


(* ::Text:: *)
(**************************************************************)


(* ::DisplayFormula:: *)
(*\[CapitalLambda]0->0.85,ci->1.5,*)
(*{0.0597742,{c1->1.43562,c2->0.412794}}*)


(* ::DisplayFormula:: *)
(*\[CapitalLambda]0->1,ci->1.5,*)
(*{0.0654518,{c1->0.917221,c2->0.539694}}*)


(* ::Section:: *)
(*import integral analytic*)


ff1=Table[
Get[
FileNameJoin[{analytic`dir,"f1."<>"analytic."<>ToString[if]<>".m"}]
]
,{if,1,11,1}];//AbsoluteTiming


ff2=Table[
Get[
FileNameJoin[{analytic`dir,"f2."<>"analytic."<>ToString[if]<>".m"}]
]
,{if,1,11,1}];//AbsoluteTiming


(* ::Text:: *)
(*zero ff1 ff2*)


zero`ff1=Table[
Get[
FileNameJoin[{zero`directory,"f1."<>"analytic."<>ToString[if]<>".m"}]
]
,{if,1,11,1}];//AbsoluteTiming


zero`ff2=Table[
Get[
FileNameJoin[{zero`directory,"f2."<>"analytic."<>ToString[if]<>".m"}]
]
,{if,1,11,1}];//AbsoluteTiming


(* ::Section:: *)
(*contribution combine coefficients,f1, f2*)


echo["start numeric, separate`nuff1 separate`nuff2 "];


SetOptions[Simplify,TimeConstraint->1];


(* ::DisplayFormula:: *)
(*fucoe=11[diagram]*8[octet]*n(coefficients)*)


(* ::DisplayFormula:: *)
(*fumass=11[diagram]*8[octet]*n(n =above n,mass rule lists)*)


(* ::DisplayFormula:: *)
(*diagff=11[diagram]*2[ff1,ff2]*many(contri terms)*)


Module[{order=0},

separate`nuff1=Table[

(*\:8ba1\:6570\:5668\:ff0c\:7528\:6765\:663e\:793a\:8ba1\:7b97\:8fdb\:5ea6\:ff0c\:4ee5 200 \:4e2a\:9879\:76ee\:4e3a\:8ba1\:6570\:5355\:4f4d*)
order++;
If[IntegerQ[order/50],
Print[
"seva=",seva,
",io=",io,
",if=",if,
",coe=",coe
]
];

Simplify[
(
(
fucoe[[seva,if,io,coe]]*ff1[[if]]
)/.baselist[[io]]
)/.fumass[[seva,if,io,coe]]
]

(*,{series,1,2,1}(*series order 0 1 *)*)
,{seva,1,13,1}
,{io,1,8,1}(*the outest level is the octet order*)
,{if,1,11,1}(*the if contris should be summed*)
,{coe,1,Length[fucoe[[seva,if,io]]],1}(*the coe contris should be summed*)
];
]//AbsoluteTiming


Module[{order=0},

separate`nuff2=Table[

order++;
If[IntegerQ[order/50],
Print[
"seva=",seva,
",io=",io,
",if=",if,
",coe=",coe
]
];

Simplify[
(
(
fucoe[[seva,if,io,coe]]*ff2[[if]]
)/.baselist[[io]]
)/.fumass[[seva,if,io,coe]]
]

(*,{series,1,2,1}(*series order 0 1 *)*)
,{seva,1,13,1}
,{io,1,8,1}(*the outest level is the octet order*)
,{if,1,11,1}(*the if contris should be summed*)
,{coe,1,Length[fucoe[[seva,if,io]]],1}(*the coe contris should be summed*)
];
]//AbsoluteTiming


nuff1=Total[separate`nuff1,{3,4}];
nuff2=Total[separate`nuff2,{3,4}];


(* nuff1,nuff2 is 1*8 *)
nugegm=Transpose[(* 8*2*1 transpose into 2*4*8*11 *)
Table[
-1/(16\[Pi]^2) {
nuff1[[All,io]]-Q2/(4constmo[[io]]^2) nuff2[[All,io]],
nuff1[[All,io]]+nuff2[[All,io]]
}
,{io,1,8,1}
]
,{3,1,2}
];


(* ::DisplayFormula:: *)
(*nugegm,{2,1,8},{gegm,seva,io}*)


(* ::Section:: *)
(*zero`nuff1 zero`nuff2*)


echo["start numeric, separate`nuff1 separate`nuff2, zero order"];


Module[{order=0},

zero`separate`nuff1=Table[

(*\:8ba1\:6570\:5668\:ff0c\:7528\:6765\:663e\:793a\:8ba1\:7b97\:8fdb\:5ea6\:ff0c\:4ee5 200 \:4e2a\:9879\:76ee\:4e3a\:8ba1\:6570\:5355\:4f4d*)
order++;
If[IntegerQ[order/200],Print[seva,",",io,",",if,",",coe]
];

Simplify[
(
(
fucoe[[seva,if,io,coe]]*zero`ff1[[if]]
)/.baselist[[io]]
)/.fumass[[seva,if,io,coe]]
]

(*,{series,1,2,1}(*series order 0 1 *)*)
,{seva,1,13,1}
,{io,1,8,1}(*the outest level is the octet order*)
,{if,1,11,1}(*the if contris should be summed*)
,{coe,1,Length[fucoe[[seva,if,io]]],1}(*the coe contris should be summed*)
];
]//AbsoluteTiming


Module[{order=0},

zero`separate`nuff2=Table[

order++;
If[IntegerQ[order/200],Print[seva,",",io,",",if,",",coe]
];

Simplify[
(
(
fucoe[[seva,if,io,coe]]*zero`ff2[[if]]
)/.baselist[[io]]
)/.fumass[[seva,if,io,coe]]
]

(*,{series,1,2,1}(*series order 0 1 *)*)
,{seva,1,13,1}
,{io,1,8,1}(*the outest level is the octet order*)
,{if,1,11,1}(*the if contris should be summed*)
,{coe,1,Length[fucoe[[seva,if,io]]],1}(*the coe contris should be summed*)
];
]//AbsoluteTiming


zero`nuff1=Total[zero`separate`nuff1,{3,4}];
zero`nuff2=Total[zero`separate`nuff2,{3,4}];


zero`nugegm=Transpose[(*8*4*2 transpose into 4*8*2*)
Table[
-1/(16\[Pi]^2) {
zero`nuff1[[All,io]]-Q2/(4constmo[[io]]^2) zero`nuff2[[All,io]],
zero`nuff1[[All,io]]+zero`nuff2[[All,io]]
}
,{io,1,8,1}]
,{3,1,2}
];//AbsoluteTiming


(* ::DisplayFormula:: *)
(*zero`nugegm,{2,4,8},{gegm,seva,io}*)


(* ::Chapter:: *)
(*tree level contributions*)


(* ::Section:: *)
(*initial*)


(* ::Text:: *)
(*because history reasons, all mass mo here is marked as mN*)


(* ::DisplayFormula:: *)
(*{ (c1 Q2)/(3 (4 mN^2+Q2)) \[CapitalLambda]^4/(\[CapitalLambda]^2+Q2)^2+ (c1 Q2)/(Sqrt[3] (4 mN^2+Q2)) \[CapitalLambda]^4/(\[CapitalLambda]^2+Q2)^2, (4 c1 mN^2)/(3(4 mN^2+Q2)) \[CapitalLambda]^4/(\[CapitalLambda]^2+Q2)^2+(4 c1 mN^2)/(Sqrt[3](4 mN^2+Q2)) \[CapitalLambda]^4/(\[CapitalLambda]^2+Q2)^2},(*2,\[CapitalSigma]0*)*)


(* ::DisplayFormula:: *)
(*{ (c1 Q2)/(3 (4 mN^2+Q2)) \[CapitalLambda]^4/(\[CapitalLambda]^2+Q2)^2, (4 c1 mN^2)/(3(4 mN^2+Q2)) \[CapitalLambda]^4/(\[CapitalLambda]^2+Q2)^2},(*2,\[CapitalSigma]0*)*)


trf1f2={
(*+++++++++++++++++total++++++++++++++++++++++++*)
{{((-12 mo^2+(c1-3 (1+c2)) Q2) \[CapitalLambda]0^4)/(3 (4 mo^2+Q2) (Q2+\[CapitalLambda]0^2)^2),(4 (c1-3 c2) mo^2 \[CapitalLambda]0^4)/(3 (4 mo^2+Q2) (Q2+\[CapitalLambda]0^2)^2)},{(c1 Q2 \[CapitalLambda]0^4)/(3 (4 mo^2+Q2) (Q2+\[CapitalLambda]0^2)^2),(4 c1 mo^2 \[CapitalLambda]0^4)/(3 (4 mo^2+Q2) (Q2+\[CapitalLambda]0^2)^2)},
{((12 mo^2+(3+c1+3 c2) Q2) \[CapitalLambda]0^4)/(3 (4 mo^2+Q2) (Q2+\[CapitalLambda]0^2)^2),(4 (c1+3 c2) mo^2 \[CapitalLambda]0^4)/(3 (4 mo^2+Q2) (Q2+\[CapitalLambda]0^2)^2)},
{((12 mo^2+(3+c1+3 c2) Q2) \[CapitalLambda]0^4)/(3 (4 mo^2+Q2) (Q2+\[CapitalLambda]0^2)^2),(4 (c1+3 c2) mo^2 \[CapitalLambda]0^4)/(3 (4 mo^2+Q2) (Q2+\[CapitalLambda]0^2)^2)},{-((2 c1 Q2 \[CapitalLambda]0^4)/(3 (4 mo^2+Q2) (Q2+\[CapitalLambda]0^2)^2)),-((8 c1 mo^2 \[CapitalLambda]0^4)/(3 (4 mo^2+Q2) (Q2+\[CapitalLambda]0^2)^2))},
{((-12 mo^2+(c1-3 (1+c2)) Q2) \[CapitalLambda]0^4)/(3 (4 mo^2+Q2) (Q2+\[CapitalLambda]0^2)^2),(4 (c1-3 c2) mo^2 \[CapitalLambda]0^4)/(3 (4 mo^2+Q2) (Q2+\[CapitalLambda]0^2)^2)},{-((2 c1 Q2 \[CapitalLambda]0^4)/(3 (4 mo^2+Q2) (Q2+\[CapitalLambda]0^2)^2)),-((8 c1 mo^2 \[CapitalLambda]0^4)/(3 (4 mo^2+Q2) (Q2+\[CapitalLambda]0^2)^2))},
{-((c1 Q2 \[CapitalLambda]0^4)/(3 (4 mo^2+Q2) (Q2+\[CapitalLambda]0^2)^2)),-((4 c1 mo^2 \[CapitalLambda]0^4)/(3 (4 mo^2+Q2) (Q2+\[CapitalLambda]0^2)^2))}},
(*+++++++++++++++++u++++++++++++++++++++++++*)
{
{((c1-c2+c3) Q2 \[CapitalLambda]0^4)/((4 mo^2+Q2) (Q2+\[CapitalLambda]0^2)^2),(4 (c1-c2+c3) mo^2 \[CapitalLambda]0^4)/((4 mo^2+Q2) (Q2+\[CapitalLambda]0^2)^2)},{((4 mo^2+(1+c1+c3) Q2) \[CapitalLambda]0^4)/((4 mo^2+Q2) (Q2+\[CapitalLambda]0^2)^2),(4 (c1+c3) mo^2 \[CapitalLambda]0^4)/((4 mo^2+Q2) (Q2+\[CapitalLambda]0^2)^2)},
{((8 mo^2+(2+c1+c2+c3) Q2) \[CapitalLambda]0^4)/((4 mo^2+Q2) (Q2+\[CapitalLambda]0^2)^2),(4 (c1+c2+c3) mo^2 \[CapitalLambda]0^4)/((4 mo^2+Q2) (Q2+\[CapitalLambda]0^2)^2)},
{((8 mo^2+(2+c1+c2+c3) Q2) \[CapitalLambda]0^4)/((4 mo^2+Q2) (Q2+\[CapitalLambda]0^2)^2),(4 (c1+c2+c3) mo^2 \[CapitalLambda]0^4)/((4 mo^2+Q2) (Q2+\[CapitalLambda]0^2)^2)},{((4 mo^2+Q2+c3 Q2) \[CapitalLambda]0^4)/((4 mo^2+Q2) (Q2+\[CapitalLambda]0^2)^2),(4 c3 mo^2 \[CapitalLambda]0^4)/((4 mo^2+Q2) (Q2+\[CapitalLambda]0^2)^2)},
{((c1-c2+c3) Q2 \[CapitalLambda]0^4)/((4 mo^2+Q2) (Q2+\[CapitalLambda]0^2)^2),(4 (c1-c2+c3) mo^2 \[CapitalLambda]0^4)/((4 mo^2+Q2) (Q2+\[CapitalLambda]0^2)^2)},{((4 mo^2+Q2+c3 Q2) \[CapitalLambda]0^4)/((4 mo^2+Q2) (Q2+\[CapitalLambda]0^2)^2),(4 c3 mo^2 \[CapitalLambda]0^4)/((4 mo^2+Q2) (Q2+\[CapitalLambda]0^2)^2)},
{((12 mo^2+(3+c1+3 c3) Q2) \[CapitalLambda]0^4)/(3 (4 mo^2+Q2) (Q2+\[CapitalLambda]0^2)^2),(4 (c1+3 c3) mo^2 \[CapitalLambda]0^4)/(3 (4 mo^2+Q2) (Q2+\[CapitalLambda]0^2)^2)}
},
(*+++++++++++++++++d++++++++++++++++++++++++*)
{
{((8 mo^2+(2+c1+c2+c3) Q2) \[CapitalLambda]0^4)/((4 mo^2+Q2) (Q2+\[CapitalLambda]0^2)^2),(4 (c1+c2+c3) mo^2 \[CapitalLambda]0^4)/((4 mo^2+Q2) (Q2+\[CapitalLambda]0^2)^2)},{((4 mo^2+(1+c1+c3) Q2) \[CapitalLambda]0^4)/((4 mo^2+Q2) (Q2+\[CapitalLambda]0^2)^2),(4 (c1+c3) mo^2 \[CapitalLambda]0^4)/((4 mo^2+Q2) (Q2+\[CapitalLambda]0^2)^2)},
{((c1-c2+c3) Q2 \[CapitalLambda]0^4)/((4 mo^2+Q2) (Q2+\[CapitalLambda]0^2)^2),(4 (c1-c2+c3) mo^2 \[CapitalLambda]0^4)/((4 mo^2+Q2) (Q2+\[CapitalLambda]0^2)^2)},
{((4 mo^2+Q2+c3 Q2) \[CapitalLambda]0^4)/((4 mo^2+Q2) (Q2+\[CapitalLambda]0^2)^2),(4 c3 mo^2 \[CapitalLambda]0^4)/((4 mo^2+Q2) (Q2+\[CapitalLambda]0^2)^2)},{((8 mo^2+(2+c1+c2+c3) Q2) \[CapitalLambda]0^4)/((4 mo^2+Q2) (Q2+\[CapitalLambda]0^2)^2),(4 (c1+c2+c3) mo^2 \[CapitalLambda]0^4)/((4 mo^2+Q2) (Q2+\[CapitalLambda]0^2)^2)},
{((4 mo^2+Q2+c3 Q2) \[CapitalLambda]0^4)/((4 mo^2+Q2) (Q2+\[CapitalLambda]0^2)^2),(4 c3 mo^2 \[CapitalLambda]0^4)/((4 mo^2+Q2) (Q2+\[CapitalLambda]0^2)^2)},{((c1-c2+c3) Q2 \[CapitalLambda]0^4)/((4 mo^2+Q2) (Q2+\[CapitalLambda]0^2)^2),(4 (c1-c2+c3) mo^2 \[CapitalLambda]0^4)/((4 mo^2+Q2) (Q2+\[CapitalLambda]0^2)^2)},
{((12 mo^2+(3+c1+3 c3) Q2) \[CapitalLambda]0^4)/(3 (4 mo^2+Q2) (Q2+\[CapitalLambda]0^2)^2),(4 (c1+3 c3) mo^2 \[CapitalLambda]0^4)/(3 (4 mo^2+Q2) (Q2+\[CapitalLambda]0^2)^2)}
},
(*+++++++++++++++++s++++++++++++++++++++++++*)
{{((4 mo^2+Q2+c3 Q2) \[CapitalLambda]0^4)/((4 mo^2+Q2) (Q2+\[CapitalLambda]0^2)^2),(4 c3 mo^2 \[CapitalLambda]0^4)/((4 mo^2+Q2) (Q2+\[CapitalLambda]0^2)^2)},{((4 mo^2+Q2+c3 Q2) \[CapitalLambda]0^4)/((4 mo^2+Q2) (Q2+\[CapitalLambda]0^2)^2),(4 c3 mo^2 \[CapitalLambda]0^4)/((4 mo^2+Q2) (Q2+\[CapitalLambda]0^2)^2)},
{((4 mo^2+Q2+c3 Q2) \[CapitalLambda]0^4)/((4 mo^2+Q2) (Q2+\[CapitalLambda]0^2)^2),(4 c3 mo^2 \[CapitalLambda]0^4)/((4 mo^2+Q2) (Q2+\[CapitalLambda]0^2)^2)},
{((c1-c2+c3) Q2 \[CapitalLambda]0^4)/((4 mo^2+Q2) (Q2+\[CapitalLambda]0^2)^2),(4 (c1-c2+c3) mo^2 \[CapitalLambda]0^4)/((4 mo^2+Q2) (Q2+\[CapitalLambda]0^2)^2)},{((c1-c2+c3) Q2 \[CapitalLambda]0^4)/((4 mo^2+Q2) (Q2+\[CapitalLambda]0^2)^2),(4 (c1-c2+c3) mo^2 \[CapitalLambda]0^4)/((4 mo^2+Q2) (Q2+\[CapitalLambda]0^2)^2)},
{((8 mo^2+(2+c1+c2+c3) Q2) \[CapitalLambda]0^4)/((4 mo^2+Q2) (Q2+\[CapitalLambda]0^2)^2),(4 (c1+c2+c3) mo^2 \[CapitalLambda]0^4)/((4 mo^2+Q2) (Q2+\[CapitalLambda]0^2)^2)},{((8 mo^2+(2+c1+c2+c3) Q2) \[CapitalLambda]0^4)/((4 mo^2+Q2) (Q2+\[CapitalLambda]0^2)^2),(4 (c1+c2+c3) mo^2 \[CapitalLambda]0^4)/((4 mo^2+Q2) (Q2+\[CapitalLambda]0^2)^2)},
{((12 mo^2+(3+4 c1+3 c3) Q2) \[CapitalLambda]0^4)/(3 (4 mo^2+Q2) (Q2+\[CapitalLambda]0^2)^2),(4 (4 c1+3 c3) mo^2 \[CapitalLambda]0^4)/(3 (4 mo^2+Q2) (Q2+\[CapitalLambda]0^2)^2)}}
}/.mo->mN;
(*trf1f2 is [consti,octet,treef1f2][4*8*2]*)


(* ::Section:: *)
(*gegm*)


(* ::DisplayFormula:: *)
(*-I el  (4 mN^2+c1 Q2)/(4 mN^2+Q2) ,-(-el /(2mN)) (4 (c1-1) mN^2)/(4 mN^2+Q2)*)


(* ::DisplayFormula:: *)
(*netrf1f2[[4]]={ (4 mN^2+c1 Q2)/(4 mN^2+Q2) \[CapitalLambda]^4/(\[CapitalLambda]^2+Q2)^2,(4 (c1-1) mN^2)/(4 mN^2+Q2) \[CapitalLambda]^4/(\[CapitalLambda]^2+Q2)^2}/.baselist*)


(* ::Input:: *)
(*(*trf1f2 is [consti,octet,treef1f2][4*8*2]*)*)


trgegm=Transpose[
Table[
Simplify[
{
trf1f2[[All,io,1]]-Q2/(4constmo[[io]]^2) trf1f2[[All,io,2]],
trf1f2[[All,io,1]]+trf1f2[[All,io,2]]
}/.baselist[[io]]
]
,{io,1,8,1}]
,{3,1,2}];//AbsoluteTiming


(* ::DisplayFormula:: *)
(*trgegm,{2,4,8},{gegm,seva,io}*)


(* ::Chapter:: *)
(*rencon calc*)


(* ::Section:: *)
(*constants*)


(* ::Text:: *)
(* octetmagetonc1={(*1*)-(c1/3),(*2*)c1/3,(*3*)c1,(*4*)c1,(*5*)-((2 c1)/3),(*6*)-(c1/3),(*7*)-((2 c1)/3),(*8*)-(c1/3)};*)


octetcharge={
(*1*)-1,(*2*)0,(*3*)1,
(*4*)1,(*5*)0,
(*6*)-1,(*7*)0,
(*8*)0
};


octetmageton={(*1*) \[Minus]1.160,(*2*) 0.60,(*3*)2.458,
  (*4*)2.7928473446, (*5*)\[Minus]1.9130427,
  (*6*)\[Minus]0.6507,(*7*)\[Minus]1.250,
 (*8*)\[Minus]0.613};


(* ::Section:: *)
(*rencon2.13*)


(* ::DisplayFormula:: *)
(*zero`nugegm,{2,4,8},{gegm,seva,io}*)


zero`gegm`value=Cancel[Chop[zero`nugegm,choplimit]]/.Q2->0;


rencon=Table[1,{seva,1,13,1},{io,1,8,1}];
(*+++++++++++++++++renormalized according to charge+++++++++++++*)
Table[
rencon[[All,io]]=Abs[octetcharge[[io]]-Re[(Cancel[Chop[zero`gegm`value[[1,1,io]],choplimit]]/.Q2->0)]]
,{io,{1,3,4,6}}];
rencon[[All,2]]=rencon[[All,3]];
rencon[[All,5]]=rencon[[All,4]];
rencon[[All,7]]=rencon[[All,6]];
rencon[[All,8]]=Abs[1-Re[(Cancel[Chop[zero`gegm`value[[1,2,8]],choplimit]]/.Q2->0)]];
(*++++++++++++++++++++no renormalized+++++++++++++++++++++*)
(*rencon\[LeftDoubleBracket]2,1\[RightDoubleBracket]=1;
rencon\[LeftDoubleBracket]2,6\[RightDoubleBracket]=1;
rencon\[LeftDoubleBracket]3,3\[RightDoubleBracket]=1;
rencon\[LeftDoubleBracket]3,7\[RightDoubleBracket]=1;
rencon\[LeftDoubleBracket]4,4\[RightDoubleBracket]=1;
rencon\[LeftDoubleBracket]4,5\[RightDoubleBracket]=1;*)


(* ::DisplayFormula:: *)
(*TableForm[rencon,TableHeadings->{Automatic,None}]*)


(*++++++++++++++++++++display+++++++++++++++++++++*)
echo["calculated renormalization constants"];
StringRiffle[rencon]


(* ::Chapter:: *)
(*graphics automatic & optimize*)


(* ::Section:: *)
(*experimental value*)


(* ::DisplayFormula:: *)
(*electric magneton:*)


(* ::DisplayFormula:: *)
(*\[Mu]B=(e \[HBar])/(2me),9.274009994(57)*10^-24 SI*)


(* ::DisplayFormula:: *)
(*\[Mu]N=(e \[HBar])/(2mN),*)


(* ::DisplayFormula:: *)
(*ne \[Minus]1.9130427\[PlusMinus]0.0000005 \[Mu]N*)


(* ::DisplayFormula:: *)
(*pr 2.7928473446\[PlusMinus]0.0000000008 \[Mu]N*)


(* ::DisplayFormula:: *)
(*\[CapitalLambda] \[Mu]=\[Minus]0.613\[PlusMinus]0.004 \[Mu]N*)


(* ::DisplayFormula:: *)
(*\[CapitalSigma]p \[Mu]=2.458\[PlusMinus]0.010 \[Mu]N*)


(* ::DisplayFormula:: *)
(*\[CapitalSigma]0 \[Mu]\[CapitalSigma]\[CapitalLambda]=1.61\[PlusMinus]0.08 \[Mu]N*)


(* ::DisplayFormula:: *)
(*\[CapitalSigma]m \[Mu]=\[Minus]1.160\[PlusMinus]0.025 \[Mu]N*)


(* ::DisplayFormula:: *)
(*\[CapitalXi]0 \[Mu]=\[Minus]1.250\[PlusMinus]0.014 \[Mu]N*)


(* ::DisplayFormula:: *)
(*\[CapitalXi]m \[Mu]=\[Minus]0.6507\[PlusMinus]0.0025 \[Mu]N*)


(* ::Section:: *)
(*name*)


octetname=
{"1\[CapitalSigma]m","2\[CapitalSigma]0","3\[CapitalSigma]p","4pr","5ne" ,"6\[CapitalXi]m","7\[CapitalXi]0","8\[CapitalLambda]"};


octetnameabbr=
{"\[CapitalSigma]m","\[CapitalSigma]0","\[CapitalSigma]p","pr","ne","\[CapitalXi]m","\[CapitalXi]0","\[CapitalLambda]"};


(* ::DisplayFormula:: *)
(*diagname={"1a","2b","3c","4de","5fg","6h","7i","8j","9kl","10mn","11op"};*)


(* ::DisplayFormula:: *)
(*fig`geconstiname={"1 ge.all","2 ge.u","3 ge.d","4 ge.s",*)
(*"5 ge.u-quench","6 ge.d-quench","7 ge.s-quench",*)
(*"8 ge.u-valence","9 ge.d-valence","10 ge.s-valence",*)
(*"11 ge.u-sea","12 ge.d-sea","13 ge.s-sea"*)
(*};*)
(*fig`gmconstiname={"1 gm.all","2 gm.u","3 gm.d","4 gm.s",*)
(*"5 gm.u-quench","6 gm.d-quench","7 gm.s-quench",*)
(*"8 gm.u-valence","9 gm.d-valence","10 gm.s-valence",*)
(*"11 gm.u-sea","12 gm.d-sea","13 gm.s-sea"*)
(*};*)


(* ::DisplayFormula:: *)
(*expfit`gegm=Table[0,{seva,1,13,1},{io,1,8,1},{gegm,1,2,1}];*)
(*expfit`gegm[[1,4,1]]=zero`value*(1+a1  Q2/(4mp^2))/(1+b1  Q2/(4mp^2)+b2 ( Q2/(4mp^2))^2+b3 ( Q2/(4mp^2))^3)/.{a1->-0.24,b1->10.98,b2->12.82,b3->21.97,zero`value->1,mp->0.9383};*)
(**)
(*expfit`gegm[[1,4,2]]=zero`value*(1+a1  Q2/(4mp^2))/(1+b1  Q2/(4mp^2)+b2 ( Q2/(4mp^2))^2+b3 ( Q2/(4mp^2))^3)/.{a1->0.12,b1->10.97,b2->18.86,b3->6.55,zero`value->2.79,mp->0.9383};*)
(*expfit`gegm[[1,5,2]]=zero`value*(1+a1  Q2/(4mp^2))/(1+b1  Q2/(4mp^2)+b2 ( Q2/(4mp^2))^2+b3 ( Q2/(4mp^2))^3)/.{a1->2.33,b1->14.72,b2->24.2,b3->84.1,zero`value->-1.93,mp->0.9396};*)
(*expfit`gegm[[1,5,1]]=(fit`A  Q2/(4mp^2))/(1+fit`B  Q2/(4mp^2)) \[CapitalLambda]2^2/(Q2+\[CapitalLambda]2)^2/.{fit`A->1.70,fit`B->3.30,\[CapitalLambda]2->0.71,mp->0.9396};*)
(**)


(* ::Section:: *)
(*\:91cd\:65b0\:7ec4\:5408\:6570\:636e*)


fig`cutlimit=0.00036`16;
fig`leadersize=4;


(* ::DisplayFormula:: *)
(*trgegm,{2,4,8},{gegm,seva,io}*)


(* ::DisplayFormula:: *)
(*nugegm,{2,1,8},{gegm,seva,io}*)


(* ::DisplayFormula:: *)
(*zero`nugegm,{2,4,8},{gegm,seva,io}*)


(* ::DisplayFormula:: *)
(*zero`gegm`value=zero`nugegm/.Q2->0;*)


tree`gegm`rencon2=Transpose[(*\:8ba1\:7b97 total \:8d21\:732e\:65f6\:ff0c\:7528\:8fd9\:4e2a\:66f4\:65b9\:4fbf*)
Transpose[trgegm,{2,3,1}]*rencon[[1]]
,{3,1,2}
];


tree`gegm`rencon3=Transpose[(*\:8ba1\:7b97 loop \:8d21\:732e\:65f6\:ff0c\:7528\:8fd9\:4e2a\:66f4\:65b9\:4fbf*)
Transpose[trgegm,{2,3,1}]*(rencon[[1]]-1)
,{3,1,2}
];


loop`gegm=Table[(*\:6574\:7406\:6570\:636e\:ff0c\:5bf9\:96f6\:70b9\:9644\:8fd1\:4f5c\:7a33\:5b9a*)
Piecewise[
{
{zero`gegm`value[[gegm,seva,io]],Q2<=fig`cutlimit},
{Re[Chop[nugegm[[gegm,seva,io]],choplimit]],Q2>fig`cutlimit}
}
]
,{gegm,1,2,1}
,{seva,1,13,1}
,{io,1,8,1}
];


(* ::DisplayFormula:: *)
(*loop`gegm//Dimensions*)
(*{2,13,8}*)


(* ::DisplayFormula:: *)
(*total = tree +(Z-1)*tree+loop*)


total`gegm=Table[
Piecewise[
{
{(tree`gegm`rencon2[[gegm,seva,io]]/.Q2->0)+zero`gegm`value[[gegm,seva,io]],Q2<=fig`cutlimit},
{(tree`gegm`rencon2[[gegm,seva,io]])+Re[Chop[nugegm[[gegm,seva,io]],choplimit]],Q2>fig`cutlimit}
}
]
,{gegm,1,2,1}
,{seva,1,4,1}
,{io,1,8,1}
];


(* ::DisplayFormula:: *)
(*total`gegm//Dimensions*)
(*{2,4,8}*)


(* ::Text:: *)
(*\:8ba1\:7b97 loop \:8d21\:732e\:65f6\:ff0c\:7528\:8fd9\:4e2a\:66f4\:65b9\:4fbf*)


loop`rencon3`gegm=Table[
Piecewise[
{
{(tree`gegm`rencon3[[gegm,seva,io]]/.Q2->0)+zero`gegm`value[[gegm,seva,io]],Q2<=fig`cutlimit},
{(tree`gegm`rencon3[[gegm,seva,io]])+Re[Chop[nugegm[[gegm,seva,io]],choplimit]],Q2>fig`cutlimit}
}
]
,{gegm,1,2,1}
,{seva,1,4,1}
,{io,1,8,1}
];


(* ::DisplayFormula:: *)
(*loop`re3`gegm//Dimensions*)
(*{2,4,8}*)


(* ::DisplayFormula:: *)
(*total = tree +(Z-1)*tree+loop*)


rearrange`seva`gegm=Transpose[
{
trgegm[[All,1,All]],(* 1;tree uds total*)
trgegm[[All,2,All]],(*2;u*)
trgegm[[All,3,All]],(*3;d*)
trgegm[[All,4,All]],(*4;s*)

loop`gegm[[All,1,All]],(*5; loop uds total*)
loop`gegm[[All,2,All]],(*6;u*)
loop`gegm[[All,3,All]],(*7;d*)
loop`gegm[[All,4,All]],(*8;s*)

loop`rencon3`gegm[[All,1,All]],(*9;rencon3,(Z-1)*tree+loop, uds*)
loop`rencon3`gegm[[All,2,All]],(*10;u*)
loop`rencon3`gegm[[All,3,All]],(*11;d*)
loop`rencon3`gegm[[All,4,All]],(*12;s*)

total`gegm[[All,1,All]],(*13; tree+loop rencon2 uds total *)
total`gegm[[All,2,All]],(*14;u*)
total`gegm[[All,3,All]],(*15;d*)
total`gegm[[All,4,All]],(*16;s*)

loop`gegm[[All,5,All]],(*17 quench, u*)
loop`gegm[[All,6,All]],(*18 quench, d*)
loop`gegm[[All,7,All]],(*19 quench, s*)

loop`gegm[[All,8,All]],(*20 valence, u*)
loop`gegm[[All,9,All]],(*21 valence, d*)
loop`gegm[[All,10,All]],(*22 valence, s*)

tree`gegm`rencon2[[All,2,All]]+loop`gegm[[All,5,All]]+loop`gegm[[All,8,All]],(*23 valence-total, u*)
tree`gegm`rencon2[[All,3,All]]+loop`gegm[[All,6,All]]+loop`gegm[[All,9,All]],(*24 valence-total, d*)
tree`gegm`rencon2[[All,4,All]]+loop`gegm[[All,7,All]]+loop`gegm[[All,10,All]],(*25 valence-total, s*)

loop`gegm[[All,11,All]],(*26 sea u,*)
loop`gegm[[All,12,All]],(*27 sea d*)
loop`gegm[[All,13,All]](*28 sea s*)

}
,{2,1,3}
];


(* ::DisplayFormula:: *)
(*rearrange`seva`gegm//Dimensions*)
(*{2,28,8}*)


nmlz`gegm={(*\:5f52\:4e00\:5316\:56e0\:5b50*)
ConstantArray[1,8],(*ge \:7684\:5f52\:4e00\:5316\:56e0\:5b50\:90fd\:662f1*)
total`gegm[[2,1]]/.Q2->0(*gm \:7684\:5f52\:4e00\:5316\:56e0\:5b50\:662f\:96f6\:70b9\:503c*)
};


(* ::DisplayFormula:: *)
(*nmlz`gegm//Dimensions*)
(*{2,8}*)


(* ::Section:: *)
(*gegm*)


fig`calc`baryons`gegm=Table[0,{gegm,1,2,1},{seva,1,28,1},{io,1,8,1}];
gegm=1;(*seva=1;*)(*io=5;*)
(*+++++++++++++++++++++++++++*)
Module[{order=0},
(*+++++++++++++++++++++++++++*)
Table[
(*+++++++++++++++++++++++++++*)
order++;
If[IntegerQ[order/16],Print[
"gegm=",gegm,
",seva=",seva,
",io=",io
]
];
(*+++++++++++++++++++++++++++*)
fig`calc`baryons`gegm[[gegm,seva,io]]=Plot[
Evaluate[rearrange`seva`gegm[[gegm,seva,io]]/nmlz`gegm[[gegm,io]]](*\:8fd9\:91cc\:9664\:4ee5\:5f52\:4e00\:5316\:56e0\:5b50\:ff0c\:4f7f\:7528 Evaluate \:5148\:8ba1\:7b97\:8868\:8fbe\:5f0f*)
,{Q2,0,1},
AxesOrigin->{0,0},
PlotRange->{{0,1},Automatic},
PlotRangePadding->{Automatic,Scaled[0.09]},
ImageSize->Scaled[0.5],
AspectRatio->1/GoldenRatio,
Frame->True
]

,{gegm,1,2,1}
,{seva,1,28,1}
,{io,1,8,1}
]
(*+++++++++++++++++++++++++++*)
];


(* ::Chapter:: *)
(*storage*)


echo["output directory"];
output`dir=FileNameJoin[{git`local`name,"/expression-mfiles/"}]


echo["files to export"];(*\:8981\:5bfc\:51fa\:7684\:6587\:4ef6,\:5173\:8054\:7684\:5f62\:5f0f\:ff0c\:4fdd\:5b58\:7528\:7684\:6587\:4ef6\:540d\[Rule]\:5bf9\:5e94\:7684\:6587\:4ef6*)
output`assoc=<|
(*++++++++++++++++*)
FileNameJoin[{output`dir,"fig_calc_baryons_gegm_"<>"L-"<>parameter`lambda0`string<>"_ci-"<>parameter`ci`string<>".m"}]->fig`calc`baryons`gegm
(*++++++++++++++++*)
|>;


echo["output status"];
KeyValueMap[Export,output`assoc]
