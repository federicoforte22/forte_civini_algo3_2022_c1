!classDefinition: #MarsRoverTest category: 'MarsRover4'!
TestCase subclass: #MarsRoverTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover4'!

!MarsRoverTest methodsFor: 'as yet unclassified' stamp: 'DEC 5/27/2022 18:35:27'!
test01WhenCreatedTheMarsRoverPositionIsAtTheOrigin

	| marsRover |
	
	marsRover := MarsRover new.
	self assert: marsRover position = (0@0).! !

!MarsRoverTest methodsFor: 'as yet unclassified' stamp: 'DEC 5/27/2022 19:46:23'!
test02WhenCreatedTheMarsRoverDirectionIsTowardsTheNorth

	| marsRover |
	
	marsRover := MarsRover new.
	self assert: (marsRover direction isKindOf: North).! !

!MarsRoverTest methodsFor: 'as yet unclassified' stamp: 'DEC 5/27/2022 20:25:01'!
test03WhenReceivingAForwardMovingCommandAndPointingTowardsNorthItMovesInTheYAxis

	| marsRover |
	
	marsRover := MarsRover new.
	marsRover executeASetOfCommands: 'f'.
	self assert: marsRover position equals: (0@1).! !

!MarsRoverTest methodsFor: 'as yet unclassified' stamp: 'DEC 5/27/2022 19:47:03'!
test04WhenReceivingATurnLeftCommandAndPointingTowardsNorthItPointsToTheWest

	| marsRover |
	
	marsRover := MarsRover new.
	marsRover executeASetOfCommands: 'l'.
	self assert: (marsRover direction isKindOf: West).! !

!MarsRoverTest methodsFor: 'as yet unclassified' stamp: 'DEC 5/27/2022 19:47:29'!
test05WhenReceivingATurnRightCommandAndPointingTowardsNorthItPointsToTheEast

	| marsRover |
	
	marsRover := MarsRover new.
	marsRover executeASetOfCommands: 'r'.
	self assert: (marsRover direction isKindOf: East).! !

!MarsRoverTest methodsFor: 'as yet unclassified' stamp: 'DEC 5/27/2022 18:57:06'!
test06WhenReceivingABackwardMovingCommandAndPointingTowardsNorthItMovesInTheYAxis

	| marsRover |
	
	marsRover := MarsRover new.
	marsRover executeASetOfCommands: 'b'.
	self assert: marsRover position = (0@-1).! !

!MarsRoverTest methodsFor: 'as yet unclassified' stamp: 'DEC 5/27/2022 19:50:05'!
test07Moving2TimesTowardsNorthAdds2PositionsInTheYAxis

	| marsRover |
	
	marsRover := MarsRover new.
	marsRover executeASetOfCommands: 'ff'.
	
	self assert: (marsRover position) equals: (0@2).! !

!MarsRoverTest methodsFor: 'as yet unclassified' stamp: 'DEC 5/27/2022 19:52:59'!
test08TurningLeft2TimesChangesTheDirectionFromNorthToSouth

	| marsRover |
	
	marsRover := MarsRover new.
	marsRover executeASetOfCommands: 'll'.
	
	self assert: (marsRover direction isKindOf: South).! !

!MarsRoverTest methodsFor: 'as yet unclassified' stamp: 'DEC 5/27/2022 20:30:57'!
test09

	| marsRover |
	
	marsRover := MarsRover new.
	marsRover executeASetOfCommands: 'lf'.
	
	self assert: (marsRover direction isKindOf: West).
	self assert: marsRover position equals: (-1@0).! !

!MarsRoverTest methodsFor: 'as yet unclassified' stamp: 'DEC 5/28/2022 18:37:45'!
test10

	| marsRover |
	
	marsRover := MarsRover new.
	
	self 
	should: [ marsRover executeASetOfCommands: 'rfxf'. ] 
	raise: Error 
	withExceptionDo: [:anError | self assert: anError messageText = MarsRover invalidCommandErrorDescription ]. 
	self assert: (marsRover direction isKindOf: East).
	self assert: marsRover position equals: (1@0).
	! !

!MarsRoverTest methodsFor: 'as yet unclassified' stamp: 'DEC 5/28/2022 18:41:38'!
test11

	| marsRover |
	
	marsRover := MarsRover new.
	marsRover executeASetOfCommands: 'rff'.
	marsRover executeASetOfCommands: 'lffb'.
	
	self assert: (marsRover direction isKindOf: North).
	self assert: marsRover position equals: (2@1).
	! !


!classDefinition: #CardinalDirections category: 'MarsRover4'!
Object subclass: #CardinalDirections
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover4'!

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


!classDefinition: #East category: 'MarsRover4'!
CardinalDirections subclass: #East
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover4'!

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


!classDefinition: #North category: 'MarsRover4'!
CardinalDirections subclass: #North
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover4'!

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


!classDefinition: #South category: 'MarsRover4'!
CardinalDirections subclass: #South
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover4'!

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


!classDefinition: #West category: 'MarsRover4'!
CardinalDirections subclass: #West
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover4'!

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


!classDefinition: #MarsRover category: 'MarsRover4'!
Object subclass: #MarsRover
	instanceVariableNames: 'position direction mapOfCommands'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover4'!

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

!classDefinition: 'MarsRover class' category: 'MarsRover4'!
MarsRover class
	instanceVariableNames: ''!

!MarsRover class methodsFor: 'as yet unclassified' stamp: 'DEC 5/28/2022 18:18:19'!
invalidCommandErrorDescription

	^'The command is not valid'! !
