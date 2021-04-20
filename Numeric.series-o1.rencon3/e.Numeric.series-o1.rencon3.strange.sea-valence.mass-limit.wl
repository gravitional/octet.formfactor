(* ::Package:: *)

(* ::Title:: *)
(*e.Numeric.series-o1.rencon3.strange.sea-valence.mass-limit.wl*)


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


inputSim={"/home/tom/octet.formfactor/Numeric.series-o1.rencon3/e.Numeric.series-o1.rencon3.strange.sea-valence.mass-limit.wl",
"o1","0.90","1.50","Baryons","notbar"};
(*\:5982\:679c\:5728\:547d\:4ee4\:884c\:6267\:884c\:ff0c\:5c31\:91c7\:7528\:547d\:4ee4\:884c\:53c2\:6570*)
If[cmdQ,
inputCml=$ScriptCommandLine,
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
Print[configc1c2=Get[cFittingDir][cFitting]//Last];,
(*\:5982\:679c\:662f\:4e3a\:4e86\:8ba1\:7b97Error\:ff0c\:5c31\:4f7f\:7528\:6307\:5b9a \[CapitalLambda],ci \:5bf9\:5e94\:7684c1c2\:8fdb\:884c\:8ba1\:7b97*)
Print[cFittingDir=FileNameJoin[{gitLocalName,"expression-mfiles","c1c2_magfit_"<>errorbarQStr<>".m"}]];
Print[configc1c2=Get[cFittingDir][cFitting]//Last];
]


(*\:8f7d\:5165 package-X*)
Get["X`"]
chopLimit=10^-10;(*cut\:7cbe\:5ea6*)
precision=20;(*\:7cbe\:786e\:5ea6*)
echo["the configuration of Simplify"];
SetOptions[Simplify,TimeConstraint->1]
(*SetOptions[EvaluationNotebook[],ShowCellLabel->True];*)


(* ::Chapter:: *)
(*coefficients & mass constants*)


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


baselist2=Join[
{
f->0.093`20,
zi->-1,
di->0.76`20,fi->0.50`20,
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


(* ::Text:: *)
(*\:8fd9\:91cc\:4e0d\:505a\:4efb\:4f55\:9884\:5904\:7406\:ff0c\:7ea7\:6570\:683c\:5f0f\:7684\:8868\:8fbe\:5f0f\:4f1a\:81ea\:52a8\:91cd\:65b0\:8c03\:6574\:ff0c\:4f7f\:5f97\:7ea7\:6570\:7684\:9636\:6570\:4e0d\:53d8*)


echo["start numeric, separate`nuff1 separate`nuff2 "];
ff1Series=ff1;
ff2Series=ff2;


Module[{order=0},

separateNuff1=Table[

(*\:8ba1\:6570\:5668\:ff0c\:7528\:6765\:663e\:793a\:8ba1\:7b97\:8fdb\:5ea6\:ff0c\:4ee5 200 \:4e2a\:9879\:76ee\:4e3a\:8ba1\:6570\:5355\:4f4d*)
order++;
If[IntegerQ[order/200],Print[seva,",",io,",",if,",",coe]
];

Simplify[
(
(
fucoe[[seva,if,io,coe]]*ff1Series[[if]]
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

separateNuff2=Table[

order++;
If[IntegerQ[order/200],Print[seva,",",io,",",if,",",coe]
];

Simplify[
(
(
fucoe[[seva,if,io,coe]]*ff2Series[[if]]
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
(*separateNuff1//Dimensions*)
(*separateNuff2//Dimensions*)


nuff1=Total[separateNuff1,{4}];
nuff2=Total[separateNuff2,{4}];


(* nuff1,nuff2 is 4*8*11 *)
nugegm=Transpose[(* 8*2*4*11 transpose into 2*4*8*11 *)
Table[
-1/(16\[Pi]^2){
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


loopIfGegmValue=Table[
Chop[
SeriesCoefficient[nugegm[[gegm,seva,io,if]],{Q2,0,series}]/.Q2->0,
chopLimit
]
,{gegm,1,2,1}
,{series,0,1,1}(*series order 0 1 *)
,{seva,1,13,1}
,{io,1,8,1}(*the outest level is the octet order*)
,{if,1,11,1}(*the if contris should be summed*)
];


loopGegm=Total[loopIfGegmValue,{5}];


(* ::DisplayFormula:: *)
(*loopGegm,{2,2,4,8},{gegm,series,seva,io}*)


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


treeGegmQ2=Transpose[
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
(*treeGegmQ2//Dimensions *)


(* ::Subsection:: *)
(*tree`gegm`d0*)


treeGegmD0=Chop[treeGegmQ2/.Q2->0,chopLimit];


(* ::DisplayFormula:: *)
(*treeGegmD0//Dimensions*)


(* ::Subsection:: *)
(*tree`gegm`d1*)


(treeGegmD1=D[Chop[treeGegmQ2,chopLimit],{Q2,1}]/.Q2->0);


(* ::DisplayFormula:: *)
(*treeGegmD1//Dimensions *)


(* ::Section:: *)
(*tree`gegm*)


treeGegm=Transpose[
{treeGegmD0,treeGegmD1}
,{2,1,3,4}
];


(* ::DisplayFormula:: *)
(*treeGegm//Dimensions*)


(* ::DisplayFormula:: *)
(*treeGegm,{2,2,4,8},{gegm,order,seva,io}*)


(* ::Chapter:: *)
(*rencon calc*)


(* ::Section:: *)
(*constants*)


(* ::DisplayFormula:: *)
(* octetmagetonc1={(*1*)-(c1/3),(*2*)c1/3,(*3*)c1,(*4*)c1,(*5*)-((2 c1)/3),(*6*)-(c1/3),(*7*)-((2 c1)/3),(*8*)-(c1/3)};*)


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
 (*8*)\[Minus]0.613`20
 };


(* ::Section:: *)
(*rencon2.13*)


(* ::DisplayFormula:: *)
(*loopGegm*)
(*{gegm,order,seva,io}*)


rencon=Table[1,{seva,1,13,1},{io,1,8,1}];
(*+++++++++++++++++renormalized according to charge+++++++++++++*)
Table[
rencon[[;;,i]]=Abs[octetCharge[[i]]-Re[(Cancel[Chop[loopGegm[[1,1,1,i]],chopLimit]]/.Q2->0)]]
,{i,{1,3,4,6}}];
rencon[[;;,2]]=rencon[[;;,3]];
rencon[[;;,5]]=rencon[[;;,4]];
rencon[[;;,7]]=rencon[[;;,6]];
rencon[[;;,8]]=Abs[1-Re[(Cancel[Chop[loopGegm[[1,1,2,8]],chopLimit]]/.Q2->0)]];
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


treeGegmRencon2=Transpose[
(
Transpose[
treeGegm
,{2,3,4,1}
]*rencon[[1]]
)
,{4,1,2,3}
];


(* ::Text:: *)
(*\:8ba1\:7b97 loop \:8d21\:732e\:65f6\:ff0c\:7528\:8fd9\:4e2a\:66f4\:65b9\:4fbf*)


treeGegmRencon3=Transpose[
(
Transpose[
treeGegm
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
(*treeGegmRencon2//Dimensions*)
(*treeGegmRencon3//Dimensions*)
(*loopGegm//Dimensions*)


(* ::Text:: *)
(***********************************************)


rearrangeSevaGegm=Transpose[
{

treeGegm[[All,All,1,All]],(*1;tree,uds*)
treeGegm[[All,All,2,All]],(*2;tree,u*)
treeGegm[[All,All,3,All]],(*3;tree,d*)
treeGegm[[All,All,4,All]],(*4;tree,s*)

loopGegm[[All,All,1,All]],(*5;loop,uds*)
loopGegm[[All,All,2,All]],(*6;loop,u*)
loopGegm[[All,All,3,All]],(*7;loop,d*)
loopGegm[[All,All,4,All]],(*8;loop,s*)

treeGegmRencon2[[All,All,1,All]]+loopGegm[[All,All,1,All]],(*9;tree+loop,uds total*)
treeGegmRencon2[[All,All,2,All]]+loopGegm[[All,All,2,All]],(*10;tree+loop,u*)
treeGegmRencon2[[All,All,3,All]]+loopGegm[[All,All,3,All]],(*11;tree+loop,d*)
treeGegmRencon2[[All,All,4,All]]+loopGegm[[All,All,4,All]],(*12;tree+loop,s*)

loopGegm[[All,All,5,All]],(*13;quench,u*)
loopGegm[[All,All,6,All]],(*14;quench,d*)
loopGegm[[All,All,7,All]],(*15;quench,s*)

loopGegm[[All,All,8,All]],(*16;valence,u*)
loopGegm[[All,All,9,All]],(*17;valence,d*)
loopGegm[[All,All,10,All]],(*18;valence,s*)

loopGegm[[All,All,11,All]],(*19;sea,u,*)
loopGegm[[All,All,12,All]],(*20;sea,d*)
loopGegm[[All,All,13,All]],(*21;sea,s*)

loopGegm[[All,All,5,All]]+loopGegm[[All,All,8,All]],(*22;quench+valence,u*)
loopGegm[[All,All,6,All]]+loopGegm[[All,All,9,All]],(*23;quench+valence,d*)
loopGegm[[All,All,7,All]]+loopGegm[[All,All,10,All]],(*24;quench+valence,s*)

treeGegmRencon2[[All,All,2,All]]+loopGegm[[All,All,5,All]]+loopGegm[[All,All,8,All]],(*25;tree+quench+valence,u*)
treeGegmRencon2[[All,All,3,All]]+loopGegm[[All,All,6,All]]+loopGegm[[All,All,9,All]],(*26;tree+quench+valence,d*)
treeGegmRencon2[[All,All,4,All]]+loopGegm[[All,All,7,All]]+loopGegm[[All,All,10,All]],(*27;tree+quench+valence,s*)

treeGegmRencon3[[All,All,1,All]]+loopGegm[[All,All,1,All]],(*28;(Z-1)tree+loop,uds*)
treeGegmRencon3[[All,All,2,All]]+loopGegm[[All,All,2,All]],(*29;(Z-1)tree+loop,u*)
treeGegmRencon3[[All,All,3,All]]+loopGegm[[All,All,3,All]],(*30;(Z-1)tree+loop,d*)
treeGegmRencon3[[All,All,4,All]]+loopGegm[[All,All,4,All]],(*31;(Z-1)tree+loop,s*)

treeGegmRencon3[[All,All,2,All]]+loopGegm[[All,All,5,All]]+loopGegm[[All,All,8,All]],(*32;(Z-1)tree+quench+valence,u*)
treeGegmRencon3[[All,All,3,All]]+loopGegm[[All,All,6,All]]+loopGegm[[All,All,9,All]],(*33;(Z-1)tree+quench+valence,d*)
treeGegmRencon3[[All,All,4,All]]+loopGegm[[All,All,7,All]]+loopGegm[[All,All,10,All]](*34;(Z-1)tree+quench+valence,s*)
}
,{3,1,2,4}
];


(* ::Text:: *)
(*rearrangeSevaGegm // Dimensions*)


(* ::Section:: *)
(*radius calculate*)


(*rearrangeSevaGegm{2,2,28,8}{gegm,order,seva2,io}*)
rearrangeRadius2GegmSeva=Table[Indeterminate,{gegm,1,2,1},{seva,1,34,1},{io,1,8,1}];
equallimit=0.0000001;
(*\:81ea\:7136\:5355\:4f4d\:5236\:4e2d\:ff0c\:4eceMeV \:5230 fm \:7684\:8f6c\:6362
GeV^-2=0.0389376fm^-2
GeV^-2=0.197326fm^-2*)
unitTransGev2=0.038937550276`20;
unitTransGev=0.197326`20;
(*\:4f5c\:4e3a\:534a\:5f84\:671f\:671b\:516c\:5f0f\:5206\:6bcd\:7684 seva \:9879\:76ee\:ff0c\:4e00\:822c\:662ftree+loop\:603b\:8d21\:732e*)
sevaTotal=9;


Table[
(*************************************start determine the value******************************)
rearrangeRadius2GegmSeva[[gegm,seva,io]]=unitTransGev2*If[

Abs[(rearrangeSevaGegm[[gegm,1,sevaTotal,io]]-0)]<=equallimit(*condition,derivative\[TildeTilde]0*)

,(-6)*rearrangeSevaGegm[[gegm,2,seva,io]](*true*)

,((-6)*rearrangeSevaGegm[[gegm,2,seva,io]])/rearrangeSevaGegm[[gegm,1,sevaTotal,io]](*false*)
]
(*************************************end determine the value******************************)

,{gegm,1,2,1}

(************************************* start the cycle range ******************************)
,{seva,1,34,1}
,{io,1,8,1}

(************************************* end the cycle range ******************************)

];
(*
rearrangeSevaGegm//Dimensions
rearrangeSevaGegm,{2,2,28,8},{gegm,order,seva,io}
rearrangeRadius2GegmSeva//Dimensions
rearrangeRadius2GegmSeva,{2,28,8},{gegm,seva,io}
*)


(* ::Section:: *)
(*show radius*)


(* ::DisplayFormula:: *)
(*treeGegm,{2,2,4,8},{gegm,order,seva1,io}*)


(* ::DisplayFormula:: *)
(*loopGegm,{2,2,13,8},{gegm,order,seva1,io}*)


(* ::DisplayFormula:: *)
(****************************************************)


(* ::DisplayFormula:: *)
(*rearrangeSevaGegm,{2,2,18,8},{gegm,order,seva2,io}*)
(*rearrangeRadius2GegmSeva,{2,18,8},{gegm,seva2,io}*)


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


octetnamePrefix[gegm_]:={{"re2","rm2"}[[gegm]],"\[CapitalSigma]m","\[CapitalSigma]0","\[CapitalSigma]p","pr","ne","\[CapitalXi]m","\[CapitalXi]0","\[CapitalLambda]"};
funExprmt[a_:"",b_:""]:=StringJoin[{ToString[a],"\[PlusMinus]",ToString[b]}]
tempNone="None";


(*paper, arXiv:1309.2063v3 \:7684\:7ed3\:679c*)
radiusGegmPaper={
{
funExprmt[0.781,0.108],"0",funExprmt[0.781,0.108],
funExprmt[0.767,0.113],funExprmt[-0.014,0.001],
funExprmt[0.767,0.113],funExprmt[0.014,0.008],
"0"
},
{
funExprmt[0.951,0.083],funExprmt[0.851,0.102],funExprmt[0.885,0.094],
funExprmt[0.909,0.084],funExprmt[0.922,0.079],
funExprmt["0.840",0.109],funExprmt[0.871,0.099],
funExprmt[0.852,0.103]
}
};


(* ::Text:: *)
(*\:7535\:8377\:534a\:5f84\:7684\:5b9e\:9a8c\:6570\:636e*)


radiusGegmPaper={
{
funExprmt[0.61,0.21],tempNone,tempNone,
funExprmt[0.76,0.09],funExprmt[-0.116,0.002],
tempNone,tempNone,
tempNone
},
{
tempNone,tempNone,tempNone,
funExprmt[0.74,"0.10"],funExprmt[0.76,0.02],
tempNone,tempNone,
tempNone
}
};


funLattice[a_:"",b_:""]:=StringJoin[{ToString[a],"(",ToString[b],")"}]


radiusGegmLat={
{
funLattice[0.657,58],tempNone,funLattice[0.749,72],
funLattice[0.685,66],funLattice[-0.158,33],
funLattice[0.502,47],funLattice[0.082,29],
funLattice["0.010",9]
},
{
funLattice[0.483,49],funLattice[0.432,38],funLattice[0.466,42],
funLattice["0.470",48],funLattice[0.478,"50"],
funLattice[0.336,18],funLattice[0.384,22],
funLattice[0.347,24]
}
};


(*\:7528\:6765\:5728\:6b64\:6587\:4ef6\:4e2d\:753b\:56fe\:7684\:51fd\:6570*)
dataRadius[gegm_,seva_,Q2_,dataVtitle_]:=Transpose[
Prepend[(*for prepend names horizontal*)
MapThread[Prepend,(*for prepend names vertical*)
{
(*start the data to display*)
Chop[
Join[
rearrangeRadius2GegmSeva[[gegm]],
{radiusGegmPaper[[gegm]]},
{radiusGegmLat[[gegm]]},
{radiusGegmPaper[[gegm]]}
][[seva]]/.Q2->0,
chopLimit],
(*end the data to display*)
(*start prepend names vertical*)
dataVtitle
(*end prepend names vertical*)
}
],
(*start prepend names horizontal*)
octetnamePrefix[gegm]
(*end prepend names horizontal*)
]
];
(*++++++++++++++++++\:672c\:6587\:4ef6\:4e2d\:7684\:8868\:683c \:683c\:5f0f\:5316\:51fd\:6570+++++++++++++++++++++++++++++++*)
tableRadius=Function[{gegm,seva,Q2,dataVtitle},
Style[
Grid[(*start grid*)
dataRadius[gegm,seva,Q2,dataVtitle],
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


(* ::Text:: *)
(**)


(*\:7528\:6765\:5b58\:50a8\:4ee5\:4f5c\:8fdb\:4e00\:6b65\:683c\:5f0f\:5316\:7684\:51fd\:6570*)
dataRadiusStorage[gegm_,seva_,Q2_]:=Transpose[
Chop[
Join[
rearrangeRadius2GegmSeva[[gegm]],
{radiusGegmPaper[[gegm]]},
{radiusGegmLat[[gegm]]},
{radiusGegmPaper[[gegm]]}
][[seva]]/.Q2->0,
chopLimit]
];


(* ::DisplayFormula:: *)
(*rearrangeSevaGegm,{2,2,18,8},{gegm,order,seva2,io}*)
(*rearrangeRadius2GegmSeva,{2,18,8},{gegm,seva2,io}*)


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
(*tableRadius[gegm, seva, Q2]*)


dataVtitle={
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
seva={1,5,9,10,19,20,21};
If[!cmdQ,{tabRadiusGe=tableRadius[1,seva,Q2,dataVtitle[[seva]]]}//TableForm]


seva={1,5,9,10,19,20,21};
If[!cmdQ,{tabRadiusGm=tableRadius[2,seva,Q2,dataVtitle[[seva]]]}//TableForm]


(* ::Chapter:: *)
(*export*)


echo["output directory"];
outputDir=FileNameJoin[{gitLocalName,"/expression-mfiles/"}]
echo["files to export"];(*\:8981\:5bfc\:51fa\:7684\:6587\:4ef6,\:5173\:8054\:7684\:5f62\:5f0f\:ff0c\:4fdd\:5b58\:7528\:7684\:6587\:4ef6\:540d\[Rule]\:5bf9\:5e94\:7684\:6587\:4ef6*)
outputAssoc=<|
(*++++++++++++++++*)
FileNameJoin[{outputDir,StringJoin["data_fit_",cFittingStr,"_rela_",errorbarQStr,"_series_",parOrderStr,"_L_",parLambda0Str,"_ci_",parciStr,".m"]}]->
{dataRadiusStorage[1,All,Q2],dataRadiusStorage[2,All,Q2]}
(*++++++++++++++++*)
|>;
echo["output status"];
KeyValueMap[Export,outputAssoc]
