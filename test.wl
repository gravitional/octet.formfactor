(* ::Package:: *)

(* ::Title:: *)
(*test.wl*)


(* ::Chapter:: *)
(*initial 1*)


Once[
git`remote`name="octet.formfactor";
(*\:7ed9\:51fa\:8fdc\:7a0bgit\:4ed3\:5e93\:7684\:540d\:5b57*)
If[
(* if $ScriptCommandLine==={}, the environment is frontend*)
SameQ[$ScriptCommandLine,{}],
(*if execute in the frontend mode, refresh the title name*)
CompoundExpression[
(*\:6587\:4ef6\:7edd\:5bf9\:8def\:5f84*)
filename=NotebookFileName[],
(*\:5355\:5143\:5bf9\:8c61,\:7b2c\:4e00\:4e2a\:5355\:5143*)
cell`title=(Cells[][[1]]),
(*\:5237\:65b0\:7b2c\:4e00\:4e2a\:5355\:5143\:7684\:540d\:5b57*)
NotebookWrite[cell`title,Cell[FileNameSplit[filename][[-1]],"Title"]],
(*if execute in commandline mode, print a ready message*)
git`local`name=FileNameJoin[Append[TakeWhile[FileNameSplit[NotebookDirectory[]],UnsameQ[#1,git`remote`name]&],git`remote`name]]
(*add the base git root dir*)
],
CompoundExpression[
Print["Ready to execute this script"]
]
]
]


(* ::Text:: *)
(*********************************** notebook \:5907\:5fd8\:5f55*)


(* ::Text:: *)
(*series full calc scripts*)


(* ::Chapter:: *)
(*initial parameters*)


(* ::Text:: *)
(*++++++++++++++++++++++++++++++++++++++++++++*)


(* ::Text:: *)
(*\:6a21\:62df\:547d\:4ee4\:884c\:8f93\:5165,\:8c03\:8bd5\:4f7f\:7528*)


(* ::Text:: *)
(*parameter`marker, "Bars","Fences","Points", "Ellipses","Bands"*)


(* ::DisplayFormula:: *)
(*file`name,parameter`order,parameter`lambda0,parameter`ci,*)
(*calc`point`opacity,calc`errobar`marker,calc`errobar`opacity,*)
(*expr`errobar`style,expr`opacity*)


input`simulation={"/home/tom/octet.formfactor/Numeric.series-o1.rencon3/
f.figure.series-full.rencon3.strange.baryons-all.band.wl","full",0.90,1.50,
1,"Bands","{1,1,1,0.2,0.2,1,1,1}",
3,1
};


(* ::Text:: *)
(*"test.wl" "full" 0.90 1.50 1 "Bands" "{1,1,1,0.2,0.2,1,1,1}" 3 1*)


(* ::Text:: *)
(*++++++++++++++++++++++++++++++++++++++++*)


(* ::Text:: *)
(*\:5f15\:5165\:547d\:4ee4\:884c\:53c2\:6570, \:81ea\:52a8\:5224\:65ad\:662f\:5728\:547d\:4ee4\:884c\:4e0b\:8fd0\:884c\:ff0c\:8fd8\:662f\:5728\:7b14\:8bb0\:672c\:4e2d\:8fd0\:884c*)


If[
SameQ[$ScriptCommandLine,{}],
(*if execute in the frontend mode, refresh the title name*)
input`cml=input`simulation,
(*if execute in commandline mode, use $ScriptCommandLine as parameters*)
input`cml=$ScriptCommandLine
];


(* ::Text:: *)
(*+++++++++++++++++++++++++++++++++*)


Print["----------------------------","\n","the parameter order, lambda, ci is","\n","----------------------------"];


(* ::Text:: *)
(*ToExpression \:9ed8\:8ba4\:662f InputForm*)


{
file`name,parameter`order,parameter`lambda0,parameter`ci,
calc`point`opacity,calc`errobar`style,calc`errobar`opacity,
expr`errobar`style,expr`opacity
}={
input`cml[[1]],input`cml[[2]],ToExpression[input`cml[[3]]],ToExpression[input`cml[[4]]],
ToExpression[input`cml[[5]]],ToString[input`cml[[6]]],ToExpression[input`cml[[7]]],
ToExpression[input`cml[[8]]],ToExpression[input`cml[[9]]]
}


Print["----------------------------"];


git`local`name=FileNameJoin[Append[TakeWhile[FileNameSplit[ExpandFileName[file`name]],UnsameQ[#1,git`remote`name]&],git`remote`name]]


parameter`order`string=ToString[parameter`order]
parameter`lambda0`string=ToString[NumberForm[parameter`lambda0,{3,2}]]
parameter`ci`string=ToString[NumberForm[parameter`ci,{3,2}]]



