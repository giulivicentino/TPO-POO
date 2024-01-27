"
Please describe the package using the class comment of the included manifest class. The manifest class also includes other additional metadata for the package. These meta data are used by other tools such as the SmalllintManifestChecker and the critics Browser
"
Class {
	#name : #ManifestTPOFINALVISUAL,
	#superclass : #PackageManifest,
	#category : #'TPOFINAL VISUAL-Manifest'
}

{ #category : #'code-critics' }
ManifestTPOFINALVISUAL class >> ruleStringConcatenationRuleV1FalsePositive [

	<ignoreForCoverage>
	^ #(#(#(#RGMethodDefinition #(#VentanaContratos #crearTabla: #false)) #'2024-01-25T19:47:47.289-03:00') #(#(#RGPackageDefinition #(#'TPOFINAL VISUAL')) #'2024-01-25T19:47:55.281-03:00') )
]
