(* ::Package:: *)

(* ::Section:: *)
(*Package Header*)


BeginPackage["ArnoudBuzing`Mosaic`"];


(* ::Text:: *)
(*Declare your public symbols here:*)


ImageStrictlyPortraitQ;
ImagePortraitQ;
ImageStrictlyLandscapeQ;
ImageLandscapeQ;
ImageSquareQ;
Image3DCubeQ;
ImageCropResize;
AlphaChannelQ

RandomRomanNumeral;
RandomWikipediaData;


Begin["`Private`"];


(* ::Section:: *)
(*Definitions*)


(* ::Subsubsection:: *)
(*Image*)


ImageStrictlyPortraitQ[image_Image] := Less @@ ImageDimensions[image]
ImageStrictlyPortraitQ[___] := False

ImagePortraitQ[image_Image] := LessEqual @@ ImageDimensions[image]
ImagePortraitQ[___] := False

ImageStrictlyLandscapeQ[image_Image] := Greater @@ ImageDimensions[image]
ImageStrictlyLandscapeQ[___] := False

ImageLandscapeQ[image_Image] := GreaterEqual @@ ImageDimensions[image]
ImageLandscapeQ[___] := False

ImageSquareQ[image_Image] := Equal @@ ImageDimensions[image]
ImageSquareQ[___] := False

Image3DCubeQ[image_Image3D] := Equal @@ ImageDimensions[image]
Image3DCubeQ[___] := False

ImageCropResize[image_Image, dims_List] := First[ ConformImages[ {image}, dims, "Fill"]]
ImageCropResize[___] := $Failed

AlphaChannelQ[image:(_Image|_Image3D)] := Information[image,"Transparency"];
AlphaChannelQ[___] := False


(* ::Subsubsection:: *)
(*Random*)


RandomRomanNumeral[args___] := RomanNumeral[RandomInteger[args]];


RandomWikipediaData[] := Module[{response,topic},
	response=URLRead["https://en.wikipedia.org/wiki/Special:Random",FollowRedirects->False];
	topic=Last[FileNameSplit[Association[response["Headers"]]["location"]]];
	WikipediaData[topic]
]


(* ::Section::Closed:: *)
(*Package Footer*)


End[];
EndPackage[];
