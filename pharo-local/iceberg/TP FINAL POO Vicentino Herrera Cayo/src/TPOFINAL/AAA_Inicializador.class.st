Class {
	#name : #'AAA_Inicializador',
	#superclass : #Object,
	#category : #TPOFINAL
}

{ #category : #InicializarCliente }
AAA_Inicializador >> inicializarClienteFrecuente [
|clienteF1|
clienteF1 := ClienteFrecuente crear: 'Tartaglia' conDni: 44444444  conCiudadResidencia: 'Fiske Menuco'  conContacto: 2555555555  conMillas: 500 
]

{ #category : #InicializarCliente }
AAA_Inicializador >> inicializarClientesNormales [
|cliente1 cliente2 cliente3|
cliente1 := Cliente crear: 'Cayo' conDni: 40000000 conCiudadResidencia: 'Alumine' conContacto: 20000000.
cliente2 := Cliente crear: 'Herrera' conDni: 41111111 conCiudadResidencia: 'Neuquen' conContacto: 21111111.
cliente3 := Cliente crear: 'Vicentino' conDni: 42222222 conCiudadResidencia: 'Cinco Saltos' conContacto: 22222222.			
]

{ #category : #InicializarContrato }
AAA_Inicializador >> inicializarContratos [
|contrato1 contrato2 contrato3|"
contrato1 := Contrato crear: 000 conFechaCreacion: (Date today)  conViaje:  conFechaViaje:  conCantPersonas:  conColCuotas:  conCantCuotas: .
contrato2 := Contrato crear: 001 conFechaCreacion: ((Date today)addMonths: 2) conViaje:  conFechaViaje:  conCantPersonas:  conColCuotas:  conCantCuotas: .
contrato3 := Contrato crear: 002 conFechaCreacion: ((Date today)addMonths: 3) conViaje:  conFechaViaje:  conCantPersonas:  conColCuotas:  conCantCuotas: ."
]

{ #category : #InicializarContrato }
AAA_Inicializador >> inicializarContratosFlexibles [
|contratoF1 contratoF2|
"contratoF1 := ContratoFlexible crear: 004 conFechaCreacion: (Date today) conViaje:  conFechaViaje:  conCantPersonas:  conColCuotas:  conCantCuotas:  conValorPlus: .
contratoF2 := ContratoFlexible crear: 005 conFechaCreacion: (Date today) conViaje:  conFechaViaje:  conCantPersonas:  conColCuotas:  conCantCuotas:  conValorPlus: ."
]

{ #category : #inicializarCuota }
AAA_Inicializador >> inicializarCuotas [
|cta1 cta2 cta3 cta4 cta5 cta6 cta7|
cta1 := Cuota crear: (Date today).
cta2 := Cuota crear: ((Date today)addDays: 6).
cta3 := Cuota crear: ((Date today)addDays: 14).
cta4 := Cuota crear: ((Date today)addMonths:1).
cta5 := Cuota crear: ((Date today)addMonths:3).
cta6 := Cuota crear: ((Date today)addMonths:3).
cta7 := Cuota crear: ((Date today)addMonths:5).
]

{ #category : #InicializarExcursion }
AAA_Inicializador >> inicializarExcursionesOpcionales [
|exOp1 exOp2 exOp3|
exOp1 := Excursion crear: 500 conCantPersonasE: 2.
exOp2 := Excursion crear: 350 conCantPersonasE: 1.
exOp3 := Excursion crear: 1500 conCantPersonasE: 4.
]

{ #category : #inicializarViaje }
AAA_Inicializador >> inicializarViajeEspecial [
|viaje1 viaje2 viaje3|
viaje1 := ViajeEspecial crear: 'Recital de Tan Bionica' conCostoPersona: 300	conImpuestos: 75 conDisponibilidad: 10	conFechaSalida: ((Date today)addMonths: 4)
								conCiudad: 'Buenos Aires' conFechaRegreso: (((Date today)addMonths: 4)addDays: 3).
viaje2 := ViajeEspecial crear: 'Mundial De Futbol Qatar 2022' conCostoPersona: 1200	conImpuestos: 300 conDisponibilidad: 4	conFechaSalida:'18-12-22'asDate  
								conCiudad: 'Qatar' conFechaRegreso: '23-12-22' asDate .
viaje3 := ViajeEspecial crear: 'Carnaval Rio 2024' conCostoPersona: 600	conImpuestos: 35 conDisponibilidad: 5	conFechaSalida: ((Date today)addMonths: 6)
								conCiudad: 'Rio De Janeiro' conFechaRegreso: (((Date today)addMonths: 6)addDays: 10)  .								
]

{ #category : #inicializarViaje }
AAA_Inicializador >> inicializarViajeOrganizado [
|viaje1 viaje2|
"viaje1 := crear: 'España-Italia-Londres' conCostoPersona:350 conImpuestos:70 conCantDias: 10 conColEtapas:unaColEtapas conColOpcionesSalida: unaColOpSalida.
viaje2 := crear: '' conCostoPersona:350 conImpuestos:70 conCantDias: 10 conColEtapas:unaColEtapas conColOpcionesSalida: unaColOpSalida."
]
