!classDefinition: #CityTest category: 'AlgoIII-2021-2C-RecuDel2doParcial'!
TestCase subclass: #CityTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'AlgoIII-2021-2C-RecuDel2doParcial'!

!CityTest methodsFor: 'as yet unclassified' stamp: 'FF 6/23/2022 07:56:40'!
test01NewlyCreatedCityDoesntHaveZonesOrServices

	| city |
	city := City new.

	self assert: city quantityOfServices equals: 0 .
	self assert: city quantityOfZones equals: 0 .
	! !

!CityTest methodsFor: 'as yet unclassified' stamp: 'FF 6/23/2022 09:31:23'!
test02AddingAWaterTowerGetsWaterPointsToTheCity

	| city waterService |
	city := City new.
	waterService := WaterTower new.
	
	city addService: waterService.

	self assert: city quantityOfServices equals: 1 .
	self assert: 200 * wp equals: city waterProduced .
	! !

!CityTest methodsFor: 'as yet unclassified' stamp: 'FF 6/23/2022 09:34:09'!
test03AddingASolarPlantGetsElectricityPointsToTheCity

	| city electricityService |
	city := City new.
	electricityService := SolarPlant new.
	
	city addService: electricityService.

	self assert: city quantityOfServices equals: 1 .
	self assert: 500 * ep equals: city electricityProduced .
	! !


!classDefinition: #RecuperatorioTest category: 'AlgoIII-2021-2C-RecuDel2doParcial'!
TestCase subclass: #RecuperatorioTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'AlgoIII-2021-2C-RecuDel2doParcial'!

!RecuperatorioTest methodsFor: 'as yet unclassified' stamp: 'SF 12/19/2021 15:51:42'!
test00PodemosUsarMedidasDeElectricidadYAgua

	self assert: 10 * ep equals: 0 * ep + (10 * ep).
	self assert: 15 * wp equals: 0 * wp + (15 * wp).
	! !

!RecuperatorioTest methodsFor: 'as yet unclassified' stamp: 'FF 6/23/2022 07:55:07'!
test01NewlyCreatedCityDoesntHaveZonesOrServices

	| city |
	city := City new

	self assert: city quantityOfServices equals: 0 .
	self assert: city quantityOfZones equals: 0 .
	! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'RecuperatorioTest class' category: 'AlgoIII-2021-2C-RecuDel2doParcial'!
RecuperatorioTest class
	instanceVariableNames: ''!

!RecuperatorioTest class methodsFor: 'class initialization' stamp: 'SF 12/19/2021 15:02:52'!
initialize

	"Este método está para crear unidades"
	"No lo deben tocar ni darle importancia durante el examen"
	
	| ep wp |
	ep := BaseUnit named: 'energypoint' sign: 'ep'.
	wp := BaseUnit named: 'waterpoint' sign: 'wp'.
	
	Smalltalk at: #ep put: ep.
	Smalltalk at: #wp put: wp.! !


!classDefinition: #City category: 'AlgoIII-2021-2C-RecuDel2doParcial'!
Object subclass: #City
	instanceVariableNames: 'zones services'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'AlgoIII-2021-2C-RecuDel2doParcial'!

!City methodsFor: 'as yet unclassified' stamp: 'FF 6/23/2022 09:06:13'!
addService: aService
	services add: aService.! !

!City methodsFor: 'as yet unclassified' stamp: 'FF 6/23/2022 09:39:04'!
electricityProduced
	^services sum: [ :aService | aService electricityPoints ] ifEmpty: [0 * ep].
! !

!City methodsFor: 'as yet unclassified' stamp: 'FF 6/23/2022 08:57:19'!
initialize

	zones := OrderedCollection new.
	services := OrderedCollection new.! !

!City methodsFor: 'as yet unclassified' stamp: 'FF 6/23/2022 08:58:43'!
quantityOfServices

	^services size! !

!City methodsFor: 'as yet unclassified' stamp: 'FF 6/23/2022 08:58:53'!
quantityOfZones

	^zones size! !

!City methodsFor: 'as yet unclassified' stamp: 'FF 6/23/2022 09:39:40'!
waterProduced

	^services sum: [ :aService | aService waterPoints ] ifEmpty: [0 * wp].! !


!classDefinition: #Service category: 'AlgoIII-2021-2C-RecuDel2doParcial'!
Object subclass: #Service
	instanceVariableNames: 'waterPoints electricityPoints'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'AlgoIII-2021-2C-RecuDel2doParcial'!

!Service methodsFor: 'as yet unclassified' stamp: 'FF 6/23/2022 09:27:04'!
electricityPoints

	^electricityPoints ! !

!Service methodsFor: 'as yet unclassified' stamp: 'FF 6/23/2022 09:26:31'!
waterPoints

	^waterPoints ! !


!classDefinition: #SolarPlant category: 'AlgoIII-2021-2C-RecuDel2doParcial'!
Service subclass: #SolarPlant
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'AlgoIII-2021-2C-RecuDel2doParcial'!

!SolarPlant methodsFor: 'as yet unclassified' stamp: 'FF 6/23/2022 09:24:12'!
initialize

	waterPoints := 0 *wp.
	electricityPoints := 500 * ep.! !


!classDefinition: #WaterTower category: 'AlgoIII-2021-2C-RecuDel2doParcial'!
Service subclass: #WaterTower
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'AlgoIII-2021-2C-RecuDel2doParcial'!

!WaterTower methodsFor: 'as yet unclassified' stamp: 'FF 6/23/2022 09:24:20'!
initialize

	waterPoints := 200 * wp.
	electricityPoints := 0 * ep.! !

RecuperatorioTest initialize!