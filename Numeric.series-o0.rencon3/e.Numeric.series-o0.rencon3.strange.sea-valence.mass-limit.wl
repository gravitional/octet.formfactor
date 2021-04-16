(* ::Package:: *)

(* ::Title:: *)
(*e.Numeric.series-o0.rencon3.strange.sea-valence.mass-limit.wl*)


(* ::Chapter:: *)
(*initial*)


(*\:8ba1\:7b97\:73af\:5883\:53c2\:91cf\:ff0c\:6bd4\:5982\:8def\:5f84*)
gitRemoteName="octet.formfactor";(*\:7ed9\:51fa\:8fdc\:7a0bgit\:4ed3\:5e93\:7684\:540d\:5b57*)
cmdQ=Not[$Notebooks];(*\:811a\:672c\:7684\:8fd0\:884c\:6a21\:5f0f\:5224\:65ad\:ff0cTrue\:4ee3\:8868\:547d\:4ee4\:884c\:ff0cFalse\:4ee3\:8868\:524d\:7aef*)
fileName=If[Not[cmdQ],NotebookFileName[],$InputFileName](*\:7ed9\:51fa\:7b14\:8bb0\:672c\:7684\:7edd\:5bf9\:8def\:5f84*)
(*\:5b9a\:4e49\:4e00\:4e9b\:5e38\:7528\:7684\:51fd\:6570*)
enList[x__]:=Replace[{x},{{y__}}:>{y},{0}](*\:5b9a\:4e49\:4e00\:4e2a\:786e\:4fdd\:5217\:8868\:7684\:51fd\:6570*)
enString[x__]:=StringJoin[ToString[#1]&/@enList[x]](*\:5b9a\:4e49\:4e00\:4e2a\:786e\:4fdd\:5b57\:7b26\:4e32\:7684\:51fd\:6570*)
If[cmdQ,
echo[x__]:=Print["----------------------------","\n\033[1;44m\033[1;37m",enString[x],"\033[0;0m\n","----------------------------"],(*\:5b9a\:4e49\:7ec8\:7aef\:7684\:6253\:5370\:51fd\:6570*)
echo[x__]:=Print[x](*\:5b9a\:4e49\:7b14\:8bb0\:672c\:7684\:6253\:5370\:51fd\:6570*)
]
Once[If[Not[cmdQ],(*\:5982\:679c\:5728\:524d\:7aef\:6267\:884c\:ff0c\:5c31\:5237\:65b0\:7b14\:8bb0\:672c\:7684\:540d\:5b57*)
cellTitle=(Cells[]//First);(*\:5355\:5143\:5bf9\:8c61,\:7b2c\:4e00\:4e2a\:5355\:5143*)
NotebookWrite[cellTitle,Cell[FileNameSplit[fileName][[-1]],"Title"]](*\:5237\:65b0\:7b2c\:4e00\:4e2a\:5355\:5143\:7684\:540d\:5b57*)
]];
If[cmdQ,echo["Ready to execute this script"]](*\:5982\:679c\:5728\:547d\:4ee4\:884c\:6267\:884c\:ff0c\:5c31\:6253\:5370\:63d0\:793a\:4fe1\:606f*)
(*\:5b9a\:4e49\:672c\:5730git\:76ee\:5f55\:ff0c\:4e5f\:5c31\:662f\:7a0b\:5e8f\:7684\:6839\:76ee\:5f55*)
echo["the gitLocalName is"];
gitLocalName=FileNameJoin[Append[TakeWhile[FileNameSplit[ExpandFileName[fileName]],UnsameQ[#1,gitRemoteName]&],gitRemoteName]]


(* ::Text:: *)
(*notebook \:5907\:5fd8\:5f55:*)
(*\:6570\:503c\:8ba1\:7b97\:6587\:4ef6  series - o0*)


(* ::Chapter:: *)
(*parameters*)


(* ::Text:: *)
(*++++++++++++++++++++++++++++++++++++++++++++*)


(* ::Text:: *)
(*\:6a21\:62df\:547d\:4ee4\:884c\:8f93\:5165\:ff0c\:8c03\:8bd5\:4f7f\:7528*)


inputSim={
"/home/tom/octet.formfactor/Numeric.series-o0.rencon3/e.Numeric.series-o0.rencon3.strange.sea-valence.mass-limit.wl",
"o0","0.90","1.50","Baryons","notbar"};
If[cmdQ,
inputCml=$ScriptCommandLine,(*\:5982\:679c\:5728\:547d\:4ee4\:884c\:6267\:884c\:ff0c\:5c31\:91c7\:7528\:547d\:4ee4\:884c\:53c2\:6570*)
inputCml=inputSim(*\:5982\:679c\:5728\:7b14\:8bb0\:672c\:6267\:884c\:ff0c\:5c31\:91c7\:7528\:6a21\:62df\:53c2\:6570*)
];
{fileName,parOrder,parLambda0,parci,cFitting,errorbarQ}={
inputCml[[1]],inputCml[[2]],
ToExpression[inputCml[[3]]],ToExpression[inputCml[[4]]],
inputCml[[5]],inputCml[[6]]
};
(*\:5c55\:793a\:63a5\:53d7\:5230\:7684\:53c2\:6570*)
echo["the parameter:order,lambda,ci,fitting"];
parOrderStr=ToString[parOrder]
parLambda0Str=ToString[NumberForm[parLambda0,{3,2}]]
parciStr=ToString[NumberForm[parci,{3,2}]]
cFittingStr=enString[cFitting]
errorbarQStr=enString[errorbarQ]
(*\:68c0\:67e5\:8f93\:5165\:7684\:53c2\:6570\:662f\:5426\:5408\:6cd5*)
If[Not[StringMatchQ[cFittingStr,{"Sigma1","Sigma2","Nucleon","Cascade","Baryons"}]&&StringMatchQ[errorbarQStr,{"notbar" ,"L_"~~NumberString~~"_ci_"~~NumberString}]],
echo["Please check the input parameters"];Abort[]
]


c3 = c2 - c1;
(*\:8bfb\:53d6c1,c2\:7684\:53d6\:503c*)
echo["c1,c2 configuration"]
If[errorbarQStr==="notbar",
(*\:5982\:679c\:4e0d\:662f\:4e3a\:4e86\:8ba1\:7b97Error\:ff0c\:5c31\:4f7f\:7528\:5339\:914d\:7684c1c2\:8fdb\:884c\:8ba1\:7b97*)
Print[cFittingDir=FileNameJoin[{gitLocalName,"expression-mfiles","c1c2_magfit_L_"<>parLambda0Str<>"_ci_"<>parciStr<>".m"}]];
Print[configc1c2=Get[cFittingDir][cFitting]//Last];,
(*\:5982\:679c\:662f\:4e3a\:4e86\:8ba1\:7b97Error\:ff0c\:5c31\:4f7f\:7528\:6307\:5b9a \[CapitalLambda],ci \:5bf9\:5e94\:7684c1c2\:8fdb\:884c\:8ba1\:7b97*)
Print[cFittingDir=FileNameJoin[{gitLocalName,"expression-mfiles","c1c2_magfit_"<>errorbarQStr<>".m"}]];
Print[configc1c2=Get[cFittingDir][cFitting]//Last];
]


(*\:8f7d\:5165 package-X*)
Get["X`"]
chopLimit=10^-8;
echo["the configuration of Simplify"];
SetOptions[Simplify,TimeConstraint->1]
(*SetOptions[EvaluationNotebook[],ShowCellLabel->True];*)


(* ::Section:: *)
(*coe list and mass rule get*)


echo["start import analytic and coes "];
analyticDir=FileNameJoin[{gitLocalName,"analytic-storage.strange.series-"<>parOrderStr}]
coeDir=FileNameJoin[{gitLocalName,"expression-coes"}]


fucoeandmrrlnm={
FileNameJoin[{coeDir,"fu.coeandmassrrl.consti.all.m"}],
FileNameJoin[{coeDir,"fu.coeandmassrrl.consti.u.m"}],
FileNameJoin[{coeDir,"fu.coeandmassrrl.consti.d.m"}],
FileNameJoin[{coeDir,"fu.coeandmassrrl.consti.s.m"}]
};
Once[chpt`qfb`quench`coemass`masslimit=Get[FileNameJoin[{coeDir,"chpt`qfb`quench`coemass`masslimit.m"}]]];
Once[chpt`qfa`sea`coemass`masslimit=Get[FileNameJoin[{coeDir,"chpt`qfa`sea`coemass`masslimit.m"}]]];
Once[chpt`qfa`valence`coemass`masslimit=Get[FileNameJoin[{coeDir,"chpt`qfa`valence`coemass`masslimit.m"}]]];
Once[fucoeandmrrlraw=Map[Get,fucoeandmrrlnm,1]];
Once[
fucoeandmrrl=Join[fucoeandmrrlraw,
Transpose[chpt`qfb`quench`coemass`masslimit,{2,3,1}],
Transpose[chpt`qfa`valence`coemass`masslimit,{2,3,1}],
Transpose[chpt`qfa`sea`coemass`masslimit,{2,3,1}]
]
];
(*fucoeandmrrlraw//Dimensions
fucoeandmrrl//Dimensions*)


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


baselist2=Join[
{
f->0.093,
zi->-1,
di->0.76,fi->0.50,
ci->parci,
\[CapitalLambda]0->parLambda0
},
configc1c2
];
baselist=Table[
Join[baselist1[[io]],baselist2]
,{io,1,8,1}
];


(* ::Chapter:: *)
(*combine coes and analytic*)


(* ::Section:: *)
(*import integral analytic *)


ff1=Table[
Get[
FileNameJoin[{analyticDir,"f1."<>"analytic."<>ToString[if]<>".m"}]
]
,{if,1,11,1}];//AbsoluteTiming
ff2=Table[
Get[
FileNameJoin[{analyticDir,"f2."<>"analytic."<>ToString[if]<>".m"}]
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


echo["start numeric, separateNuff1 separate`nuff2 "];
Module[{order=0},

separateNuff1=Table[

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

separateNuff2=Table[

order++;
If[IntegerQ[order/400],Print[seva,",",io,",",if,",",coe](*\:7528\:6765\:663e\:793a\:8ba1\:7b97\:8fdb\:5ea6\:ff0c\:4ee5400 \:4e2a\:9879\:76ee\:4e3a\:8ba1\:6570\:5355\:4f4d*)
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


nuff1=Total[separateNuff1,{3,4}];
nuff2=Total[separateNuff2,{3,4}];
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


(* ::Text:: *)
(*\:603b\:8d21\:732e=Z*A+loop, Z=1-loop*)


rencon=Table[1,{seva,1,13,1},{io,1,8,1}];
(*+++++++++++++++++renormalized according to charge+++++++++++++*)
Table[
rencon[[;;,io]]=Abs[octetcharge[[io]]-Re[(Cancel[Chop[nugegm[[1,io,1]],chopLimit]]/.Q2->0)]]
,{io,{1,3,4,6}}];
rencon[[;;,2]]=rencon[[;;,3]];
rencon[[;;,5]]=rencon[[;;,4]];
rencon[[;;,7]]=rencon[[;;,6]];
rencon[[;;,8]]=Abs[1-Re[(Cancel[Chop[nugegm[[2,8,1]],chopLimit]]/.Q2->0)]];
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
(*tabular ge & gm rearrange*)


(* ::Section:: *)
(*Q2  table initial*)


(* ::Input:: *)
(*(*trf1f2 is [consti,octet,treef1f2][4*8*2]*)*)
(*(*trgegm is [consti,octet,treegegem][4*8*2]*)*)


octetGegmExpriment={
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


treeGegm=Transpose[
Re[trgegm/.Q2->0],
{2,3,1}
];


(* ::DisplayFormula:: *)
(*total = tree +(Z-1)*tree+loop*)


(* ::Text:: *)
(*\:8ba1\:7b97 total \:8d21\:732e\:65f6\:ff0c\:7528\:8fd9\:4e2a\:66f4\:65b9\:4fbf*)


treeGegmRencon2=Transpose[
(
Transpose[
treeGegm
,{2,3,1}
]*rencon[[1]]
)
,{3,1,2}
];


treeGegmRencon3=Transpose[(*\:8ba1\:7b97 loop \:8d21\:732e\:65f6\:ff0c\:7528\:8fd9\:4e2a\:66f4\:65b9\:4fbf*)
(
Transpose[
treeGegm
,{2,3,1}
]*(rencon[[1]]-1)
)
,{3,1,2}
];


loopGegm=Transpose[
Chop[
Re[Cancel[Chop[nugegm,chopLimit]]/.Q2->0]
,chopLimit]
,{2,3,1}
];
(*gives loop zero term, choose loopged0 or loopgmd0*)


(* ::DisplayFormula:: *)
(*loopGegm,{gegm,seva,io},{2,13,8}*)


(* ::DisplayFormula:: *)
(*total = tree +(Z-1)*tree+loop*)


rearrangeSevaGegm=Transpose[
{
treeGegm[[All,1,All]],(*1;tree,uds*)
treeGegm[[All,2,All]],(*2;tree,u*)
treeGegm[[All,3,All]],(*3;tree,d*)
treeGegm[[All,4,All]],(*4;tree,s*)

loopGegm[[All,1,All]],(*5;loop,uds*)
loopGegm[[All,2,All]],(*6;loop,u*)
loopGegm[[All,3,All]],(*7;loop,d*)
loopGegm[[All,4,All]],(*8;loop,s*)

treeGegmRencon2[[All,1,All]]+loopGegm[[All,1,All]],(*9;tree+loop,uds total *)
treeGegmRencon2[[All,2,All]]+loopGegm[[All,2,All]],(*10;tree+loop,u*)
treeGegmRencon2[[All,3,All]]+loopGegm[[All,3,All]],(*11;tree+loop,d*)
treeGegmRencon2[[All,4,All]]+loopGegm[[All,4,All]],(*12;tree+loop,s*)

loopGegm[[All,5,All]],(*13;quench,u*)
loopGegm[[All,6,All]],(*14;quench,d*)
loopGegm[[All,7,All]],(*15;quench,s*)

loopGegm[[All,8,All]],(*16;valence,u*)
loopGegm[[All,9,All]],(*17;valence,d*)
loopGegm[[All,10,All]],(*18;valence,s*)

loopGegm[[All,11,All]],(*19;sea,u,*)
loopGegm[[All,12,All]],(*20;sea,d*)
loopGegm[[All,13,All]],(*21;sea,s*)

loopGegm[[All,5,All]]+loopGegm[[All,8,All]],(*22;quench+valence,u*)
loopGegm[[All,6,All]]+loopGegm[[All,9,All]],(*23;quench+valence,d*)
loopGegm[[All,7,All]]+loopGegm[[All,10,All]],(*24;quench+valence,s*)

treeGegmRencon2[[All,2,All]]+loopGegm[[All,5,All]]+loopGegm[[All,8,All]],(*25;tree+quench+valence,u*)
treeGegmRencon2[[All,3,All]]+loopGegm[[All,6,All]]+loopGegm[[All,9,All]],(*26;tree+quench+valence,d*)
treeGegmRencon2[[All,4,All]]+loopGegm[[All,7,All]]+loopGegm[[All,10,All]],(*27;tree+quench+valence,s*)

treeGegmRencon3[[All,1,All]]+loopGegm[[All,1,All]],(*28;(Z-1)tree+loop,uds*)
treeGegmRencon3[[All,2,All]]+loopGegm[[All,2,All]],(*29;(Z-1)tree+loop,u*)
treeGegmRencon3[[All,3,All]]+loopGegm[[All,3,All]],(*30;(Z-1)tree+loop,d*)
treeGegmRencon3[[All,4,All]]+loopGegm[[All,4,All]],(*31;(Z-1)tree+loop,s*)

treeGegmRencon3[[All,2,All]]+loopGegm[[All,5,All]]+loopGegm[[All,8,All]],(*32;(Z-1)tree+quench+valence,u*)
treeGegmRencon3[[All,3,All]]+loopGegm[[All,6,All]]+loopGegm[[All,9,All]],(*33;(Z-1)tree+quench+valence,d*)
treeGegmRencon3[[All,4,All]]+loopGegm[[All,7,All]]+loopGegm[[All,10,All]](*34;(Z-1)tree+quench+valence,s*)
}
,{2,1,3}
];


(* ::DisplayFormula:: *)
(*rearrangeSevaGegm,{2,18,8},{gegm,seva,io}*)


(* ::Section:: *)
(*Q2table`style 2*)


funQ2tableRearrange=Function[{namesHorizontal,namesVertical,dataList,background},
Grid[(*grid start*)
(Prepend[(*add names row*)
MapThread[Prepend,
{(*add names column*)
dataList,(*add the data to display*)
namesVertical (*prepend names aligned in vertical *)
}
],
namesHorizontal(* prepend names aligned in horizontal, should +1, for vertical names place*)
])
,Frame->{All,All}
,Spacings->{2,2}
,Background->background
](*grid end*)
];


(* ::Text:: *)
(*\:5982\:679c\:78c1\:77e9\:7684\:5b9e\:9a8c\:503c\:662f0\:7684\:8bdd\:ff0c\:8bef\:5dee\:4e2d\:7684\:5206\:6bcd\:5c06\:4f1a\:88ab parGhost \:6240\:4ee3\:66ff\:ff0c*)
(*\:4ee5\:514d\:4ea7\:751f\:4e0d\:826f\:8868\:8fbe\:5f0f\:ff0c\:5e76\:80fd\:591f\:4e0e\:6b63\:5e38\:7684\:8868\:8fbe\:5f0f\:7edf\:4e00*)


parGhost=Sqrt[2];(*\:53d6\:975e\:6574\:6570\:503c\:ff0c\:66f4\:5bb9\:6613\:53d1\:73b0\:5f02\:5e38*)
namesLegend={"Ge.loop.quench-sea-valence","Gm.loop.quench-sea-valence"};
tempNone="None";


funLattice[a_:"",b_:""]:=If[b=="",
ToString[a],
StringJoin[{ToString[a],"(",ToString[b],")"}]
]
dataLattice={
{
"-1","0","1",
"1","0",
"-1","0",
"0"
},
{
funLattice["-0.88","8"],tempNone,funLattice["2.27","16"],
funLattice["2.4","2"],funLattice["-1.59","17"],
funLattice["-0.71","3"],funLattice["-1.32","4"],
tempNone
}
};


funExprmt[a_:"",b_:""]:=If[b=="",
ToString[a],
StringJoin[{ToString[a],"\[PlusMinus]",ToString[b]}]
]


dataExprmt={
{
"-1","0","1",
"1","0",
"-1","0",
"0"
},
{
funExprmt["-1.160","0.025"],tempNone,funExprmt["2.458","0.010"],
funExprmt["2.793"],funExprmt["-1.913"],
funExprmt["-0.651","0.080"],funExprmt["-1.250","0.014"],
funExprmt["-0.613","0.004"]
}
};


dataPaper={
{
"-1","0","1",
"1","0",
"-1","0",
"0"
},
{
funExprmt["-0.861","0.040"],funExprmt["0.838","0.091"],funExprmt["2.537","0.201"],
funExprmt["2.735","0.121"],funExprmt["-1.956","0.103"],
funExprmt["-0.840","0.087"],funExprmt["-1.690","0.142"],
funExprmt["-0.867","0.074"]
}
};


dataList[gegm_]:=Transpose[
Join[
rearrangeSevaGegm[[gegm]],
{
dataExprmt[[gegm]],dataLattice[[gegm]],dataPaper[[gegm]]
}
]
,{2,1}
];


(* ::DisplayFormula:: *)
(*dataList[2]//Dimensions*)


namesVertical={"\[CapitalSigma]m","\[CapitalSigma]0","\[CapitalSigma]p","pr","ne","\[CapitalXi]m","\[CapitalXi]0","\[CapitalLambda]"};(*octet abbreviations*)


namesHorizontal={
{"Ge",
(*1:*)"tree,uds",(*2:*)"tree,u",(*3:*)"tree,d",(*4:*)"tree,s",
(*5:*)"loop,uds",(*6:*)"loop,u",(*7:*)"loop,d",(*8:*)"loop,s",
(*9:*)"tree+loop,uds",(*10:*)"tree+loop,u",(*11:*)"tree+loop,d",(*12:*)"tree+loop,s",
(*13:*)"quench,u",(*14:*)"quench d",(*15:*)"quench,s",
(*16:*)"valence,u",(*17:*)"valence,d",(*18:*)"valence,s",
(*19:*)"sea,u",(*20:*)"sea,d",(*21:*)"sea,s",
(*22:*)"quench+valence,u",(*23:*)"quench+valence,d",(*24:*)"quench+valence,s",
(*25:*)"tree+quench+valence,u",(*26:*)"tree+quench+valence,d",(*27:*)"tree+quench+valence,s",
(*28:*)"(Z-1)tree+loop,uds",(*29:*)"(Z-1)tree+loop,u",(*30:*)"(Z-1)tree+loop,d",(*31:*)"(Z-1)tree+loop,s",
(*32:*)"(Z-1)tree+quench+valence,u",(*33:*)"(Z-1)tree+quench+valence,d",(*34:*)"(Z-1)tree+quench+valence,s",
(*35:*)"exprmt.",(*36:*)"lattice",(*37:*)"paper"
},
{"\[Mu]",
(*1:*)"tree,uds",(*2:*)"tree,u",(*3:*)"tree,d",(*4:*)"tree,s",
(*5:*)"loop,uds",(*6:*)"loop,u",(*7:*)"loop,d",(*8:*)"loop,s",
(*9:*)"tree+loop,uds",(*10:*)"tree+loop,u",(*11:*)"tree+loop,d",(*12:*)"tree+loop,s",
(*13:*)"quench,u",(*14:*)"quench d",(*15:*)"quench,s",
(*16:*)"valence,u",(*17:*)"valence,d",(*18:*)"valence,s",
(*19:*)"sea,u",(*20:*)"sea,d",(*21:*)"sea,s",
(*22:*)"quench+valence,u",(*23:*)"quench+valence,d",(*24:*)"quench+valence,s",
(*25:*)"tree+quench+valence,u",(*26:*)"tree+quench+valence,d",(*27:*)"tree+quench+valence,s",
(*28:*)"(Z-1)tree+loop,uds",(*29:*)"(Z-1)tree+loop,u",(*30:*)"(Z-1)tree+loop,d",(*31:*)"(Z-1)tree+loop,s",
(*32:*)"(Z-1)tree+quench+valence,u",(*33:*)"(Z-1)tree+quench+valence,d",(*34:*)"(Z-1)tree+quench+valence,s",
(*35:*)"exprmt.",(*36:*)"lattice",(*37:*)"paper"
}
};


dataBackground={
None,(* color horizontal: x1, x2, x3...*)
{
LightCyan,{None,LightBlue}
}(* color vertical: y1, y2, y3...*)
};


If[!cmdQ,
gegm=1;
tabMomentGe=Style[
Multicolumn[
{(* paras of column need an {} *)
(*+++++++++++++++++++++++++sea-valence part  +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++*)
funQ2tableRearrange[(*legend name*)
namesHorizontal[[gegm]],(*column name*)
namesVertical,(*row name*)
(*****************************data list start********************************)
dataList[gegm],
(********************************start background*******************************************)
dataBackground
]
(*+++++++++++++++++++++++++sea-valence part  +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++*)
}
,1
]
,FontSize->11
]
]


If[!cmdQ,
gegm=2;
tabMomentGm=Style[
Multicolumn[
{(* paras of column need an {} *)
(*+++++++++++++++++++++++++sea-valence part  +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++*)
funQ2tableRearrange[(*legend name*)
namesHorizontal[[gegm]],(*column name*)
namesVertical,(*row name*)
(*****************************data list start********************************)
dataList[gegm],
(********************************start background*******************************************)
dataBackground
]
(*+++++++++++++++++++++++++sea-valence part  +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++*)
}
,1
]
,FontSize->11
]
]


(* ::Chapter:: *)
(*export*)


echo["output directory"];
outputDir=FileNameJoin[{gitLocalName,"/expression-mfiles/"}]
echo["files to export"];(*\:8981\:5bfc\:51fa\:7684\:6587\:4ef6,\:5173\:8054\:7684\:5f62\:5f0f\:ff0c\:4fdd\:5b58\:7528\:7684\:6587\:4ef6\:540d\[Rule]\:5bf9\:5e94\:7684\:6587\:4ef6*)
outputAssoc=<|
(*++++++++++++++++*)
FileNameJoin[{outputDir,StringJoin["data_fit_",cFittingStr,"_",errorbarQStr,"_series_",parOrderStr,"_L_",parLambda0Str,"_ci_",parciStr,".m"]}]->{dataList[1],dataList[2]},
FileNameJoin[{outputDir,StringJoin["rencon_fit_",cFittingStr,"_L_",parLambda0Str,"_ci_",parciStr,".m"]}]->rencon
(*++++++++++++++++*)
|>;
echo["output status"];
KeyValueMap[Export,outputAssoc]
