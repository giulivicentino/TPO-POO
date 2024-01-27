Class {
	#name : #ClienteFrecuente,
	#superclass : #Cliente,
	#instVars : [
		'millas'
	],
	#category : #TPOFINAL
}

{ #category : #constructor }
ClienteFrecuente class >> crear: unApellido conDni: unDni conCiudadResidencia: unaCiudad conContacto: unContacto conMillas: unasMillas conContrasenia: unaContra [
|nuevoClienteFrecuente|
nuevoClienteFrecuente := self crear: unApellido conDni: unDni conCiudadResidencia: unaCiudad conContacto: unContacto conContrasenia: unaContra.
nuevoClienteFrecuente inicializar: unasMillas.
^nuevoClienteFrecuente 
]

{ #category : #'punto_e' }
ClienteFrecuente >> cancelarContratoA: unNroContrato [
|elReembolso|
elReembolso := super cancelarContratoA: unNroContrato. 
millas := millas + elReembolso.
^ elReembolso .
]

{ #category : #accessing }
ClienteFrecuente >> getMillas [
^ millas.
]

{ #category : #queries }
ClienteFrecuente >> inicializar: unasMillas [
millas:= unasMillas .
]

{ #category : #queries }
ClienteFrecuente >> pagarCuotasCFrecuente: cantCuotasAPagar conQuiereMillas: quiereMillas conContrato: elContrato [
|rta|.
rta := elContrato pagarContratoFrecuente: cantCuotasAPagar conQuiereMillas: quiereMillas conCliente: self.
^ rta.

]

{ #category : #accessing }
ClienteFrecuente >> setMillas: unasMillas [
millas := unasMillas.
]
