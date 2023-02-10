(* ::Package:: *)

(* ::Section:: *)
(*Package Header*)


BeginPackage["ArnoudBuzing`Mosaic`"];


(* ::Text:: *)
(*Declare your public symbols here:*)


ImageSquareQ;


Begin["`Private`"];


(* ::Section:: *)
(*Definitions*)


(* ::Text:: *)
(*Define your public and private symbols here:*)


ImageSquareQ[image_Image] := Equal @@ ImageDimensions[image];


(* ::Section::Closed:: *)
(*Package Footer*)


End[];
EndPackage[];
