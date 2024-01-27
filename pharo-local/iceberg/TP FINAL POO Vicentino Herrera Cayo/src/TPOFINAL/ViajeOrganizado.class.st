Class {
	#name : #ViajeOrganizado,
	#superclass : #Viaje,
	#instVars : [
		'cantDias',
		'colEtapas',
		'colOpcionesSalida',
		'colExcursiones'
	],
	#category : #TPOFINAL
}

{ #category : #constructor }
ViajeOrganizado class >> crear: unNombre conCostoPersona:unCosto conImpuestos:unosImpuestos conCantDias:unaCantDias conColEtapas:unaColEtapas conColOpcionesSalida: unaColOpSalida [
|nuevoViajeOrganizado|
nuevoViajeOrganizado := self crear: unNombre conCostoPersona:unCosto conImpuestos:unosImpuestos.
nuevoViajeOrganizado inicializar:unaCantDias conColEtapas:unaColEtapas conColOpcionesSalida: unaColOpSalida.
^nuevoViajeOrganizado 
]

{ #category : #queries }
ViajeOrganizado >> actualizarExcursionesEnViaje: unaExcursion [
colExcursiones add: unaExcursion.
]

{ #category : #queries }
ViajeOrganizado >> agregarExcursion: unaExcursion [
colExcursiones add:unaExcursion
]

{ #category : #queries }
ViajeOrganizado >> buscaFecha: laFecha conCupo: laCantPersonas [
|fechaDisponible|
fechaDisponible := colOpcionesSalida detect: [ :cdaOpSalida | cdaOpSalida " como comparo elementos de una dupla??"  ].
^ fechaDisponible .
]

{ #category : #queries }
ViajeOrganizado >> inicializar:unaCantDias conColEtapas:unaColEtapas conColOpcionesSalida: unaColOpSalida [
cantDias := unaCantDias .
colEtapas := unaColEtapas .
colOpcionesSalida := unaColOpSalida .
colExcursiones := OrderedCollection new.
]

{ #category : #queries }
ViajeOrganizado >> liberarCupo: laCantPersonas enFecha: laFecha [ 
"si existe una opSalida en colOpcionesSalida tal que fechaSalida == laFecha entonces cupo := cupo + laCantPersonas "
]

{ #category : #queries }
ViajeOrganizado >> modificarFecha: fecha1 conFecha2: fecha2 [
|fueModificada valorAux|.
fueModificada := false.
colOpcionesSalida keysAndValuesDo: [:clave :valor | (clave=fecha1) ifTrue:[valorAux := valor.colOpcionesSalida remove: clave. colOpcionesSalida at:fecha2 put: valorAux. fueModificada := true]].
^ fueModificada.
]

{ #category : #queries }
ViajeOrganizado >> verificarFecha: fecha1 conOtraFecha: fecha2 [
|rta|
rta:=true.
colOpcionesSalida keysAndValuesDo: [:clave :cupo| ((clave>=fecha1) & (clave<=fecha2) & (cupo>0)) ifTrue:[rta:=true]].
^ rta.
]
