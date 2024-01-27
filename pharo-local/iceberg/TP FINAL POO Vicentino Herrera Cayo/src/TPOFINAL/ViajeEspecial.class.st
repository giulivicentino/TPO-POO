Class {
	#name : #ViajeEspecial,
	#superclass : #Viaje,
	#instVars : [
		'disponibilidad',
		'fechaSalida',
		'ciudad',
		'fechaRegreso'
	],
	#category : #TPOFINAL
}

{ #category : #constructor }
ViajeEspecial class >> crear: unNombre conCostoPersona:unCosto conImpuestos:unosImpuestos conDisponibilidad:unaDisponibilidad conFechaSalida: unaFechaS conCiudad:unaCiudad conFechaRegreso:unaFechaR [
|nuevoViajeEspecial|
nuevoViajeEspecial := self crear: unNombre conCostoPersona:unCosto conImpuestos:unosImpuestos.
nuevoViajeEspecial inicializar:unaDisponibilidad conFechaSalida: unaFechaS conCiudad:unaCiudad conFechaRegreso:unaFechaR.
^nuevoViajeEspecial 
]

{ #category : #queries }
ViajeEspecial >> inicializar:unaDisponibilidad conFechaSalida: unaFechaS conCiudad:unaCiudad conFechaRegreso:unaFechaR [
disponibilidad := unaDisponibilidad .
fechaSalida :=unaFechaS .
fechaRegreso := unaFechaR .
ciudad:= unaCiudad.

]

{ #category : #queries }
ViajeEspecial >> modificarFecha: fecha1 conFecha2: fecha2 [
|fueModificada|.
fueModificada := false.
(fecha2>=fecha1) ifTrue:[fueModificada := true. fechaSalida := fecha1. fechaRegreso := fecha2].
^ fueModificada.
]

{ #category : #queries }
ViajeEspecial >> verificarFecha: fecha1 conOtraFecha: fecha2 [
|rta|.
rta := false.
((disponibilidad) > 0 & (fechaSalida>=fecha1) & (fechaSalida<=fecha2)) ifTrue:[rta := true].
^ rta.
]
