!classDefinition: #MarsRoverTest category: 'MarsRover5'!
TestCase subclass: #MarsRoverTest
	instanceVariableNames: 'marsRover'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover5'!

!MarsRoverTest methodsFor: 'set up' stamp: 'DEC 5/29/2022 12:31:23'!
setUp

	marsRover := MarsRover new.! !


!MarsRoverTest methodsFor: 'private' stamp: 'DEC 5/29/2022 12:31:23'!
assertPosition: anExpectedPosition andDirection: anExpectedDirection ofAMarsRoverWhenExecuting: aSetOfCommandsToExecute

	"| marsRover |
	marsRover := MarsRover new."
	marsRover executeASetOfCommands: aSetOfCommandsToExecute.
	
	self assert: ( marsRover direction isKindOf: anExpectedDirection ).
	self assert: marsRover position equals: anExpectedPosition.
	! !


!MarsRoverTest methodsFor: 'tests' stamp: 'DEC 5/29/2022 12:31:23'!
test01WhenCreatedTheMarsRoverPositionIsAtTheOrigin

	"| marsRover |
	
	marsRover := MarsRover new."
	self assert: marsRover position = (0@0).! !

!MarsRoverTest methodsFor: 'tests' stamp: 'DEC 5/29/2022 12:31:23'!
test02WhenCreatedTheMarsRoverDirectionIsTowardsTheNorth

	"| marsRover |
	
	marsRover := MarsRover new."
	self assert: (marsRover direction isKindOf: North).! !

!MarsRoverTest methodsFor: 'tests' stamp: 'DEC 5/29/2022 12:16:55'!
test03WhenReceivingAForwardMovingCommandAndPointingTowardsNorthItMovesInTheYAxis

	self assertPosition: (0@1) andDirection: North ofAMarsRoverWhenExecuting: 'f'.
"
	| marsRover |
	
	marsRover := MarsRover new.
	marsRover executeASetOfCommands: 'f'.
	self assert: marsRover position equals: (0@1)."! !

!MarsRoverTest methodsFor: 'tests' stamp: 'DEC 5/29/2022 12:17:42'!
test04WhenReceivingATurnLeftCommandAndPointingTowardsNorthItPointsToTheWest

	self assertPosition: (0@0) andDirection: West ofAMarsRoverWhenExecuting: 'l'.

"
	| marsRover |
	
	marsRover := MarsRover new.
	marsRover executeASetOfCommands: 'l'.
	self assert: (marsRover direction isKindOf: West)."! !

!MarsRoverTest methodsFor: 'tests' stamp: 'DEC 5/29/2022 12:18:19'!
test05WhenReceivingATurnRightCommandAndPointingTowardsNorthItPointsToTheEast

	self assertPosition: (0@0) andDirection: East ofAMarsRoverWhenExecuting: 'r'.
"
	| marsRover |
	
	marsRover := MarsRover new.
	marsRover executeASetOfCommands: 'r'.
	self assert: (marsRover direction isKindOf: East)."! !

!MarsRoverTest methodsFor: 'tests' stamp: 'DEC 5/29/2022 12:19:09'!
test06WhenReceivingABackwardMovingCommandAndPointingTowardsNorthItMovesInTheYAxis

	self assertPosition: (0@-1) andDirection: North ofAMarsRoverWhenExecuting: 'b'.
"
	| marsRover |
	
	marsRover := MarsRover new.
	marsRover executeASetOfCommands: 'b'.
	self assert: marsRover position = (0@-1)."! !

!MarsRoverTest methodsFor: 'tests' stamp: 'DEC 5/29/2022 12:19:44'!
test07Moving2TimesTowardsNorthAdds2PositionsInTheYAxis

	self assertPosition: (0@2) andDirection: North ofAMarsRoverWhenExecuting: 'ff'.
"
	| marsRover |
	
	marsRover := MarsRover new.
	marsRover executeASetOfCommands: 'ff'.
	
	self assert: (marsRover position) equals: (0@2)."! !

!MarsRoverTest methodsFor: 'tests' stamp: 'DEC 5/29/2022 12:27:33'!
test08TurningLeft2TimesChangesTheDirectionFromNorthToSouth

	self assertPosition: (0@0) andDirection: South  ofAMarsRoverWhenExecuting: 'll'.

"
	| marsRover |
	
	marsRover := MarsRover new.
	marsRover executeASetOfCommands: 'll'.
	
	self assert: (marsRover direction isKindOf: South)."! !

!MarsRoverTest methodsFor: 'tests' stamp: 'DEC 5/29/2022 12:22:12'!
test09TurningLeftAndThenMovingForwardChangesPositionInTheXAxis

	self assertPosition: (-1@0) andDirection: West ofAMarsRoverWhenExecuting: 'lf'.
"
	| marsRover |
	
	marsRover := MarsRover new.
	marsRover executeASetOfCommands: 'lf'.
	
	self assert: (marsRover direction isKindOf: West).
	self assert: marsRover position equals: (-1@0)."! !

!MarsRoverTest methodsFor: 'tests' stamp: 'DEC 5/29/2022 12:31:23'!
test10ReceivingAnInvalidCommandAfterValidCommandsStillAffectsPositionAndDirection

	"| marsRover |
	
	marsRover := MarsRover new."
	
	self 
	should: [ marsRover executeASetOfCommands: 'rfxf'. ] 
	raise: Error 
	withExceptionDo: [:anError | self assert: anError messageText = MarsRover invalidCommandErrorDescription ].
	self assert: (marsRover direction isKindOf: East).
	self assert: marsRover position equals: (1@0).
	! !

!MarsRoverTest methodsFor: 'tests' stamp: 'DEC 5/29/2022 12:30:29'!
test11ChangesOfDifferentSetOfCommandsAreAddUp

	"| marsRover |
	
	marsRover := MarsRover new."
	self assertPosition: (2@0) andDirection: East ofAMarsRoverWhenExecuting: 'rff'.
	self assertPosition: (2@1) andDirection: North ofAMarsRoverWhenExecuting: 'lffb'.
	"
	mars executeASetOfCommands: 'rff'.
	mars executeASetOfCommands: 'lffb'.
	
	self assert: (mars direction isKindOf: North).
	self assert: mars position equals: (2@1)."
	! !


!classDefinition: #CardinalDirections category: 'MarsRover5'!
Object subclass: #CardinalDirections
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover5'!

!CardinalDirections methodsFor: 'as yet unclassified' stamp: 'DEC 5/27/2022 19:28:12'!
left

	self subclassResponsibility ! !

!CardinalDirections methodsFor: 'as yet unclassified' stamp: 'DEC 5/27/2022 20:05:12'!
opposite

	self subclassResponsibility ! !

!CardinalDirections methodsFor: 'as yet unclassified' stamp: 'DEC 5/27/2022 20:19:21'!
positionChangeOf: anObjectToChangeItsPosition

	self subclassResponsibility 

	! !

!CardinalDirections methodsFor: 'as yet unclassified' stamp: 'DEC 5/27/2022 19:28:17'!
right

	self subclassResponsibility ! !


!classDefinition: #East category: 'MarsRover5'!
CardinalDirections subclass: #East
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover5'!

!East methodsFor: 'as yet unclassified' stamp: 'DEC 5/27/2022 19:42:49'!
left 

	^North new! !

!East methodsFor: 'as yet unclassified' stamp: 'DEC 5/27/2022 20:03:33'!
opposite

	^West new! !

!East methodsFor: 'as yet unclassified' stamp: 'DEC 5/27/2022 20:29:52'!
positionChangeOf: anObjectToChangeItsPosition

	anObjectToChangeItsPosition positionChangeInTheEastDirection! !

!East methodsFor: 'as yet unclassified' stamp: 'DEC 5/27/2022 19:43:01'!
right 

	^South new! !


!classDefinition: #North category: 'MarsRover5'!
CardinalDirections subclass: #North
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover5'!

!North methodsFor: 'as yet unclassified' stamp: 'DEC 5/27/2022 19:29:35'!
left

	^West new! !

!North methodsFor: 'as yet unclassified' stamp: 'DEC 5/27/2022 20:02:52'!
opposite

	^South new! !

!North methodsFor: 'as yet unclassified' stamp: 'DEC 5/27/2022 20:30:01'!
positionChangeOf: anObjectToChangeItsPosition

	anObjectToChangeItsPosition positionChangeInTheNorthDirection! !

!North methodsFor: 'as yet unclassified' stamp: 'DEC 5/27/2022 19:29:49'!
right

	^East new! !


!classDefinition: #South category: 'MarsRover5'!
CardinalDirections subclass: #South
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover5'!

!South methodsFor: 'as yet unclassified' stamp: 'DEC 5/27/2022 19:42:17'!
left

	^East new! !

!South methodsFor: 'as yet unclassified' stamp: 'DEC 5/27/2022 20:02:40'!
opposite

	^North new! !

!South methodsFor: 'as yet unclassified' stamp: 'DEC 5/27/2022 20:30:11'!
positionChangeOf: anObjectToChangeItsPosition

	anObjectToChangeItsPosition positionChangeInTheSouthDirection! !

!South methodsFor: 'as yet unclassified' stamp: 'DEC 5/27/2022 19:42:30'!
right

	^West new! !


!classDefinition: #West category: 'MarsRover5'!
CardinalDirections subclass: #West
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover5'!

!West methodsFor: 'as yet unclassified' stamp: 'DEC 5/27/2022 19:30:07'!
left

	^South new! !

!West methodsFor: 'as yet unclassified' stamp: 'DEC 5/27/2022 20:02:25'!
opposite

	^East new! !

!West methodsFor: 'as yet unclassified' stamp: 'DEC 5/27/2022 20:30:05'!
positionChangeOf: anObjectToChangeItsPosition

	anObjectToChangeItsPosition positionChangeInTheWestDirection! !

!West methodsFor: 'as yet unclassified' stamp: 'DEC 5/27/2022 19:30:21'!
right

	^North new! !


!classDefinition: #MarsRover category: 'MarsRover5'!
Object subclass: #MarsRover
	instanceVariableNames: 'position direction mapOfCommands'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover5'!

!MarsRover methodsFor: 'as yet unclassified' stamp: 'DEC 5/27/2022 18:23:08'!
direction
	
	^direction! !

!MarsRover methodsFor: 'as yet unclassified' stamp: 'DEC 5/27/2022 19:12:22'!
executeASetOfCommands: aSetOfCommandsToBeExecuted

	aSetOfCommandsToBeExecuted collect: [:aCommandToBeExecuted | self executeCommand: aCommandToBeExecuted ].
! !

!MarsRover methodsFor: 'as yet unclassified' stamp: 'DEC 5/28/2022 18:36:19'!
executeCommand: aCommandToBeExecuted

	| aClosureWithACommand |
	aClosureWithACommand :=  mapOfCommands at: aCommandToBeExecuted ifAbsent: [^self error: MarsRover invalidCommandErrorDescription].
	aClosureWithACommand value
"
	(aCommandToBeExecuted = $f) ifTrue: [ direction positionChangeOf: self ].
	(aCommandToBeExecuted = $b) ifTrue: [ direction opposite positionChangeOf: self ].
	(aCommandToBeExecuted = $r) ifTrue: [ direction := direction right ].
	(aCommandToBeExecuted = $l) ifTrue: [ direction := direction left ].
	^self error: MarsRover invalidCommandErrorDescription "! !

!MarsRover methodsFor: 'as yet unclassified' stamp: 'DEC 5/28/2022 18:34:12'!
initialize
	
	position := 0@0.
	direction := North new.
	mapOfCommands := Dictionary new.
	mapOfCommands at: $f put: [direction positionChangeOf: self].
	mapOfCommands at: $b put: [direction opposite positionChangeOf: self].
	mapOfCommands at: $r put: [direction := direction right].
	mapOfCommands at: $l put: [direction := direction left].
	! !

!MarsRover methodsFor: 'as yet unclassified' stamp: 'DEC 5/27/2022 18:14:13'!
position

	^position! !

!MarsRover methodsFor: 'as yet unclassified' stamp: 'DEC 5/27/2022 20:29:34'!
positionChangeInTheEastDirection

	position := (position) + (1@0)! !

!MarsRover methodsFor: 'as yet unclassified' stamp: 'DEC 5/27/2022 20:29:37'!
positionChangeInTheNorthDirection

	position := (position) + (0@1)! !

!MarsRover methodsFor: 'as yet unclassified' stamp: 'DEC 5/27/2022 20:29:40'!
positionChangeInTheSouthDirection

	position := (position) - (0@1)! !

!MarsRover methodsFor: 'as yet unclassified' stamp: 'DEC 5/27/2022 20:29:45'!
positionChangeInTheWestDirection

	position := (position) - (1@0)! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'MarsRover class' category: 'MarsRover5'!
MarsRover class
	instanceVariableNames: ''!

!MarsRover class methodsFor: 'as yet unclassified' stamp: 'DEC 5/28/2022 18:18:19'!
invalidCommandErrorDescription

	^'The command is not valid'! !
