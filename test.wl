(* ::Package:: *)

(* ::Title:: *)
(*test.wl*)


(* ::Chapter:: *)
(*initial*)


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
(*\:5b9a\:4e49\:4e00\:4e2a\:5e38\:7528\:7684\:6253\:5370\:51fd\:6570*)
echo[x_]:=Print["----------------------------","\n",ToString[x],"\n","----------------------------"];


(* ::Text:: *)
(*********************************** notebook \:5907\:5fd8\:5f55*)


(* ::Text:: *)
(*series full calc scripts*)


(* ::Text:: *)
(*++++++++++++++++++++++++++++++++++++++++++++*)


(* ::Text:: *)
(*\:6a21\:62df\:547d\:4ee4\:884c\:8f93\:5165,\:8c03\:8bd5\:4f7f\:7528*)


(* ::Text:: *)
(*parameter`marker, "Bars","Fences","Points", "Ellipses","Bands"*)


(* ::DisplayFormula:: *)
(*file`name,parameter`order,parameter`lambda0,parameter`ci,*)


input`simulation={"/home/tom/octet.formfactor/f.figure.series-full.rencon3.strange.baryons-all.band.wl",
"<|\"a\" -> 1, \"b\" -> {323, \"dsf\", 3}|>"
};


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


(*\:6307\:5b9a\:57fa\:672c\:53c2\:6570\:ff0c\:6587\:4ef6\:540d*)
file`name=If[StringQ[input`cml[[1]]],input`cml[[1]],ToString[input`cml[[1]]]];


echo["the parameter inputed is"]


input`cml


echo["the git`local`name is"]


git`local`name=FileNameJoin[Append[TakeWhile[FileNameSplit[ExpandFileName[file`name]],UnsameQ[#1,git`remote`name]&],git`remote`name]]


(* ::Chapter:: *)
(*test*)


ToExpression[input`cml[[2]],InputForm]
