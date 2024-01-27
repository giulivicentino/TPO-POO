Class {
	#name : #Viaje,
	#superclass : #Object,
	#instVars : [
		'nombre',
		'costoPersona',
		'impuestos'
	],
	#category : #TPOFINAL
}

{ #category : #constructor }
Viaje class >> crear: unNombre conCostoPersona:unCosto conImpuestos:unosImpuestos [
|nuevoViaje|
nuevoViaje := self new.
nuevoViaje inicializar:unNombre conCostoPersona:unCosto conImpuestos:unosImpuestos.
^nuevoViaje 
]

{ #category : #queries }
Viaje >> esIgual: unNombre [
^ nombre = unNombre.
]

{ #category : #accessing }
Viaje >> getCostoXPersona [
^ costoPersona.
]

{ #category : #accessing }
Viaje >> getImpuesto [
^ impuestos.
]

{ #category : #accessing }
Viaje >> getNombre [
^ nombre.
]

{ #category : #queries }
Viaje >> inicializar:unNombre conCostoPersona:unCosto conImpuestos:unosImpuestos [
nombre := unNombre .
costoPersona :=unCosto .
impuestos := unosImpuestos .
]

{ #category : #queries }
Viaje >> modificarFecha: fecha1 conFecha2: fecha2 [
self subclassResponsibility.
]

{ #category : #queries }
Viaje >> obtenerCostoTotal: cantPersonas [
^ (costoPersona * cantPersonas) + impuestos.
]

{ #category : #accessing }
Viaje >> setCostoPersona: nuevoCosto [
costoPersona := nuevoCosto.
]

{ #category : #accessing }
Viaje >> setValorImpuesto: nuevoValor [
impuestos := nuevoValor.
]

{ #category : #printing }
Viaje >> toString [
^ nombre, 'costo: ',costoPersona.
]

{ #category : #queries }
Viaje >> verificarFecha: fecha1 conOtraFecha: fecha2 [
self subclassResponsibility.
]
