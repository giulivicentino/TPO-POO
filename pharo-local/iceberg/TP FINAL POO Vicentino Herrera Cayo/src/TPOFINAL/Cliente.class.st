Class {
	#name : #Cliente,
	#superclass : #Object,
	#instVars : [
		'apellido',
		'dni',
		'ciudadResidencia',
		'contacto',
		'colContratos',
		'contrasenia'
	],
	#category : #TPOFINAL
}

{ #category : #constructor }
Cliente class >> crear: unApellido conDni: unDni conCiudadResidencia: unaCiudad conContacto: unContacto conContrasenia: unaContra [
|nuevoCliente|
nuevoCliente:=self new.
nuevoCliente inicializar: unApellido conDni: unDni conCiudadResidencia: unaCiudad conContacto: unContacto conContrasenia: unaContra.
^ nuevoCliente.

]

{ #category : #queries }
Cliente >> agregarContrato: unContrato [
colContratos add:unContrato.
]

{ #category : #queries }
Cliente >> agregarContrato: unNumero conViaje: unViaje conFechaViaje: unaFecha conPersonas: personas conCuotas: cuotas [
|unContrato|.
unContrato := Contrato crear: unNumero conFechaCreacion: Date today conViaje: unViaje conFechaViaje: unaFecha conCantPersonas: personas conColCuotas: cuotas conCantCuotas: cuotas size.
colContratos add: unContrato.
]

{ #category : #accessing }
Cliente >> apellido [

	^ apellido
]

{ #category : #accessing }
Cliente >> apellido: anObject [

	apellido := anObject
]

{ #category : #queries }
Cliente >> buscarContrato: nroContrato [
|rta|.
rta := colContratos detect:[:unContrato | unContrato esIgual: nroContrato].
^ rta .
]

{ #category : #queries }
Cliente >> buscarContratoAPagar: unNroContrato [
|elContrato|
elContrato := colContratos detect: [:cadaContrato| (cadaContrato numero = unNroContrato )].
^ elContrato.
]

{ #category : #'punto_e' }
Cliente >> cancelarContratoA: unNroContrato [
|elContrato elReembolso elViaje laFecha laCantPersonas|
elContrato  := (colContratos detect: [:cdaContrato | (cdaContrato getNroContrato = unNroContrato  )]).
elReembolso := elContrato reembolsar.
elViaje := elContrato getRefViaje.
laFecha := elContrato getFechaViaje.
laCantPersonas := elContrato getCantPersonas.
elViaje liberarCupo: laCantPersonas enFecha: laFecha .
colContratos remove: [ :cdaContrato | cdaContrato = elContrato].
^ elReembolso .
]

{ #category : #accessing }
Cliente >> ciudadResidencia [

	^ ciudadResidencia
]

{ #category : #accessing }
Cliente >> ciudadResidencia: anObject [

	ciudadResidencia := anObject
]

{ #category : #accessing }
Cliente >> colContratos [

	^ colContratos
]

{ #category : #accessing }
Cliente >> colContratos: anObject [

	colContratos := anObject
]

{ #category : #accessing }
Cliente >> contacto [

	^ contacto
]

{ #category : #accessing }
Cliente >> contacto: anObject [

	contacto := anObject
]

{ #category : #accessing }
Cliente >> dni [

	^ dni
]

{ #category : #accessing }
Cliente >> dni: anObject [

	dni := anObject
]

{ #category : #queries }
Cliente >> eliminarRefViaje: unNombreViaje [
colContratos do:[:contrato | (contrato tieneViaje: unNombreViaje) ifTrue:[colContratos remove: contrato]].
]

{ #category : #queries }
Cliente >> esIgual: unDni [
^ dni asString = unDni asString.
]

{ #category : #queries }
Cliente >> getContrasenia [
^ contrasenia.
]

{ #category : #accessing }
Cliente >> getContratos [
^ colContratos.
]

{ #category : #'as yet unclassified' }
Cliente >> getContratosString [
|contratos|.
contratos := OrderedCollection new.
colContratos do:[:contrato | contratos add: contrato toString].
^ contratos.

]

{ #category : #queries }
Cliente >> inicializar: unApellido conDni: unDni conCiudadResidencia: unaCiudad conContacto: unContacto conContrasenia: unaContrasenia [
apellido:= unApellido .
dni:= unDni .
ciudadResidencia := unaCiudad .
contacto := unContacto .
colContratos := OrderedCollection new.
contrasenia := unaContrasenia.
]

{ #category : #queries }
Cliente >> obtenerContrato: nroContrato [
|rta|.
rta := colContratos detect:[:unContrato | unContrato esIgual: nroContrato].
^ rta.
]

{ #category : #queries }
Cliente >> pagarCuotas: cantCuotasAPagar conContrato: elContrato [
^ elContrato cancelarCuotas: cantCuotasAPagar.
]

{ #category : #queries }
Cliente >> revisarContratos [
|rta|.
rta := colContratos detect:[:contrato | contrato revisarCuotas] ifNone:[nil]."se fija si hay un contrato con cuotas sin pagar a punto de vencer"
^ rta isNotNil.
]

{ #category : #queries }
Cliente >> tieneContrato: nroContrato [
|rta|.
rta := colContratos detect:[:unContrato | unContrato esIgual: nroContrato].
^ rta isNotNil .
]
