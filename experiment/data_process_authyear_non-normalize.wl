(* ::Package:: *)

(* ::Title:: *)
(*data_process_authyear_non-normalize.nb*)


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
(*\:5b9a\:4e49\:4e00\:4e2a\:5e38\:7528\:7684\:6253\:5370\:51fd\:6570*)
echo[x_]:=Print["----------------------------","\n",ToString[x],"\n","----------------------------"];


(* ::Text:: *)
(*********************************** notebook \:5907\:5fd8\:5f55*)


(* ::Text:: *)
(*series full calc scripts*)


(* ::Chapter:: *)
(*import*)


(* ::Text:: *)
(*\:6570\:636e\:7684\:5bfc\:5165\:987a\:5e8f\:662f*)


(* ::DisplayFormula:: *)
(*{ge . n,ge . p,gm . n,gm . p}*)


(* ::Input:: *)
(*xlxs`list=FileNames["data.FF."~~("ge"|"gm")~~__~~".xlsx",*)
(*FileNameJoin[{git`local`name,"experiment"}]*)
(*];*)
(*xlxs`list//TableForm*)


(* ::Input:: *)
(*data=Import/@xlxs`list;*)


(* ::Input:: *)
(*data//Dimensions*)


(* ::Input:: *)
(*data[[2]]//Dimensions*)


(* ::Text:: *)
(*\:53bb\:9664\:7a7a\:683c*)


(* ::Input:: *)
(*data`trim1=DeleteCases[data,"",{-1}];*)


(* ::Text:: *)
(*\:53bb\:9664\:7a7a\:884c*)


(* ::Input:: *)
(*data`trim2=DeleteCases[data`trim1,{},{-2}];*)


(* ::Text:: *)
(*\:53bb\:9664 None*)


(* ::Input:: *)
(*data`trim3=DeleteCases[data`trim2,{__,Repeated["none"],__},{-2}];*)


(* ::Text:: *)
(**************************************)


(* ::Input:: *)
(*data`trim2[[2,1]]*)
(*data`trim3[[3,2]]*)


(* ::Section::Closed:: *)
(*test*)


(* ::Input:: *)
(*data`trim3[[4]]*)


(* ::Chapter:: *)
(*add refs*)


(* ::Input:: *)
(*data`keys=Range[4];*)


(* ::Section:: *)
(*data`keys*)


(* ::DisplayFormula:: *)
(*{ge . n, ge . p, gm . n, gm . p}*)


(* ::Input:: *)
(*term=1;*)
(*data`keys[[term]]={"Eden1994","Bruins1995","Herberg1999",*)
(*"Ostrick1999","Passchier1999","Golak2001",*)
(*"Bermuth2003","Madey2003","Warren2003",*)
(*"Glazier2005"*)
(*};*)


(* ::Input:: *)
(*term=1;*)
(*data`keys[[term]]//Dimensions*)
(*data`trim3[[term]]//Dimensions*)


(* ::Text:: *)
(**************************)


(* ::Input:: *)
(*term=2;*)
(*data`keys[[term]]={*)
(*"Janssens1966","Berger1971","Price1971",*)
(*"Hanson1973","Murphy1974","Hohler1976",*)
(*"Simon1980","Walker1994","Arrington2007"*)
(*};*)


(* ::Input:: *)
(*term=2;*)
(*data`keys[[term]]//Dimensions*)
(*data`trim3[[term]]//Dimensions*)


(* ::Text:: *)
(*****************************)


(* ::Input:: *)
(*term=3;*)
(*data`keys[[term]]={*)
(*"Golak2001","Bartel1973","Markowitz1993",*)
(*"Anklin1994","Bruins1995","Anklin1998",*)
(*"Xu2000","Kubon2002","Madey2003",*)
(*"Xu2003"*)
(*};*)


(* ::Input:: *)
(*term=3;*)
(*data`keys[[term]]//Dimensions*)
(*data`trim3[[term]]//Dimensions*)


(* ::Text:: *)
(*********************)


(* ::Input:: *)
(*term=4;*)
(*data`keys[[term]]={*)
(*"Janssens1966","Berger1971","Price1971",*)
(*"Hanson1973","Walker1994","Bartel1973","Arrington2007"*)
(*};*)


(* ::Input:: *)
(*term=4;*)
(*data`keys[[term]]//Dimensions*)
(*data`trim3[[term]]//Dimensions*)


(* ::Section:: *)
(*assoc`data*)


(* ::Text:: *)
(*\:4ea7\:751f association, \:7528\:6765\:5b58\:8d2e\:6570\:636e*)


(* ::Input:: *)
(*assoc`data=Table[*)
(*AssociationThread[data`keys[[term]],data`trim3[[term]]]*)
(*,{term,1,4,1}*)
(*];*)


(* ::Subsection:: *)
(*test*)


(* ::Input:: *)
(*term=4;*)
(*assoc`data[[term]]*)


(* ::Chapter:: *)
(*experiment*)


(* ::Section:: *)
(*rearrange data*)


(* ::DisplayFormula:: *)
(*Values[assoc`expr][[inde, refe, entr, item]],*)
(*{inde, ge.p, ge.n, etc},*)
(*{refe, different authors},*)
(*{entr, row of tables},*)
(*{item, collum of tables}*)


(* ::Text:: *)
(*\:7ed9\:51fa \:5b9e\:9a8c\:6570\:636e\:7684 keys \:548c\:76f8\:5e94\:7684\:6570\:503c\:8868\:683c*)


(* ::Input:: *)
(*assoc`expr`keys=Keys[assoc`data];*)
(*assoc`expr`values=Values[assoc`data];*)


(* ::Text:: *)
(*\:628a\:5b9e\:9a8c\:5ba4\:636e\:5c01\:88c5\:6210\:5e26\:6709 errorbar \:7684\:5f62\:5f0f\:ff0c*)
(*\:7b2c\:4e00\:5217\:662f Q2\:ff0c\:5373\:81ea\:53d8\:91cf\:7684\:503c*)
(*\:8fd9\:91cc\:7b2c\:4e8c\:5217\:662f\:4e2d\:5fc3\:503c*)
(*\:7b2c\:56db\:5217\:662fdown error\:ff0c\:7b2c\:4e09\:5217\:662fup error*)


(* ::Text:: *)
(*\:5bf9 gm \:6570\:636e\:ff0c\:53d6\:7edd\:5bf9\:503c, \:5e76\:9664\:4ee5\:76f8\:5e94\:7684\:5e45\:503c\:8fdb\:884c\:5f52\:4e00\:5316*)


(* ::Input:: *)
(*assoc`expr`values`normal`factor={1,1,1.9130427,2.7928473446};*)


(* ::Input:: *)
(*assoc`expr`values`re=Table[*)
(*{*)
(*assoc`expr`values[[inde,refe,entr,1]],*)
(**)
(*Around[*)
(*If[inde<=2,*)
(*assoc`expr`values[[inde,refe,entr,2]],*)
(*Identity[assoc`expr`values[[inde,refe,entr,2]]*)
(*]],(*center value*)*)
(**)
(*{*)
(*assoc`expr`values[[inde,refe,entr,4]],(*down error*)*)
(*assoc`expr`values[[inde,refe,entr,3]](*up error*)*)
(*}*)
(*]*)
(*}*)
(**)
(**)
(*,{inde,1,4,1}*)
(*,{refe,1,Length[assoc`expr`values[[inde]]],1}*)
(*,{entr,3,Length[assoc`expr`values[[inde,refe]]],1}(*\:5ffd\:7565\:8868\:683c\:7684\:6807\:9898\:884c\:548c\:5355\:4f4d\:884c*)*)
(*];*)


(* ::Text:: *)
(*\:91cd\:65b0\:7ec4\:6210\:5173\:8054*)


(* ::Input:: *)
(*assoc`expr=Table[*)
(**)
(*AssociationThread[*)
(*assoc`expr`keys[[inde]],*)
(*assoc`expr`values`re[[inde]]*)
(*]*)
(**)
(*,{inde,1,4,1}*)
(*];*)


(* ::Chapter:: *)
(*export*)


output`dir=FileNameJoin[{git`local`name,"/experiment/"}]


output`name`list={
FileNameJoin[{output`dir,
"nucleon_assoc_data_authyear_non-normalized"<>
".m"
}]
}


output`file`list={
assoc`expr
};


(* ::Input:: *)
(*Table[*)
(*Export[output`name`list[[i]],output`file`list[[i]]]*)
(*,{i,1,Length[output`file`list],1}];*)
