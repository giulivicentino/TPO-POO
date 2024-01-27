Class {
	#name : #Tabla,
	#superclass : #ScrollPane,
	#instVars : [
		'colorTexto',
		'x',
		'y',
		'ultimoY',
		'cabecera',
		'fondoCabecera'
	],
	#category : #'TPOFINAL VISUAL'
}

{ #category : #'as yet unclassified' }
Tabla class >> crear:xIn y:yIn [
^ self new iniciar:xIn y:yIn.
]

{ #category : #'as yet unclassified' }
Tabla class >> crear:xIn y:yIn cabecera:cabecera [
^ self new iniciar:xIn y:yIn cabecera:cabecera.
]

{ #category : #'as yet unclassified' }
Tabla >> agregarTexto:texto [
| label |
    label := texto asStringMorph.
    label position: 5@ultimoY.
    ultimoY := ultimoY + 15.
	 colorTexto add: label.
    self scroller addMorph: label behind: fondoCabecera.
]

{ #category : #'as yet unclassified' }
Tabla >> iniciar:xIn y:yIn [
x := xIn.
	y := yIn.
	ultimoY := 40.
	self extent: x@y.
	self color: Color black.
	colorTexto := OrderedCollection new.
]

{ #category : #'as yet unclassified' }
Tabla >> iniciar:xIn y:yIn cabecera:cabeceraIn [
x := xIn.
	y := yIn.
	ultimoY := 40.
	self extent: x@y.
	self color: Color white.
	self borderWidth: 2.
	self borderColor: Color lightBlue.
	colorTexto := OrderedCollection new.
	cabecera := cabeceraIn asStringMorph.
	fondoCabecera := Morph new.
	fondoCabecera extent: x@30.
	fondoCabecera color: Color white.
	fondoCabecera borderColor: Color lightBlue.
	fondoCabecera borderWidth: 2.
	cabecera borderColor: Color lightBlue.
	cabecera borderWidth: 2.
	cabecera position:5@10.
	self addMorph: fondoCabecera .
	self addMorphFront: cabecera. 
]

{ #category : #'as yet unclassified' }
Tabla >> resetear [
colorTexto do: [:textMorph | textMorph delete. ].
	colorTexto := OrderedCollection new.
	ultimoY := 40.
]
