Class {
	#name : #BotonAccion,
	#superclass : #SimpleButtonMorph,
	#instVars : [
		'bloque'
	],
	#category : #'TPOFINAL VISUAL'
}

{ #category : #'as yet unclassified' }
BotonAccion >> mouseAction: unBloque [
^ bloque := unBloque.
]

{ #category : #'event handling' }
BotonAccion >> mouseUp: unEvento [
bloque value.
]
