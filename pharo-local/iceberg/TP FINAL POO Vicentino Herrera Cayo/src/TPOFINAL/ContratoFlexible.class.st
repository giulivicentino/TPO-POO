Class {
	#name : #ContratoFlexible,
	#superclass : #Contrato,
	#instVars : [
		'valorPlus'
	],
	#category : #TPOFINAL
}

{ #category : #constructor }
ContratoFlexible class >> crear:unNumero conFechaCreacion: unaFechaCreacion conViaje: unViaje conFechaViaje: unaFechaV conCantPersonas:unaCantPersonas conColCuotas:unaColCuotas conCantCuotas:unaCant conValorPlus: unValorPlus [
	|nuevoContratoFlexible|
	nuevoContratoFlexible := self crear:unNumero conFechaCreacion: unaFechaCreacion conViaje: unViaje conFechaViaje: unaFechaV conCantPersonas:unaCantPersonas conColCuotas:unaColCuotas conCantCuotas:unaCant.
	nuevoContratoFlexible inicializar.
	^nuevoContratoFlexible 
]

{ #category : #queries }
ContratoFlexible >> inicializar [
valorPlus := (((refViaje getCostoXPersona) * cantPersonas) + (((refViaje getCostoXPersona) * cantPersonas)*0.10)).
]

{ #category : #queries }
ContratoFlexible >> inicializar:unValorPlus [
valorPlus :=unValorPlus 
]

{ #category : #'punto_e' }
ContratoFlexible >> modificarContratoB: unaFecha [ 
|modificacionValida|

(self tieneViajeOrganizado) ifTrue: [ (refViaje buscaFecha: unaFecha conCupo: cantPersonas )ifTrue: [ self fechaViaje: unaFecha. modificacionValida := true.  ] ifFalse: [ modificacionValida := false ]  ] ifFalse: [ modificacionValida := false ].
^ modificacionValida. 
]

{ #category : #'punto_e' }
ContratoFlexible >> reembolsar [
|elReembolso elCosto elImpuesto|
elCosto := refViaje getCostoXPersona.
elImpuesto := refViaje getImpuesto.
((Date today) <= (fechaViaje addMonths: -3))ifTrue: [
    elReembolso := ((0,75)* ((elCosto * cantPersonas) + elImpuesto )).
] ifFalse: [
	elReembolso := ((0,25)* ((elCosto * cantPersonas) + elImpuesto)).
    ((Date today) > (fechaViaje addMonths: -3) & ((Date today) < (fechaViaje addMonths: -2))) ifTrue: [
        elReembolso := ((0,50)* ((elCosto * cantPersonas) + elImpuesto )).
    ] 
    ].																	 
^ elReembolso 

]
