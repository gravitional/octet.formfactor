(* ::Package:: *)

(* ::Title:: *)
(*e_Numeric_recon3_check.wl*)


(* ::Text:: *)
(*\:8ba1\:7b97\:91cd\:6574\:5316\:5e38\:6570\:ff0c\:4e24\:79cd\:8ba1\:7b97\:65b9\:5f0f\:3002\:7b2c\:4e00\:79cd\:4e3a\:ff1aZ*(tree+loop)\:ff0c\:7b2c\:4e8c\:79cd\:4e3a  z*tree+loop*)


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
(*initial parameters*)


InputSim={"/home/tom/octet.formfactor/Numeric.series-o0.rencon3/e.Numeric.series-o0.rencon3.strange.sea-valence.mass-limit.wl",
"o0",0.90`28,1.0`28};
If[cmdQ,
InCml=$ScriptCommandLine,(*\:5982\:679c\:5728\:547d\:4ee4\:884c\:6267\:884c\:ff0c\:5c31\:91c7\:7528\:547d\:4ee4\:884c\:53c2\:6570*)
InCml=InputSim(*\:5982\:679c\:5728\:7b14\:8bb0\:672c\:6267\:884c\:ff0c\:5c31\:91c7\:7528\:6a21\:62df\:53c2\:6570*)
];
echo["the parameter order, lambda, ci,"];
{fileName,parOrder,parLambda0,parci}={
InCml[[1]],InCml[[2]],
ToExpression[InCml[[3]]],(*\:8f6c\:6362\:6210\:8868\:8fbe\:5f0f*)
ToExpression[InCml[[4]]]
}
parOrderStr=ToString[parOrder];
parLambda0Str=ToString[NumberForm[parLambda0,{3,2}]];
parciStr=ToString[NumberForm[parci,{3,2}]];


(* ::Section:: *)
(*Initial2*)


Needs["X`"];(*inital by hand*)
choplimit=10^-10;(*cut\:7cbe\:5ea6*)
precision=25;(*\:7cbe\:786e\:5ea6*)


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
0.1381`28,
0.4956`28,
0.5693`28,
0.9452`28
};


{conm\[CapitalSigma],conmN,conm\[CapitalXi],conm\[CapitalLambda],conm\[CapitalLambda]\[CapitalSigma],
conmUUU,conmDDD,conmSSS(* \:865a\:62df\:7684\:5bf9\:79f0\:91cd\:5b50 *)
}={
1.193`28,0.939`28,1.315`28,1.116`28,1.155`28,
0.939`28,0.939`28,1.315`28
};


{conm\[CapitalDelta],conm\[CapitalSigma]s,conm\[CapitalXi]s,conm\[CapitalOmega]}={
1.232`28,
1.385`28,
1.530`28,
1.672`28
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


configc1c2=<|
(*here is the test configuration*)
{"0.90","1.05"}->{c1->1.6953280353951576`28,c2->0.3310658564719022`28},
{"0.90","1.10"}->{c1->1.6542713327732161`28,c2->0.33436637472152625`28}
|>;


baselist2=Join[
{
f->0.093`28,
zi->-1,
di->0.76`28,fi->0.5`28,
ci->parci,
\[CapitalLambda]0->parLambda0
},
{Nothing}
];


(* ::Text:: *)
(*for neutron pull-apart, best octet fit \[CapitalLambda]0\[TildeTilde]1~0.1*)


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
DiscBChop[x__]:=Chop[DiscB[x],choplimit]/;And@@NumericQ/@{x}(*\:5f53\:8f93\:5165\:662f\:6570\:5b57\:7684\:65f6\:5019\:ff0c\:624d\:8fdb\:884cchop*)
ScalarC0Chop[x__]:=Chop[ScalarC0[x],choplimit]/;And@@NumericQ/@{x}(*\:5f53\:8f93\:5165\:662f\:6570\:5b57\:7684\:65f6\:5019\:ff0c\:624d\:8fdb\:884cchop*)


(* ::DisplayFormula:: *)
(*fucoe=11[diagram]*8[octet]*n(coefficients)*)


(* ::DisplayFormula:: *)
(*fumass=11[diagram]*8[octet]*n(n =above n,mass rule lists)*)


(* ::DisplayFormula:: *)
(*diagff=11[diagram]*2[ff1,ff2]*many(contri terms)*)


Module[{order=0},

SeparateNuff1=Table[

(*\:8ba1\:6570\:5668\:ff0c\:7528\:6765\:663e\:793a\:8ba1\:7b97\:8fdb\:5ea6\:ff0c\:4ee5 200 \:4e2a\:9879\:76ee\:4e3a\:8ba1\:6570\:5355\:4f4d*)
order++;
If[IntegerQ[order/50],Print["seva=",seva,",io=",io,",if=",if,",coe=",coe]];
(*\:907f\:514dDiscB\:5e26\:6765\:7684\:5fae\:5c0f\:5047\:865a\:90e8*)
fucoe[[seva,if,io,coe]]*ff1[[if]]/.{DiscB->DiscBChop,ScalarC0->ScalarC0Chop}/.baselist[[io]]/.fumass[[seva,if,io,coe]]//Cancel

(*,{series,1,2,1}(*series order 0 1 *)*)
,{seva,1,2,1}
,{io,1,8,1}(*the outest level is the octet order*)
,{if,1,11,1}(*the if contris should be summed*)
,{coe,1,Length[fucoe[[seva,if,io]]],1}(*the coe contris should be summed*)
(*,DistributedContexts->Automatic*)
];
]//AbsoluteTiming


Module[{order=0},

SeparateNuff2=Table[

order++;
If[IntegerQ[order/50],Print["seva=",seva,",io=",io,",if=",if,",coe=",coe]];

fucoe[[seva,if,io,coe]]*ff2[[if]]/.{DiscB->DiscBChop,ScalarC0->ScalarC0Chop}/.baselist[[io]]/.fumass[[seva,if,io,coe]]//Cancel

(*,{series,1,2,1}(*series order 0 1 *)*)
,{seva,1,2,1}
,{io,1,8,1}(*the outest level is the octet order*)
,{if,1,11,1}(*the if contris should be summed*)
,{coe,1,Length[fucoe[[seva,if,io]]],1}(*the coe contris should be summed*)
(*,DistributedContexts->Automatic*)
];
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


(* ::DisplayFormula:: *)
(*nugegm,{2,1,8},{gegm,seva,io}*)


(* ::Chapter:: *)
(*parameter method*)


(* ::Text:: *)
(*all operation can be done here after ( initial and get all \[CapitalGamma]\[Mu] .)*)


(* ::Section:: *)
(*calc rencon*)


octcharge={
-1,(*1*)0,1,1,(*4*)0,-1,(*6*)0,(*7*)0(*8*)};
magc1c2c3={
(*1 \[CapitalSigma]*)-1+1/3 (c1-3 c2),c1/3,1+1/3 (c1+3 c2),
(*4 N*)1+1/3 (c1+3 c2),-((2 c1)/3),
(*6 \[CapitalXi]*)-1+1/3 (c1-3 c2),-((2 c1)/3),
(*4 \[CapitalLambda]*)-(c1/3)
};(*chpt representation of c1 c2 c3,c3=c2-c1 *)
octmagNum={
(*1*)\[Minus]1.160`28,(*2*)0.60`28,(*3*)2.458`28,
(*4*)2.7928473446`28,(*5*)\[Minus]1.9130427`28,
(*6*)\[Minus]0.6507`28,(*7*)\[Minus]1.250`28,
(*8*)\[Minus]0.613`28
};


nugegmZero=Chop[nugegm/.Q2->0,choplimit];
(*rencon2 & c1c2 calc sum-square cp1*)(*\:8ba1\:7b97\:6ce2\:51fd\:6570\:91cd\:6574\:5316\:5e38\:6570*)
rencon=Table[1,{ren,1,2,1},{io,1,8,1}];
(*\:6309\:7167\:7b2c\:4e00\:79cd\:65b9\:5f0f\:8ba1\:7b97\:7684\:91cd\:6574\:5316\:5e38\:6570*)
Table[rencon[[ren=1,io]]=octcharge[[io]]/(octcharge[[io]]+nugegmZero[[gegm=1,seva=1,io]]),{io,{1,3,4,6}}];
rencon[[ren=1,8]]=1/(1+nugegmZero[[gegm=1,seva=2,io=8]]);
(*\:6309\:7167\:7b2c\:4e8c\:79cd\:65b9\:5f0f\:8ba1\:7b97\:7684\:91cd\:6574\:5316\:5e38\:6570*)
Table[rencon[[ren=2,io]]=Abs[octcharge[[io]]-nugegmZero[[gegm=1,seva=1,io]]],{io,{1,3,4,6}}];
rencon[[ren=2,8]]=Abs[1-nugegmZero[[gegm=1,seva=2,io=8]]];
(*+++++++++++++++renormalized isospin+++++++++++++++++++++*)
rencon[[All,2]]=rencon[[All,3]];
rencon[[All,5]]=rencon[[All,4]];
rencon[[All,7]]=rencon[[All,6]];
echo["wave renormalization constants"]
StringRiffle[N[rencon,3]]


magNum=nugegmZero[[2,1]];(*\:8ba1\:7b97\:51fa\:7684octet\:78c1\:77e9*)
cccReslt=AssociationThread[
{
"Sigma1",
"Sigma2",
"{1,4}",
"{1,6}",
"Nucleon",
"{4,6}",
"Cascade",
"{1,3,4,5}",
"{1,3,4,5,6,7}",
"{1,3,4,5,8}",
"Baryons"
},
Table[
{
NMinimize[(*\:6309\:7167\:7b2c1\:79cd\:91cd\:6574\:5316\:5e38\:6570 Z*(tree+loop)*)
{
Total[((rencon[[ren=1]]*(magc1c2c3+magNum)-octmagNum)^2)[[conf]]],
{c1,c2}\[Element]Reals
},
{c1,c2}
,WorkingPrecision->20
],
NMinimize[(*\:6309\:7167\:7b2c2\:79cd\:91cd\:6574\:5316\:5e38\:6570 Z*tree+loop*)
{
Total[((rencon[[ren=2]]*magc1c2c3+magNum-octmagNum)^2)[[conf]]],
{c1,c2}\[Element]Reals
},
{c1,c2}
,WorkingPrecision->20
]
}
,{
conf,{
{1,3},
{1,2,3},
{1,4},
{1,6},
{4,5},
{4,6},
{6,7},
{1,3,4,5},
{1,3,4,5,6,7},
{1,3,4,5,8},
{1,3,4,5,6,7,8}
}
}
]
];
cccReslt["ci"]=parci;
cccReslt["\[CapitalLambda]0"]=parLambda0;


(* ::Chapter:: *)
(*storage*)


echo["output directory"];
outputdir=FileNameJoin[{gitLocalName,"/expression-mfiles/"}]


echo["files to export"];(*\:8981\:5bfc\:51fa\:7684\:6587\:4ef6,\:5173\:8054\:7684\:5f62\:5f0f\:ff0c\:4fdd\:5b58\:7528\:7684\:6587\:4ef6\:540d\[Rule]\:5bf9\:5e94\:7684\:6587\:4ef6*)
outputAssoc=<|
(*++++++++++++++++*)
FileNameJoin[{outputdir,"c1c2_magfit_L_"<>parLambda0Str<>"_ci_"<>parciStr<>".m"}]->cccReslt
(*++++++++++++++++*)
|>;


echo["output status"];
KeyValueMap[Export,outputAssoc]
