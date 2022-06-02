!classDefinition: #MarsRoverTest category: 'MarsRover12'!
TestCase subclass: #MarsRoverTest
	instanceVariableNames: 'rover'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover12'!

!MarsRoverTest methodsFor: 'private' stamp: 'DEC 6/1/2022 15:03:29'!
assertPosition: anExpectedPosition andDirection: anExpectedDirection ofAMarsRoverWhenExecuting: aSetOfCommandsToExecute

	rover executeASetOfCommands: aSetOfCommandsToExecute.
	
	self assert: ( rover direction isKindOf: anExpectedDirection ).
	self assert: rover position equals: anExpectedPosition.! !


!MarsRoverTest methodsFor: 'tests' stamp: 'DEC 5/31/2022 19:47:48'!
test01MarsRoverStartsAtTheOriginOfThePlane

	| marsRover |
	
	marsRover := MarsRover new.
	
	self assert: ( marsRover position ) equals: (0@0).! !

!MarsRoverTest methodsFor: 'tests' stamp: 'DEC 6/2/2022 10:18:12'!
test02MarsRoverStartsLookingTowardsTheNorth

	| marsRover |
	
	marsRover := MarsRover new.
	
	self assert: ( marsRover direction isKindOf: MarsRoverHeadDirectedToTheNorth ).! !

!MarsRoverTest methodsFor: 'tests' stamp: 'DEC 6/2/2022 10:19:23'!
test03WhenReceveingTheMovingForwardCommandAndLookingTowardsTheNorthItMovesInThePositiveYAxis

	self assertPosition: 0@1 andDirection: MarsRoverHeadDirectedToTheNorth ofAMarsRoverWhenExecuting: 'f'
! !

!MarsRoverTest methodsFor: 'tests' stamp: 'DEC 6/2/2022 10:19:20'!
test04WhenReceveingTheMovingBackwardsCommandAndLookingTowardsTheNorthItMovesInTheNegativeYAxis

	self assertPosition: 0@-1 andDirection: MarsRoverHeadDirectedToTheNorth ofAMarsRoverWhenExecuting: 'b'
! !

!MarsRoverTest methodsFor: 'tests' stamp: 'DEC 6/2/2022 10:19:15'!
test05WhenRecevingTheTurningLeftCommandAndLookingTowardsTheNorthItChangesDirectionTowardsTheWest

	self assertPosition: 0@0 andDirection: MarsRoverHeadDirectedToTheWest ofAMarsRoverWhenExecuting: 'l'
! !

!MarsRoverTest methodsFor: 'tests' stamp: 'DEC 6/2/2022 10:19:10'!
test06WhenRecevingTheTurningRightCommandAndLookingTowardsTheNorthItChangesDirectionTowardsTheWest

	self assertPosition: 0@0 andDirection: MarsRoverHeadDirectedToTheEast ofAMarsRoverWhenExecuting: 'r'
! !

!MarsRoverTest methodsFor: 'tests' stamp: 'DEC 6/2/2022 10:19:05'!
test07WhenReceveing2MovingForwardCommandsAndLookingTowardsTheNorthItMoves2PointsInThePositiveYAxis

	self assertPosition: 0@2 andDirection: MarsRoverHeadDirectedToTheNorth ofAMarsRoverWhenExecuting: 'ff'
! !

!MarsRoverTest methodsFor: 'tests' stamp: 'DEC 6/2/2022 10:19:00'!
test08WhenReceveing2MovingBackwardCommandsAndLookingTowardsTheNorthItMoves2PointsInTheNegativeYAxis

	self assertPosition: 0@-2 andDirection: MarsRoverHeadDirectedToTheNorth  ofAMarsRoverWhenExecuting: 'bb'
! !

!MarsRoverTest methodsFor: 'tests' stamp: 'DEC 6/2/2022 10:18:56'!
test09WhenReceveing2TurningRightCommandsAndLookingTowardsTheNorthItChangesDirectionTowardsTheSouth

	self assertPosition: 0@0 andDirection: MarsRoverHeadDirectedToTheSouth ofAMarsRoverWhenExecuting: 'rr'
! !

!MarsRoverTest methodsFor: 'tests' stamp: 'DEC 6/2/2022 10:18:52'!
test10WhenReceveing2TurningLeftCommandsAndLookingTowardsTheNorthItChangesDirectionTowardsTheSouth

	self assertPosition: 0@0 andDirection: MarsRoverHeadDirectedToTheSouth  ofAMarsRoverWhenExecuting: 'll'
! !

!MarsRoverTest methodsFor: 'tests' stamp: 'DEC 6/2/2022 10:18:46'!
test11WhenMarsRoverIsLookingTowardsTheWestAndMovesForwardItChangesPositionInTheNegativeXAxis

	self assertPosition: -1@0 andDirection: MarsRoverHeadDirectedToTheWest  ofAMarsRoverWhenExecuting: 'lf'
! !

!MarsRoverTest methodsFor: 'tests' stamp: 'DEC 6/2/2022 10:18:38'!
test12WhenMarsRoverIsLookingTowardsTheEastAndMovesBackwardItChangesPositionInTheNegativeXAxis

	self assertPosition: -1@0 andDirection: MarsRoverHeadDirectedToTheEast ofAMarsRoverWhenExecuting: 'rb'
! !

!MarsRoverTest methodsFor: 'tests' stamp: 'DEC 6/1/2022 19:50:41'!
test13WhenRecevingAnInvalidCommandItReturnsAnInvalidCommandErrorButExecutesThePreviousValidCommands

	| marsRover |
	
	marsRover := MarsRover new.
	
	self 
	should: [ marsRover executeASetOfCommands: 'rfxf'. ] 
	raise: Error 
	withExceptionDo: [:anError | self assert: anError messageText = MarsRover invalidCommandErrorDescription ].
	self assert: ( marsRover direction isKindOf: MarsRoverHeadDirectedToTheEast ).
	self assert: ( marsRover position ) equals: (1@0).! !


!MarsRoverTest methodsFor: 'set up' stamp: 'DEC 6/1/2022 15:04:01'!
setUp

	rover := MarsRover new! !


!classDefinition: #MarsRover category: 'MarsRover12'!
Object subclass: #MarsRover
	instanceVariableNames: 'position head programmedCommands'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover12'!

!MarsRover methodsFor: 'mobility' stamp: 'DEC 6/1/2022 19:46:33'!
moveTowardsTheEast

	position := position + (1@0)! !

!MarsRover methodsFor: 'mobility' stamp: 'DEC 6/1/2022 19:47:02'!
moveTowardsTheNorth

	position := position + (0@1)! !

!MarsRover methodsFor: 'mobility' stamp: 'DEC 6/1/2022 19:45:53'!
moveTowardsTheSouth

	position := position + (0@-1)! !

!MarsRover methodsFor: 'mobility' stamp: 'DEC 6/1/2022 19:45:53'!
moveTowardsTheWest

	position := position + (-1@0)! !


!MarsRover methodsFor: 'initialization' stamp: 'DEC 6/1/2022 20:03:42'!
initialize

	position := 0@0.
	head := MarsRoverHeadDirectedToTheNorth new.
	programmedCommands := Dictionary new.
	
	programmedCommands at: $f put: [ head moveForward: self ].
	programmedCommands at: $b put: [ head turnAround moveForward: self ].
	programmedCommands at: $l put: [ head := head turnLeft ].
	programmedCommands at: $r put: [ head := head turnRight ].! !


!MarsRover methodsFor: 'direction' stamp: 'DEC 6/1/2022 20:00:35'!
direction
	
	^head! !


!MarsRover methodsFor: 'position' stamp: 'DEC 6/1/2022 19:45:53'!
position

	^position! !


!MarsRover methodsFor: 'command execution' stamp: 'DEC 5/31/2022 20:15:56'!
executeASetOfCommands: aSetOfCommandsToExecute

	aSetOfCommandsToExecute collect: [:aCommandToBeExecuted | self executeCommand: aCommandToBeExecuted ]! !

!MarsRover methodsFor: 'command execution' stamp: 'DEC 6/1/2022 10:18:20'!
executeCommand: aCommandToExecute
	
	| commandExecution |
	
	commandExecution := programmedCommands at: aCommandToExecute ifAbsent: [ ^self error: MarsRover invalidCommandErrorDescription ].
	commandExecution value.
	
"
	Podriamos dejar los ifs, pero en el paso 3 cuando estabamos haciendo el refactor se nos ocurrio esta manera de 'mapear' los comandos del MarsRover. Ya que si el comando pedido no esta programado, no lo encuentra en el Dictionary y devuelve el error.
	
	( aCommandToExecute = $f ) ifTrue: [direction positionChangeOf: self].
	( aCommandToExecute = $b ) ifTrue: [direction opposite positionChangeOf: self].
	( aCommandToExecute = $l ) ifTrue: [direction := direction left].
	( aCommandToExecute = $r ) ifTrue: [direction := direction right]."! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'MarsRover class' category: 'MarsRover12'!
MarsRover class
	instanceVariableNames: ''!

!MarsRover class methodsFor: 'error description' stamp: 'DEC 5/31/2022 22:27:33'!
invalidCommandErrorDescription

	^'The command is invalid'! !


!classDefinition: #MarsRoverHead category: 'MarsRover12'!
Object subclass: #MarsRoverHead
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover12'!

!MarsRoverHead methodsFor: 'move forward' stamp: 'DEC 6/1/2022 20:00:18'!
moveForward: aMarsRoverToChangeItsPosition

	self subclassResponsibility ! !


!MarsRoverHead methodsFor: 'turning head movement' stamp: 'DEC 6/1/2022 19:53:47'!
turnAround

	self subclassResponsibility ! !

!MarsRoverHead methodsFor: 'turning head movement' stamp: 'DEC 6/1/2022 19:53:09'!
turnLeft

	self subclassResponsibility ! !

!MarsRoverHead methodsFor: 'turning head movement' stamp: 'DEC 6/1/2022 19:53:23'!
turnRight

	self subclassResponsibility ! !


!classDefinition: #MarsRoverHeadDirectedToTheEast category: 'MarsRover12'!
MarsRoverHead subclass: #MarsRoverHeadDirectedToTheEast
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover12'!

!MarsRoverHeadDirectedToTheEast methodsFor: 'move forward' stamp: 'DEC 6/1/2022 20:00:18'!
moveForward: aMarsRoverToChangeItsPosition

	aMarsRoverToChangeItsPosition moveTowardsTheEast! !


!MarsRoverHeadDirectedToTheEast methodsFor: 'turning head movement' stamp: 'DEC 6/1/2022 19:53:47'!
turnAround

	^MarsRoverHeadDirectedToTheWest new! !

!MarsRoverHeadDirectedToTheEast methodsFor: 'turning head movement' stamp: 'DEC 6/1/2022 19:53:09'!
turnLeft

	^MarsRoverHeadDirectedToTheNorth new! !

!MarsRoverHeadDirectedToTheEast methodsFor: 'turning head movement' stamp: 'DEC 6/1/2022 19:53:23'!
turnRight

	^MarsRoverHeadDirectedToTheSouth new! !


!classDefinition: #MarsRoverHeadDirectedToTheNorth category: 'MarsRover12'!
MarsRoverHead subclass: #MarsRoverHeadDirectedToTheNorth
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover12'!

!MarsRoverHeadDirectedToTheNorth methodsFor: 'move forward' stamp: 'DEC 6/1/2022 20:00:18'!
moveForward: aMarsRoverToChangeItsPosition

	aMarsRoverToChangeItsPosition moveTowardsTheNorth! !


!MarsRoverHeadDirectedToTheNorth methodsFor: 'turning head movement' stamp: 'DEC 6/1/2022 19:53:47'!
turnAround

	^MarsRoverHeadDirectedToTheSouth new! !

!MarsRoverHeadDirectedToTheNorth methodsFor: 'turning head movement' stamp: 'DEC 6/1/2022 19:53:09'!
turnLeft

	^MarsRoverHeadDirectedToTheWest new! !

!MarsRoverHeadDirectedToTheNorth methodsFor: 'turning head movement' stamp: 'DEC 6/1/2022 19:53:23'!
turnRight

	^MarsRoverHeadDirectedToTheEast new! !


!classDefinition: #MarsRoverHeadDirectedToTheSouth category: 'MarsRover12'!
MarsRoverHead subclass: #MarsRoverHeadDirectedToTheSouth
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover12'!

!MarsRoverHeadDirectedToTheSouth methodsFor: 'turning head movement' stamp: 'DEC 6/1/2022 19:53:47'!
turnAround

	^MarsRoverHeadDirectedToTheNorth new! !

!MarsRoverHeadDirectedToTheSouth methodsFor: 'turning head movement' stamp: 'DEC 6/1/2022 19:53:09'!
turnLeft

	^MarsRoverHeadDirectedToTheEast new! !

!MarsRoverHeadDirectedToTheSouth methodsFor: 'turning head movement' stamp: 'DEC 6/1/2022 19:53:23'!
turnRight

	^MarsRoverHeadDirectedToTheWest new! !


!MarsRoverHeadDirectedToTheSouth methodsFor: 'move forward' stamp: 'DEC 6/1/2022 20:00:18'!
moveForward: aMarsRoverToChangeItsPosition

	aMarsRoverToChangeItsPosition moveTowardsTheSouth! !


!classDefinition: #MarsRoverHeadDirectedToTheWest category: 'MarsRover12'!
MarsRoverHead subclass: #MarsRoverHeadDirectedToTheWest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover12'!

!MarsRoverHeadDirectedToTheWest methodsFor: 'turning head movement' stamp: 'DEC 6/1/2022 19:53:47'!
turnAround

	^MarsRoverHeadDirectedToTheEast new! !

!MarsRoverHeadDirectedToTheWest methodsFor: 'turning head movement' stamp: 'DEC 6/1/2022 19:53:09'!
turnLeft

	^MarsRoverHeadDirectedToTheSouth new! !

!MarsRoverHeadDirectedToTheWest methodsFor: 'turning head movement' stamp: 'DEC 6/1/2022 19:53:23'!
turnRight

	^MarsRoverHeadDirectedToTheNorth new! !


!MarsRoverHeadDirectedToTheWest methodsFor: 'move forward' stamp: 'DEC 6/1/2022 20:00:18'!
moveForward: aMarsRoverToChangeItsPosition

	aMarsRoverToChangeItsPosition moveTowardsTheWest! !
