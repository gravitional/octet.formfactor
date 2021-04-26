(* ::Package:: *)

(* ::Title:: *)
(*e.Numeric.series-full.rencon3.strange.wl*)


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
(*\:6a21\:62df\:547d\:4ee4\:884c\:8f93\:5165\:ff0c\:8c03\:8bd5\:4f7f\:7528*)


InputSim={"/home/tom/octet.formfactor/Numeric.series-full.rencon3/e.Numeric.series-full.rencon3.strange.wl",
"full",0.80`20,1.00`20,"Baryons","L_0.90_ci_1.00"};
(*\:5982\:679c\:5728\:547d\:4ee4\:884c\:6267\:884c\:ff0c\:5c31\:91c7\:7528\:547d\:4ee4\:884c\:53c2\:6570*)
If[cmdQ,
inputCml=$ScriptCommandLine,(*\:5982\:679c\:5728\:547d\:4ee4\:884c\:6267\:884c\:ff0c\:5c31\:91c7\:7528\:547d\:4ee4\:884c\:53c2\:6570*)
inputCml=InputSim(*\:5982\:679c\:5728\:7b14\:8bb0\:672c\:6267\:884c\:ff0c\:5c31\:91c7\:7528\:6a21\:62df\:53c2\:6570*)
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
(*eg."L_0.90_ci_1.50"*)
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
Needs["X`"];ParallelNeeds["X`"];CloseKernels[];LaunchKernels[];
chopLimit=10^-10;(*cut\:7cbe\:5ea6*)
precision=20;(*\:7cbe\:786e\:5ea6*)


(* ::Chapter:: *)
(*coefficients & mass constants*)


(* ::Text:: *)
(*a 4 component list, contain all, u,d,s*)


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
Once[
fucoeandmrrlraw=Map[Get,fucoeandmrrlnm,1]
];
Once[chptQfbQuenchCoemassMasslimit=Get[FileNameJoin[{coeDir,"chpt_qfb_quench_coemass_masslimit.m"}]]];
Once[chptQfaSeaCoemassMasslimit=Get[FileNameJoin[{coeDir,"chpt_qfa_sea_coemass_masslimit.m"}]]];
Once[ChptQfaValenceCoemassMasslimit=Get[FileNameJoin[{coeDir,"chpt_qfa_valence_coemass_masslimit.m"}]]];
Once[
fucoeandmrrl=Join[fucoeandmrrlraw,
Transpose[chptQfbQuenchCoemassMasslimit,{2,3,1}],
Transpose[ChptQfaValenceCoemassMasslimit,{2,3,1}],
Transpose[chptQfaSeaCoemassMasslimit,{2,3,1}]
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
0.1381`20,
0.4956`20,
0.5693`20,
0.9452`20
};


{conm\[CapitalSigma],conmN,conm\[CapitalXi],conm\[CapitalLambda],conm\[CapitalLambda]\[CapitalSigma],
conmUUU,conmDDD,conmSSS(* \:865a\:62df\:7684\:5bf9\:79f0\:91cd\:5b50 *)
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


baselist2=Join[
{
f->0.093`20,
zi->-1,
di->0.76`20,fi->0.5`20,
ci->parci,
\[CapitalLambda]0->parLambda0
},
configc1c2
];
baselist=Table[
Join[baselist1[[io]],baselist2]
,{io,1,8,1}
];


(* ::Section:: *)
(*import integral analytic*)


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
(*contribution combine coefficients,f1, f2*)


echo["start numeric, separate`nuff1 separate`nuff2 "];
SetOptions[Simplify,TimeConstraint->1];
DiscBChop[x__]:=Chop[DiscB[x],chopLimit]/;And@@NumericQ/@{x}(*\:5f53\:8f93\:5165\:662f\:6570\:5b57\:7684\:65f6\:5019\:ff0c\:624d\:8fdb\:884cchop*)
ScalarC0Chop[x__]:=Chop[ScalarC0[x],chopLimit]/;And@@NumericQ/@{x}(*\:5f53\:8f93\:5165\:662f\:6570\:5b57\:7684\:65f6\:5019\:ff0c\:624d\:8fdb\:884cchop*)


(* ::DisplayFormula:: *)
(*fucoe=11[diagram]*8[octet]*n(coefficients)*)


(* ::DisplayFormula:: *)
(*fumass=11[diagram]*8[octet]*n(n =above n,mass rule lists)*)


(* ::DisplayFormula:: *)
(*diagff=11[diagram]*2[ff1,ff2]*many(contri terms)*)


Module[{order=0},

SeparateNuff1=ParallelTable[

(*\:8ba1\:6570\:5668\:ff0c\:7528\:6765\:663e\:793a\:8ba1\:7b97\:8fdb\:5ea6\:ff0c\:4ee5 200 \:4e2a\:9879\:76ee\:4e3a\:8ba1\:6570\:5355\:4f4d*)
order++;
If[IntegerQ[order/50],Print["seva=",seva,",io=",io,",if=",if,",coe=",coe]];
(*\:907f\:514dDiscB\:5e26\:6765\:7684\:5fae\:5c0f\:5047\:865a\:90e8*)
fucoe[[seva,if,io,coe]]*ff1[[if]]/.{DiscB->DiscBChop,ScalarC0->ScalarC0Chop}/.baselist[[io]]/.fumass[[seva,if,io,coe]]//Cancel

(*,{series,1,2,1}(*series order 0 1 *)*)
,{seva,1,13,1}
,{io,1,8,1}(*the outest level is the octet order*)
,{if,1,11,1}(*the if contris should be summed*)
,{coe,1,Length[fucoe[[seva,if,io]]],1}(*the coe contris should be summed*)
,DistributedContexts->Automatic];
]//AbsoluteTiming


Module[{order=0},

SeparateNuff2=ParallelTable[

order++;
If[IntegerQ[order/50],Print["seva=",seva,",io=",io,",if=",if,",coe=",coe]];

fucoe[[seva,if,io,coe]]*ff2[[if]]/.{DiscB->DiscBChop,ScalarC0->ScalarC0Chop}/.baselist[[io]]/.fumass[[seva,if,io,coe]]//Cancel

(*,{series,1,2,1}(*series order 0 1 *)*)
,{seva,1,13,1}
,{io,1,8,1}(*the outest level is the octet order*)
,{if,1,11,1}(*the if contris should be summed*)
,{coe,1,Length[fucoe[[seva,if,io]]],1}(*the coe contris should be summed*)
,DistributedContexts->Automatic];
]//AbsoluteTiming


nuff1=Total[SeparateNuff1,{3,4}];
nuff2=Total[SeparateNuff2,{3,4}];
(* nuff1,nuff2 is 1*8 *)
nugegm=Transpose[(* 8*2*1 transpose into 2*4*8*11 *)
Table[
-1/(16\[Pi]^2) {
nuff1[[All,io]]-Q2/(4constmo[[io]]^2)nuff2[[All,io]],
nuff1[[All,io]]+nuff2[[All,io]]
}
,{io,1,8,1}
]
,{3,1,2}
];
(*nugegm//Dimensions
nugegm,{2,1,8},{gegm,seva,io}*)


(* ::DisplayFormula:: *)
(**)


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


treeGegm=Transpose[Chop[Table[Cancel[
{
trf1f2[[All,io,1]]-Q2/(4constmo[[io]]^2) trf1f2[[All,io,2]],
trf1f2[[All,io,1]]+trf1f2[[All,io,2]]
}/.baselist[[io]]
]
,{io,1,8,1}]
,chopLimit
]
,{3,1,2}];//AbsoluteTiming


(* ::DisplayFormula:: *)
(*treeGegm,{2,4,8},{gegm,seva,io}*)


(* ::Chapter:: *)
(*rencon calc*)


namesHorizontal={
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
};


octetCharge={
(*1*)-1,(*2*)0,(*3*)1,
(*4*)1,(*5*)0,
(*6*)-1,(*7*)0,
(*8*)0
};
octetMageton={
(*1*) \[Minus]1.160`20,(*2*) 0.60`20,(*3*)2.458`20,
  (*4*)2.7928473446`20, (*5*)\[Minus]1.9130427`20,
  (*6*)\[Minus]0.6507`20,(*7*)\[Minus]1.250`20,
 (*8*)\[Minus]0.613`20};


(* ::DisplayFormula:: *)
(*(*0\:9636\:7ed3\:679c\:7684\:4f4d\:7f6e*)*)
(*seriesO0dataPath=FileNameJoin[{gitLocalName,"/expression-mfiles/",StringJoin["data_fit_",cFittingStr,"_rela_",errorbarQStr,"_series_o0_L_",parLambda0Str,"_ci_",parciStr,".m"]}];*)
(*seriesO0data=Get[seriesO0dataPath];*)
(*(*seriesO0data//Dimensions*)
(*{2,8,37},{gegm,io,seva}*)*)
(*(*\:63d0\:53d6\:51faseriesO0data\:4e2d\:5708\:56fe\:90e8\:5206\:7684\:503c*)*)
(*loopSpan=Range[5,8]~Join~Range[13,21];*)
(*zeroGegmValue=Transpose[seriesO0data[[All,All,loopSpan]],{1,3,2}];*)
(*(*zeroGegmValue//Dimensions*)
(*{2,13,8},{gegm,seva,io}*)*)
(*(*\:5f00\:59cb\:8ba1\:7b97\:91cd\:6574\:5316\:5e38\:6570*)*)
(*rencon=Table[1,{seva,1,13,1},{io,1,8,1}];*)
(*(*+++++++++++++++++renormalized according to charge+++++++++++++*)*)
(*Table[*)
(*rencon[[All,io]]=Abs[octetCharge[[io]]-Re[(Cancel[Chop[zeroGegmValue[[1,1,io]],chopLimit]]/.Q2->0)]]*)
(*,{io,{1,3,4,6}}];*)
(*rencon[[All,2]]=rencon[[All,3]];*)
(*rencon[[All,5]]=rencon[[All,4]];*)
(*rencon[[All,7]]=rencon[[All,6]];*)
(*rencon[[All,8]]=Abs[1-Re[(Cancel[Chop[zeroGegmValue[[1,2,8]],chopLimit]]/.Q2->0)]];*)
(*(*++++++++++++++++++++no renormalized+++++++++++++++++++++*)*)
(*(*rencon\[LeftDoubleBracket]2,1\[RightDoubleBracket]=1;*)
(*rencon\[LeftDoubleBracket]2,6\[RightDoubleBracket]=1;*)
(*rencon\[LeftDoubleBracket]3,3\[RightDoubleBracket]=1;*)
(*rencon\[LeftDoubleBracket]3,7\[RightDoubleBracket]=1;*)
(*rencon\[LeftDoubleBracket]4,4\[RightDoubleBracket]=1;*)
(*rencon\[LeftDoubleBracket]4,5\[RightDoubleBracket]=1;*)*)
(*(*++++++++++++++++++++display+++++++++++++++++++++*)*)
(*echo["calculated renormalization constants"];*)
(*StringRiffle[rencon]*)


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


figCutlimit=0.0001;
figLeadersize=4;


precsn[Q2_]:=SetPrecision[Q2,16]/;NumericQ[Q2](*\:8fd9\:4e2a\:51fd\:6570\:5bf9\:8f93\:5165\:7684Q2\:8c03\:8282\:7cbe\:5ea6*)
loopGegm=Table[(*\:6574\:7406\:6570\:636e\:ff0c\:5bf9\:96f6\:70b9\:9644\:8fd1\:4f5c\:7a33\:5b9a*)
Piecewise[
{
{zeroGegmValue[[gegm,seva,io]],Q2<=figCutlimit},
{nugegm[[gegm,seva,io]]/.{Q2->precsn[Q2]},Q2>figCutlimit}
}
]
,{gegm,1,2,1}
,{seva,1,13,1}
,{io,1,8,1}
];
(*loopGegm//Dimensions
{2,13,8}*)


reSevaGegm=Chop[Transpose[
{
treeGegm[[All,1,All]],(*1;tree,uds*)
treeGegm[[All,2,All]],(*2;tree,u*)
treeGegm[[All,3,All]],(*3;tree,d*)
treeGegm[[All,4,All]],(*4;tree,s*)

loopGegm[[All,1,All]],(*5;loop,uds*)
loopGegm[[All,2,All]],(*6;loop,u*)
loopGegm[[All,3,All]],(*7;loop,d*)
loopGegm[[All,4,All]],(*8;loop,s*)

loopGegm[[All,5,All]],(*9;quench,u*)
loopGegm[[All,6,All]],(*10;quench,d*)
loopGegm[[All,7,All]],(*11;quench,s*)

loopGegm[[All,8,All]],(*12;valence,u*)
loopGegm[[All,9,All]],(*13;valence,d*)
loopGegm[[All,10,All]],(*14;valence,s*)

loopGegm[[All,11,All]],(*15;sea,u,*)
loopGegm[[All,12,All]],(*16;sea,d*)
loopGegm[[All,13,All]](*17;sea,s*)

}
,{2,1,3}
],chopLimit];
(*reSevaGegm//Dimensions
{2,17,8}*)


(* ::DisplayFormula:: *)
(*nmlzGegm={(*\:5f52\:4e00\:5316\:56e0\:5b50*)*)
(*ConstantArray[1,8],(*ge \:7684\:5f52\:4e00\:5316\:56e0\:5b50\:90fd\:662f1*)*)
(*SetPrecision[totalGegm[[2,1]]/.Q2->0,precision](*gm \:7684\:5f52\:4e00\:5316\:56e0\:5b50\:662f\:96f6\:70b9\:503c*)*)
(*};*)
(*(*nmlzGegm//Dimensions*)
(*{2,8}*)*)


(* ::Section:: *)
(*gegm*)


figCalcBaryonsGegm=Table[0,{gegm,1,2,1},{seva,1,17,1},{io,1,8,1}];
(*gegm=1;seva=1;io=5;*)
(*+++++++++++++++++++++++++++*)
Module[{order=0,teff},
(*+++++++++++++++++++++++++++*)
figCalcBaryonsGegm=ParallelTable[
(*+++++++++++++++++++++++++++*)
order++;
If[IntegerQ[order/16],Print["gegm=",gegm,",seva=",seva,",io=",io]
];
(*+++++++++++++++++++++++++++*)
teff=reSevaGegm[[gegm,seva,io]];
Plot[
teff(*\:8fd9\:91cc\:9664\:4ee5\:5f52\:4e00\:5316\:56e0\:5b50\:ff0c\:4f7f\:7528 Evaluate \:5148\:8ba1\:7b97\:8868\:8fbe\:5f0f*)
,{Q2,0,1},
AxesOrigin->{0,0},
PlotRange->{{0,1},Automatic},
PlotRangePadding->{Automatic,Scaled[0.09]},
ImageSize->Scaled[0.5],
AspectRatio->1/GoldenRatio,
Frame->True
]

,{gegm,1,2,1}
,{seva,1,17,1}
,{io,1,8,1}
,DistributedContexts->Automatic
]
(*+++++++++++++++++++++++++++*)
];//AbsoluteTiming


(* ::Chapter:: *)
(*storage*)


echo["output directory"];
outputDir=FileNameJoin[{gitLocalName,"/expression-mfiles/"}]
(*\:8981\:5bfc\:51fa\:7684\:6587\:4ef6,\:5173\:8054\:7684\:5f62\:5f0f\:ff0c\:4fdd\:5b58\:7528\:7684\:6587\:4ef6\:540d\[Rule]\:5bf9\:5e94\:7684\:6587\:4ef6*)
outputAssoc=<|
(*++++++++++++++++*)
FileNameJoin[{outputDir,StringJoin["data_fit_",cFittingStr,"_rela_",errorbarQStr,"_series_",parOrderStr,"_L_",parLambda0Str,"_ci_",parciStr,".m"]}]->figCalcBaryonsGegm
(*++++++++++++++++*)
|>;
echo["output status"];
KeyValueMap[Export,outputAssoc]
