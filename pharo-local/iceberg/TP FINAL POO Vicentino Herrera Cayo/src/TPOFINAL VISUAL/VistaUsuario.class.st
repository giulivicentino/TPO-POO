Class {
	#name : #VistaUsuario,
	#superclass : #Ventana,
	#instVars : [
		'inicioSesion',
		'botonAceptar',
		'campoUsuario',
		'campoContrasenia',
		'titulo',
		'cliente'
	],
	#category : #'TPOFINAL VISUAL'
}

{ #category : #'as yet unclassified' }
VistaUsuario class >> crearConSistema: unSistema usuario: unDni [
|vista|
vista := self crearVentanaConAncho:  770 altura: 600 titulo: 'LIBRERÍA NACIONAL I.A'.
vista inicializarConSistema: unSistema usuario: unDni.
^ vista
]

{ #category : #'as yet unclassified' }
VistaUsuario class >> crearVistaUsuario [
|aux|.
aux := self new.
aux ventanaInicioSesion.
]

{ #category : #'as yet unclassified' }
VistaUsuario class >> crearVistaUsuarioConSist:unSistema [
|aux|.
aux := self new.
aux ventanaInicioSesionConSist:unSistema.
]

{ #category : #'as yet unclassified' }
VistaUsuario >> ventanaInicioSesion [
super initialize.
self color: Color paleBlue.
self position: 45@45.
self bounds: (self position extent: 450@300).
"titulo"
titulo := StringMorph new.
titulo contents: 'Iniciar Sesion:'.
self addMorph: titulo.
titulo position: self topLeft + (90@55).
"campo usuario"
campoUsuario := RubTextFieldMorph new extent:(200@20);ghostText: 'INGRESE SU DNI'.
self addMorph: campoUsuario.
campoUsuario position: self center - (campoUsuario extent/2) - (0@40).
self openCenteredInWorld.
"campo contraseña"
campoContrasenia := RubTextFieldMorph new extent:(200@20);ghostText: 'INGRESE SU CONTRASEÑA'.
self addMorph: campoContrasenia.
campoContrasenia position: self center - (campoContrasenia extent/2) - (0@5).
self openCenteredInWorld.
"boton aceptar"
botonAceptar := BotonInicioSesion new.
botonAceptar label: 'ACEPTAR'.
botonAceptar position: self center - (botonAceptar extent/2) + (0@30) - (70@0).
botonAceptar mouseAction: [botonAceptar inicializar: campoUsuario conContra: campoContrasenia conSistema: self.].
self addMorph: botonAceptar.

]

{ #category : #'as yet unclassified' }
VistaUsuario >> ventanaInicioSesionConSist:unSistema [
self setSistema: unSistema .
super initialize.
self color: Color paleBlue.
self position: 45@45.
self bounds: (self position extent: 450@300).
"titulo"
titulo := StringMorph new.
titulo contents: 'Iniciar Sesion:'.
self addMorph: titulo.
titulo position: self topLeft + (90@55).
"campo usuario"
campoUsuario := RubTextFieldMorph new extent:(200@20);ghostText: 'INGRESE SU DNI'.
self addMorph: campoUsuario.
campoUsuario position: self center - (campoUsuario extent/2) - (0@40).
"campo contraseña"
campoContrasenia := RubTextFieldMorph new extent:(200@20);ghostText: 'INGRESE SU CONTRASEÑA'.
self addMorph: campoContrasenia.
campoContrasenia position: self center - (campoContrasenia extent/2) - (0@5).
"boton aceptar"
botonAceptar := BotonInicioSesion new.
botonAceptar label: 'ACEPTAR'.
botonAceptar position: self center - (botonAceptar extent/2) + (0@30) - (70@0).
botonAceptar mouseAction: [botonAceptar inicializar: campoUsuario conContra: campoContrasenia conSistema: empresa conVentana:self.].
self addMorph: botonAceptar.
self openCenteredInWorld.

]
