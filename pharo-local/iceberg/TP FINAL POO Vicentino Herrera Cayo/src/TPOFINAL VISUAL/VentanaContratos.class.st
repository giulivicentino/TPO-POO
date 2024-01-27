Class {
	#name : #VentanaContratos,
	#superclass : #Ventana,
	#instVars : [
		'textoTitulo',
		'botonActualizar',
		'botonAñadir',
		'cliente',
		'tabla',
		'campoNumContrato',
		'campoCantPerso',
		'texto1',
		'texto2',
		'botonViaje',
		'botonModificar'
	],
	#category : #'TPOFINAL VISUAL'
}

{ #category : #'as yet unclassified' }
VentanaContratos class >> crearVistaContrato: unCliente [
|aux|.
aux:= self new.
aux ventanaDeContratos: unCliente.
]

{ #category : #'as yet unclassified' }
VentanaContratos class >> crearVistaContratoConSist:unSistema conCliente:unCliente [
|aux|.
aux:= self new.
aux inicializarContratosConSist: unSistema conCliente:unCliente.
]

{ #category : #'as yet unclassified' }
VentanaContratos >> crearTabla:  unCliente [
|coleccion posicion tablaAux contratoAux i|.
coleccion := unCliente getContratosString. "este metodo hace una coleccion de strings de cada contrato"
posicion := '' asMorph.
posicion position: (20@(self lastSubmorph bottom)).
tablaAux := Tabla crear: 950 y:250 cabecera: 'Contratos existentes de: ', unCliente apellido,'.'.
i := 1.
coleccion do: [ :objeto | 
    contratoAux := objeto asMorph.
    contratoAux position: posicion position + (0 @ 20).
	posicion position: posicion position + (0@20).
    tablaAux agregarTexto: i asString,'.  ',objeto asString.
	i := i+1.
].
^ tablaAux.
]

{ #category : #'as yet unclassified' }
VentanaContratos >> inicializarContratosConSist: unSistema conCliente:unCliente [
self setSistema: unSistema.
super initialize.
self color: Color paleBlue.
self position: 45@45.
self bounds: (self position extent: 1200@400).
botonCerrarVentana position: (1185@50).
cliente := unCliente.
textoTitulo := StringMorph new.
textoTitulo contents: 'Hola, ',cliente apellido,'!'.
self addMorph: textoTitulo.
textoTitulo position: self topLeft + (15@15).
"tabla"
tabla := Tabla new.
tabla := self crearTabla: cliente.
tabla position: self topLeft + (120@60).
self addMorph: tabla.
"texto de ranura"
texto1 := StringMorph new.
texto1 contents: 'Para modificar un contrato:'.
texto1 position: self bottomLeft - (-150@37).
self addMorph: texto1.
"ranura para modificar viaje"
campoNumContrato := RubTextFieldMorph new extent:(220@20);ghostText: 'INGRESE EL NUMERO DE CONTRATO'.
campoNumContrato borderWidth: 1; borderColor: Color darkGray.
self addMorph: campoNumContrato.
campoNumContrato position: self bottomLeft - (-330@40).
"ranura para cant personas"
campoCantPerso := RubTextFieldMorph new extent:(220@20);ghostText: 'INGRESE LA CANTIDAD DE PERSONAS'.
self addMorph: campoCantPerso.
campoCantPerso borderWidth: 1; borderColor: Color darkGray.
campoCantPerso position: self bottomLeft - (-330@75).
"texto de ranura2"
texto2 := StringMorph new.
texto2 contents: 'Para contratar un nuevo viaje:'.
texto2 position: self bottomLeft - (-150@75).
self addMorph: texto2.
"boton añadir viaje"
botonViaje := BotonAccion new.
botonViaje label: 'AÑADIR'.
botonViaje position: self bottomLeft - (-555@75).
self addMorph: botonViaje.
"boton modificar viaje"
botonModificar := BotonAccion new.
botonModificar label: 'MODIFICAR'.
botonModificar position: self bottomLeft - (-555@40).
botonModificar mouseAction: [].
self addMorph: botonModificar.
self openCenteredInWorld.
]

{ #category : #'as yet unclassified' }
VentanaContratos >> ventanaDeContratos: unCliente [
super initialize.
self color: Color paleBlue.
self position: 45@45.
self bounds: (self position extent: 450@300).
cliente := unCliente.
]
