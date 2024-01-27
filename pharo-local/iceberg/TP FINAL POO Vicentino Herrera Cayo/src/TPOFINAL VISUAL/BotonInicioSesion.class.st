Class {
	#name : #BotonInicioSesion,
	#superclass : #BotonAccion,
	#instVars : [
		'campoUser',
		'campoClave',
		'sistema',
		'ventanita'
	],
	#category : #'TPOFINAL VISUAL'
}

{ #category : #'as yet unclassified' }
BotonInicioSesion >> inicializar: unUsuario conContra: unaContra conSistema: unSistema [
campoUser := unUsuario.
campoClave := unaContra.
sistema := unSistema getEmpresa .
self iniciarSesion.
 
]

{ #category : #'as yet unclassified' }
BotonInicioSesion >> inicializar: unUsuario conContra: unaContra conSistema: unSistema conVentana: unaVentana [
campoUser := unUsuario.
campoClave := unaContra.
sistema := unSistema.
ventanita:= unaVentana.
self iniciarSesion.
 
]

{ #category : #'as yet unclassified' }
BotonInicioSesion >> iniciarSesion [

"es usuario comun"
    ((campoUser getText ~= '')  & (campoUser getText asString isAllDigits) & (campoClave getText ~= ''))
    ifTrue: 
    [ 
        |tempUsuario|.
        tempUsuario := (sistema encontrarClienteconDNI: campoUser getText asString).
        (tempUsuario) ifNotNil: 
        [  
            ((tempUsuario getContrasenia) asString = (campoClave getText) asString)
                ifTrue: [ self owner delete.ventanita abrirVisualContratosConSist: sistema conCliente: tempUsuario ]
                ifFalse: [ ventanita error: 'Contraseña incorrecta.'].
        ].
         tempUsuario ifNil: 
            [ventanita error: 'Usuario no existe.'].
    ]
    ifFalse:
    [ ventanita error: 'Error: no ingresó correctamente en algún campo' ]


]
