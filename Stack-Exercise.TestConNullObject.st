!classDefinition: #OOStackTest category: 'Stack-Exercise.TestConNullObject'!
TestCase subclass: #OOStackTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise.TestConNullObject'!

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


!classDefinition: #SentenceFinderByPrefixTest category: 'Stack-Exercise.TestConNullObject'!
TestCase subclass: #SentenceFinderByPrefixTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise.TestConNullObject'!


!classDefinition: #OOStack category: 'Stack-Exercise.TestConNullObject'!
Object subclass: #OOStack
	instanceVariableNames: 'array topIndex estado'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise.TestConNullObject'!

!OOStack methodsFor: 'as yet unclassified' stamp: 'DEC 5/11/2022 22:35:53'!
initialize

	estado := OOEmptyStack new.! !

!OOStack methodsFor: 'as yet unclassified' stamp: 'DEC 5/11/2022 22:30:30'!
initializeOfSize: aSize

	estado := OOEmptyStack new: aSize.! !

!OOStack methodsFor: 'as yet unclassified' stamp: 'DEC 5/11/2022 22:33:44'!
isEmpty
	
	^estado isEmpty 
"
	(self size = 0) ifTrue: [^true].
	
	^false
"! !

!OOStack methodsFor: 'as yet unclassified' stamp: 'DEC 5/11/2022 22:03:49'!
pop

	self subclassResponsibility 
"	
	| lastPushedObject |
	
	lastPushedObject := self top.
	topIndex := topIndex - 1.
	
	^lastPushedObject 
"! !

!OOStack methodsFor: 'as yet unclassified' stamp: 'DC 5/11/2022 14:27:13'!
push: anObjectToBePushed
	
	| newTopIndex | 
		
	array at: topIndex put: anObjectToBePushed.
	newTopIndex := topIndex + 1.
	topIndex := newTopIndex.! !

!OOStack methodsFor: 'as yet unclassified' stamp: 'DEC 5/11/2022 22:05:55'!
size
	
	self subclassResponsibility 
	"
	^(topIndex - firstIndex)"! !

!OOStack methodsFor: 'as yet unclassified' stamp: 'DEC 5/11/2022 22:06:14'!
top

	self subclassResponsibility 
"
	| newTopIndex lastPushedObject |
	
	( self isEmpty ) ifTrue: [ self error: OOStack stackEmptyErrorDescription ].
		
	newTopIndex := topIndex - 1.
	lastPushedObject := array at: newTopIndex.
	
	^lastPushedObject "! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'OOStack class' category: 'Stack-Exercise.TestConNullObject'!
OOStack class
	instanceVariableNames: ''!

!OOStack class methodsFor: 'error descriptions' stamp: 'HernanWilkinson 5/7/2012 11:51'!
stackEmptyErrorDescription
	
	^ 'Stack is empty'! !


!OOStack class methodsFor: 'as yet unclassified' stamp: 'DEC 5/11/2022 22:34:58'!
new

	^super new initialize.
	! !


!classDefinition: #OOEmptyStack category: 'Stack-Exercise.TestConNullObject'!
OOStack subclass: #OOEmptyStack
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise.TestConNullObject'!

!OOEmptyStack methodsFor: 'as yet unclassified' stamp: 'DEC 5/11/2022 22:36:56'!
initialize
	
	topIndex := 1.
	estado := nil.
	array := nil.
	 ! !

!OOEmptyStack methodsFor: 'as yet unclassified' stamp: 'DEC 5/11/2022 22:32:49'!
initializeOfSize: aSize
	
	topIndex := 1.
	estado := nil.
	array := nil.
	 ! !

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

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'OOEmptyStack class' category: 'Stack-Exercise.TestConNullObject'!
OOEmptyStack class
	instanceVariableNames: ''!

!OOEmptyStack class methodsFor: 'as yet unclassified' stamp: 'DEC 5/11/2022 22:36:50'!
new

	^super initialize! !

!OOEmptyStack class methodsFor: 'as yet unclassified' stamp: 'DEC 5/11/2022 22:31:22'!
new: aSize

	^super initializeOfSize: aSize! !


!classDefinition: #OONotEmptyStack category: 'Stack-Exercise.TestConNullObject'!
OOStack subclass: #OONotEmptyStack
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise.TestConNullObject'!

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


!classDefinition: #SentenceFinderByPrefix category: 'Stack-Exercise.TestConNullObject'!
Object subclass: #SentenceFinderByPrefix
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise.TestConNullObject'!
