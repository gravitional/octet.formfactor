(* ::Package:: *)

(* ::Title:: *)
(*e-Numeric_series-o0_rencon3_strange_sea-valence_mass-limit_individual.wl*)


(* ::Text:: *)
(*\:7528\:6765\:8ba1\:7b97\:7cfb\:6570\:4e2d\:5355\:72ec\:67d0\:4e00\:9879\:7684\:8d21\:732e\:ff0c\:5bf9\:4e8e\:7279\:5b9a\:7684\:4e2d\:95f4\:91cd\:5b50\:548c\:4ecb\:5b50\:3002\:5e76\:4f7f\:7528\:4e24\:79cd\:91cd\:6574\:5316\:5e38\:6570\:8ba1\:7b97\:65b9\:6848\:3002*)


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


(* ::Chapter:: *)
(*parameters*)


inputSim={
"/home/tom/octet.formfactor/Numeric.series-o0.rencon3/e.Numeric.series-o0.rencon3.strange.sea-valence.mass-limit.wl",
"o0","0.90","1.50","Baryons","notbar"};
If[cmdQ,
inputCml=$ScriptCommandLine,(*\:5982\:679c\:5728\:547d\:4ee4\:884c\:6267\:884c\:ff0c\:5c31\:91c7\:7528\:547d\:4ee4\:884c\:53c2\:6570*)
inputCml=inputSim(*\:5982\:679c\:5728\:7b14\:8bb0\:672c\:6267\:884c\:ff0c\:5c31\:91c7\:7528\:6a21\:62df\:53c2\:6570*)
];
echo["the parameter:order,lambda,ci,fitting"];(*\:5c55\:793a\:63a5\:53d7\:5230\:7684\:53c2\:6570*)
{fileName,parOrder,parLambda0,parci,cFitting,errorbarQ}={
inputCml[[1]],inputCml[[2]],
ToExpression[inputCml[[3]]],ToExpression[inputCml[[4]]],
inputCml[[5]],inputCml[[6]]
}
parOrderStr=ToString[parOrder];
parLambda0Str=ToString[NumberForm[parLambda0,{3,2}]];
parciStr=ToString[NumberForm[parci,{3,2}]];
cFittingStr=enString[cFitting];
errorbarQStr=enString[errorbarQ];
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
Print[configc1c2=Get[cFittingDir][cFitting][[All,2]]];,
(*\:5982\:679c\:662f\:4e3a\:4e86\:8ba1\:7b97Error\:ff0c\:5c31\:4f7f\:7528\:6307\:5b9a \[CapitalLambda],ci \:5bf9\:5e94\:7684c1c2\:8fdb\:884c\:8ba1\:7b97*)
Print[cFittingDir=FileNameJoin[{gitLocalName,"expression-mfiles","c1c2_magfit_"<>errorbarQStr<>".m"}]];
Print[configc1c2=Get[cFittingDir][cFitting][[All,2]]];
]


(*\:8f7d\:5165 package-X*)
Get["X`"]
chopLimit=10^-10;(*cut\:7cbe\:5ea6*)
precision=20;(*\:7cbe\:786e\:5ea6*)
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
Once[chptQfbQuenchCoemassMasslimit=Get[FileNameJoin[{coeDir,"chpt_qfb_quench_coemass_masslimit.m"}]]];
Once[chptQfaSeaCoemassMasslimit=Get[FileNameJoin[{coeDir,"chpt_qfa_sea_coemass_masslimit.m"}]]];
Once[chptQfaValenceCoemassMasslimit=Get[FileNameJoin[{coeDir,"chpt_qfa_valence_coemass_masslimit.m"}]]];
Once[fucoeandmrrlraw=Map[Get,fucoeandmrrlnm,1]];
Once[
fucoeandmrrl=Join[fucoeandmrrlraw,
Transpose[chptQfbQuenchCoemassMasslimit,{2,3,1}],
Transpose[chptQfaValenceCoemassMasslimit,{2,3,1}],
Transpose[chptQfaSeaCoemassMasslimit,{2,3,1}]
]
];
(*fucoeandmrrlraw//Dimensions
fucoeandmrrl//Dimensions*)


(* ::Section:: *)
(*fu Coefficients mass rules reduce*)


(* ::DisplayFormula:: *)
(*in {4,9}\:6709\:989d\:5916\:7684\:8d1f\:53f7*)
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
(*\:5b58\:50a8\:7cfb\:6570\:548c\:8d28\:91cf\:8bb0\:5f55*)
fumass=Keys[fucoeandmrrl];
(*\:5728\:7ed9\:8d28\:91cf\:8d4b\:503c\:4e4b\:524d\:ff0c\:5148\:5b58\:50a8\:7cfb\:6570\:7684\:8bb0\:5f55*)
Once[fumassStr=Transpose[Map[ToString,Keys[fucoeandmrrl],{-1}],{1,3,2}]];
(*fucoe//Dimensions
fumass//Dimensions*)


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
(*rule lists*)


constmo={
(*1*)conm\[CapitalSigma],(*2*)conm\[CapitalSigma],(*3*)conm\[CapitalSigma],
(*4*)conmN,(*5*)conmN,
(*6*)conm\[CapitalXi],(*7*)conm\[CapitalXi],
(*8*)conm\[CapitalLambda]
};


(*c1->2.081,c2->(2/3 c1-1),c3->(-1/3 c1-1)*)
baselist1={
{mN->conm\[CapitalSigma]},{mN->conm\[CapitalSigma]},{mN->conm\[CapitalSigma]},
{mN->conmN},{mN->conmN},
{mN->conm\[CapitalXi]},{mN->conm\[CapitalXi]},
{mN->conm\[CapitalLambda]}
};
(*\:4f7f\:7528\:4e24\:79cd\:91cd\:6574\:5316\:65b9\:6848\:8ba1\:7b97*)
baselist2=Table[
Join[
{
f->0.093`20,zi->-1,di->0.76`20,fi->0.50`20,
ci->parci,\[CapitalLambda]0->parLambda0
},
configc1c2[[ren]]
]
,{ren,2}
];
baselist=Table[
Join[baselist1[[io]],baselist2[[ren]]]
,{ren,2}
,{io,8}
];
(*baselist//Dimensions,{2,8,9},{ren,io,terms}*)


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


echo["start numeric, separateNuff1 separate`nuff2 "];
Module[{order=0},

separateNuff1=Table[

(*\:8ba1\:6570\:5668\:ff0c\:7528\:6765\:663e\:793a\:8ba1\:7b97\:8fdb\:5ea6\:ff0c\:4ee5400 \:4e2a\:9879\:76ee\:4e3a\:8ba1\:6570\:5355\:4f4d*)
order++;
If[IntegerQ[order/400],Print[ren,seva,",",io,",",if,",",coe]];

Simplify[
(
(
fucoe[[seva,if,io,coe]]*ff1[[if]]
)/.baselist[[ren,io]]
)/.fumass[[seva,if,io,coe]]
]
,{ren,2}
,{seva,1,13,1}
,{io,1,8,1}(*the outest level is the octet order*)
,{if,1,11,1}(*the figures contris should be summed*)
,{coe,1,Length[fucoe[[seva,if,io]]],1}(*the coe contris should be summed*)
];
]//AbsoluteTiming


Module[{order=0},

separateNuff2=Table[

order++;
If[IntegerQ[order/400],Print[ren,seva,",",io,",",if,",",coe]];(*\:7528\:6765\:663e\:793a\:8ba1\:7b97\:8fdb\:5ea6\:ff0c\:4ee5400 \:4e2a\:9879\:76ee\:4e3a\:8ba1\:6570\:5355\:4f4d*)

Simplify[
(
(
fucoe[[seva,if,io,coe]]*ff2[[if]]
)/.baselist[[ren,io]]
)/.fumass[[seva,if,io,coe]]
]
,{ren,2}
,{seva,1,13,1}
,{io,1,8,1}(*the outest level is the octet order*)
,{if,1,11,1}(*the figures contris should be summed*)
,{coe,1,Length[fucoe[[seva,if,io]]],1}(*the coe contris should be summed*)
];
]//AbsoluteTiming


separateNugegm=Transpose[
Table[
-1/(16\[Pi]^2) {
separateNuff1[[All,All,io]]-Q2/(4constmo[[io]]^2)separateNuff2[[All,All,io]],
separateNuff1[[All,All,io]]+separateNuff2[[All,All,io]]
}
,{io,8}]
,{3,4,1,2,5}
];
(*separateNugegm//Dimensions
{2,13,8,2,11},{ren,seva,io,gegm,if}*)
(*\:5bf9\:4e0d\:540c\:4e2d\:95f4\:91cd\:5b50\:548c\:4ecb\:5b50\:7684\:9879\:76ee\:6c42\:548c*)
nuff1=Total[separateNuff1,{4,5}];
nuff2=Total[separateNuff2,{4,5}];
(*nuff1//Dimensions,{2,13,8},{ren,seva,io}*)
nugegm=Transpose[
Table[
-1/(16\[Pi]^2) {
nuff1[[All,All,io]]-Q2/(4constmo[[io]]^2) nuff2[[All,All,io]],
nuff1[[All,All,io]]+nuff2[[All,All,io]]
}
,{io,1,8,1}
]
,{3,4,1,2}
];
(*nugegm//Dimensions
{2,13,8,2},{ren,seva,io,gegm}*)


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
}/.baselist[[ren,io]]
]
,{ren,2}
,{io,8}
]
,{1,3,4,2}
];
(*trgegm//Dimensions,{2,4,8,2},{ren,seva,io,gegm}*)


(* ::Chapter:: *)
(*rencon calc*)


(*octetmagetonc1={(*1*)-(c1/3),(*2*)c1/3,(*3*)c1,(*4*)c1,(*5*)-((2 c1)/3),(*6*)-(c1/3),(*7*)-((2 c1)/3),(*8*)-(c1/3)};*)
octetname={"1\[CapitalSigma]m","2\[CapitalSigma]0","3\[CapitalSigma]p","4pr","5ne" ,"6\[CapitalXi]m","7\[CapitalXi]0","8\[CapitalLambda]"};
octetCharge={
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


(*rencon2 & c1c2 calc sum-square cp1*)(*\:8ba1\:7b97\:6ce2\:51fd\:6570\:91cd\:6574\:5316\:5e38\:6570*)
nugegmZero=Chop[(Cancel[Chop[nugegm,chopLimit]]/.Q2->0),chopLimit];
(*nugegmZero//Dimensions,{2,13,8,2},{ren,seva,io,gegm}*)
rencon=Table[1,{ren,1,2,1},{io,1,8,1}];
(*\:6309\:7167\:7b2c\:4e00\:79cd\:65b9\:5f0f\:8ba1\:7b97\:7684\:91cd\:6574\:5316\:5e38\:6570 Z*(tree+loop)*)
Table[rencon[[ren=1,io]]=octetCharge[[io]]/(octetCharge[[io]]+nugegmZero[[ren=1,seva=1,io,gegm=1]]),{io,{1,3,4,6}}];
rencon[[ren=1,8]]=1/(1+nugegmZero[[ren=1,seva=2,io=8,gegm=1]]);
(*\:6309\:7167\:7b2c\:4e8c\:79cd\:65b9\:5f0f\:8ba1\:7b97\:7684\:91cd\:6574\:5316\:5e38\:6570 Z*tree+loop*)
Table[rencon[[ren=2,io]]=Abs[octetCharge[[io]]-nugegmZero[[ren=2,seva=1,io,gegm=1]]],{io,{1,3,4,6}}];
rencon[[ren=2,8]]=Abs[1-nugegmZero[[ren=2,seva=2,io=8,gegm=1]]];
(*+++++++++++++++renormalized isospin+++++++++++++++++++++*)
rencon[[All,2]]=rencon[[All,3]];
rencon[[All,5]]=rencon[[All,4]];
rencon[[All,7]]=rencon[[All,6]];
echo["wave renormalization constants"]
StringRiffle[N[rencon,3]]


(* ::Chapter:: *)
(*tabular ge & gm rearrange*)


octetGegmExpriment={
{
(*1*)-1,(*2*)0,(*3*)1,
(*4*)1,(*5*)0,
(*6*)-1,(*7*)0,
(*8*)0
},
{
(*1*)\[Minus]1.160`20,(*2*)0.60`20,(*3*)2.458`20,
(*4*)2.7928473446`20,(*5*)\[Minus]1.9130427`20,
(*6*)\[Minus]0.6507`20,(*7*)\[Minus]1.250`20,
(*8*)\[Minus]0.613`20
}
};
(*{seva},{
1;"all","u","d","s",
5;"u-quench","d-quench","s-quench",
8;"u-valence","d-valence","s-valence",
11;"u-sea","d-sea","s-sea"
}*)


treeGegm=Transpose[Re[trgegm/.Q2->0],{1,3,4,2}];
(*treeGegm//Dimensions,{2,2,4,8},{ren,gegm,seva,io}*)
(*total = tree +(Z-1)*tree+loop, \:8ba1\:7b97 total \:8d21\:732e\:65f6\:ff0c\:7528\:8fd9\:4e2a\:66f4\:65b9\:4fbf*)
treeGegmRencon2=Table[
treeGegm[[ren,gegm,seva,io]]*rencon[[ren,io]]
,{ren,1,2,1}
,{gegm,1,2,1}
,{seva,1,4,1}
,{io,1,8,1}
];
treeGegmRencon3=Table[(*\:8ba1\:7b97 loop \:8d21\:732e\:65f6\:ff0c\:7528\:8fd9\:4e2a\:66f4\:65b9\:4fbf*)
treeGegm[[ren,gegm,seva,io]]*(rencon[[ren,io]]-1)
,{ren,1,2,1}
,{gegm,1,2,1}
,{seva,1,4,1}
,{io,1,8,1}
];
(*treeGegmRencon2//Dimensions,{2,2,4,8},{ren,gegm,seva,io}*)


loopGegm=Transpose[Chop[Re[Cancel[Chop[nugegm,chopLimit]]/.Q2->0],chopLimit],{1,3,4,2}];
(*\:7ed9\:51fa\:5708\:56fe\:7684\:96f6\:70b9\:503c,total = tree +(Z-1)*tree+loop
loopGegm,{2,2,13,8},{ren,gegm,seva,io}*)
indLoopGegm=Transpose[Chop[Re[Cancel[Chop[separateNugegm,chopLimit]]/.Q2->0],chopLimit],{1,3,4,2,5}];
(*indLoopGegm//Dimensions,{2,2,13,8,11},{ren,gegm,seva,io,if}*)


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


assocLoopGeGm=Table[(*\:5236\:4f5c\:4e00\:4e2a\:91cd\:5b50\:4ecb\:5b50\:5bf9\:5e94\:6570\:503c\:7684\:5173\:8054*)
Table[
Values[fumassStr[[seva,io,if]]][[coe]]->indLoopGegm[[ren,gegm,seva,io,if,coe]],
{coe,1,Length[fumassStr[[seva,io,if]]],1}]~Join~
{"Tot."->Total[indLoopGegm[[ren,gegm,seva,io,if]]]}
,{ren,2}
,{gegm,1,2,1}
,{seva,1,13,1}
,{io,1,8,1}
,{if,1,11,1}
];
(*++++++++++++++++++++++\:8ba1\:7b97\:5bf9\:5e94\:7684\:80cc\:666f\:989c\:8272+++++++++++++++++++++++++++++++\:ff0c\:5728\:4e00\:4e2a\:68af\:5ea6\:7684\:8272\:5f69\:65b9\:6848\:4e2d\:ff0c\:6309\:7167\:8d21\:732e\:7684\:5927\:5c0f\:9009\:53d6\:989c\:8272*)
bgdColor=Table[

{if+1,coe+1}->Lighter[ColorData[{"SunsetColors","Reverse"}][
Abs[indLoopGegm[[ren,gegm,seva,io,if,coe]]]/Total[Abs[indLoopGegm[[ren,gegm,seva,io]]],2](*\:8ba1\:7b97\:67d0\:4e00\:9879\:5360\:6574\:4f53\:8d21\:732e\:7684\:6bd4\:503c*)
]
]

,{ren,2}
,{gegm,1,2,1}
,{seva,1,13,1}
,{io,1,8,1}
,{if,1,11,1}
,{coe,1,Length[fumassStr[[seva,io,if]]],1}
];
(*\:8868\:683c\:7684\:6a2a\:7eb5\:5411\:540d\:79f0*)
namesVertical={"f1","f2","f3","f4","f5","f6","f7","f8","f9","f10","f11"};
namesHorizontal1={"\[CapitalSigma]-","\[CapitalSigma]0","\[CapitalSigma]+","Pr","Ne","\[CapitalXi]-","\[CapitalXi]0","\[CapitalLambda]"};
namesHorizontal2={
(*1:*)"loop,uds",(*2:*)"loop,u",(*3:*)"loop,d",(*4:*)"loop,s",
(*5:*)"quench,u",(*6*)"quench d",(*7:*)"quench,s",
(*8:*)"valence,u",(*9:*)"valence,d",(*10:*)"valence,s",
(*11:*)"sea,u",(*12:*)"sea,d",(*13:*)"sea,s"
};
namesHorizontal[ren_,gegm_,io_,seva_]:={namesHorizontal1[[io]],namesHorizontal2[[seva]],loopGegm[[ren,gegm,seva,io]]};


ren=1;gegm=2;seva=1;io=4;
Style[
Multicolumn[
{(* paras of column need an {} *)
(*+++++++++++++++++++++++++sea-valence part  +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++*)
funQ2tableRearrange[(*legend name*)
namesHorizontal[ren,gegm,io,seva],(*column name*)
namesVertical,(*row name*)
(*****************************data list start********************************)
assocLoopGeGm[[ren,gegm,seva,io]],
(********************************start background*******************************************)
{
None,None,
Flatten[bgdColor[[ren,gegm,seva,io]]]
}
]
(*+++++++++++++++++++++++++sea-valence part  +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++*)
}
,1
]
,FontSize->11
]
