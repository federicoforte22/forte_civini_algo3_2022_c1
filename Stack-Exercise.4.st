!classDefinition: #OOStack category: 'Stack-Exercise.4'!
OrderedCollection subclass: #OOStack
	instanceVariableNames: 'topIndex'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise.4'!

!OOStack methodsFor: 'as yet unclassified' stamp: 'DC 5/11/2022 14:27:40'!
initializeOfSize: aSize

	array := (Array new: aSize ).
	firstIndex := 1.
	lastIndex := aSize.
	topIndex := 1.! !

!OOStack methodsFor: 'as yet unclassified' stamp: 'DC 5/11/2022 14:24:05'!
isEmpty

	(self size = 0) ifTrue: [^true].
	
	^false! !

!OOStack methodsFor: 'as yet unclassified' stamp: 'DEC 5/11/2022 21:51:08'!
pop
	
	| lastPushedObject |
	
	lastPushedObject := self top.
	topIndex := topIndex - 1.
	
	^lastPushedObject 
"
	| newTopIndex lastPushedObject | 
	
	( self isEmpty ) ifTrue: [ self error: OOStack stackEmptyErrorDescription ].
		
	newTopIndex := topIndex - 1.
	topIndex := newTopIndex .
	lastPushedObject := array at: newTopIndex.
	
	^lastPushedObject
"! !

!OOStack methodsFor: 'as yet unclassified' stamp: 'DC 5/11/2022 14:27:13'!
push: anObjectToBePushed
	
	| newTopIndex | 
		
	array at: topIndex put: anObjectToBePushed.
	newTopIndex := topIndex + 1.
	topIndex := newTopIndex.! !

!OOStack methodsFor: 'as yet unclassified' stamp: 'FF 5/10/2022 20:56:20'!
size

	^(topIndex - firstIndex)! !

!OOStack methodsFor: 'as yet unclassified' stamp: 'DC 5/11/2022 14:25:40'!
top

	| newTopIndex lastPushedObject |
	
	( self isEmpty ) ifTrue: [ self error: OOStack stackEmptyErrorDescription ].
		
	newTopIndex := topIndex - 1.
	lastPushedObject := array at: newTopIndex.
	
	^lastPushedObject ! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'OOStack class' category: 'Stack-Exercise.4'!
OOStack class
	instanceVariableNames: ''!

!OOStack class methodsFor: 'error descriptions' stamp: 'HernanWilkinson 5/7/2012 11:51'!
stackEmptyErrorDescription
	
	^ 'Stack is empty'! !


!OOStack class methodsFor: 'as yet unclassified' stamp: 'FF 5/10/2022 20:55:41'!
new

	^super new initializeOfSize: 10.
	! !


!classDefinition: #OOStackTest category: 'Stack-Exercise.4'!
TestCase subclass: #OOStackTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise.4'!

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


!classDefinition: #SentenceFinderByPrefixTest category: 'Stack-Exercise.4'!
TestCase subclass: #SentenceFinderByPrefixTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise.4'!


!classDefinition: #SentenceFinderByPrefix category: 'Stack-Exercise.4'!
Object subclass: #SentenceFinderByPrefix
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise.4'!
