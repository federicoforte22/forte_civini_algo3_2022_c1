!classDefinition: #HabitatReal category: 'AvispasYAbejasParte.2'!
DenotativeObject subclass: #HabitatReal
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'AvispasYAbejasParte.2'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'HabitatReal class' category: 'AvispasYAbejasParte.2'!
HabitatReal class
	instanceVariableNames: 'cantidadDeOrugas cantidadDePolillas firmasGeneticas'!

!HabitatReal class methodsFor: 'setters' stamp: 'FF 4/21/2022 20:46:38'!
aumentarOrugas
	cantidadDeOrugas  := cantidadDeOrugas + 1.! !

!HabitatReal class methodsFor: 'setters' stamp: 'FF 4/21/2022 20:46:38'!
aumentarPolillas
	cantidadDePolillas := cantidadDePolillas + 1.! !

!HabitatReal class methodsFor: 'setters' stamp: 'FF 4/21/2022 20:46:38'!
decrementarCantidadOrugas
	cantidadDeOrugas  := cantidadDeOrugas - 1.! !

!HabitatReal class methodsFor: 'setters' stamp: 'FF 4/21/2022 20:46:38'!
decrementarCantidadPolillas
	cantidadDePolillas := cantidadDePolillas - 1.! !

!HabitatReal class methodsFor: 'setters' stamp: 'FF 4/25/2022 14:27:41'!
iniciarHabitatVacio
	cantidadDeOrugas := 0.
	cantidadDePolillas := 0.
	firmasGeneticas := Dictionary new.
	firmasGeneticas at: 'geneticaOrianaOrnella' put:  0.
	firmasGeneticas at: 'geneticaPolly' put:  0.
	firmasGeneticas at: 'geneticaLara' put:  0.! !


!HabitatReal class methodsFor: 'getters' stamp: 'DC 4/23/2022 16:55:13'!
cantidadDeHuevosDeAvispas
	| cantHuevosOrianaOrnella cantHuevosPolly |
	cantHuevosOrianaOrnella := HabitatReal firmasGeneticas at: 'geneticaOrianaOrnella'.
	cantHuevosPolly := HabitatReal firmasGeneticas at: 'geneticaPolly'.
	^(cantHuevosOrianaOrnella + cantHuevosPolly)! !

!HabitatReal class methodsFor: 'getters' stamp: 'FF 4/21/2022 20:46:38'!
cantidadDeOrugas
	^cantidadDeOrugas ! !

!HabitatReal class methodsFor: 'getters' stamp: 'FF 4/21/2022 20:46:38'!
cantidadDePolillas
	^cantidadDePolillas ! !

!HabitatReal class methodsFor: 'getters' stamp: 'FF 4/22/2022 17:39:31'!
firmasGeneticas
	^firmasGeneticas ! !


!HabitatReal class methodsFor: '--** private fileout/in **--' stamp: 'FF 4/25/2022 15:02:07'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	cantidadDeOrugas := 2.
	cantidadDePolillas := 1.
	firmasGeneticas := ((Dictionary new) add: ('geneticaLara'->0); add: ('geneticaOrianaOrnella'->0); add: ('geneticaPolly'->1); yourself).! !


!classDefinition: #LaVerdaderaAvispaLara category: 'AvispasYAbejasParte.2'!
DenotativeObject subclass: #LaVerdaderaAvispaLara
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'AvispasYAbejasParte.2'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'LaVerdaderaAvispaLara class' category: 'AvispasYAbejasParte.2'!
LaVerdaderaAvispaLara class
	instanceVariableNames: ''!

!LaVerdaderaAvispaLara class methodsFor: 'public' stamp: 'DC 4/23/2022 16:42:58'!
intentarReproducirse
	| cantHuevosOrianaOrnella cantHuevosLara cantHuevosPolly | 
	cantHuevosOrianaOrnella := HabitatReal firmasGeneticas at: 'geneticaOrianaOrnella'.
	cantHuevosLara := HabitatReal firmasGeneticas at: 'geneticaLara'.
	cantHuevosPolly := HabitatReal firmasGeneticas at: 'geneticaPolly'.
	
	(cantHuevosOrianaOrnella > 0) ifTrue: [	
		HabitatReal firmasGeneticas at: 'geneticaOrianaOrnella' put: 	(cantHuevosOrianaOrnella - 1).
		HabitatReal firmasGeneticas at: 'geneticaLara' put: (cantHuevosLara + 1).
		] ifFalse:
	[(cantHuevosPolly > 0) ifTrue: [	
		HabitatReal firmasGeneticas at: 'geneticaPolly' put: 	(cantHuevosPolly - 1).
		HabitatReal firmasGeneticas at: 'geneticaLara' put: (cantHuevosLara + 1).
		]]
	! !


!classDefinition: #LaVerdaderaAvispaOriana category: 'AvispasYAbejasParte.2'!
DenotativeObject subclass: #LaVerdaderaAvispaOriana
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'AvispasYAbejasParte.2'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'LaVerdaderaAvispaOriana class' category: 'AvispasYAbejasParte.2'!
LaVerdaderaAvispaOriana class
	instanceVariableNames: ''!

!LaVerdaderaAvispaOriana class methodsFor: 'public' stamp: 'DC 4/23/2022 16:57:07'!
intentarReproducirse
	| cantHuevosOrianaOrnella |
	cantHuevosOrianaOrnella := HabitatReal firmasGeneticas at: 'geneticaOrianaOrnella'. 
	(HabitatReal cantidadDeOrugas > 0) ifTrue: [
		HabitatReal decrementarCantidadOrugas .
		HabitatReal firmasGeneticas at: 'geneticaOrianaOrnella' put: (cantHuevosOrianaOrnella + 1).
		].! !


!classDefinition: #LaVerdaderaAvispaOrnella category: 'AvispasYAbejasParte.2'!
DenotativeObject subclass: #LaVerdaderaAvispaOrnella
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'AvispasYAbejasParte.2'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'LaVerdaderaAvispaOrnella class' category: 'AvispasYAbejasParte.2'!
LaVerdaderaAvispaOrnella class
	instanceVariableNames: ''!

!LaVerdaderaAvispaOrnella class methodsFor: 'public' stamp: 'DC 4/23/2022 16:57:22'!
intentarReproducirse
	| cantHuevosOrianaOrnella |
	cantHuevosOrianaOrnella := HabitatReal firmasGeneticas at: 'geneticaOrianaOrnella'.
	(HabitatReal cantidadDeOrugas > 0) ifTrue: [
		HabitatReal decrementarCantidadOrugas .
		HabitatReal firmasGeneticas at: 'geneticaOrianaOrnella' put: (	cantHuevosOrianaOrnella + 1).
		].
	! !


!classDefinition: #LaVerdaderaAvispaPolly category: 'AvispasYAbejasParte.2'!
DenotativeObject subclass: #LaVerdaderaAvispaPolly
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'AvispasYAbejasParte.2'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'LaVerdaderaAvispaPolly class' category: 'AvispasYAbejasParte.2'!
LaVerdaderaAvispaPolly class
	instanceVariableNames: ''!

!LaVerdaderaAvispaPolly class methodsFor: 'public' stamp: 'DC 4/23/2022 16:57:34'!
intentarReproducirse
	| cantHuevosPolly |
	cantHuevosPolly := HabitatReal firmasGeneticas at: 'geneticaPolly'.
	(HabitatReal cantidadDePolillas > 0) ifTrue: [
		HabitatReal decrementarCantidadPolillas .
		HabitatReal firmasGeneticas at: 'geneticaPolly' put: (cantHuevosPolly + 1).
		].
	! !


!classDefinition: #PruebasReproduccionDeAvispas category: 'AvispasYAbejasParte.2'!
DenotativeObject subclass: #PruebasReproduccionDeAvispas
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'AvispasYAbejasParte.2'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'PruebasReproduccionDeAvispas class' category: 'AvispasYAbejasParte.2'!
PruebasReproduccionDeAvispas class
	instanceVariableNames: ''!

!PruebasReproduccionDeAvispas class methodsFor: 'tests - Oriana' stamp: 'JMB 4/18/2022 18:38:11'!
test01EnElInicioDeLosTiemposNoHayHuevos	
	self retrocederElHabitatAlInicioDeLosTiempos.
	
	Assert that: self habitat cantidadDeHuevosDeAvispas isEqualTo: 0! !

!PruebasReproduccionDeAvispas class methodsFor: 'tests - Oriana' stamp: 'JMB 4/21/2022 12:12:44'!
test02CuandoOrianaLaAvispaSeReproducePorPrimeraVezDejaUnHuevo
	self retrocederElHabitatAlInicioDeLosTiempos. 
	self hacerQueElHabitatTengaLosRecursosSuficientes.
	
	self laAvispaOriana intentarReproducirse.
	
	Assert that: self habitat cantidadDeHuevosDeAvispas isEqualTo: 1.! !

!PruebasReproduccionDeAvispas class methodsFor: 'tests - Oriana' stamp: 'JMB 4/21/2022 12:12:11'!
test03CadaVezQueOrianaSeReproduceDejaUnHuevoMas
	self retrocederElHabitatAlInicioDeLosTiempos. 
	self hacerQueElHabitatTengaLosRecursosSuficientes.
	self laAvispaOriana intentarReproducirse.
	
	self laAvispaOriana intentarReproducirse.
	
	Assert that: self habitat cantidadDeHuevosDeAvispas isEqualTo: 2.! !

!PruebasReproduccionDeAvispas class methodsFor: 'tests - Oriana' stamp: 'JMB 4/21/2022 12:12:53'!
test04ParaDejarUnHuevoOrianaLaAvispaReduceLaPoblacionDeUnaOrugaANinguna
	self retrocederElHabitatAlInicioDeLosTiempos.
	self queElHabitatTengaUnaOrugaMas.
	
	self laAvispaOriana intentarReproducirse.
	
	Assert that: self habitat cantidadDeOrugas isEqualTo: 0.! !

!PruebasReproduccionDeAvispas class methodsFor: 'tests - Oriana' stamp: 'JMB 4/21/2022 12:13:43'!
test05ParaDejarUnHuevoOrianaLaAvispaDecrementaEnUnoLaPoblacionDeOrugasDelHabitat
	self retrocederElHabitatAlInicioDeLosTiempos.
	self queElHabitatTengaDosOrugasMas.
	
	self laAvispaOriana intentarReproducirse.
	
	Assert that: self habitat cantidadDeOrugas isEqualTo: 1.! !

!PruebasReproduccionDeAvispas class methodsFor: 'tests - Oriana' stamp: 'JMB 4/21/2022 12:13:22'!
test06CuandoNoHayOrugasOrianaLaAvispaNoPuedeDejarHuevos
	self retrocederElHabitatAlInicioDeLosTiempos.
	
	self laAvispaOriana intentarReproducirse.
	
	Assert that: self habitat cantidadDeHuevosDeAvispas isEqualTo: 0.! !


!PruebasReproduccionDeAvispas class methodsFor: 'tests - Ornella' stamp: 'JMB 4/21/2022 12:14:24'!
test07CuandoOrnellaLaAvispaSeReproduceDejaUnHuevo
	self retrocederElHabitatAlInicioDeLosTiempos. 
	self hacerQueElHabitatTengaLosRecursosSuficientes.
	
	self laAvispaOrnella intentarReproducirse.
	
	Assert that: self habitat cantidadDeHuevosDeAvispas isEqualTo: 1.! !

!PruebasReproduccionDeAvispas class methodsFor: 'tests - Ornella' stamp: 'JMB 4/21/2022 12:14:18'!
test08ParaDejarUnHuevoOrnellaLaAvispaReduceLaPoblacionDeUnaOrugaANinguna
	self retrocederElHabitatAlInicioDeLosTiempos.
	self queElHabitatTengaUnaOrugaMas.
	
	self laAvispaOrnella intentarReproducirse.
	
	Assert that: self habitat cantidadDeOrugas isEqualTo: 0.! !

!PruebasReproduccionDeAvispas class methodsFor: 'tests - Ornella' stamp: 'JMB 4/21/2022 12:14:11'!
test09CuandoNoHayOrugasOrnellaLaAvispaNoPuedeDejarHuevos
	self retrocederElHabitatAlInicioDeLosTiempos.
	
	self laAvispaOrnella intentarReproducirse.
	
	Assert that: self habitat cantidadDeHuevosDeAvispas isEqualTo: 0.! !


!PruebasReproduccionDeAvispas class methodsFor: 'tests - Polly' stamp: 'JMB 4/21/2022 12:14:46'!
test10CuandoPollyLaAvispaSeReproduceDejaUnHuevo
	self retrocederElHabitatAlInicioDeLosTiempos. 
	self hacerQueElHabitatTengaLosRecursosSuficientes.
	
	self laAvispaPolly intentarReproducirse.
	
	Assert that: self habitat cantidadDeHuevosDeAvispas isEqualTo: 1.! !

!PruebasReproduccionDeAvispas class methodsFor: 'tests - Polly' stamp: 'JMB 4/21/2022 12:14:40'!
test11ParaDejarUnHuevoPollyLaAvispaReduceLaPoblacionDeUnaPolillaANinguna
	self retrocederElHabitatAlInicioDeLosTiempos.
	self queElHabitatTengaUnaPolillaMas.
	
	self laAvispaPolly intentarReproducirse.
	
	Assert that: self habitat cantidadDePolillas isEqualTo: 0.! !

!PruebasReproduccionDeAvispas class methodsFor: 'tests - Polly' stamp: 'JMB 4/21/2022 12:14:36'!
test12ParaDejarUnHuevoPollyLaAvispaDecrementaEnUnoLaPoblacionDePolillasDelHabitat
	self retrocederElHabitatAlInicioDeLosTiempos.
	self queElHabitatTengaDosPolillasMas.
	
	self laAvispaPolly intentarReproducirse.
	
	Assert that: self habitat cantidadDePolillas isEqualTo: 1.! !

!PruebasReproduccionDeAvispas class methodsFor: 'tests - Polly' stamp: 'JMB 4/21/2022 12:14:30'!
test13CuandoNoHayPolillasPollyLaAvispaNoPuedeDejarHuevos
	self retrocederElHabitatAlInicioDeLosTiempos.
	
	self laAvispaPolly intentarReproducirse.
	
	Assert that: self habitat cantidadDeHuevosDeAvispas isEqualTo: 0.! !


!PruebasReproduccionDeAvispas class methodsFor: 'tests - firma genetica' stamp: 'JMB 4/21/2022 12:15:06'!
test14CuandoOrianaLaAvispaSeReproduceDejaUnHuevoConSuFirmaGenetica
	self retrocederElHabitatAlInicioDeLosTiempos. 
	self hacerQueElHabitatTengaLosRecursosSuficientes.
	
	self laAvispaOriana intentarReproducirse.
	
	Assert that: self cantidadDeHuevosConLaFirmaGeneticaDeOriana isEqualTo: 1.! !

!PruebasReproduccionDeAvispas class methodsFor: 'tests - firma genetica' stamp: 'JMB 4/21/2022 12:15:02'!
test15CuandoOrianaLaAvispaAunNoSeReprodujoNoTieneHuevosConSuFirmaGenetica
	self retrocederElHabitatAlInicioDeLosTiempos. 
	
	self laAvispaOriana intentarReproducirse.
	
	Assert that: self cantidadDeHuevosConLaFirmaGeneticaDeOriana isEqualTo: 0.! !

!PruebasReproduccionDeAvispas class methodsFor: 'tests - firma genetica' stamp: 'JMB 4/21/2022 12:14:58'!
test16CuandoPollyLaAvispaSeReproduceDejaUnHuevoConSuFirmaGenetica
	self retrocederElHabitatAlInicioDeLosTiempos. 
	self hacerQueElHabitatTengaLosRecursosSuficientes.
	
	self laAvispaPolly intentarReproducirse.
	
	Assert that: self cantidadDeHuevosConLaFirmaGeneticaDePolly isEqualTo: 1.
	Assert that: self cantidadDeHuevosConLaFirmaGeneticaDeOriana isEqualTo: 0.! !

!PruebasReproduccionDeAvispas class methodsFor: 'tests - firma genetica' stamp: 'JMB 4/21/2022 12:14:54'!
test17CuandoOrnellaLaAvispaSeReproduceDejaUnHuevoConLaMismaFirmaGeneticaQueOriana
	self retrocederElHabitatAlInicioDeLosTiempos. 
	self hacerQueElHabitatTengaLosRecursosSuficientes.
	
	self laAvispaOrnella intentarReproducirse.
	
	Assert that: self cantidadDeHuevosConLaFirmaGeneticaDeOrnella isEqualTo: 1.
	Assert 
		that: self cantidadDeHuevosConLaFirmaGeneticaDeOrnella  
		isEqualTo: self cantidadDeHuevosConLaFirmaGeneticaDeOriana! !


!PruebasReproduccionDeAvispas class methodsFor: 'tests - Lara la ladrona' stamp: 'JMB 4/21/2022 12:15:27'!
test18CuandoLaraLaAvispaSeReproduceDejaUnHuevoConSuFirmaGenetica
	self retrocederElHabitatAlInicioDeLosTiempos. 
	self hacerQueElHabitatTengaLosRecursosSuficientes.
	self laAvispaOrnella intentarReproducirse.
	
	self laAvispaLara intentarReproducirse.
	
	Assert that: self cantidadDeHuevosConLaFirmaGeneticaDeLara isEqualTo: 1.! !

!PruebasReproduccionDeAvispas class methodsFor: 'tests - Lara la ladrona' stamp: 'JMB 4/21/2022 12:15:22'!
test19CuandoLaraLaAvispaSeReproduceLeSacaElHuevoAOtraAvispa
	self retrocederElHabitatAlInicioDeLosTiempos. 
	self hacerQueElHabitatTengaLosRecursosSuficientes.
	self laAvispaOriana intentarReproducirse.
	
	self laAvispaLara intentarReproducirse.
	
	Assert that: self cantidadDeHuevosConLaFirmaGeneticaDeOriana isEqualTo: 0.! !

!PruebasReproduccionDeAvispas class methodsFor: 'tests - Lara la ladrona' stamp: 'JMB 4/21/2022 12:15:18'!
test20CuandoLaraLaAvispaSeReproduceLeSacaElHuevoAPolly
	self retrocederElHabitatAlInicioDeLosTiempos. 
	self hacerQueElHabitatTengaLosRecursosSuficientes.
	self laAvispaPolly intentarReproducirse.
	
	self laAvispaLara intentarReproducirse.
	
	Assert that: self cantidadDeHuevosConLaFirmaGeneticaDePolly isEqualTo: 0.! !

!PruebasReproduccionDeAvispas class methodsFor: 'tests - Lara la ladrona' stamp: 'JMB 4/21/2022 12:15:12'!
test21CuandoLaraLaAvispaNoTieneRecursosNoDejaUnHuevo
	self retrocederElHabitatAlInicioDeLosTiempos. 
		
	self laAvispaLara intentarReproducirse.
		
	Assert that: self cantidadDeHuevosConLaFirmaGeneticaDeLara isEqualTo: 0.! !


!PruebasReproduccionDeAvispas class methodsFor: 'Para completar' stamp: 'DC 4/23/2022 16:49:13'!
cantidadDeHuevosConLaFirmaGeneticaDeLara
	^HabitatReal firmasGeneticas at: 'geneticaLara'.! !

!PruebasReproduccionDeAvispas class methodsFor: 'Para completar' stamp: 'DC 4/23/2022 16:49:20'!
cantidadDeHuevosConLaFirmaGeneticaDeOriana
	^HabitatReal firmasGeneticas at: 'geneticaOrianaOrnella'.! !

!PruebasReproduccionDeAvispas class methodsFor: 'Para completar' stamp: 'DC 4/23/2022 16:49:25'!
cantidadDeHuevosConLaFirmaGeneticaDeOrnella
	^HabitatReal firmasGeneticas at: 'geneticaOrianaOrnella'.! !

!PruebasReproduccionDeAvispas class methodsFor: 'Para completar' stamp: 'DC 4/23/2022 16:49:31'!
cantidadDeHuevosConLaFirmaGeneticaDePolly
	^HabitatReal firmasGeneticas at: 'geneticaPolly'.! !

!PruebasReproduccionDeAvispas class methodsFor: 'Para completar' stamp: 'FF 4/22/2022 17:14:58'!
habitat
	^HabitatReal! !

!PruebasReproduccionDeAvispas class methodsFor: 'Para completar' stamp: 'DC 4/23/2022 16:50:24'!
hacerQueElHabitatTengaLosRecursosSuficientes
	2 timesRepeat: [HabitatReal aumentarOrugas.].
	2 timesRepeat: [HabitatReal aumentarPolillas.].! !

!PruebasReproduccionDeAvispas class methodsFor: 'Para completar' stamp: 'FF 4/22/2022 18:07:38'!
laAvispaLara
	^LaVerdaderaAvispaLara ! !

!PruebasReproduccionDeAvispas class methodsFor: 'Para completar' stamp: 'FF 4/21/2022 20:45:35'!
laAvispaOriana
	^LaVerdaderaAvispaOriana! !

!PruebasReproduccionDeAvispas class methodsFor: 'Para completar' stamp: 'FF 4/21/2022 20:45:51'!
laAvispaOrnella
	^LaVerdaderaAvispaOrnella ! !

!PruebasReproduccionDeAvispas class methodsFor: 'Para completar' stamp: 'FF 4/21/2022 20:46:12'!
laAvispaPolly
	^LaVerdaderaAvispaPolly ! !

!PruebasReproduccionDeAvispas class methodsFor: 'Para completar' stamp: 'DC 4/23/2022 16:51:02'!
queElHabitatTengaDosOrugasMas
	2 timesRepeat: [HabitatReal aumentarOrugas.].! !

!PruebasReproduccionDeAvispas class methodsFor: 'Para completar' stamp: 'DC 4/23/2022 16:51:22'!
queElHabitatTengaDosPolillasMas
	2 timesRepeat: [HabitatReal aumentarPolillas.].! !

!PruebasReproduccionDeAvispas class methodsFor: 'Para completar' stamp: 'FF 4/22/2022 17:14:58'!
queElHabitatTengaUnaOrugaMas
	HabitatReal aumentarOrugas ! !

!PruebasReproduccionDeAvispas class methodsFor: 'Para completar' stamp: 'FF 4/22/2022 17:14:58'!
queElHabitatTengaUnaPolillaMas
	HabitatReal aumentarPolillas.! !

!PruebasReproduccionDeAvispas class methodsFor: 'Para completar' stamp: 'FF 4/25/2022 14:27:41'!
retrocederElHabitatAlInicioDeLosTiempos
	HabitatReal iniciarHabitatVacio! !

HabitatReal initializeAfterFileIn!