(* ::Package:: *)

(* ::Title:: *)
(*e.Numeric.series-o0.rencon3.strange.sea-valence.mass-limit.wl*)


(* ::Text:: *)
(*********************************** notebook \:5907\:5fd8\:5f55*)


(* ::Text:: *)
(*\:6570\:503c\:8ba1\:7b97\:6587\:4ef6  series-o0*)


(* ::Chapter:: *)
(*parameters*)


(* ::Text:: *)
(*++++++++++++++++++++++++++++++++++++++++++++*)


(* ::Text:: *)
(*\:6a21\:62df\:547d\:4ee4\:884c\:8f93\:5165\:ff0c\:8c03\:8bd5\:4f7f\:7528*)


input`simulation={"C:\\octet.formfactor\\Numeric.series-o0.rencon3
\\e.Numeric.series-o0.rencon3.strange.sea-valence.mass-limit.wl",
"o0",0.80,1.00}


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
(*Initial*)


(* ::Text:: *)
(*inital by hand*)


Get["X`"]


choplimit=10^-8;


Print["----------------------------","\n","the configuration of Simplify","\n","----------------------------"];


SetOptions[Simplify,TimeConstraint->1]


(* ::DisplayFormula:: *)
(*SetOptions[EvaluationNotebook[],ShowCellLabel->True];*)


(* ::Chapter:: *)
(*coefficients & mass constants*)


(* ::Section:: *)
(*coe list and mass rule get*)


Print["----------------------------","\n","start import analytic and coes ","\n","----------------------------"];


analytic`dir=FileNameJoin[{git`root`dir,"analytic-storage.strange.series-"<>parameter`order`string}]


coe`dir=FileNameJoin[{git`root`dir,"expression-coes"}]


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


Print["----------------------------","\n","start combine coes and presigns","\n","----------------------------"];


(*fucoeandmrrlraw [consti,figure,octet][4*11*8]*)
fucoe=Table[
Simplify[
fucoepresign*Values[fucoeandmrrl[[seva]]]
]
,{seva,1,13,1}
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
(*here is the ci test configuration*)
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
(*import integral analytic *)


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


Print["----------------------------","\n","start numeric, separate`nuff1 separate`nuff2 ","\n","----------------------------"];


Module[{order=0},

separate`nuff1=Table[

(*\:8ba1\:6570\:5668\:ff0c\:7528\:6765\:663e\:793a\:8ba1\:7b97\:8fdb\:5ea6\:ff0c\:4ee5400 \:4e2a\:9879\:76ee\:4e3a\:8ba1\:6570\:5355\:4f4d*)
order++;
If[IntegerQ[order/400],Print[seva,",",io,",",if,",",coe]
];

Simplify[
(
(
fucoe[[seva,if,io,coe]]*ff1[[if]]
)/.baselist[[io]]
)/.fumass[[seva,if,io,coe]]
]
,{seva,1,13,1}
,{io,1,8,1}(*the outest level is the octet order*)
,{if,1,11,1}(*the figures contris should be summed*)
,{coe,1,Length[fucoe[[seva,if,io]]],1}(*the coe contris should be summed*)
];
]//AbsoluteTiming


Module[{order=0},

separate`nuff2=Table[

order++;
If[IntegerQ[order/400],Print[seva,",",io,",",if,",",coe]
];

Simplify[
(
(
fucoe[[seva,if,io,coe]]*ff2[[if]]
)/.baselist[[io]]/.baselist[[io]]
)/.fumass[[seva,if,io,coe]]
]
,{seva,1,13,1}
,{io,1,8,1}(*the outest level is the octet order*)
,{if,1,11,1}(*the figures contris should be summed*)
,{coe,1,Length[fucoe[[seva,if,io]]],1}(*the coe contris should be summed*)
];
]//AbsoluteTiming


nuff1=Total[separate`nuff1,{3,4}];
nuff2=Total[separate`nuff2,{3,4}];


(* ::DisplayFormula:: *)
(*nuff1//Dimensions*)
(*nuff2//Dimensions*)


(*nuff1,nuff2 is 13*8*)
nugegm=Transpose[(*8*13*2 transpose into 13*8*2*)
Table[
-1/(16\[Pi]^2) {
nuff1[[;;,io]]-Q2/(4constmo[[io]]^2) nuff2[[;;,io]],
nuff1[[;;,io]]+nuff2[[;;,io]]
}
,{io,1,8,1}]
,{2,3,1}
];


(* ::DisplayFormula:: *)
(*nugegm//Dimensions*)


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
trf1f2[[;;,i,1]]-Q2/(4constmo[[i]]^2) trf1f2[[;;,i,2]],
trf1f2[[;;,i,1]]+trf1f2[[;;,i,2]]
}/.baselist[[i]]
]
,{i,1,8,1}]
,{2,3,1}];
(*trgegm is [consti,octet,treegegem][4*8*2]*)


(* ::DisplayFormula:: *)
(*trgegm//Dimensions *)


(* ::Chapter:: *)
(*rencon calc*)


(* ::Section:: *)
(*constants*)


(* ::DisplayFormula:: *)
(* octetmagetonc1={(*1*)-(c1/3),(*2*)c1/3,(*3*)c1,(*4*)c1,(*5*)-((2 c1)/3),(*6*)-(c1/3),(*7*)-((2 c1)/3),(*8*)-(c1/3)};*)


octetname={"1\[CapitalSigma]m","2\[CapitalSigma]0","3\[CapitalSigma]p","4pr","5ne" ,"6\[CapitalXi]m","7\[CapitalXi]0","8\[CapitalLambda]"};


octetcharge={
(*1*)-1,(*2*)0,(*3*)1,
(*4*)1,(*5*)0,
(*6*)-1,(*7*)0,
(*8*)0
};


(* ::DisplayFormula:: *)
(*octetmageton={*)
(*(*1*) \[Minus]1.160,(*2*) 0.60,(*3*)2.458,*)
(*  (*4*)2.7928473446, (*5*)\[Minus]1.9130427,*)
(*  (*6*)\[Minus]0.6507,(*7*)\[Minus]1.250,*)
(* (*8*)\[Minus]0.613*)
(* };*)


(* ::Section:: *)
(*rencon2.13*)


rencon=Table[1,{seva,1,13,1},{io,1,8,1}];
(*+++++++++++++++++renormalized according to charge+++++++++++++*)
Table[
rencon[[;;,io]]=Abs[octetcharge[[io]]-Re[(Cancel[Chop[nugegm[[1,io,1]],choplimit]]/.Q2->0)]]
,{io,{1,3,4,6}}];
rencon[[;;,2]]=rencon[[;;,3]];
rencon[[;;,5]]=rencon[[;;,4]];
rencon[[;;,7]]=rencon[[;;,6]];
rencon[[;;,8]]=Abs[1-Re[(Cancel[Chop[nugegm[[2,8,1]],choplimit]]/.Q2->0)]];
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
Print["----------------------------","\n","calculated renormalization constants","\n","----------------------------"];
StringRiffle[rencon]


(* ::Chapter:: *)
(*tabular ge & gm rearrange*)


(* ::Section:: *)
(*Q2  table initial*)


(* ::Input:: *)
(*(*trf1f2 is [consti,octet,treef1f2][4*8*2]*)*)
(*(*trgegm is [consti,octet,treegegem][4*8*2]*)*)


octet`gegm`expriment={
{
(*1*)-1,(*2*)0,(*3*)1,
(*4*)1,(*5*)0,
(*6*)-1,(*7*)0,
(*8*)0
},
{
(*1*)\[Minus]1.160,(*2*)0.60,(*3*)2.458,
(*4*)2.7928473446,(*5*)\[Minus]1.9130427,
(*6*)\[Minus]0.6507,(*7*)\[Minus]1.250,
(*8*)\[Minus]0.613
}
};


getree=Re[trgegm[[;;,;;,1]]/.Q2->0];


gmtree=Re[trgegm[[;;,;;,2]]/.Q2->0];


gegmtree=Re[trgegm/.Q2->0];


(* ::DisplayFormula:: *)
(*getree is [consti,octet,][4*8]*)


(* ::DisplayFormula:: *)
(*gmtree is [consti,octet,][4*8]*)


(* ::DisplayFormula:: *)
(*gegmtree is [consti,octet,treegegem][4*8*2]*)


geconstiname={"Ge.all","Ge.u","Ge.d","Ge.s"};
gmconstiname={"Gm.all","Gm.u","Gm.d","Gm.s"};


(* ::DisplayFormula:: *)
(*loopged0{13,8}{seva,io}*)


(* ::DisplayFormula:: *)
(*loopgmd0{13,8}{seva,io}*)


(* ::DisplayFormula:: *)
(*trgegm{4,8,2}{seva,io,gegm}*)


(* ::DisplayFormula:: *)
(*{seva}{*)
(*1;"all","u","d","s",*)
(*5;"u-quench","d-quench","s-quench",*)
(*8;"u-valence","d-valence","s-valence",*)
(*11;"u-sea","d-sea","s-sea"*)
(*}*)


tree`gegm=Transpose[
Re[trgegm/.Q2->0],
{2,3,1}
];


(* ::DisplayFormula:: *)
(*total = tree +(Z-1)*tree+loop*)


(* ::Text:: *)
(*\:8ba1\:7b97 total \:8d21\:732e\:65f6\:ff0c\:7528\:8fd9\:4e2a\:66f4\:65b9\:4fbf*)


tree`gegm`rencon2=Transpose[
(
Transpose[
tree`gegm
,{2,3,1}
]*rencon[[1]]
)
,{3,1,2}
];


(* ::Text:: *)
(*\:8ba1\:7b97 loop \:8d21\:732e\:65f6\:ff0c\:7528\:8fd9\:4e2a\:66f4\:65b9\:4fbf*)


tree`gegm`rencon3=Transpose[
(
Transpose[
tree`gegm
,{2,3,1}
]*(rencon[[1]]-1)
)
,{3,1,2}
];


loop`gegm=Transpose[
Chop[
Re[Cancel[Chop[nugegm,choplimit]]/.Q2->0]
,choplimit]
,{2,3,1}
];
(*gives loop zero term, choose loopged0 or loopgmd0*)


(* ::DisplayFormula:: *)
(*loop`gegm,{gegm,seva,io},{2,13,8}*)


(* ::DisplayFormula:: *)
(*total = tree +(Z-1)*tree+loop*)


rearrange`seva`gegm=Transpose[
{
tree`gegm[[All,1,All]],(* 1;tree flavor total *)
tree`gegm[[All,2,All]],(*2;u*)
tree`gegm[[All,3,All]],(*3;d*)
tree`gegm[[All,4,All]],(*4;s*)

tree`gegm`rencon3[[All,1,All]]+loop`gegm[[All,1,All]],(*5; loop flavor total *)
tree`gegm`rencon3[[All,2,All]]+loop`gegm[[All,2,All]],(*6;u*)
tree`gegm`rencon3[[All,3,All]]+loop`gegm[[All,3,All]],(*7;d*)
tree`gegm`rencon3[[All,4,All]]+loop`gegm[[All,4,All]],(*8;s*)

tree`gegm`rencon2[[All,1,All]]+loop`gegm[[All,1,All]],(*9; tree+loop flavor total *)
tree`gegm`rencon2[[All,2,All]]+loop`gegm[[All,2,All]],(*10;u*)
tree`gegm`rencon2[[All,3,All]]+loop`gegm[[All,3,All]],(*11;d*)
tree`gegm`rencon2[[All,4,All]]+loop`gegm[[All,4,All]],(*12;s*)

tree`gegm`rencon2[[All,2,All]]+loop`gegm[[All,5,All]]+loop`gegm[[All,8,All]],(*13 valence-total, u*)
tree`gegm`rencon2[[All,3,All]]+loop`gegm[[All,6,All]]+loop`gegm[[All,9,All]],(*14 valence-total, d*)
tree`gegm`rencon2[[All,4,All]]+loop`gegm[[All,7,All]]+loop`gegm[[All,10,All]],(*15 valence-total, s*)

loop`gegm[[All,11,All]],loop`gegm[[All,12,All]],loop`gegm[[All,13,All]](*16 sea u, sea d, sea s*)

}
,{2,1,3}
];


(* ::DisplayFormula:: *)
(*rearrange`seva`gegm,{2,18,8},{gegm,seva,io}*)


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


(* ::Text:: *)
(*\:5982\:679c\:78c1\:77e9\:7684\:5b9e\:9a8c\:503c\:662f0\:7684\:8bdd\:ff0c\:8bef\:5dee\:4e2d\:7684\:5206\:6bcd\:5c06\:4f1a\:88abparameter`ghost \:6240\:4ee3\:66ff\:ff0c*)


(* ::Text:: *)
(*\:4ee5\:514d\:4ea7\:751f\:4e0d\:826f\:8868\:8fbe\:5f0f\:ff0c\:5e76\:80fd\:591f\:4e0e\:6b63\:5e38\:7684\:8868\:8fbe\:5f0f\:7edf\:4e00*)


parameter`ghost=Sqrt[2];


names`legend={"Ge.loop.quench-sea-valence","Gm.loop.quench-sea-valence"};


te`none="None";


fun`lat[a_:"",b_:""]:=If[b=="",
ToString[a],
StringJoin[{ToString[a],"(",ToString[b],")"}]
]


data`lat={
{
"-1","0","1",
"1","0",
"-1","0",
"0"
},
{
fun`lat["-0.88","8"],te`none,fun`lat["2.27","16"],
fun`lat["2.4","2"],fun`lat["-1.59","17"],
fun`lat["-0.71","3"],fun`lat["-1.32","4"],
te`none
}
};


fun`exp[a_:"",b_:""]:=If[b=="",
ToString[a],
StringJoin[{ToString[a],"\[PlusMinus]",ToString[b]}]
]


data`exp={
{
"-1","0","1",
"1","0",
"-1","0",
"0"
},
{
fun`exp["-1.160","0.025"],te`none,fun`exp["2.458","0.010"],
fun`exp["2.793"],fun`exp["-1.913"],
fun`exp["-0.651","0.080"],fun`exp["-1.250","0.014"],
fun`exp["-0.613","0.004"]
}
};


data`paper={
{
"-1","0","1",
"1","0",
"-1","0",
"0"
},
{
fun`exp["-0.861","0.040"],fun`exp["0.838","0.091"],fun`exp["2.537","0.201"],
fun`exp["2.735","0.121"],fun`exp["-1.956","0.103"],
fun`exp["-0.840","0.087"],fun`exp["-1.690","0.142"],
fun`exp["-0.867","0.074"]
}
};


data`list[gegm_]:=Transpose[
{
rearrange`seva`gegm[[gegm,1]],(*tree*)

rearrange`seva`gegm[[gegm,5]],(*flavor valence total, include tree level*)

rearrange`seva`gegm[[gegm,9]],(*flavor valence total, include tree level*)

data`exp[[gegm]],

data`lat[[gegm]],

data`paper[[gegm]]
}
,{2,1}
];


(* ::Input:: *)
(*data`list[2]//Dimensions*)


names`vertical={"\[CapitalSigma]m","\[CapitalSigma]0","\[CapitalSigma]p","pr","ne","\[CapitalXi]m","\[CapitalXi]0","\[CapitalLambda]"};(*octet abbreviations*)


names`horizontal={
{
"Ge","tree","loop","total",
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
(*gegm=1;*)
(*tab`moment`ge`total=Style[*)
(*Multicolumn[*)
(*{(* paras of column need an {} *)*)
(*(*+++++++++++++++++++++++++sea-valence part  +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++*)*)
(*fun`Q2table`rearrange[(*legend name*)*)
(*names`horizontal[[gegm]],(*column name*)*)
(*names`vertical,(*row name*)*)
(*(*****************************data list start********************************)*)
(*data`list[gegm],*)
(*(********************************start background*******************************************)*)
(*data`background*)
(*]*)
(*(*+++++++++++++++++++++++++sea-valence part  +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++*)*)
(*}*)
(*,1*)
(*]*)
(*,FontSize->11*)
(*]*)


(* ::DisplayFormula:: *)
(*gegm=2;*)
(*tab`moment`gm`total=Style[*)
(*Multicolumn[*)
(*{(* paras of column need an {} *)*)
(*(*+++++++++++++++++++++++++sea-valence part  +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++*)*)
(*fun`Q2table`rearrange[(*legend name*)*)
(*names`horizontal[[gegm]],(*column name*)*)
(*names`vertical,(*row name*)*)
(*(*****************************data list start********************************)*)
(*data`list[gegm],*)
(*(********************************start background*******************************************)*)
(*data`background*)
(*]*)
(*(*+++++++++++++++++++++++++sea-valence part  +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++*)*)
(*}*)
(*,1*)
(*]*)
(*,FontSize->11*)
(*]*)


(* ::Chapter:: *)
(*export*)


Print["----------------------------","\n","output directory","\n","----------------------------"];


output`dir=FileNameJoin[{git`root`dir,"/expression-mfiles/"}]


Print["----------------------------","\n","output file name","\n","----------------------------"];


output`name=FileNameJoin[{output`dir,"data.baryons."<>
"series-"<>parameter`order`string
<>".L-"<>parameter`lambda0`string
<>".ci-"<>parameter`ci`string
<>".m"
}]


Print["----------------------------","\n","output status","\n","----------------------------"];


Export[
output`name,
{data`list[1],data`list[2]}
]
