!classDefinition: #MarsRoverTest category: 'MarsRover7'!
TestCase subclass: #MarsRoverTest
	instanceVariableNames: 'marsRover'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover7'!

!MarsRoverTest methodsFor: 'set up' stamp: 'DEC 5/29/2022 12:31:23'!
setUp

	marsRover := MarsRover new.! !


!MarsRoverTest methodsFor: 'private' stamp: 'FF 6/1/2022 12:24:30'!
assertPosition: anExpectedPosition andDirection: anExpectedDirection ofAMarsRoverWhenExecuting: aSetOfCommandsToExecute

	"| marsRover |
	marsRover := MarsRover new."
	marsRover executeASetOfCommands: aSetOfCommandsToExecute.
	
	self assert: ( marsRover direction = anExpectedDirection ).
	self assert: marsRover position equals: anExpectedPosition.
	! !


!MarsRoverTest methodsFor: 'tests' stamp: 'DEC 5/29/2022 12:31:23'!
test01WhenCreatedTheMarsRoverPositionIsAtTheOrigin

	"| marsRover |
	
	marsRover := MarsRover new."
	self assert: marsRover position = (0@0).! !

!MarsRoverTest methodsFor: 'tests' stamp: 'FF 6/1/2022 12:23:56'!
test02WhenCreatedTheMarsRoverDirectionIsTowardsTheNorth

	"| marsRover |
	
	marsRover := MarsRover new."
	self assert: (marsRover direction = $N).! !

!MarsRoverTest methodsFor: 'tests' stamp: 'FF 6/1/2022 12:24:12'!
test03WhenReceivingAForwardMovingCommandAndPointingTowardsNorthItMovesInTheYAxis

	self assertPosition: (0@1) andDirection: $N ofAMarsRoverWhenExecuting: 'f'.
"
	| marsRover |
	
	marsRover := MarsRover new.
	marsRover executeASetOfCommands: 'f'.
	self assert: marsRover position equals: (0@1)."! !

!MarsRoverTest methodsFor: 'tests' stamp: 'FF 6/1/2022 12:27:34'!
test04WhenReceivingATurnLeftCommandAndPointingTowardsNorthItPointsToTheWest

	self assertPosition: (0@0) andDirection: $W ofAMarsRoverWhenExecuting: 'l'.

"
	| marsRover |
	
	marsRover := MarsRover new.
	marsRover executeASetOfCommands: 'l'.
	self assert: (marsRover direction isKindOf: West)."! !

!MarsRoverTest methodsFor: 'tests' stamp: 'FF 6/1/2022 12:27:40'!
test05WhenReceivingATurnRightCommandAndPointingTowardsNorthItPointsToTheEast

	self assertPosition: (0@0) andDirection: $E ofAMarsRoverWhenExecuting: 'r'.
"
	| marsRover |
	
	marsRover := MarsRover new.
	marsRover executeASetOfCommands: 'r'.
	self assert: (marsRover direction isKindOf: East)."! !

!MarsRoverTest methodsFor: 'tests' stamp: 'FF 6/1/2022 12:27:47'!
test06WhenReceivingABackwardMovingCommandAndPointingTowardsNorthItMovesInTheYAxis

	self assertPosition: (0@-1) andDirection: $N ofAMarsRoverWhenExecuting: 'b'.
"
	| marsRover |
	
	marsRover := MarsRover new.
	marsRover executeASetOfCommands: 'b'.
	self assert: marsRover position = (0@-1)."! !

!MarsRoverTest methodsFor: 'tests' stamp: 'FF 6/1/2022 12:27:55'!
test07Moving2TimesTowardsNorthAdds2PositionsInTheYAxis

	self assertPosition: (0@2) andDirection: $N ofAMarsRoverWhenExecuting: 'ff'.
"
	| marsRover |
	
	marsRover := MarsRover new.
	marsRover executeASetOfCommands: 'ff'.
	
	self assert: (marsRover position) equals: (0@2)."! !

!MarsRoverTest methodsFor: 'tests' stamp: 'FF 6/1/2022 12:28:00'!
test08TurningLeft2TimesChangesTheDirectionFromNorthToSouth

	self assertPosition: (0@0) andDirection: $S  ofAMarsRoverWhenExecuting: 'll'.

"
	| marsRover |
	
	marsRover := MarsRover new.
	marsRover executeASetOfCommands: 'll'.
	
	self assert: (marsRover direction isKindOf: South)."! !

!MarsRoverTest methodsFor: 'tests' stamp: 'FF 6/1/2022 12:28:06'!
test09TurningLeftAndThenMovingForwardChangesPositionInTheXAxis

	self assertPosition: (-1@0) andDirection: $W ofAMarsRoverWhenExecuting: 'lf'.
"
	| marsRover |
	
	marsRover := MarsRover new.
	marsRover executeASetOfCommands: 'lf'.
	
	self assert: (marsRover direction isKindOf: West).
	self assert: marsRover position equals: (-1@0)."! !

!MarsRoverTest methodsFor: 'tests' stamp: 'FF 6/1/2022 12:28:27'!
test10ReceivingAnInvalidCommandAfterValidCommandsStillAffectsPositionAndDirection

	"| marsRover |
	
	marsRover := MarsRover new."
	
	self 
	should: [ marsRover executeASetOfCommands: 'rfxf'. ] 
	raise: Error 
	withExceptionDo: [:anError | self assert: anError messageText = MarsRover invalidCommandErrorDescription ].
	self assert: (marsRover direction = $E).
	self assert: marsRover position equals: (1@0).
	! !

!MarsRoverTest methodsFor: 'tests' stamp: 'FF 6/1/2022 12:28:46'!
test11ChangesOfDifferentSetOfCommandsAreAddUp

	"| marsRover |
	
	marsRover := MarsRover new."
	self assertPosition: (2@0) andDirection: $E ofAMarsRoverWhenExecuting: 'rff'.
	self assertPosition: (2@1) andDirection: $N ofAMarsRoverWhenExecuting: 'lffb'.
	"
	mars executeASetOfCommands: 'rff'.
	mars executeASetOfCommands: 'lffb'.
	
	self assert: (mars direction isKindOf: North).
	self assert: mars position equals: (2@1)."
	! !


!classDefinition: #MarsRover category: 'MarsRover7'!
Object subclass: #MarsRover
	instanceVariableNames: 'position mobilitySystem mapOfCommands direction'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover7'!

!MarsRover methodsFor: 'position' stamp: 'DEC 5/27/2022 18:14:13'!
position

	^position! !

!MarsRover methodsFor: 'position' stamp: 'DEC 5/27/2022 20:29:34'!
positionChangeInTheEastDirection

	position := (position) + (1@0)! !

!MarsRover methodsFor: 'position' stamp: 'DEC 5/27/2022 20:29:37'!
positionChangeInTheNorthDirection

	position := (position) + (0@1)! !

!MarsRover methodsFor: 'position' stamp: 'DEC 5/27/2022 20:29:40'!
positionChangeInTheSouthDirection

	position := (position) - (0@1)! !

!MarsRover methodsFor: 'position' stamp: 'DEC 5/27/2022 20:29:45'!
positionChangeInTheWestDirection

	position := (position) - (1@0)! !


!MarsRover methodsFor: 'initialization' stamp: 'FF 6/1/2022 12:29:21'!
initialize
	
	position := 0@0.
	mobilitySystem := MobilityRelatedToNorth new.
	mapOfCommands := Dictionary new.
	mapOfCommands at: $f put: [mobilitySystem positionChangeOf: self].
	mapOfCommands at: $b put: [mobilitySystem opposite positionChangeOf: self].
	mapOfCommands at: $r put: [mobilitySystem := mobilitySystem rotateRight].
	mapOfCommands at: $l put: [mobilitySystem := mobilitySystem rotateLeft].
	! !


!MarsRover methodsFor: 'direction' stamp: 'FF 6/1/2022 12:29:38'!
direction
	
	(mobilitySystem isKindOf: MobilityRelatedToNorth) ifTrue: [^$N].
	(mobilitySystem isKindOf: MobilityRelatedToEast) ifTrue: [^$E].
	(mobilitySystem isKindOf: MobilityRelatedToWest) ifTrue: [^$W].
	(mobilitySystem isKindOf: MobilityRelatedToSouth) ifTrue: [^$S].! !


!MarsRover methodsFor: 'command execution' stamp: 'DEC 5/27/2022 19:12:22'!
executeASetOfCommands: aSetOfCommandsToBeExecuted

	aSetOfCommandsToBeExecuted collect: [:aCommandToBeExecuted | self executeCommand: aCommandToBeExecuted ].
! !

!MarsRover methodsFor: 'command execution' stamp: 'DEC 5/28/2022 18:36:19'!
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

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'MarsRover class' category: 'MarsRover7'!
MarsRover class
	instanceVariableNames: ''!

!MarsRover class methodsFor: 'error description' stamp: 'DEC 5/28/2022 18:18:19'!
invalidCommandErrorDescription

	^'The command is not valid'! !


!classDefinition: #MarsRoverMobilitySystem category: 'MarsRover7'!
Object subclass: #MarsRoverMobilitySystem
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover7'!

!MarsRoverMobilitySystem methodsFor: 'as yet unclassified' stamp: 'DEC 5/27/2022 20:05:12'!
opposite

	self subclassResponsibility ! !

!MarsRoverMobilitySystem methodsFor: 'as yet unclassified' stamp: 'DEC 5/27/2022 20:19:21'!
positionChangeOf: anObjectToChangeItsPosition

	self subclassResponsibility 

	! !

!MarsRoverMobilitySystem methodsFor: 'as yet unclassified' stamp: 'FF 6/1/2022 12:20:18'!
rotateLeft

	self subclassResponsibility ! !

!MarsRoverMobilitySystem methodsFor: 'as yet unclassified' stamp: 'FF 6/1/2022 12:20:36'!
rotateRight

	self subclassResponsibility ! !


!classDefinition: #MobilityRelatedToEast category: 'MarsRover7'!
MarsRoverMobilitySystem subclass: #MobilityRelatedToEast
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover7'!

!MobilityRelatedToEast methodsFor: 'as yet unclassified' stamp: 'FF 6/1/2022 12:29:38'!
opposite

	^MobilityRelatedToWest new! !

!MobilityRelatedToEast methodsFor: 'as yet unclassified' stamp: 'DEC 5/27/2022 20:29:52'!
positionChangeOf: anObjectToChangeItsPosition

	anObjectToChangeItsPosition positionChangeInTheEastDirection! !

!MobilityRelatedToEast methodsFor: 'as yet unclassified' stamp: 'FF 6/1/2022 12:29:21'!
rotateLeft 

	^MobilityRelatedToNorth new! !

!MobilityRelatedToEast methodsFor: 'as yet unclassified' stamp: 'FF 6/1/2022 12:29:29'!
rotateRight 

	^MobilityRelatedToSouth new! !


!classDefinition: #MobilityRelatedToNorth category: 'MarsRover7'!
MarsRoverMobilitySystem subclass: #MobilityRelatedToNorth
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover7'!

!MobilityRelatedToNorth methodsFor: 'as yet unclassified' stamp: 'FF 6/1/2022 12:29:29'!
opposite

	^MobilityRelatedToSouth new! !

!MobilityRelatedToNorth methodsFor: 'as yet unclassified' stamp: 'DEC 5/27/2022 20:30:01'!
positionChangeOf: anObjectToChangeItsPosition

	anObjectToChangeItsPosition positionChangeInTheNorthDirection! !

!MobilityRelatedToNorth methodsFor: 'as yet unclassified' stamp: 'FF 6/1/2022 12:29:38'!
rotateLeft

	^MobilityRelatedToWest new! !

!MobilityRelatedToNorth methodsFor: 'as yet unclassified' stamp: 'FF 6/1/2022 12:29:12'!
rotateRight

	^MobilityRelatedToEast new! !


!classDefinition: #MobilityRelatedToSouth category: 'MarsRover7'!
MarsRoverMobilitySystem subclass: #MobilityRelatedToSouth
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover7'!

!MobilityRelatedToSouth methodsFor: 'as yet unclassified' stamp: 'FF 6/1/2022 12:29:21'!
opposite

	^MobilityRelatedToNorth new! !

!MobilityRelatedToSouth methodsFor: 'as yet unclassified' stamp: 'DEC 5/27/2022 20:30:11'!
positionChangeOf: anObjectToChangeItsPosition

	anObjectToChangeItsPosition positionChangeInTheSouthDirection! !

!MobilityRelatedToSouth methodsFor: 'as yet unclassified' stamp: 'FF 6/1/2022 12:29:12'!
rotateLeft

	^MobilityRelatedToEast new! !

!MobilityRelatedToSouth methodsFor: 'as yet unclassified' stamp: 'FF 6/1/2022 12:29:38'!
rotateRight

	^MobilityRelatedToWest new! !


!classDefinition: #MobilityRelatedToWest category: 'MarsRover7'!
MarsRoverMobilitySystem subclass: #MobilityRelatedToWest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover7'!

!MobilityRelatedToWest methodsFor: 'as yet unclassified' stamp: 'FF 6/1/2022 12:29:12'!
opposite

	^MobilityRelatedToEast new! !

!MobilityRelatedToWest methodsFor: 'as yet unclassified' stamp: 'DEC 5/27/2022 20:30:05'!
positionChangeOf: anObjectToChangeItsPosition

	anObjectToChangeItsPosition positionChangeInTheWestDirection! !

!MobilityRelatedToWest methodsFor: 'as yet unclassified' stamp: 'FF 6/1/2022 12:29:29'!
rotateLeft

	^MobilityRelatedToSouth new! !

!MobilityRelatedToWest methodsFor: 'as yet unclassified' stamp: 'FF 6/1/2022 12:29:21'!
rotateRight

	^MobilityRelatedToNorth new! !
