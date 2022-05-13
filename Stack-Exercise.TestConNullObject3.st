!classDefinition: #OOStackTest category: 'Stack-Exercise.TestConNullObject3'!
TestCase subclass: #OOStackTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise.TestConNullObject3'!

!OOStackTest methodsFor: 'test' stamp: 'HernanWilkinson 5/7/2012 11:30'!
test01StackShouldBeEmptyWhenCreated

	| stack |
	
	stack := OOStack new.
	
	self assert: stack isEmpty! !

!OOStackTest methodsFor: 'test' stamp: 'NR 5/13/2020 13:29:55'!
test02PushAddElementsToTheStack

	| stack |
	
	stack := OOStack new.
	stack push: 'something'.
	
	self deny: stack isEmpty! !

!OOStackTest methodsFor: 'test' stamp: 'NR 5/13/2020 13:30:01'!
test03PopRemovesElementsFromTheStack

	| stack |
	
	stack := OOStack new.
	stack push: 'something'.
	stack pop.
	
	self assert: stack isEmpty! !

!OOStackTest methodsFor: 'test' stamp: 'NR 5/13/2020 13:30:09'!
test04PopReturnsLastPushedObject

	| stack pushedObject |
	
	stack := OOStack new.
	pushedObject := 'something'.
	stack push: pushedObject.
	
	self assert: stack pop = pushedObject! !

!OOStackTest methodsFor: 'test' stamp: 'NR 5/13/2020 13:30:48'!
test05StackBehavesLIFO

	| stack firstPushedObject secondPushedObject |
	
	stack := OOStack new.
	firstPushedObject := 'first'.
	secondPushedObject := 'second'.
	
	stack push: firstPushedObject.
	stack push: secondPushedObject.
	
	self assert: stack pop = secondPushedObject.
	self assert: stack pop = firstPushedObject.
	self assert: stack isEmpty 
	! !

!OOStackTest methodsFor: 'test' stamp: 'NR 5/13/2020 13:30:20'!
test06TopReturnsLastPushedObject

	| stack pushedObject |
	
	stack := OOStack new.
	pushedObject := 'something'.
	
	stack push: pushedObject.
	
	self assert: stack top = pushedObject.
	! !

!OOStackTest methodsFor: 'test' stamp: 'NR 5/13/2020 13:30:24'!
test07TopDoesNotRemoveObjectFromStack

	| stack pushedObject |
	
	stack := OOStack new.
	pushedObject := 'something'.
	
	stack push: pushedObject.
	
	self assert: stack size = 1.
	stack top.
	self assert: stack size = 1.
	! !

!OOStackTest methodsFor: 'test' stamp: 'HAW 4/14/2017 22:48:26'!
test08CanNotPopWhenThereAreNoObjectsInTheStack

	| stack  |
	
	stack := OOStack new.
	self
		should: [ stack pop ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: anError messageText = OOStack stackEmptyErrorDescription ]
		
! !

!OOStackTest methodsFor: 'test' stamp: 'NR 5/13/2020 13:30:31'!
test09CanNotPopWhenThereAreNoObjectsInTheStackAndTheStackHadObjects

	| stack  |
	
	stack := OOStack new.
	stack push: 'something'.
	stack pop.
	
	self
		should: [ stack pop ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: anError messageText = OOStack stackEmptyErrorDescription ]
		
! !

!OOStackTest methodsFor: 'test' stamp: 'HAW 4/14/2017 22:48:44'!
test10CanNotTopWhenThereAreNoObjectsInTheStack

	| stack  |
	
	stack := OOStack new.
	self
		should: [ stack top ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: anError messageText = OOStack stackEmptyErrorDescription ]
		
! !


!classDefinition: #SentenceFinderByPrefixTest category: 'Stack-Exercise.TestConNullObject3'!
TestCase subclass: #SentenceFinderByPrefixTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise.TestConNullObject3'!


!classDefinition: #OOStack category: 'Stack-Exercise.TestConNullObject3'!
Object subclass: #OOStack
	instanceVariableNames: 'contents state'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise.TestConNullObject3'!

!OOStack methodsFor: 'as yet unclassified' stamp: 'FF 5/12/2022 20:29:24'!
initialize

	state := OOEmptyStack new.
	contents := OrderedCollection new.! !

!OOStack methodsFor: 'as yet unclassified' stamp: 'FF 5/12/2022 20:28:35'!
isEmpty
	
	^state isEmpty 
"
	(self size = 0) ifTrue: [^true].
	
	^false
"! !

!OOStack methodsFor: 'as yet unclassified' stamp: 'FF 5/12/2022 20:47:26'!
pop
	^state pop.
"
	( state class = OOEmptyStack ) ifTrue: [ self error: OOStack stackEmptyErrorDescription ].
	( state class = OONotEmptyStack and: [contents size = 1] ) ifTrue: [	state := OOEmptyStack new. 														^contents removeLast.]. 
	( state class = OONotEmptyStack ) ifTrue: [ ^contents removeLast ]"
	! !

!OOStack methodsFor: 'as yet unclassified' stamp: 'FF 5/12/2022 20:36:36'!
push: anObjectToBePushed
	
	( state class = OOEmptyStack ) ifTrue: [		state := OONotEmptyStack new].
	^contents add: anObjectToBePushed.! !

!OOStack methodsFor: 'as yet unclassified' stamp: 'FF 5/12/2022 20:42:48'!
size
	
	^contents size
	"
	^(topIndex - firstIndex)"! !

!OOStack methodsFor: 'as yet unclassified' stamp: 'FF 5/12/2022 20:33:12'!
top

	( state class = OOEmptyStack ) ifTrue: [ self error: OOStack stackEmptyErrorDescription ].
	( state class = OONotEmptyStack ) ifTrue: [ ^contents last]
"
	| newTopIndex lastPushedObject |
	
	( self isEmpty ) ifTrue: [ self error: OOStack stackEmptyErrorDescription ].
		
	newTopIndex := topIndex - 1.
	lastPushedObject := array at: newTopIndex.
	
	^lastPushedObject "! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'OOStack class' category: 'Stack-Exercise.TestConNullObject3'!
OOStack class
	instanceVariableNames: ''!

!OOStack class methodsFor: 'error descriptions' stamp: 'HernanWilkinson 5/7/2012 11:51'!
stackEmptyErrorDescription
	
	^ 'Stack is empty'! !



!classDefinition: #OOStackState category: 'Stack-Exercise.TestConNullObject3'!
Object subclass: #OOStackState
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise.TestConNullObject3'!

!OOStackState methodsFor: 'as yet unclassified' stamp: 'FF 5/12/2022 20:08:58'!
isEmpty
	
	self subclassResponsibility ! !

!OOStackState methodsFor: 'as yet unclassified' stamp: 'FF 5/12/2022 20:54:03'!
pop

	self subclassResponsibility ! !

!OOStackState methodsFor: 'as yet unclassified' stamp: 'FF 5/12/2022 20:53:48'!
push: anObjectToBePushed

	self subclassResponsibility ! !

!OOStackState methodsFor: 'as yet unclassified' stamp: 'FF 5/12/2022 20:53:15'!
size 

	self subclassResponsibility ! !

!OOStackState methodsFor: 'as yet unclassified' stamp: 'FF 5/12/2022 20:53:26'!
top 

	self subclassResponsibility ! !


!classDefinition: #OOEmptyStack category: 'Stack-Exercise.TestConNullObject3'!
OOStackState subclass: #OOEmptyStack
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise.TestConNullObject3'!

!OOEmptyStack methodsFor: 'as yet unclassified' stamp: 'DEC 5/11/2022 22:00:16'!
isEmpty

	^true! !

!OOEmptyStack methodsFor: 'as yet unclassified' stamp: 'DEC 5/11/2022 22:02:42'!
pop

	^self error: OOStack stackEmptyErrorDescription! !

!OOEmptyStack methodsFor: 'as yet unclassified' stamp: 'DEC 5/11/2022 22:07:35'!
push: anObjectToBePushed
! !

!OOEmptyStack methodsFor: 'as yet unclassified' stamp: 'DEC 5/11/2022 22:05:29'!
size

	^0! !

!OOEmptyStack methodsFor: 'as yet unclassified' stamp: 'DEC 5/11/2022 22:04:14'!
top

	^self error: OOStack stackEmptyErrorDescription! !


!classDefinition: #OONotEmptyStack category: 'Stack-Exercise.TestConNullObject3'!
OOStackState subclass: #OONotEmptyStack
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise.TestConNullObject3'!

!OONotEmptyStack methodsFor: 'as yet unclassified' stamp: 'DEC 5/11/2022 22:01:07'!
isEmpty

	^false! !

!OONotEmptyStack methodsFor: 'as yet unclassified' stamp: 'DEC 5/11/2022 22:03:05'!
pop

	| lastPushedObject |
	
	lastPushedObject := self top.
	topIndex := topIndex - 1.
	
	^lastPushedObject ! !

!OONotEmptyStack methodsFor: 'as yet unclassified' stamp: 'DEC 5/11/2022 22:07:13'!
push: anObjectToBePushed

	| newTopIndex | 
		
	array at: topIndex put: anObjectToBePushed.
	newTopIndex := topIndex + 1.
	topIndex := newTopIndex.	

	! !

!OONotEmptyStack methodsFor: 'as yet unclassified' stamp: 'DEC 5/11/2022 22:05:43'!
size

	^(topIndex - firstIndex)	! !

!OONotEmptyStack methodsFor: 'as yet unclassified' stamp: 'DEC 5/11/2022 22:04:49'!
top

	| newTopIndex lastPushedObject |
		
	newTopIndex := topIndex - 1.
	lastPushedObject := array at: newTopIndex.
	
	^lastPushedObject ! !


!classDefinition: #SentenceFinderByPrefix category: 'Stack-Exercise.TestConNullObject3'!
Object subclass: #SentenceFinderByPrefix
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise.TestConNullObject3'!
