Class {
	#name : #Etapa,
	#superclass : #Object,
	#instVars : [
		'fechaLlegada',
		'diasEnCiudad',
		'hotel',
		'tipoPension',
		'listaActividades'
	],
	#category : #TPOFINAL
}

{ #category : #constructor }
Etapa class >> crear:unaFechaLlegada conDiasEnCiudad:unosDias conHotel:unHotel conTipoPension:unTipo conListaActividades:unaLista [
	|nuevaEtapa|
	nuevaEtapa := self new.
	nuevaEtapa inicializar:unaFechaLlegada conDiasEnCiudad:unosDias conHotel:unHotel conTipoPension:unTipo conListaActividades:unaLista.
	^ nuevaEtapa 
]

{ #category : #queries }
Etapa >> inicializar:unaFechaLlegada conDiasEnCiudad:unosDias conHotel:unHotel conTipoPension:unTipo conListaActividades:unaLista [
fechaLlegada :=unaFechaLlegada .
diasEnCiudad := unosDias .
hotel :=unHotel.
listaActividades := unaLista
]
