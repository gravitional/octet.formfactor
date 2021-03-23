(* ::Package:: *)

(* ::Title:: *)
(*e.Numeric.series-o1.rencon3.strange.sea-valence.mass-limit.wl*)


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
(*parameters*)


(* ::Text:: *)
(*++++++++++++++++++++++++++++++++++++++++++++*)


(* ::Text:: *)
(*\:6a21\:62df\:547d\:4ee4\:884c\:8f93\:5165\:ff0c\:8c03\:8bd5\:4f7f\:7528*)


input`simulation={"/home/tom/octet.formfactor/Numeric.series-o1.rencon3/e.Numeric.series-o1.rencon3.strange.sea-valence.mass-limit.wl",
"o1",0.90,1.50};


(* ::Text:: *)
(*++++++++++++++++++++++++++++++++++++++++*)


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


Get["X`"]


choplimit=10^-8;


echo["the configuration of Simplify"];


SetOptions[Simplify,TimeConstraint->1]


(* ::DisplayFormula:: *)
(*SetOptions[EvaluationNotebook[],ShowCellLabel->True];*)


(* ::Chapter:: *)
(*coefficients & mass constants*)


(* ::Section:: *)
(*coe list and mass rule get*)


echo["start import analytic and coes "];


analytic`dir=FileNameJoin[{git`local`name,"analytic-storage.strange.series-"<>parameter`order`string}]


coe`dir=FileNameJoin[{git`local`name,"expression-coes"}]


fucoeandmrrlnm={
FileNameJoin[{coe`dir,"fu.coeandmassrrl.consti.all.m"}],
FileNameJoin[{coe`dir,"fu.coeandmassrrl.consti.u.m"}],
FileNameJoin[{coe`dir,"fu.coeandmassrrl.consti.d.m"}],
FileNameJoin[{coe`dir,"fu.coeandmassrrl.consti.s.m"}]
};


Once[chpt`qfb`quench`coemass`masslimit=Get[FileNameJoin[{coe`dir,"chpt`qfb`quench`coemass`masslimit.m"}]]];
Once[chpt`qfa`sea`coemass`masslimit=Get[FileNameJoin[{coe`dir,"chpt`qfa`sea`coemass`masslimit.m"}]]];
Once[chpt`qfa`valence`coemass`masslimit=Get[FileNameJoin[{coe`dir,"chpt`qfa`valence`coemass`masslimit.m"}]]];


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
0.1381,
0.4956,
0.5693,
0.9452
};


{conm\[CapitalSigma],conmN,conm\[CapitalXi],conm\[CapitalLambda],conm\[CapitalLambda]\[CapitalSigma],
conmUUU,conmDDD,conmSSS(* the symmetric terms *)
}={
1.193,0.939,1.315,1.116,1.155,
0.939,0.939,1.315
};


{conm\[CapitalDelta],conm\[CapitalSigma]s,conm\[CapitalXi]s,conm\[CapitalOmega]}={
1.232,
1.385,
1.530,
1.672
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
{1,1,1,
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
fucoepresign*Values[fucoeandmrrl[[i]]]
]
,{i,1,13,1}
];


(* ::Subsection:: *)
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
f->0.093,
zi->-1,
di->0.76,fi->0.50,
ci->parameter`ci,
\[CapitalLambda]0->parameter`lambda0
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


(* ::Chapter:: *)
(*combine coes and analytic*)


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


(* ::Section:: *)
(*form-factor f1, f2*)


(* ::Text:: *)
(****************************************)


(* ::DisplayFormula:: *)
(*fucoe=11[diagram]*8[octet]*n(a coefficients lists of n elements)*)


(* ::DisplayFormula:: *)
(*fumass=11[diagram]*8[octet]*n(n ==above n,n mass rule lists)*)


(* ::DisplayFormula:: *)
(*diagff=11[diagram]*2[ff1,ff2]*many(contri terms)*)


(* ::Section:: *)
(*combine coefficients and f1, f2*)


(* ::DisplayFormula:: *)
(*fucoe=11[diagram]*8[octet]*n(coefficients)*)


(* ::DisplayFormula:: *)
(*fumass=11[diagram]*8[octet]*n(n =above n,mass rule lists)*)


(* ::DisplayFormula:: *)
(*diagff=11[diagram]*2[ff1,ff2]*many(contri terms)*)


echo["start numeric, separate`nuff1 separate`nuff2 "];


(* ::Section:: *)
(*series preprocess*)


(* ::Text:: *)
(*\:8fd9\:91cc\:4e0d\:505a\:4efb\:4f55\:9884\:5904\:7406\:ff0c\:7ea7\:6570\:683c\:5f0f\:7684\:8868\:8fbe\:5f0f\:4f1a\:81ea\:52a8\:91cd\:65b0\:8c03\:6574\:ff0c\:4f7f\:5f97\:7ea7\:6570\:7684\:9636\:6570\:4e0d\:53d8*)


ff1`series=ff1;
ff2`series=ff2;


(* ::Section:: *)
(*combine fucoe and massrule*)


Module[{order=0},

separate`nuff1=Table[

(*\:8ba1\:6570\:5668\:ff0c\:7528\:6765\:663e\:793a\:8ba1\:7b97\:8fdb\:5ea6\:ff0c\:4ee5 200 \:4e2a\:9879\:76ee\:4e3a\:8ba1\:6570\:5355\:4f4d*)
order++;
If[IntegerQ[order/200],Print[seva,",",io,",",if,",",coe]
];

Simplify[
(
(
fucoe[[seva,if,io,coe]]*ff1`series[[if]]
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
If[IntegerQ[order/200],Print[seva,",",io,",",if,",",coe]
];

Simplify[
(
(
fucoe[[seva,if,io,coe]]*ff2`series[[if]]
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


(* ::DisplayFormula:: *)
(*separate`nuff1//Dimensions*)
(*separate`nuff2//Dimensions*)


nuff1=Total[separate`nuff1,{4}];
nuff2=Total[separate`nuff2,{4}];


(* nuff1,nuff2 is 4*8*11 *)
nugegm=Transpose[(* 8*2*4*11 transpose into 2*4*8*11 *)
Table[
-1/(16\[Pi]^2) {
nuff1[[All,io,All]]-Q2/(4constmo[[io]]^2) nuff2[[All,io,All]],
nuff1[[All,io,All]]+nuff2[[All,io,All]]
}
,{io,1,8,1}
]
,{3,1,2,4}
];


(* ::DisplayFormula:: *)
(*nugegm,{2,4,8,11},{gegm,seva,io,if}*)


(* ::Chapter:: *)
(*loopd0d1*)


octetname={"1\[CapitalSigma]m","2\[CapitalSigma]0","3\[CapitalSigma]p","4pr","5ne" ,"6\[CapitalXi]m","7\[CapitalXi]0","8\[CapitalLambda]"};


(* ::Section:: *)
(*loop derivative coefficient*)


(* ::DisplayFormula:: *)
(*nugegm,{2,4,8,11},{gegm,seva,io,if}*)


loop`if`gegm`value=Table[
Chop[
SeriesCoefficient[nugegm[[gegm,seva,io,if]],{Q2,0,series}]/.Q2->0,
choplimit
]
,{gegm,1,2,1}
,{series,0,1,1}(*series order 0 1 *)
,{seva,1,13,1}
,{io,1,8,1}(*the outest level is the octet order*)
,{if,1,11,1}(*the if contris should be summed*)
];


loop`gegm=Total[loop`if`gegm`value,{5}];


(* ::DisplayFormula:: *)
(*loop`gegm,{2,2,4,8},{gegm,series,seva,io}*)


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
(*tree gegm*)


(* ::DisplayFormula:: *)
(*-I el  (4 mN^2+c1 Q2)/(4 mN^2+Q2) ,-(-el /(2mN)) (4 (c1-1) mN^2)/(4 mN^2+Q2)*)


(* ::DisplayFormula:: *)
(*netrf1f2[[4]]={ (4 mN^2+c1 Q2)/(4 mN^2+Q2) \[CapitalLambda]^4/(\[CapitalLambda]^2+Q2)^2,(4 (c1-1) mN^2)/(4 mN^2+Q2) \[CapitalLambda]^4/(\[CapitalLambda]^2+Q2)^2}/.baselist*)


(* ::Input:: *)
(*(*trf1f2 is [consti,octet,treef1f2][4*8*2]*)*)


tree`gegm`Q2=Transpose[
Table[
Simplify[
{
trf1f2[[;;,i,1]]-Q2/(4constmo[[i]]^2) trf1f2[[;;,i,2]],
trf1f2[[;;,i,1]]+trf1f2[[;;,i,2]]
}/.baselist[[i]]
]
,{i,1,8,1}]
,{3,1,2}
];


(* ::DisplayFormula:: *)
(*tree`gegm`Q2//Dimensions *)


(* ::Subsection:: *)
(*tree`gegm`d0*)


tree`gegm`d0=Chop[tree`gegm`Q2/.Q2->0,choplimit];


(* ::DisplayFormula:: *)
(*tree`gegm`d0//Dimensions*)


(* ::Subsection:: *)
(*tree`gegm`d1*)


(tree`gegm`d1=D[Chop[tree`gegm`Q2,choplimit],{Q2,1}]/.Q2->0);


(* ::DisplayFormula:: *)
(*tree`gegm`d1//Dimensions *)


(* ::Section:: *)
(*tree`gegm*)


tree`gegm=Transpose[
{tree`gegm`d0,tree`gegm`d1}
,{2,1,3,4}
];


(* ::DisplayFormula:: *)
(*tree`gegm//Dimensions*)


(* ::DisplayFormula:: *)
(*tree`gegm,{2,2,4,8},{gegm,order,seva,io}*)


(* ::Chapter:: *)
(*rencon calc*)


(* ::Section:: *)
(*constants*)


(* ::DisplayFormula:: *)
(* octetmagetonc1={(*1*)-(c1/3),(*2*)c1/3,(*3*)c1,(*4*)c1,(*5*)-((2 c1)/3),(*6*)-(c1/3),(*7*)-((2 c1)/3),(*8*)-(c1/3)};*)


octetcharge={
(*1*)-1,(*2*)0,(*3*)1,
(*4*)1,(*5*)0,
(*6*)-1,(*7*)0,
(*8*)0
};


octetmageton={
(*1*) \[Minus]1.160,(*2*) 0.60,(*3*)2.458,
  (*4*)2.7928473446, (*5*)\[Minus]1.9130427,
  (*6*)\[Minus]0.6507,(*7*)\[Minus]1.250,
 (*8*)\[Minus]0.613
 };


(* ::Section:: *)
(*rencon2.13*)


(* ::DisplayFormula:: *)
(*loop`gegm*)
(*{gegm,order,seva,io}*)


rencon=Table[1,{seva,1,13,1},{io,1,8,1}];
(*+++++++++++++++++renormalized according to charge+++++++++++++*)
Table[
rencon[[;;,i]]=Abs[octetcharge[[i]]-Re[(Cancel[Chop[loop`gegm[[1,1,1,i]],choplimit]]/.Q2->0)]]
,{i,{1,3,4,6}}];
rencon[[;;,2]]=rencon[[;;,3]];
rencon[[;;,5]]=rencon[[;;,4]];
rencon[[;;,7]]=rencon[[;;,6]];
rencon[[;;,8]]=Abs[1-Re[(Cancel[Chop[loop`gegm[[1,1,2,8]],choplimit]]/.Q2->0)]];
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
(*radii tree and loop*)


(* ::Section:: *)
(*non-zero and zero formula*)


(* ::Text:: *)
(*********************************************)


(* ::DisplayFormula:: *)
(*for G[0]!= 0,*)


(* ::DisplayFormula:: *)
(*\[LeftAngleBracket]r^2\[RightAngleBracket]=-6/G[0]*(D[G[Q2],{Q2,1}]@0),G=Ge,or Gm*)


(* ::Text:: *)
(*********************************************)


(* ::DisplayFormula:: *)
(*for G[0]= 0,*)


(* ::DisplayFormula:: *)
(*\[LeftAngleBracket]r^2\[RightAngleBracket]=(-6)*(D[G[Q2],{Q2,1}]@0),G=Ge,or Gm*)


(* ::Section::Closed:: *)
(*zero terms*)


(* ::Subsection:: *)
(*ge*)


(* ::DisplayFormula:: *)
(*tree and loop-total:{1,2},{1,5},{1,7},{1,8},*)
(*tree and loop-u:{2,1},{2,6},*)
(*tree and loop-d:{3,3},{3,7},*)
(*tree and loop-s:{4,4},{4,5}*)


(* ::DisplayFormula:: *)
(*5u-quench :{*)
(* {{5,1}, ,{5,6}}*)
(*}*)


(* ::DisplayFormula:: *)
(*6d-quench :{*)
(* {{6,3}, ,{6,7}}*)
(*}*)


(* ::DisplayFormula:: *)
(*7s-quench :{*)
(* {{7,4}, ,{7,5}}*)
(*}*)


(* ::DisplayFormula:: *)
(*8u-valence :{*)
(* {{8,1}, ,{8,6}}*)
(*}*)


(* ::DisplayFormula:: *)
(*9d-valence :{*)
(* {{9,3}, ,{9,7}}*)
(*}*)


(* ::DisplayFormula:: *)
(*10s-valence :{*)
(* {{10,4}, ,{10,5}}*)
(*}*)


(* ::DisplayFormula:: *)
(*11u-sea :{11,1},{11,2},{11,3},{11,4},{11,5},{11,6},{11,7},{11,8}*)


(* ::DisplayFormula:: *)
(*12d-sea :{12,1},{12,2},{12,3},{12,4},{12,5},{12,6},{12,7},{12,8}*)


(* ::DisplayFormula:: *)
(*13s-sea :{13,1},{13,2},{13,3},{13,4},{13,5},{13,6},{13,7},{13,8}*)


(* ::Subsection:: *)
(*gm*)


(* ::DisplayFormula:: *)
(*tree-u:{2,1},{2,6},*)


(* ::DisplayFormula:: *)
(*tree-d:{3,3},{3,7},*)


(* ::DisplayFormula:: *)
(*tree-s:{4,4},{4,5}*)


(* ::DisplayFormula:: *)
(*5u-quench :{*)
(* {{5,1}, ,{5,6}}*)
(*}*)


(* ::DisplayFormula:: *)
(*6d-quench :{*)
(* {{6,3}, ,{6,7}}*)
(*}*)


(* ::DisplayFormula:: *)
(*7s-quench :{*)
(* {{7,4}, ,{7,5}}*)
(*}*)


(* ::DisplayFormula:: *)
(*8u-valence :{*)
(* {{8,1}, ,{8,6}}*)
(*}*)


(* ::DisplayFormula:: *)
(*9d-valence :{*)
(* {{9,3}, ,{9,7}}*)
(*}*)


(* ::DisplayFormula:: *)
(*10s-valence :{*)
(* {{10,4}, ,{10,5}}*)
(*}*)


(* ::Section:: *)
(*renormalization z*tree+loop*)


(* ::DisplayFormula:: *)
(*total = tree +(Z-1)*tree+loop*)


(* ::Text:: *)
(*\:8ba1\:7b97 total \:8d21\:732e\:65f6\:ff0c\:7528\:8fd9\:4e2a\:66f4\:65b9\:4fbf*)


tree`gegm`rencon2=Transpose[
(
Transpose[
tree`gegm
,{2,3,4,1}
]*rencon[[1]]
)
,{4,1,2,3}
];


(* ::Text:: *)
(*\:8ba1\:7b97 loop \:8d21\:732e\:65f6\:ff0c\:7528\:8fd9\:4e2a\:66f4\:65b9\:4fbf*)


tree`gegm`rencon3=Transpose[
(
Transpose[
tree`gegm
,{2,3,4,1}
]*(rencon[[1]]-1)
)
,{4,1,2,3}
];


(* ::DisplayFormula:: *)
(****************************************************)


(* ::Text:: *)
(*consider the rencon2, wave function renormalizations*)


(* ::DisplayFormula:: *)
(*tree`gegm`rencon2//Dimensions*)
(*tree`gegm`rencon3//Dimensions*)
(*loop`gegm//Dimensions*)


(* ::Text:: *)
(***********************************************)


rearrange`seva`gegm=Transpose[
{

tree`gegm[[All,All,1,All]],(* 1;tree uds total*)
tree`gegm[[All,All,2,All]],(*2;u*)
tree`gegm[[All,All,3,All]],(*3;d*)
tree`gegm[[All,All,4,All]],(*4;s*)

loop`gegm[[All,All,1,All]],(*5; loop uds total*)
loop`gegm[[All,All,2,All]],(*6;u*)
loop`gegm[[All,All,3,All]],(*7;d*)
loop`gegm[[All,All,4,All]],(*8;s*)

tree`gegm`rencon3[[All,All,1,All]]+loop`gegm[[All,All,1,All]],(*9;rencon3,(Z-1)*tree+loop, uds*)
tree`gegm`rencon3[[All,All,2,All]]+loop`gegm[[All,All,2,All]],(*10;u*)
tree`gegm`rencon3[[All,All,3,All]]+loop`gegm[[All,All,3,All]],(*11;d*)
tree`gegm`rencon3[[All,All,4,All]]+loop`gegm[[All,All,4,All]],(*12;s*)

tree`gegm`rencon2[[All,All,1,All]]+loop`gegm[[All,All,1,All]],(*13; tree+loop rencon2 uds total *)
tree`gegm`rencon2[[All,All,2,All]]+loop`gegm[[All,All,2,All]],(*14;u*)
tree`gegm`rencon2[[All,All,3,All]]+loop`gegm[[All,All,3,All]],(*15;d*)
tree`gegm`rencon2[[All,All,4,All]]+loop`gegm[[All,All,4,All]],(*16;s*)

loop`gegm[[All,All,5,All]],(*17 quench, u*)
loop`gegm[[All,All,6,All]],(*18 quench, d*)
loop`gegm[[All,All,7,All]],(*19 quench, s*)

loop`gegm[[All,All,8,All]],(*20 valence, u*)
loop`gegm[[All,All,9,All]],(*21 valence, d*)
loop`gegm[[All,All,10,All]],(*22 valence, s*)

tree`gegm`rencon2[[All,All,2,All]]+loop`gegm[[All,All,5,All]]+loop`gegm[[All,All,8,All]],(*23 valence-total, u*)
tree`gegm`rencon2[[All,All,3,All]]+loop`gegm[[All,All,6,All]]+loop`gegm[[All,All,9,All]],(*24 valence-total, d*)
tree`gegm`rencon2[[All,All,4,All]]+loop`gegm[[All,All,7,All]]+loop`gegm[[All,All,10,All]],(*25 valence-total, s*)

loop`gegm[[All,All,11,All]],(*26 sea u,*)
loop`gegm[[All,All,12,All]],(*27 sea d*)
loop`gegm[[All,All,13,All]](*28 sea s*)

}
,{3,1,2,4}
];


(* ::Text:: *)
(*rearrange`seva`gegm // Dimensions*)


(* ::Section:: *)
(*radius calculate*)


(* ::DisplayFormula:: *)
(*rearrange`seva`gegm{2,2,28,8}{gegm,order,seva2,io}*)


rearrange`radius2`gegm`seva=Table[Indeterminate,{gegm,1,2,1},{seva,1,28,1},{io,1,8,1}];


equallimit=0.0000001;


(* ::Text:: *)
(*\:81ea\:7136\:5355\:4f4d\:5236\:4e2d\:ff0c\:4eceMeV \:5230 fm \:7684\:8f6c\:6362*)


(* ::DisplayFormula:: *)
(*GeV^-2=0.0389376fm^-2*)


(* ::DisplayFormula:: *)
(*GeV^-2=0.197326fm^-2*)


unit`trans`gev2=0.038937550276;


unit`trans`gev=0.197326;


(* ::Text:: *)
(*\:4f5c\:4e3a\:534a\:5f84\:671f\:671b\:516c\:5f0f\:5206\:6bcd\:7684 seva \:9879\:76ee\:ff0c\:4e00\:822c\:662ftree+loop\:603b\:8d21\:732e*)


seva`total=13;


Table[
(*************************************start determine the value******************************)
rearrange`radius2`gegm`seva[[gegm,seva,io]]=unit`trans`gev2*If[

Abs[(rearrange`seva`gegm[[gegm,1,seva`total,io]]-0)]<=equallimit(*condition,derivative\[TildeTilde]0*)

,(-6)*rearrange`seva`gegm[[gegm,2,seva,io]](*true*)

,((-6)*rearrange`seva`gegm[[gegm,2,seva,io]])/rearrange`seva`gegm[[gegm,1,seva`total,io]](*false*)
]
(*************************************end determine the value******************************)

,{gegm,1,2,1}

(************************************* start the cycle range ******************************)
,{seva,1,28,1}
,{io,1,8,1}

(************************************* end the cycle range ******************************)

];


(* ::DisplayFormula:: *)
(*rearrange`seva`gegm//Dimensions*)
(*rearrange`radius2`gegm`seva//Dimensions*)


(* ::DisplayFormula:: *)
(*rearrange`seva`gegm,{2,2,28,8},{gegm,order,seva,io}*)


(* ::DisplayFormula:: *)
(*rearrange`radius2`gegm`seva,{2,28,8},{gegm,seva,io}*)


(* ::Section:: *)
(*show radius*)


(* ::DisplayFormula:: *)
(*tree`gegm,{2,2,4,8},{gegm,order,seva1,io}*)


(* ::DisplayFormula:: *)
(*loop`gegm,{2,2,13,8},{gegm,order,seva1,io}*)


(* ::DisplayFormula:: *)
(****************************************************)


(* ::DisplayFormula:: *)
(*rearrange`seva`gegm,{2,2,18,8},{gegm,order,seva2,io}*)
(*rearrange`radius2`gegm`seva,{2,18,8},{gegm,seva2,io}*)


(* ::DisplayFormula:: *)
(****************************************************)


(* ::DisplayFormula:: *)
(*{seva2}{*)
(*tree;1"all",2"u",3"d",4"s",*)
(*loop;5"all",6"u",7"d",8"s",*)
(*total;9"all",10"u",11"d",12"s",*)
(*13"u-valence-total",14"d-valence-total",15"s-valence-total",*)
(*16"u-sea",17"d-sea",18"s-sea"*)
(*}*)


(* ::Section:: *)
(*style 2*)


octetname`prefix[gegm_]:={{"re2","rm2"}[[gegm]],"\[CapitalSigma]m","\[CapitalSigma]0","\[CapitalSigma]p","pr","ne","\[CapitalXi]m","\[CapitalXi]0","\[CapitalLambda]"};


fun`exp[a_:"",b_:""]:=StringJoin[{ToString[a],"\[PlusMinus]",ToString[b]}]


te`none="None";


(* ::Text:: *)
(*paper, arXiv:1309.2063v3 \:7684\:7ed3\:679c*)


radius`gegm`paper={
{
fun`exp[0.781,0.108],"0",fun`exp[0.781,0.108],
fun`exp[0.767,0.113],fun`exp[-0.014,0.001],
fun`exp[0.767,0.113],fun`exp[0.014,0.008],
"0"
},
{
fun`exp[0.951,0.083],fun`exp[0.851,0.102],fun`exp[0.885,0.094],
fun`exp[0.909,0.084],fun`exp[0.922,0.079],
fun`exp["0.840",0.109],fun`exp[0.871,0.099],
fun`exp[0.852,0.103]
}
};


(* ::Text:: *)
(*\:7535\:8377\:534a\:5f84\:7684\:5b9e\:9a8c\:6570\:636e*)


radius`gegm`exp={
{
fun`exp[0.61,0.21],te`none,te`none,
fun`exp[0.76,0.09],fun`exp[-0.116,0.002],
te`none,te`none,
te`none
},
{
te`none,te`none,te`none,
fun`exp[0.74,"0.10"],fun`exp[0.76,0.02],
te`none,te`none,
te`none
}
};


fun`lat[a_:"",b_:""]:=StringJoin[{ToString[a],"(",ToString[b],")"}]


radius`gegm`lat={
{
fun`lat[0.657,58],te`none,fun`lat[0.749,72],
fun`lat[0.685,66],fun`lat[-0.158,33],
fun`lat[0.502,47],fun`lat[0.082,29],
fun`lat["0.010",9]
},
{
fun`lat[0.483,49],fun`lat[0.432,38],fun`lat[0.466,42],
fun`lat["0.470",48],fun`lat[0.478,"50"],
fun`lat[0.336,18],fun`lat[0.384,22],
fun`lat[0.347,24]
}
};


(*\:7528\:6765\:5728\:6b64\:6587\:4ef6\:4e2d\:753b\:56fe\:7684\:51fd\:6570*)
data`radius[gegm_,seva_,Q2_]:=Transpose[
Prepend[(*for prepend names horizontal*)
MapThread[Prepend,(*for prepend names vertical*)
{
(*start the data to display*)
Chop[
Join[
rearrange`radius2`gegm`seva[[gegm]],
{radius`gegm`exp[[gegm]]},
{radius`gegm`lat[[gegm]]},
{radius`gegm`paper[[gegm]]}
][[seva]]/.Q2->0,
choplimit],
(*end the data to display*)
(*start prepend names vertical*)
data`vtitle
(*end prepend names vertical*)
}
],
(*start prepend names horizontal*)
octetname`prefix[gegm]
(*end prepend names horizontal*)
]
];


(* ::Text:: *)
(*\:7528\:6765\:5b58\:50a8\:4ee5\:4f5c\:8fdb\:4e00\:6b65\:683c\:5f0f\:5316\:7684\:51fd\:6570*)


data`radius`storage[gegm_,seva_,Q2_]:=Transpose[
Chop[
Join[
rearrange`radius2`gegm`seva[[gegm]],
{radius`gegm`exp[[gegm]]},
{radius`gegm`lat[[gegm]]},
{radius`gegm`paper[[gegm]]}
][[seva]]/.Q2->0,
choplimit]
];


(* ::Text:: *)
(*\:672c\:6587\:4ef6\:4e2d\:7684\:8868\:683c \:683c\:5f0f\:5316\:51fd\:6570*)


table`radius=Function[{gegm,seva,Q2},
Style[
Grid[(*start grid*)
data`radius[gegm,seva,Q2],
Frame->{All,All},
Spacings->{2,2},
Background->{(************start color*************)
None,(* color x direction: x1, x2, x3...*)
{
1->LightCyan,3->LightBlue,5->LightBlue,7->LightBlue,9->LightBlue
}(* color y direction: y1, y2, y3...*)
}(************end color*************)
](*end grid*)

,FontSize->12
]
];


(* ::DisplayFormula:: *)
(*rearrange`seva`gegm,{2,2,18,8},{gegm,order,seva2,io}*)
(*rearrange`radius2`gegm`seva,{2,18,8},{gegm,seva2,io}*)


(* ::DisplayFormula:: *)
(****************************************************)


(* ::DisplayFormula:: *)
(*{seva2}{*)
(*tree;1"all",2"u",3"d",4"s",*)
(*loop;5"all",6"u",7"d",8"s",*)
(*total;9"all",10"u",11"d",12"s",*)
(*13"u-valence-total",14"d-valence-total",15"s-valence-total",*)
(*16"u-sea",17"d-sea",18"s-sea"*)
(*}*)


(* ::Text:: *)
(*\:9009\:62e9\:7ed8\:5236\:7684\:6570\:636e\:8303\:56f4\:ff0c\:7528Span[]\:6216\:8005\:5217\:8868\:6307\:5b9a*)


(* ::Text:: *)
(*gegm = 1; seva = 1;*)
(*table`radius[gegm, seva, Q2]*)


seva={1,5,9,19,20,21};
data`vtitle={
"tr uds","tr u","tr d","tr s",(*1,4*)
"lo,re2,uds","lo,re2,u","lo,re2,d","lo,re2,s",(*5,8*)
"lo,re3,uds","lo,re3,u","lo,re3,d","lo,re3,s",(*9,12*)
"lt uds","lt u","lt d","tot s",(*13,16*)
"qch u","qch d","qch s",(*17,19*)
"val u","val d","val s",(*20,22*)
"valtot u","valtot d","valtot s",(*23,25*)
"sea u","sea d","sea s",(*26,28*)
"exp.","Lattice","paper"(*29,31*)
}[[seva]];
{
tab`radius`ge=table`radius[1,seva,Q2](*total*)
(*,table`radius[2](*u total*),
table`radius[5](*u valence total*),
table`radius[8](*sea*)*)
}//TableForm;


seva={1,5,9,10,19,20,21};
data`vtitle={
"tr uds","tr u","tr d","tr s",(*1,4*)
"lo,re2,uds","lo,re2,u","lo,re2,d","lo,re2,s",(*5,8*)
"lo,re3,uds","lo,re3,u","lo,re3,d","lo,re3,s",(*9,12*)
"lt uds","lt u","lt d","tot s",(*13,16*)
"qch u","qch d","qch s",(*17,19*)
"val u","val d","val s",(*20,22*)
"valtot u","valtot d","valtot s",(*23,25*)
"sea u","sea d","sea s",(*26,28*)
"exp.","Lattice","paper"(*29,31*)
}[[seva]];
{
tab`radius`gm=table`radius[2,seva,Q2](*total*)
(*,table`radius[2](*u total*),
table`radius[5](*u valence total*),
table`radius[8](*sea*)*)
}//TableForm;


(* ::Chapter:: *)
(*export*)


echo["output directory"];
output`dir=FileNameJoin[{git`local`name,"/expression-mfiles/"}]


echo["files to export"];(*\:8981\:5bfc\:51fa\:7684\:6587\:4ef6,\:5173\:8054\:7684\:5f62\:5f0f\:ff0c\:4fdd\:5b58\:7528\:7684\:6587\:4ef6\:540d\[Rule]\:5bf9\:5e94\:7684\:6587\:4ef6*)
output`assoc=<|
(*++++++++++++++++*)
FileNameJoin[{output`dir,"data.baryons."<>"series-"<>parameter`order`string<>".L-"<>parameter`lambda0`string<>".ci-"<>parameter`ci`string<>".m"}]->{data`radius`storage[1,All,Q2],data`radius`storage[2,All,Q2]}
(*++++++++++++++++*)
|>;


echo["output status"];
KeyValueMap[Export,output`assoc]
