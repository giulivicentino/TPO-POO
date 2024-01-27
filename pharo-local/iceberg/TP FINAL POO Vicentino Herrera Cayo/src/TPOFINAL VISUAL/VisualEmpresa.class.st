Class {
	#name : #VisualEmpresa,
	#superclass : #Ventana,
	#instVars : [
		'botonCerrar',
		'botonContrato',
		'numeroContrato',
		'fechaHoy',
		'miEmpresa',
		'origen',
		'botonCliente',
		'menuDatos',
		'botonTest',
		'tituloMenu',
		'botonUserAdmin',
		'botonUserNormal'
	],
	#category : #'TPOFINAL VISUAL'
}

{ #category : #'as yet unclassified' }
VisualEmpresa class >> abrirVisualEmpresa [
|aux|.
aux := VisualEmpresa new.

]

{ #category : #'as yet unclassified' }
VisualEmpresa class >> abrirVisualEmpresaConSist:unSistema [
|aux|.
aux := VisualEmpresa new.
aux inicializarConSISTEMA: unSistema.
^aux
]

{ #category : #initialization }
VisualEmpresa >> inicializarConSISTEMA:unSistema [
self setSistema: unSistema .
super initialize.
self color: Color paleBlue.
self position: 45@45.
self bounds: (self position extent: 450@100).
origen := self innerBounds origin.
"texto fecha hoy"
fechaHoy := StringMorph new.
fechaHoy contents: Date today asString.
self addMorph: fechaHoy.
fechaHoy position: origen + (5@5).
"texto seleccione su rol"
tituloMenu := StringMorph new.
tituloMenu contents: 'SELECCIONE SU ROL'.
tituloMenu position: origen + (160@30).
self addMorph: tituloMenu.
"boton usuario admin"
botonUserAdmin := BotonAccion new.
self addMorph: botonUserAdmin.
botonUserAdmin label: 'ADMINISTRADOR'.
botonUserAdmin position: origen + (260@60).
"boton usuario normal"
botonUserNormal := BotonAccion new.
self addMorph: botonUserNormal.
botonUserNormal label: 'USUARIO'.
botonUserNormal position: origen + (100@60).
botonUserNormal mouseAction: [self delete. self abrirInicioSesionConSist: unSistema ]. "abre el inicio de sesion"
"agregar cliente
botonCliente := BotonAccion new.
botonCliente label: 'AGREGAR CLIENTE'.
botonCliente mouseAction: [nombre := UIManager default
	request: 'What''s your name?'
	initialAnswer: 'no name'].
self addMorph: botonCliente.
botonCliente position: origen + (5@25)."
self openCenteredInWorld.


]

{ #category : #initialization }
VisualEmpresa >> initialize [
super initialize.
self color: Color paleBlue.
self position: 45@45.
self bounds: (self position extent: 450@100).
origen := self innerBounds origin.
"texto fecha hoy"
fechaHoy := StringMorph new.
fechaHoy contents: Date today asString.
self addMorph: fechaHoy.
fechaHoy position: origen + (5@5).
"texto seleccione su rol"
tituloMenu := StringMorph new.
tituloMenu contents: 'SELECCIONE SU ROL'.
tituloMenu position: origen + (160@30).
self addMorph: tituloMenu.
"boton usuario admin"
botonUserAdmin := BotonAccion new.
self addMorph: botonUserAdmin.
botonUserAdmin label: 'ADMINISTRADOR'.
botonUserAdmin position: origen + (260@60).
"boton usuario normal"
botonUserNormal := BotonAccion new.
self addMorph: botonUserNormal.
botonUserNormal label: 'USUARIO'.
botonUserNormal position: origen + (100@60).
botonUserNormal mouseAction: [self delete. self abrirInicioSesion]. "abre el inicio de sesion"
"agregar cliente
botonCliente := BotonAccion new.
botonCliente label: 'AGREGAR CLIENTE'.
botonCliente mouseAction: [nombre := UIManager default
	request: 'What''s your name?'
	initialAnswer: 'no name'].
self addMorph: botonCliente.
botonCliente position: origen + (5@25)."
self openCenteredInWorld.


]
