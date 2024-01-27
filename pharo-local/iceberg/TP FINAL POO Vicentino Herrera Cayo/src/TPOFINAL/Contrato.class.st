Class {
	#name : #Contrato,
	#superclass : #Object,
	#instVars : [
		'numero',
		'fechaCreacion',
		'refViaje',
		'fechaViaje',
		'cantPersonas',
		'colCuotas',
		'cantCuotas',
		'colExcursionesContrato'
	],
	#category : #TPOFINAL
}

{ #category : #constructor }
Contrato class >> crear:unNumero conFechaCreacion: unaFechaCreacion conViaje: unViaje conFechaViaje: unaFechaV conCantPersonas:unaCantPersonas conColCuotas:unaColCuotas conCantCuotas:unaCant [
|nuevoContrato|
nuevoContrato := self new.
nuevoContrato inicializar: unNumero conFechaCreacion: unaFechaCreacion conViaje: unViaje conFechaViaje: unaFechaV conCantPersonas:unaCantPersonas conColCuotas:unaColCuotas conCantCuotas:unaCant.
^nuevoContrato 
]

{ #category : #queries }
Contrato >> agregarExcursionOp: unaExcursion para: unaCantPersonas [
	|agregado|
	(unaCantPersonas <= cantPersonas) ifTrue: [(unaExcursion actualizarCantPersonasE: unaCantPersonas ).
															(refViaje actualizarExcursionesEnViaje: unaExcursion).
															(agregado := true).
															colExcursionesContrato add: unaExcursion.] 
														
												ifFalse: (agregado := false).
	
	^ agregado.  
	
]

{ #category : #queries }
Contrato >> cancelarCuotas: cuotasAPagar [
"este metodo da por sentado que la coleccion de cuotas está ordenada de modo que la ultima cuota es la mas proxima a vencer"
    |pagoExitoso cuotasAPagarAux cuotaAux|
    cuotasAPagarAux := cuotasAPagar.
"chequea que efectivamene tenga cuotas que pagar"
 1 to: cuotasAPagarAux  do: [:each|
	
      cuotaAux := colCuotas detect: [:unaCuota| (unaCuota cuotaPagada)].
 cuotaAux ifNotNil: [cuotaAux pagar. pagoExitoso := true]

    ].



    ^ pagoExitoso .
]

{ #category : #accessing }
Contrato >> cantCuotas [

	^ cantCuotas
]

{ #category : #accessing }
Contrato >> cantCuotas: anObject [

	cantCuotas := anObject
]

{ #category : #accessing }
Contrato >> cantPersonas [

	^ cantPersonas
]

{ #category : #accessing }
Contrato >> cantPersonas: anObject [

	cantPersonas := anObject
]

{ #category : #accessing }
Contrato >> colCuotas [

	^ colCuotas
]

{ #category : #accessing }
Contrato >> colCuotas: anObject [

	colCuotas := anObject
]

{ #category : #queries }
Contrato >> efectivizarContratoB [
|efectivizado|
efectivizado := ((cantCuotas  = 0) & (( fechaViaje > ((Date today) addDays: 7 )))).
^ efectivizado .
]

{ #category : #queries }
Contrato >> eliminarCuotas: cuotasAPagar [			
	"este metodo da por sentado que la coleccion de cuotas está ordenada de modo que la ultima cuota es la mas proxima a vencer"
	|pagoExitoso cuotasAPagarAux |
	cuotasAPagarAux := cuotasAPagar.
"chequea que efectivamene tenga cuotas que pagar"
 1 to: cuotasAPagarAux  size do: [ colCuotas detect: [ :unaCuota| (unaCuota cuotaPagada) ifTrue:[ unaCuota pagar.   cuotasAPagarAux := (cuotasAPagarAux - 1).pagoExitoso := true.  ] ]. ]. 
	
				
	^ pagoExitoso .
	
	 
]

{ #category : #queries }
Contrato >> esIgual: unNumContrato [
^unNumContrato = numero 
]

{ #category : #accessing }
Contrato >> fechaCreacion [

	^ fechaCreacion
]

{ #category : #accessing }
Contrato >> fechaCreacion: anObject [

	fechaCreacion := anObject
]

{ #category : #accessing }
Contrato >> fechaViaje [

	^ fechaViaje
]

{ #category : #accessing }
Contrato >> fechaViaje: anObject [

	fechaViaje := anObject
]

{ #category : #accessing }
Contrato >> getCantPersonas [
^ cantPersonas 
]

{ #category : #accessing }
Contrato >> getCuotas [
^ colCuotas.
]

{ #category : #accessing }
Contrato >> getFechaViaje [
^ fechaViaje 
]

{ #category : #accessing }
Contrato >> getNroContrato [
^ numero 
]

{ #category : #accessing }
Contrato >> getRefViaje [ 
^ refViaje 
]

{ #category : #queries }
Contrato >> inicializar: unNumero conFechaCreacion: unaFechaCreacion conViaje: unViaje conFechaViaje: unaFechaV conCantPersonas:unaCantPersonas conColCuotas:unaColCuotas conCantCuotas:unaCant [
numero:=unNumero.
fechaCreacion :=unaFechaCreacion .
refViaje := unViaje .
fechaViaje := unaFechaV .
colCuotas := unaColCuotas .
cantCuotas := unaCant .
cantPersonas := unaCantPersonas .
colExcursionesContrato := OrderedCollection new.
]

{ #category : #accessing }
Contrato >> numero [

	^ numero
]

{ #category : #accessing }
Contrato >> numero: anObject [

	numero := anObject
]

{ #category : #queries }
Contrato >> pagarContratoFrecuente: cantCuotasPagar conQuiereMillas: quiereMillas conCliente: unCliente [
|pagoExitoso costoTotal millasPosibles|.
pagoExitoso := self cancelarCuotas: cantCuotasPagar.
(pagoExitoso & quiereMillas) ifTrue:
	[
		|millasCliente|.
		millasCliente := unCliente getMillas.
		costoTotal := refViaje obtenerCostoTotal: cantPersonas.
		millasPosibles := costoTotal * 0.10.
		(millasCliente >= millasPosibles) ifTrue:[unCliente setMillas: millasCliente-millasPosibles].
	].
^ pagoExitoso.

]

{ #category : #accessing }
Contrato >> refViaje [

	^ refViaje
]

{ #category : #accessing }
Contrato >> refViaje: anObject [

	refViaje := anObject
]

{ #category : #queries }
Contrato >> revisarCuotas [
|rta|.
(colCuotas size > 0)ifTrue:[rta := colCuotas detect:[:cuota | cuota revisarFechaVencimiento] ifNone:[nil]].
^ rta isNotNil. 
]

{ #category : #queries }
Contrato >> tieneViaje: unNombreViaje [
^ refViaje esIgual: unNombreViaje.
]

{ #category : #queries }
Contrato >> toString [
^ 'Numero de contrato: ',numero asString,' | Nombre del viaje: ',refViaje getNombre,' | Fecha creacion: ',fechaCreacion asString,' | Cantidad de personas: ',cantPersonas asString,' | Cantidad de cuotas por pagar: ',cantCuotas asString,'.'.
]
