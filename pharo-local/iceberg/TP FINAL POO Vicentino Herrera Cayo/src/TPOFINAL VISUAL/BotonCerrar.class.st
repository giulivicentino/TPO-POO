Class {
	#name : #BotonCerrar,
	#superclass : #BotonAccion,
	#category : #'TPOFINAL VISUAL'
}

{ #category : #initialization }
BotonCerrar >> initialize [
super initialize.
self label: ('CERRAR' asText allBold). self extent: 45@20; color: Color red; borderColor: Color darkGray ; borderWidth: 3.
]

{ #category : #'event handling' }
BotonCerrar >> mouseUp: unEvento [
super mouseUp: unEvento.
self owner delete.
]
