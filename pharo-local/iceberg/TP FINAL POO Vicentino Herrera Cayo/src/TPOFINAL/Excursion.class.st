Class {
	#name : #Excursion,
	#superclass : #Object,
	#instVars : [
		'costo',
		'cantPersonasE'
	],
	#category : #TPOFINAL
}

{ #category : #constructor }
Excursion class >> crar:unCosto conCantPersonasE: unaCant [
	|nuevaExcursion|
	nuevaExcursion := self new.
	nuevaExcursion inicializar:unCosto conCantPersonasE: unaCant.
	^nuevaExcursion 
]

{ #category : #constructor }
Excursion class >> crear: unCosto conCantPersonasE: unaCant [
	|nuevaExcursion|
	nuevaExcursion := self new.
	nuevaExcursion inicializar:unCosto conCantPersonasE: unaCant.
	^nuevaExcursion 
]

{ #category : #queries }
Excursion >> actualizarCantPersonasE: unaCantPersonas [
cantPersonasE := unaCantPersonas 
]

{ #category : #queries }
Excursion >> inicializar:unCosto conCantPersonasE: unaCant [
costo := unCosto .
cantPersonasE := unaCant .
]
