Class {
	#name : #Ventana,
	#superclass : #BorderedMorph,
	#instVars : [
		'empresa',
		'botonCerrarVentana'
	],
	#category : #'TPOFINAL VISUAL'
}

{ #category : #'as yet unclassified' }
Ventana class >> crearVentanaConAncho: unAncho altura: unaAltura [
|frame barra bCerrar|

frame := self new color: Color veryDarkGray ; extent: unAncho@unaAltura; borderColor: Color darkGray; borderWidth: 3.
barra := self new color: Color veryDarkGray; extent: unAncho@20; borderColor: Color darkGray; borderWidth: 3.
bCerrar := BotonCerrar new.

bCerrar position: frame topRight - bCerrar extent.
barra position: frame position - (0@20).
frame addMorph: barra.
frame addMorph: bCerrar  inFrontOf: barra.
^ frame
]

{ #category : #'as yet unclassified' }
Ventana class >> crearVentanaConAncho: unAncho altura: unaAltura titulo: unTitulo [
|frame titulo contenedorTitulo|
frame := self new color: Color veryDarkGray ; extent: unAncho@unaAltura; borderColor: Color darkGray; borderWidth: 3.
contenedorTitulo := Morph new beTransparent; extent: unAncho@40.
titulo := TextMorph new contents: (unTitulo asText allBold); fillsOwner: true.
titulo font: (LogicalFont familyName: 'Roboto' pointSize: 20).
frame addMorphFront: titulo. titulo position: frame topLeft + (10@0).
^ frame.
]

{ #category : #'as yet unclassified' }
Ventana >> abrirInicioSesion [
VistaUsuario crearVistaUsuario.
]

{ #category : #'as yet unclassified' }
Ventana >> abrirInicioSesionConSist:unSistema [
VistaUsuario crearVistaUsuarioConSist:unSistema
]

{ #category : #'as yet unclassified' }
Ventana >> abrirVisualContratos: unCliente [
VentanaContratos crearVistaContrato: unCliente.
]

{ #category : #'as yet unclassified' }
Ventana >> abrirVisualContratosConSist:unSistema conCliente: unCliente [
VentanaContratos crearVistaContratoConSist:unSistema conCliente:unCliente.
]

{ #category : #'error handling' }
Ventana >> error: unTexto [
|ventanaAux texto|
texto := TextMorph new contents: unTexto; color: Color blue ; bold.
ventanaAux  := self class crearVentanaConAncho: (texto width + 330) altura: (texto height + 40) titulo: 'ERROR'.
ventanaAux  addMorphCentered: texto.
ventanaAux  openCenteredInWorld .
]

{ #category : #'as yet unclassified' }
Ventana >> getEmpresa [
^ empresa.
]

{ #category : #'as yet unclassified' }
Ventana >> iniciarSistema: unSistema [
empresa := unSistema.
VisualEmpresa abrirVisualEmpresaConSist: unSistema .
]

{ #category : #initialization }
Ventana >> initialize [
super initialize.
self color: Color paleBlue.
self position: 45@45.
self bounds: (self position extent: 450@100).
"boton cerrar"
botonCerrarVentana := BotonAccion new.
self addMorph: botonCerrarVentana.
botonCerrarVentana position: self topRight - (botonCerrarVentana width + 22@0)+(0@5).
botonCerrarVentana label: 'CERRAR'.
botonCerrarVentana mouseAction: [self delete].
]

{ #category : #initialization }
Ventana >> setBotonCerrar: boton [
botonCerrarVentana := boton.
]

{ #category : #initialization }
Ventana >> setSistema:unSistema [
empresa := unSistema.

]
