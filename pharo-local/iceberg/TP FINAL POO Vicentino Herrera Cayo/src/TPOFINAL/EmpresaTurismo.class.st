Class {
	#name : #EmpresaTurismo,
	#superclass : #Object,
	#instVars : [
		'colClientes',
		'colViajes'
	],
	#category : #TPOFINAL
}

{ #category : #constructor }
EmpresaTurismo class >> crear [ 
|nuevaEmpresa|.
nuevaEmpresa := self new.
nuevaEmpresa inicializar.
^nuevaEmpresa .
]

{ #category : #'punto_e' }
EmpresaTurismo >> ModificarContrato: unNroContrato A: unaFecha [
| elCliente elContrato reembolso|
elContrato := (colClientes   detect: [ :cdaCliente | cdaCliente buscarContrato: unNroContrato  ]).
( elContrato isNotNil ) ifTrue: [ elCliente := (colClientes   detect: [ :cdaCliente | cdaCliente buscarContrato: unNroContrato.
											  (elContrato modificarContratoB: unaFecha) ifFalse: [reembolso := (elCliente cancelarContrato: unNroContrato)] . ]) ].
^ reembolso 
]

{ #category : #queries }
EmpresaTurismo >> agregarCliente: unCliente [
colClientes add:unCliente.
]

{ #category : #'punto_f' }
EmpresaTurismo >> agregarExcOpcional: unaExcursion AContrato: nroContrato paraCantPersonas: unaCantPersonas [
	| agregada elCliente elContrato |
	elCliente := colClientes detect: [ :cdaCliente | (cdaCliente buscarContrato: nroContrato) isNotNil  ].
	Transcript show: 'jeree'.
	elCliente ifNotNil: [elContrato:= elCliente buscarContrato:nroContrato.
		                 agregada := (elContrato agregarExcursionOp:unaExcursion para: unaCantPersonas )].
	^ agregada.
]

{ #category : #queries }
EmpresaTurismo >> agregarViaje: unViaje [
colViajes add:unViaje.
]

{ #category : #queries }
EmpresaTurismo >> cancelarViaje: unNombreViaje [
colClientes do:[:cliente | cliente eliminarRefViaje: unNombreViaje].
]

{ #category : #accessing }
EmpresaTurismo >> colClientes [

	^ colClientes
]

{ #category : #accessing }
EmpresaTurismo >> colClientes: anObject [

	colClientes := anObject
]

{ #category : #accessing }
EmpresaTurismo >> colViajes [

	^ colViajes
]

{ #category : #accessing }
EmpresaTurismo >> colViajes: anObject [

	colViajes := anObject
]

{ #category : #'punto_e' }
EmpresaTurismo >> efectivizarContratoA: unNroContrato [
	|elContrato elCliente|
	elCliente  := colClientes detect:[:cdaCliente | (cdaCliente getNroContrato)=unNroContrato].
	(elCliente) ifNotNil: [elContrato := elCliente buscarContrato: unNroContrato].
	^ elContrato efectivizarContratoB.
]

{ #category : #queries }
EmpresaTurismo >> encontrarClienteconDNI: unDni [
^ colClientes detect:[:unCliente | unCliente esIgual: unDni]ifNone: [nil].

]

{ #category : #queries }
EmpresaTurismo >> encontrarContratoDeCliente: unCliente conID:unId [
^ unCliente getContratos detect:[:unContrato | unContrato getNroContrato = unId ]ifNone: [nil].
]

{ #category : #queries }
EmpresaTurismo >> generarContrato: unDni conNum: unNumero conViaje: unViaje conFecha: unaFecha conPersonas: personas conCuotas: cuotas [
|unCliente|.

unCliente := colClientes detect:[:cliente | cliente esIgual: unDni] ifNone:[nil].
(unCliente) ifNotNil:[unCliente agregarContrato: unNumero conViaje: unViaje conFechaViaje:  unaFecha conPersonas: personas conCuotas: cuotas].
]

{ #category : #queries }
EmpresaTurismo >> inicializar [
 colClientes:= OrderedCollection new.
colViajes := OrderedCollection new.
]

{ #category : #queries }
EmpresaTurismo >> listar: fecha1 conOtraFecha: fecha2 [
|listado|
listado:=OrderedCollection new.
listado := colViajes select:[:unViaje|unViaje verificarFecha: fecha1 conOtraFecha: fecha2].
^ listado.
]

{ #category : #queries }
EmpresaTurismo >> modificarCostoPersona: nuevoCosto conNombreViaje: nombreViaje [
|unViaje|.
unViaje := colViajes detect:[:viaje | viaje esIgual: nombreViaje].
unViaje setCostoPersona: nuevoCosto.

]

{ #category : #queries }
EmpresaTurismo >> modificarFechaViaje: unNombreViaje conFecha1: fecha1 conFecha2: fecha2 [
|elViaje|.
elViaje := colViajes detect:[:unViaje | unViaje esIgual: unNombreViaje].

]

{ #category : #queries }
EmpresaTurismo >> modificarValorImpuestos: nuevoValor conNombreViaje: nombreViaje [
|elViaje|.
elViaje := colViajes detect:[:viaje | viaje esIgual: nombreViaje].
elViaje setValorImpuesto: nuevoValor.
]

{ #category : #queries }
EmpresaTurismo >> registrarPagos:unNroContrato conCuotas: cantCuotasAPagar conQuiereMillas:quiereMillas [
|clienteAPagar contratoAPagar mensajeRespuesta|.
clienteAPagar := colClientes detect:[:cadaCliente | cadaCliente tieneContrato: unNroContrato].
(clienteAPagar) ifNotNil:[contratoAPagar := clienteAPagar  buscarContrato: unNroContrato.].


(contratoAPagar) ifNotNil: [quiereMillas ifTrue:[[clienteAPagar  pagarContratoFrecuente:cantCuotasAPagar conQuiereMillas: quiereMillas conCliente:clienteAPagar] ifTrue: [mensajeRespuesta := 'Pago Exitoso'] ifFalse: [[mensajeRespuesta := 'Error al pagar las Cuotas']]] ifFalse:[clienteAPagar pagarCuotas: cantCuotasAPagar conContrato:contratoAPagar]].  
^ mensajeRespuesta.

]

{ #category : #queries }
EmpresaTurismo >> revisionDiariaContratos [
|clientesANotificar|.
clientesANotificar := colClientes select:[:cliente | cliente revisarContratos].
"se retornan los clientes y luego se les deberia mandar una notificacion a cada uno"
^ clientesANotificar.
]

{ #category : #queries }
EmpresaTurismo >> verificarContrasenia: unCliente conContrasenia: unaContrasenia [
|correcta contraseniaCorrecta|.
contraseniaCorrecta := unCliente getContrasenia.
correcta := unaContrasenia = contraseniaCorrecta.
^ correcta.
]
