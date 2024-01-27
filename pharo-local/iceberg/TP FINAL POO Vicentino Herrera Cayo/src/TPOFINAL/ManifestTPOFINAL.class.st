"
Please describe the package using the class comment of the included manifest class. The manifest class also includes other additional metadata for the package. These meta data are used by other tools such as the SmalllintManifestChecker and the critics Browser
"
Class {
	#name : #ManifestTPOFINAL,
	#superclass : #PackageManifest,
	#category : #'TPOFINAL-Manifest'
}

{ #category : #'code-critics' }
ManifestTPOFINAL class >> ruleGuardingClauseRuleV1FalsePositive [

	<ignoreForCoverage>
	^ #(#(#(#RGPackageDefinition #(#TPOFINAL)) #'2023-07-28T20:49:39.187-03:00') )
]
