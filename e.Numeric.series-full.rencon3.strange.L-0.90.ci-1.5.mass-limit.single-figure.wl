(* ::Package:: *)

(* ::Title:: *)
(*e.Numeric.series-full.rencon2.strange.L-0.90.ci-1.5.mass-limit.single-figure.nb*)


NotebookFileName[]


(* ::Chapter:: *)
(*note*)


(* ::ItemNumbered:: *)
(*\:5728\:8ba1\:7b97\:5f62\:72b6\:56e0\:5b50\:65f6\:52a0\:4e0a\:4e86chop\:ff0c\:5e0c\:671b\:53ef\:4ee5\:6539\:5584\:4f5c\:56fe*)


(* ::ItemNumbered:: *)
(*use full integral analytic expression to draw pictures.*)


(* ::ItemNumbered:: *)
(*s flavor in proton has no contribution, so  the rencon is zero.*)


(* ::ItemNumbered:: *)
(*for perspective quark, use perspective fucoeandmrrlnm*)


(* ::ItemNumbered:: *)
(* this nb is to numeric evaluating the \[CapitalGamma]\[Mu]s*)


(* ::ItemNumbered:: *)
(*and draw pictures.*)


(* ::ItemNumbered:: *)
(*if consider 1/(1+Q^2/\[CapitalLambda]^2)^2->c^2/(1+Q^2/\[CapitalLambda]^2)^2 ,c^2=((\[CapitalLambda]^2+m\[Pi]^2)/\[CapitalLambda]^2)^2,then c^2={1.05349 m\[Pi], 1.79549 mKi, 2.0984 m\[Eta]}*)


(* ::ItemNumbered:: *)
(*for different particles, use different rencon*)


(* ::Chapter:: *)
(*Initial*)


(* ::Text:: *)
(*inital by hand*)


<<X`


choplimit=10^-8;


(* ::Chapter:: *)
(*coefficients & mass constants*)


(* ::Text:: *)
(*a 4 component list, contain all, u,d,s*)


(* ::Subchapter:: *)
(*coe list and mass rule list initial*)


Once[fucoe=Table[0,{k,1,13,1},{i,1,11,1},{i,1,8,1}]];


Once[fumass=Table[0,{k,1,13,1},{i,1,11,1},{i,1,8,1}]];


(* ::Subchapter:: *)
(*coe list and mass rule get*)


SetDirectory[FileNameJoin[{NotebookDirectory[],"analytic-storage.strange.series-full"}]]


zero`directory=FileNameJoin[{NotebookDirectory[],"analytic-storage.strange.series-o0"}]


coe`directory=FileNameJoin[{NotebookDirectory[],"expression-coes"}]


fucoeandmrrlnm={
FileNameJoin[{coe`directory,"fu.coeandmassrrl.consti.all.m"}],
FileNameJoin[{coe`directory,"fu.coeandmassrrl.consti.u.m"}],
FileNameJoin[{coe`directory,"fu.coeandmassrrl.consti.d.m"}],
FileNameJoin[{coe`directory,"fu.coeandmassrrl.consti.s.m"}]
};


Once[chpt`qfb`quench`coemass`masslimit=Get[FileNameJoin[{coe`directory,"chpt_qfb_quench_coemass_masslimit.m"}]]];
Once[chpt`qfa`sea`coemass`masslimit=Get[FileNameJoin[{coe`directory,"chpt_qfa_sea_coemass_masslimit.m"}]]];
Once[chpt`qfa`valence`coemass`masslimit=Get[FileNameJoin[{coe`directory,"chpt_qfa_valence_coemass_masslimit.m"}]]];


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


(* ::Input:: *)
(*fucoeandmrrlraw//Dimensions*)
(*fucoeandmrrl//Dimensions*)


(* ::Subchapter:: *)
(*mass constant*)


(* ::Section:: *)
(*order*)


(* ::DisplayFormula:: *)
(*conmo={1\[CapitalSigma],2Neu,3\[CapitalXi],4\[CapitalLambda]}--{1\[CapitalSigma]m,2\[CapitalSigma]0,3\[CapitalSigma]p,4pr,5ne,6\[CapitalXi]m,7\[CapitalXi]0,8\[CapitalLambda]}*)


(* ::DisplayFormula:: *)
(*conmm={1\[Pi],2Ki,3\[Eta]},*)


(* ::DisplayFormula:: *)
(*conmd={1\[CapitalDelta],2\[CapitalSigma]s,3\[CapitalXi]s,4\[CapitalOmega]}*)


(* ::Section:: *)
(*assign value*)


Once[
{conm\[Pi],conmKi,conm\[Eta],conmEtas}={
0.1381,
0.4956,
0.5693,
0.9452
}
];


Once[
{conm\[CapitalSigma],conmN,conm\[CapitalXi],conm\[CapitalLambda],conm\[CapitalLambda]\[CapitalSigma],
conmUUU,conmDDD,conmSSS(* the symmetric terms *)
}={
1.193,0.939,1.315,1.116,1.155,
0.939,0.939,1.315
}
];


{conm\[CapitalDelta],conm\[CapitalSigma]s,conm\[CapitalXi]s,conm\[CapitalOmega]}={
1.232,
1.385,
1.530,
1.672
};


{conmN,conm\[Eta],conm\[CapitalXi]s}


(* ::Subchapter:: *)
(*fu Coefficients mass rules reduce*)


(* ::Section:: *)
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


(*fucoeandmrrlraw [consti,figure,octet][4*11*8]*)
fucoe=Table[
Simplify[
fucoepresign*Values[fucoeandmrrl[[i]]]
]
,{i,1,13,1}
];//AbsoluteTiming


(* ::Section:: *)
(*fu mass rules*)


fumass=Keys[fucoeandmrrl];


(* ::Input:: *)
(*fucoe//Dimensions*)
(*fumass//Dimensions*)


(* ::Subchapter:: *)
(*magnetic momentum tree level*)


(* ::Text:: *)
(* octetmagetonc1={(*1*)-(c1/3),(*2*)c1/3,(*3*)c1,(*4*)c1,(*5*)-((2 c1)/3),(*6*)-(c1/3),(*7*)-((2 c1)/3),(*8*)-(c1/3)};*)


(* ::DisplayFormula:: *)
(*octetmageton={(*1*) \[Minus]1.160,(*2*) 0.60,(*3*)2.458,*)
(*  (*4*)2.7928473446, (*5*)\[Minus]1.9130427,*)
(*  (*6*)\[Minus]0.6507,(*7*)\[Minus]1.250,*)
(* (*8*)\[Minus]0.613};*)


(* ::Subchapter:: *)
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


baselist2={
f->0.093,
zi->-1,
di->0.76,fi->0.50,
ci->1.5,\[CapitalLambda]0->0.9,
c1->1.288084560330264,c2->0.4203262639337118
};


(* ::Text:: *)
(*for neutron pull-apart, best octet fit \[CapitalLambda]0\[TildeTilde]1~0.1*)


baselist=Table[
Join[baselist1[[i]],baselist2]
,{i,1,8,1}
];


(* ::Section:: *)
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


(* ::Section::Closed:: *)
(*para test c1c2 sum - square*)


(* ::DisplayFormula:: *)
(*fch,ci->1,\[CapitalLambda]0->0.9,*)
(*c1->2.081,c2->0.788,c3->-1.693*)
(*{0.0434328,{c1->2.00193}}*)


(* ::DisplayFormula:: *)
(*ci->1,\[CapitalLambda]0->0.8,*)
(* {4.55972*10^-17,{c1->2.14188,c2->0.756261}}*)


(* ::DisplayFormula:: *)
(*ci->1,\[CapitalLambda]0->0.85,*)
(* {6.40949*10^-31,{c1->2.09749,c2->0.752286}}*)


(* ::DisplayFormula:: *)
(*ci->1,\[CapitalLambda]0->0.90,*)
(* {1.33761*10^-17,{c1->2.05739,c2->0.747545}}*)


(* ::DisplayFormula:: *)
(*ci->1,\[CapitalLambda]0->0.95*)
(* {3.9443*10^-31,{c1->2.02149,c2->0.741624}}*)


(* ::DisplayFormula:: *)
(*ci->1,\[CapitalLambda]0->1.0,*)
(* {1.32802*10^-16,{c1->1.98969,c2->0.734099}}*)


(* ::Chapter:: *)
(*\[CapitalGamma]\[Mu] get*)


(* ::Subchapter:: *)
(*pure diagram form-factor*)


(* ::Input:: *)
(*Clear[ff1,ff2]*)


Once[Monitor[
ff1=Table[
Get[
FileNameJoin[{Directory[],"f1."<>"analytic."<>ToString[i]<>".m"}]
]
,{i,1,11,1}];
ff2=Table[
Get[
FileNameJoin[{Directory[],"f2."<>"analytic."<>ToString[j]<>".m"}]
]
,{j,1,11,1}];
,{i,j}]//AbsoluteTiming]


Once[Monitor[
zero`ff1=Table[
Get[
FileNameJoin[{zero`directory,"f1."<>"analytic."<>ToString[i]<>".m"}]
]
,{i,1,11,1}];
zero`ff2=Table[
Get[
FileNameJoin[{zero`directory,"f2."<>"analytic."<>ToString[j]<>".m"}]
]
,{j,1,11,1}];
,{i,j}]//AbsoluteTiming]


(* ::Input:: *)
(*ff1//Dimensions*)
(*zero`ff2//Dimensions*)


(* ::Subchapter:: *)
(*form-factor f1, f2*)


(* ::Section:: *)
(*form-factor list*)


(* ::DisplayFormula:: *)
(*fucoe=11[diagram]*8[octet]*n(a coefficients lists of n elements)*)


(* ::DisplayFormula:: *)
(*fumass=11[diagram]*8[octet]*n(n ==above n,n mass rule lists)*)


(* ::DisplayFormula:: *)
(*diagff=11[diagram]*2[ff1,ff2]*many(contri terms)*)


(* ::Input:: *)
(*fucoe[[2,4]]*)


(* ::Input:: *)
(*Length[fucoe[[2,4]]]*)


(* ::Subchapter:: *)
(*contribution combine coefficients,f1, f2*)


SetOptions[Simplify,TimeConstraint->1];


(* ::DisplayFormula:: *)
(*fucoe=11[diagram]*8[octet]*n(coefficients)*)


(* ::DisplayFormula:: *)
(*fumass=11[diagram]*8[octet]*n(n =above n,mass rule lists)*)


(* ::DisplayFormula:: *)
(*diagff=11[diagram]*2[ff1,ff2]*many(contri terms)*)


Monitor[

separate`nuff1=Table[
Simplify[
(
(
fucoe[[seva,if,io,coe]]*ff1[[if]]
)/.baselist[[io]]
)/.fumass[[seva,if,io,coe]]
]
,{seva,1,13,1}
,{io,1,8,1}(*the outest level is the octet order*)
,{if,1,11,1}(*the if contris should be summed*)
,{coe,1,Length[fucoe[[seva,if,io]]],1}(*the coe contris should be summed*)
];


separate`nuff2=Table[
Simplify[
(
(
fucoe[[seva,if,io,coe]]*ff2[[if]]
)/.baselist[[io]]
)/.fumass[[seva,if,io,coe]]
]
,{seva,1,13,1}
,{io,1,8,1}(*the outest level is the octet order*)
,{if,1,11,1}(*the diag contris should be summed*)
,{coe,1,Length[fucoe[[seva,if,io]]],1}(*the coe contris should be summed*)
];

,{seva,io,if,coe}
]//AbsoluteTiming


nuff1=Chop[Total[separate`nuff1,{4}],choplimit];
nuff2=Chop[Total[separate`nuff2,{4}],choplimit];


(* ::Text:: *)
(********************************************************)


(* ::Text:: *)
(***************************************************)


(*nuff1,nuff2 is 4*8*)
nugegm=Transpose[(*8*4*2 transpose into 4*8*2*)
Table[
-1/(16\[Pi]^2) {
nuff1[[All,i,All]]-Q2/(4constmo[[i]]^2) nuff2[[All,i,All]],
nuff1[[All,i,All]]+nuff2[[All,i,All]]
}
,{i,1,8,1}]
,{2,4,1,3}
];//AbsoluteTiming


(* ::Input:: *)
(*separate`nuff1//Dimensions*)
(*separate`nuff2//Dimensions*)
(*nuff1//Dimensions*)
(*nuff2//Dimensions*)
(*nugegm//Dimensions*)


(* ::Section:: *)
(*zero`nuff1 zero`nuff2*)


Monitor[

separate`zero`nuff1=Table[
Simplify[
(
(
fucoe[[seva,diag,oct,coe]]*zero`ff1[[diag]]
)/.baselist[[oct]]
)/.fumass[[seva,diag,oct,coe]]
]
,{seva,1,13,1}
,{oct,1,8,1}(*the outest level is the octet order*)
,{diag,1,11,1}(*the diag contris should be summed*)
,{coe,1,Length[fucoe[[seva,diag,oct]]],1}(*the coe contris should be summed*)
];

separate`zero`nuff2=Table[
Simplify[
(
(
fucoe[[seva,diag,oct,coe]]*zero`ff2[[diag]]
)/.baselist[[oct]]/.baselist[[oct]]
)/.fumass[[seva,diag,oct,coe]]
]
,{seva,1,13,1}
,{oct,1,8,1}(*the outest level is the octet order*)
,{diag,1,11,1}(*the diag contris should be summed*)
,{coe,1,Length[fucoe[[seva,diag,oct]]],1}(*the coe contris should be summed*)
];

,{seva,oct,diag,coe}
]//AbsoluteTiming
(*nuff1,nuff2 is 4*8*)


(* ::Text:: *)
(********************************)


zero`ifsepa`nuff1=Total[separate`zero`nuff1,{4}];
zero`ifsepa`nuff2=Total[separate`zero`nuff2,{4}];


(* ::DisplayFormula:: *)
(*zero`ifsepa`nuff1,{13,8,11},{config,io,if}*)


zero`ifsepa`nugegm=Transpose[(*8*4*2 transpose into 4*8*2*)
Table[
-1/(16\[Pi]^2) {
zero`ifsepa`nuff1[[All,i,All]]-Q2/(4constmo[[i]]^2) zero`ifsepa`nuff2[[All,i,All]],
zero`ifsepa`nuff1[[All,i,All]]+zero`ifsepa`nuff2[[All,i,All]]
}
,{i,1,8,1}]
,{2,4,1,3}
];//AbsoluteTiming


(* ::Input:: *)
(*zero`ifsepa`nugegm//Dimensions*)


(* ::Text:: *)
(********************************)


zero`nuff1=Total[separate`zero`nuff1,{3,4}];
zero`nuff2=Total[separate`zero`nuff2,{3,4}];


(* ::Input:: *)
(*zero`nuff1//Dimensions*)


zero`nugegm=Transpose[(*8*4*2 transpose into 4*8*2*)
Table[
-1/(16\[Pi]^2) {
zero`nuff1[[;;,i]]-Q2/(4constmo[[i]]^2) zero`nuff2[[;;,i]],
zero`nuff1[[;;,i]]+zero`nuff2[[;;,i]]
}
,{i,1,8,1}]
,{2,3,1}
];//AbsoluteTiming


(* ::Input:: *)
(*zero`nuff1//Dimensions*)
(*zero`nuff2//Dimensions*)
(*zero`nugegm//Dimensions*)


(* ::Chapter:: *)
(*tree level contributions*)


(* ::Subchapter:: *)
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


(* ::Subchapter:: *)
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
,{2,3,1}];//AbsoluteTiming
(*trgegm is [consti,octet,treegegem][4*8*2]*)


(* ::Input:: *)
(*trgegm//Dimensions *)


(* ::Subchapter::Closed:: *)
(*plot*)


(* ::Input:: *)
(*Plot[*)
(*trgegm[[4,1]]*)
(*,{Q2,0.,2.},PlotRange->Full*)
(*]*)


(* ::Input:: *)
(*Plot[*)
(*trgegm[[4,2]]*)
(*,{Q2,0.,2.},PlotRange->Full*)
(*]*)


(* ::Input:: *)
(*Plot[*)
(*trgegm[[5,1]]*)
(*,{Q2,0.,2.},PlotRange->Full]*)


(* ::Input:: *)
(*Plot[*)
(*trgegm[[5,2]]*)
(*,{Q2,0.,2.},PlotRange->Full]*)


(* ::Chapter:: *)
(*loopd0*)


octetname=
{"1\[CapitalSigma]m","2\[CapitalSigma]0","3\[CapitalSigma]p","4pr","5ne" ,"6\[CapitalXi]m","7\[CapitalXi]0","8\[CapitalLambda]"};


(* ::Subchapter:: *)
(*loop derivative coefficient*)


(* ::DisplayFormula:: *)
(*to order 0*)


(* ::DisplayFormula:: *)
(*{loopged0,loopgmd0}*)


(* ::DisplayFormula:: *)
(*nugegm[[consti,oct,F1F2]]4*8*2*)


{loopged0,loopgmd0}=Transpose[(*[oct,loop,consti]8*6*4 transpose into [loop,consti,oct][6*4*8]*)
Table[
{
zero`nugegm[[;;,oct,1]],
(*++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++*)
zero`nugegm[[;;,oct,2]]
}
,{oct,1,8,1}
]
,{3,1,2}];//AbsoluteTiming
(*{loopged0,loopgmd0} \[LeftDoubleBracket]consti,oct\[RightDoubleBracket][4,8]*)


(* ::Input:: *)
(*loopged0//Dimensions*)
(*loopgmd0//Dimensions*)


(* ::Chapter:: *)
(*rencon calc*)


(* ::Subchapter:: *)
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


(* ::Subchapter:: *)
(*rencon2.13*)


rencon=Table[1,{seva,1,13,1},{io,1,8,1}];
(*+++++++++++++++++renormalized according to charge+++++++++++++*)
Table[
rencon[[;;,i]]=Abs[octetcharge[[i]]-Re[(Cancel[Chop[loopged0[[1,i]],choplimit]]/.Q2->0)]]
,{i,{1,3,4,6}}];
rencon[[;;,2]]=rencon[[;;,3]];
rencon[[;;,5]]=rencon[[;;,4]];
rencon[[;;,7]]=rencon[[;;,6]];
rencon[[;;,8]]=Abs[1-Re[(Cancel[Chop[loopged0[[2,8]],choplimit]]/.Q2->0)]];
(*++++++++++++++++++++no renormalized+++++++++++++++++++++*)
(*rencon\[LeftDoubleBracket]2,1\[RightDoubleBracket]=1;
rencon\[LeftDoubleBracket]2,6\[RightDoubleBracket]=1;
rencon\[LeftDoubleBracket]3,3\[RightDoubleBracket]=1;
rencon\[LeftDoubleBracket]3,7\[RightDoubleBracket]=1;
rencon\[LeftDoubleBracket]4,4\[RightDoubleBracket]=1;
rencon\[LeftDoubleBracket]4,5\[RightDoubleBracket]=1;*)
(*++++++++++++++++++++display+++++++++++++++++++++*)
TableForm[rencon,TableHeadings->{Automatic,None}]


(* ::Chapter:: *)
(*graphics automatic & optimize*)


(* ::Subchapter::Closed:: *)
(*exprimental value*)


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


(* ::Input:: *)
(*octetmageton={*)
(*\[Minus]1.160,(*1\[CapitalSigma]m*)*)
(*0.76,(*2\[CapitalSigma]0*)*)
(*2.458,(*3\[CapitalSigma]p*)*)
(*2.7928473446,(*4pr*)*)
(*\[Minus]1.9130427,(*1Ne*)*)
(*\[Minus]0.6507,(*6\[CapitalXi]m*)*)
(*\[Minus]1.250,(*7\[CapitalXi]0*)*)
(*\[Minus]0.613(*8\[CapitalLambda]*)*)
(*};*)


(* ::Input:: *)
(*octetcharge={*)
(*-1,(*1*)0,1,1,(*4*)0,-1,(*6*)0,(*7*)0(*8*)};*)


(* ::Subchapter:: *)
(*name*)


octetname=
{"1\[CapitalSigma]m","2\[CapitalSigma]0","3\[CapitalSigma]p","4pr","5ne" ,"6\[CapitalXi]m","7\[CapitalXi]0","8\[CapitalLambda]"};


octetnameabbr=
{"\[CapitalSigma]m","\[CapitalSigma]0","\[CapitalSigma]p","pr","ne","\[CapitalXi]m","\[CapitalXi]0","\[CapitalLambda]"};


diagname={"1a","2b","3c","4de","5fg","6h","7i","8j","9kl","10mn","11op"};


fig`geconstiname={"1 ge.all","2 ge.u","3 ge.d","4 ge.s",
"5 ge.u-quench","6 ge.d-quench","7 ge.s-quench",
"8 ge.u-valence","9 ge.d-valence","10 ge.s-valence",
"11 ge.u-sea","12 ge.d-sea","13 ge.s-sea"
};
fig`gmconstiname={"1 gm.all","2 gm.u","3 gm.d","4 gm.s",
"5 gm.u-quench","6 gm.d-quench","7 gm.s-quench",
"8 gm.u-valence","9 gm.d-valence","10 gm.s-valence",
"11 gm.u-sea","12 gm.d-sea","13 gm.s-sea"
};


Once[
expfit`gegm=Table[0,{consti,1,13,1},{octet,1,8,1},{gegm,1,2,1}];
expfit`gegm[[1,4,1]]=zero`value*(1+a1  Q2/(4mp^2))/(1+b1  Q2/(4mp^2)+b2 ( Q2/(4mp^2))^2+b3 ( Q2/(4mp^2))^3)/.{a1->-0.24,b1->10.98,b2->12.82,b3->21.97,zero`value->1,mp->0.9383};

expfit`gegm[[1,4,2]]=zero`value*(1+a1  Q2/(4mp^2))/(1+b1  Q2/(4mp^2)+b2 ( Q2/(4mp^2))^2+b3 ( Q2/(4mp^2))^3)/.{a1->0.12,b1->10.97,b2->18.86,b3->6.55,zero`value->2.79,mp->0.9383};
expfit`gegm[[1,5,2]]=zero`value*(1+a1  Q2/(4mp^2))/(1+b1  Q2/(4mp^2)+b2 ( Q2/(4mp^2))^2+b3 ( Q2/(4mp^2))^3)/.{a1->2.33,b1->14.72,b2->24.2,b3->84.1,zero`value->-1.93,mp->0.9396};
expfit`gegm[[1,5,1]]=(fit`A  Q2/(4mp^2))/(1+fit`B  Q2/(4mp^2)) \[CapitalLambda]2^2/(Q2+\[CapitalLambda]2)^2/.{fit`A->1.70,fit`B->3.30,\[CapitalLambda]2->0.71,mp->0.9396};
]



(* ::Subchapter:: *)
(*fun`graph`octet*)


fig`cutlimit=0.00001;
fig`leadersize=4;


(* ::Input:: *)
(*SetOptions[EvaluationNotebook[],ShowCellLabel->False];*)


(* ::Subchapter:: *)
(*figure`ge*)


(* ::DisplayFormula:: *)
(*trgegm,[[seva,io,gegm]],{4,8,2}*)


(* ::DisplayFormula:: *)
(*nugegm,{seva,io,if,gegm},{1,8,11,2},*)
(*zero`ifsepa`nugegm,{13,8,11,2},{seva,io,if,gegm}*)


(* ::Section:: *)
(*ge`total*)


fig`separate`baryons`ge`total=Table[0,{io,1,8,1},{if,1,11,1}];
seva=1;gegm=1;
Monitor[
Table[
(fig`separate`baryons`ge`total[[io,if]]=(Plot[
#1,
{Q2,0,1},
AxesOrigin->{0,0},
PlotRange->{{0,1},All},
PlotRangePadding->{Automatic,Scaled[0.09]},
ImageSize->Scaled[0.5],
AspectRatio->1/GoldenRatio,
Frame->True
]&/@
(*=====================================================*)
{
rencon[[seva,io]]*trgegm[[seva,io,gegm]],(*"Tree"*)
(*+++++++++++++++++++++++++++++++++++++++++++++++++*)
Piecewise[
{
{zero`ifsepa`nugegm[[seva,io,if,gegm]],Q2<=fig`cutlimit},
{Re[nugegm[[seva,io,if,gegm]]],Q2>fig`cutlimit}
}
]
(*"Loop"*)
(*+++++++++++++++++++++++++++++++++++++++++++++++++*)
(*,Piecewise[
{
{rencon\[LeftDoubleBracket]seva,io\[RightDoubleBracket]*(trgegm\[LeftDoubleBracket]seva,io,gegm\[RightDoubleBracket]/.Q2\[Rule]0)+loopged0\[LeftDoubleBracket]seva,io\[RightDoubleBracket],Q2\[LessEqual]fig`cutlimit},
{rencon\[LeftDoubleBracket]seva,io\[RightDoubleBracket]*trgegm\[LeftDoubleBracket]seva,io,gegm\[RightDoubleBracket]+Re[nugegm\[LeftDoubleBracket]seva,io,if,gegm\[RightDoubleBracket]],Q2>fig`cutlimit}
}
]*)
(*"Total"*)
(*+++++++++++++++++++++++++++++++++++++++++++++++++*)
}
)
)
,{io,1,8,1}
,{if,1,11,1}
]
,{io,if}
];


(* ::Section::Closed:: *)
(*ge`u*)


(* ::DisplayFormula:: *)
(*1Total, 2u,3d,4s,quench:u, d, 7s,valence:u,d,10s,sea:u11,12d,13s*)


(* ::Input:: *)
(*consit=11;io=4;gegm=1;*)
(*Labeled[*)
(*fig`calc`nucleon`ge`u=Plot[*)
(*{*)
(*(*++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++*)*)
(*Piecewise[*)
(*{*)
(*{0,Q2<=fig`cutlimit},*)
(*{(*rencon\[LeftDoubleBracket]consit,io\[RightDoubleBracket]**)Re[nugegm[[consit,io,gegm]]],Q2>fig`cutlimit}*)
(*}*)
(*]*)
(*},*)
(*{Q2,0,2},*)
(*PlotStyle->{Directive[Dashed,AbsoluteThickness[0.7]]},*)
(*AxesOrigin->{0,0},*)
(*PlotRange->{{0,2},Automatic},*)
(*PlotRangePadding->{Automatic,Scaled[0.09]},*)
(*ImageSize->Scaled[0.5],*)
(*AspectRatio->1/GoldenRatio,*)
(*Frame->True*)
(*],*)
(*Style["Nucleon.Ge.u","Subsection"],{{Top,Left}}*)
(*]*)


(* ::Section::Closed:: *)
(*ge`d*)


(* ::DisplayFormula:: *)
(*Total, u,d,4s,quench:u, d, 7s,valence:u,d,10s,sea:u11,12d,13s*)


(* ::Input:: *)
(*consit=12;io=4;gegm=1;*)
(*Labeled[*)
(*fig`calc`nucleon`ge`d=Plot[*)
(*{*)
(*(*++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++*)*)
(*Piecewise[*)
(*{*)
(*{0,Q2<=fig`cutlimit},*)
(*{(*rencon\[LeftDoubleBracket]consit,io\[RightDoubleBracket]**)Re[nugegm[[consit,io,gegm]]],Q2>fig`cutlimit}*)
(*}*)
(*]*)
(*},*)
(*{Q2,0,2},*)
(*PlotStyle->{Directive[Dashed,AbsoluteThickness[0.7]]},*)
(*AxesOrigin->{0,0},*)
(*PlotRange->{{0,2},Automatic},*)
(*PlotRangePadding->{Automatic,Scaled[0.09]},*)
(*ImageSize->Scaled[0.5],*)
(*AspectRatio->1/GoldenRatio,*)
(*Frame->True*)
(*],*)
(*Style["Nucleon.Ge.d","Subsection"],{{Top,Left}}*)
(*]*)


(* ::Section:: *)
(*ge`s*)


(* ::DisplayFormula:: *)
(*Total, u,d,4s,quench:u, d, 7s,valence:u,d,10s,sea:u,d,13s*)


seva=13;gegm=1;
Monitor[
fig`separate`baryons`ge`s=Table[
((Plot[
#1,
{Q2,0,1},
AxesOrigin->{0,0},
PlotRange->{{0,1},All},
PlotRangePadding->{Automatic,Scaled[0.09]},
ImageSize->Medium,
AspectRatio->1/GoldenRatio,
Frame->True
]&/@
(*=====================================================*)
{
(*rencon[[seva,io]]*trgegm[[seva,io,gegm]],(*"Tree"*)*)
(*+++++++++++++++++++++++++++++++++++++++++++++++++*)
Piecewise[
{
{zero`ifsepa`nugegm[[seva,io,if,gegm]],Q2<=fig`cutlimit},
{Re[nugegm[[seva,io,if,gegm]]],Q2>fig`cutlimit}
}
]
(*"Loop"*)
(*+++++++++++++++++++++++++++++++++++++++++++++++++*)
(*,Piecewise[
{
{rencon\[LeftDoubleBracket]seva,io\[RightDoubleBracket]*(trgegm\[LeftDoubleBracket]seva,io,gegm\[RightDoubleBracket]/.Q2\[Rule]0)+loopged0\[LeftDoubleBracket]seva,io\[RightDoubleBracket],Q2\[LessEqual]fig`cutlimit},
{rencon\[LeftDoubleBracket]seva,io\[RightDoubleBracket]*trgegm\[LeftDoubleBracket]seva,io,gegm\[RightDoubleBracket]+Re[nugegm\[LeftDoubleBracket]seva,io,if,gegm\[RightDoubleBracket]],Q2>fig`cutlimit}
}
]*)
(*"Total"*)
(*+++++++++++++++++++++++++++++++++++++++++++++++++*)
}
)
)
,{io,1,8}
,{if,1,11,1}
]
,{io,if}
];


(* ::Subchapter:: *)
(*figure`gm*)


(* ::Section:: *)
(*gm`total*)


fig`separate`baryons`gm`total=Table[0,{io,1,8,1},{if,1,11,1}];
seva=1;gegm=2;
Monitor[
Table[
(fig`separate`baryons`gm`total[[io,if]]=(Plot[
#1,
{Q2,0,1},
AxesOrigin->{0,0},
PlotRange->{{0,1},All},
PlotRangePadding->{Automatic,Scaled[0.09]},
ImageSize->Scaled[0.5],
AspectRatio->1/GoldenRatio,
Frame->True
]&/@
(*=====================================================*)
{
rencon[[seva,io]]*trgegm[[seva,io,gegm]],(*"Tree"*)
(*+++++++++++++++++++++++++++++++++++++++++++++++++*)
Piecewise[
{
{zero`ifsepa`nugegm[[seva,io,if,gegm]],Q2<=fig`cutlimit},
{Re[nugegm[[seva,io,if,gegm]]],Q2>fig`cutlimit}
}
]
(*"Loop"*)
(*+++++++++++++++++++++++++++++++++++++++++++++++++*)
(*,Piecewise[
{
{rencon\[LeftDoubleBracket]seva,io\[RightDoubleBracket]*(trgegm\[LeftDoubleBracket]seva,io,gegm\[RightDoubleBracket]/.Q2\[Rule]0)+loopged0\[LeftDoubleBracket]seva,io\[RightDoubleBracket],Q2\[LessEqual]fig`cutlimit},
{rencon\[LeftDoubleBracket]seva,io\[RightDoubleBracket]*trgegm\[LeftDoubleBracket]seva,io,gegm\[RightDoubleBracket]+Re[nugegm\[LeftDoubleBracket]seva,io,if,gegm\[RightDoubleBracket]],Q2>fig`cutlimit}
}
]*)
(*"Total"*)
(*+++++++++++++++++++++++++++++++++++++++++++++++++*)
}
)
)
,{io,1,8,1}
,{if,1,11,1}
]
,{io,if}
];


(* ::Section::Closed:: *)
(*gm`u*)


(* ::DisplayFormula:: *)
(*Total, u,d,4s,quench:u, d, 7s,valence:u,d,10s,sea:u10,d,13s*)


(* ::Input:: *)
(*consit=11;io=4;gegm=2;*)
(*Labeled[*)
(*fig`calc`nucleon`gm`u=Plot[*)
(*{*)
(*(*++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++*)*)
(*Piecewise[*)
(*{*)
(*{(*rencon\[LeftDoubleBracket]consit,io\[RightDoubleBracket]**)loopgmd0[[consit,io]],Q2<=fig`cutlimit},*)
(*{(*rencon\[LeftDoubleBracket]consit,io\[RightDoubleBracket]**)Re[nugegm[[consit,io,gegm]]],Q2>fig`cutlimit}*)
(*}*)
(*]*)
(*},*)
(*{Q2,0,2},*)
(*PlotStyle->{Directive[Dashed,AbsoluteThickness[0.7]]},*)
(*AxesOrigin->{0,0},*)
(*PlotRange->{{0,2},Full},*)
(*PlotRangePadding->{Automatic,Scaled[0.09]},*)
(*ImageSize->Scaled[0.5],*)
(*AspectRatio->1/GoldenRatio,*)
(*Frame->True*)
(*],*)
(*Style["Nucleon.Gm.u","Subsection"],{{Top,Left}}*)
(*]*)


(* ::Section::Closed:: *)
(*gm`d*)


(* ::DisplayFormula:: *)
(*Total, u,d,4s,quench:u, d, 7s,valence:u,d,10s,sea:u11,12d,13s*)


(* ::Input:: *)
(*consit=12;io=4;gegm=2;*)
(*Labeled[*)
(*fig`calc`nucleon`gm`d=Plot[*)
(*{*)
(*(*++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++*)*)
(*Piecewise[*)
(*{*)
(*{(*rencon\[LeftDoubleBracket]consit,io\[RightDoubleBracket]**)loopgmd0[[consit,io]],Q2<=fig`cutlimit},*)
(*{(*rencon\[LeftDoubleBracket]consit,io\[RightDoubleBracket]**)Re[nugegm[[consit,io,gegm]]],Q2>fig`cutlimit}*)
(*}*)
(*]*)
(*},*)
(*{Q2,0,2},*)
(*AxesOrigin->{0,0},*)
(*PlotStyle->{Directive[Dashed,AbsoluteThickness[0.7]]},*)
(*PlotRange->{{0,2},Full},*)
(*PlotRangePadding->{Automatic,Scaled[0.09]},*)
(*ImageSize->Scaled[0.5],*)
(*AspectRatio->1/GoldenRatio,*)
(*Frame->True*)
(*],*)
(*Style["Nucleon.Gm.d","Subsection"],{{Top,Left}}*)
(*]*)


(* ::Section:: *)
(*gm`s*)


(* ::DisplayFormula:: *)
(*Total, u,d,4s,quench:u, d, 7s,valence:u,d,10s,sea:u,d,13s*)


(* ::Input:: *)
(*consit=13;io=4;gegm=2;*)
(*Labeled[*)
(*fig`calc`nucleon`gm`s=Plot[*)
(*{*)
(*(*++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++*)*)
(*Piecewise[*)
(*{*)
(*{(*rencon\[LeftDoubleBracket]consit,io\[RightDoubleBracket]**)loopgmd0[[consit,io]],Q2<=fig`cutlimit},*)
(*{(*rencon\[LeftDoubleBracket]consit,io\[RightDoubleBracket]**)Re[nugegm[[consit,io,gegm]]],Q2>fig`cutlimit}*)
(*}*)
(*]*)
(*},*)
(*{Q2,0,2},*)
(*PlotStyle->{Directive[Dashed,AbsoluteThickness[0.7]]},*)
(*AxesOrigin->{0,0},*)
(*PlotRange->{{0,2},Full},*)
(*PlotRangePadding->{Automatic,Scaled[0.09]},*)
(*ImageSize->Scaled[0.5],*)
(*AspectRatio->1/GoldenRatio,*)
(*Frame->True*)
(*],*)
(*Style["Nucleon.Gm.s","Subsection"],{{Top,Left}}*)
(*]*)


(* ::Subchapter:: *)
(*storage*)


directory`fig=FileNameJoin[{NotebookDirectory[],"expression-fig"}];


(* ::Input:: *)
(*FileNameJoin[{directory`fig,"fig.separate.baryons.ge.tot.L-0.90.ci-1.5.m"}]*)


(* ::Section:: *)
(*ge*)


Export[
FileNameJoin[{directory`fig,"fig.separate.baryons.ge.tot.L-0.90.ci-1.5.m"}]
,fig`separate`baryons`ge`total
];
(*Export[FileNameJoin[{directory`fig,
"fig.calc.nucleon.masslimit.ge.d.L-0.90.m"}],fig`calc`nucleon`ge`d];
Export[FileNameJoin[{directory`fig,
"fig.calc.nucleon.masslimit.ge.s.L-0.90.m"}],fig`calc`nucleon`ge`s];*)


(* ::Section:: *)
(*gm*)


Export[
FileNameJoin[{directory`fig,"fig.separate.baryons.gm.tot.L-0.90.ci-1.5.m"}]
,fig`separate`baryons`gm`total
];
(*Export[FileNameJoin[{directory`fig,
"fig.calc.nucleon.masslimit.gm.d.L-0.90.m"}],fig`calc`nucleon`gm`d];
Export[FileNameJoin[{directory`fig,
"fig.calc.nucleon.masslimit.gm.s.L-0.90.m"}],fig`calc`nucleon`gm`s];*)
