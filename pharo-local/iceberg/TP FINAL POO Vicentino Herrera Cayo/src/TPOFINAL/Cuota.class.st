Class {
	#name : #Cuota,
	#superclass : #Object,
	#instVars : [
		'fechaVencimiento',
		'estado'
	],
	#category : #TPOFINAL
}

{ #category : #constructor }
Cuota class >> crear: unaFecha [
	|nuevaCuota|
	nuevaCuota := self new.
	nuevaCuota inicializar:unaFecha.
	^nuevaCuota 
]

{ #category : #queries }
Cuota >> cuotaPagada [
^estado not.
]

{ #category : #queries }
Cuota >> inicializar:unaFecha [
fechaVencimiento := unaFecha .
estado:= false

]

{ #category : #queries }
Cuota >> pagar [
estado:=true
]

{ #category : #queries }
Cuota >> revisarFechaVencimiento [
^ ((Date today<fechaVencimiento) & (Date today>= (fechaVencimiento - 7 days))). "es decir que esta en los ultimos 7 dias"
]
