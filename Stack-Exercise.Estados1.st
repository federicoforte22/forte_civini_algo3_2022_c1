!classDefinition: #OOStackTest category: 'Stack-Exercise.Estados1'!
TestCase subclass: #OOStackTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise.Estados1'!

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


!classDefinition: #SentenceFinderByPrefixTest category: 'Stack-Exercise.Estados1'!
TestCase subclass: #SentenceFinderByPrefixTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise.Estados1'!


!classDefinition: #OOStack category: 'Stack-Exercise.Estados1'!
Object subclass: #OOStack
	instanceVariableNames: 'contents state'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise.Estados1'!

!OOStack methodsFor: 'adding' stamp: 'DEC 5/13/2022 19:49:33'!
push: anObjectToBePushed
	
	state push: anObjectToBePushed to: self.
! !


!OOStack methodsFor: 'info getters' stamp: 'DEC 5/13/2022 22:45:30'!
isEmpty

	^contents size = 0
! !

!OOStack methodsFor: 'info getters' stamp: 'DEC 5/13/2022 22:46:07'!
size
	
	^contents size
! !

!OOStack methodsFor: 'info getters' stamp: 'DEC 5/13/2022 22:46:17'!
top

	^state topFrom: self
! !


!OOStack methodsFor: 'initialization' stamp: 'DEC 5/13/2022 22:47:31'!
initialize

	state := OOEmptyStackState new.
	contents := OrderedCollection new.! !


!OOStack methodsFor: 'subtracting' stamp: 'DEC 5/13/2022 22:45:38'!
pop

	^state popFrom: self
! !


!OOStack methodsFor: 'private' stamp: 'DEC 5/13/2022 22:01:23'!
popWhenEmpty

	^self error: OOStack stackEmptyErrorDescription ! !

!OOStack methodsFor: 'private' stamp: 'DEC 5/13/2022 22:27:37'!
popWhenNotEmpty
	
	| lastPushedObject |
	
	lastPushedObject := contents removeLast.
	self updateState.
	
	^lastPushedObject! !

!OOStack methodsFor: 'private' stamp: 'DEC 5/13/2022 22:45:58'!
pushWhenEmpty: anObjectToBePushed

	contents addLast: anObjectToBePushed.
	self updateState.


	! !

!OOStack methodsFor: 'private' stamp: 'DEC 5/13/2022 19:56:26'!
pushWhenNotEmpty: anObjectToBePushed

	contents addLast: anObjectToBePushed ! !

!OOStack methodsFor: 'private' stamp: 'DEC 5/13/2022 22:09:49'!
topWhenEmpty

	^self error: OOStack stackEmptyErrorDescription ! !

!OOStack methodsFor: 'private' stamp: 'DEC 5/13/2022 22:12:23'!
topWhenNotEmpty

	^contents last! !

!OOStack methodsFor: 'private' stamp: 'DEC 5/13/2022 22:27:55'!
updateState

	| newStateClass |
	
	newStateClass := OOStackState subclasses detect: [:aSubclass | (aSubclass isStackValidForMe: self) = true].
	state := newStateClass new.
! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'OOStack class' category: 'Stack-Exercise.Estados1'!
OOStack class
	instanceVariableNames: ''!

!OOStack class methodsFor: 'error descriptions' stamp: 'HernanWilkinson 5/7/2012 11:51'!
stackEmptyErrorDescription
	
	^ 'Stack is empty'! !


!classDefinition: #OOStackState category: 'Stack-Exercise.Estados1'!
Object subclass: #OOStackState
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise.Estados1'!

!OOStackState methodsFor: 'info getters' stamp: 'DEC 5/13/2022 22:50:14'!
topFrom: aStackToSeeItsTop

	self subclassResponsibility ! !


!OOStackState methodsFor: 'adding' stamp: 'DEC 5/13/2022 22:51:46'!
push: anObjectToBePushed to: aStackToPushObjects

	self subclassResponsibility ! !


!OOStackState methodsFor: 'subtracting' stamp: 'DEC 5/13/2022 22:52:24'!
popFrom: aStackToPopElements

	self subclassResponsibility ! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'OOStackState class' category: 'Stack-Exercise.Estados1'!
OOStackState class
	instanceVariableNames: ''!

!OOStackState class methodsFor: 'validate' stamp: 'DEC 5/13/2022 22:53:50'!
isStackValidForMe: aStackToValidate

	self subclassResponsibility ! !


!classDefinition: #OOEmptyStackState category: 'Stack-Exercise.Estados1'!
OOStackState subclass: #OOEmptyStackState
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise.Estados1'!

!OOEmptyStackState methodsFor: 'info getters' stamp: 'DEC 5/13/2022 22:09:00'!
topFrom: aStackToSeeItsTop

	^aStackToSeeItsTop topWhenEmpty
	

! !


!OOEmptyStackState methodsFor: 'subtracting' stamp: 'DEC 5/13/2022 22:52:47'!
popFrom: aStackToPopElements

	aStackToPopElements popWhenEmpty! !


!OOEmptyStackState methodsFor: 'adding' stamp: 'DEC 5/13/2022 22:46:40'!
push: anObjectToBePushed to: aStackToPushObjects

	aStackToPushObjects pushWhenEmpty: anObjectToBePushed 


	
! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'OOEmptyStackState class' category: 'Stack-Exercise.Estados1'!
OOEmptyStackState class
	instanceVariableNames: ''!

!OOEmptyStackState class methodsFor: 'validation' stamp: 'DEC 5/13/2022 22:54:04'!
isStackValidForMe: aStackToValidate

	^(aStackToValidate isEmpty) = true! !


!classDefinition: #OONotEmptyStackState category: 'Stack-Exercise.Estados1'!
OOStackState subclass: #OONotEmptyStackState
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise.Estados1'!

!OONotEmptyStackState methodsFor: 'subtracting' stamp: 'DEC 5/13/2022 22:46:51'!
popFrom: aStackToPopElements

	^aStackToPopElements popWhenNotEmpty.
! !


!OONotEmptyStackState methodsFor: 'info getters' stamp: 'DEC 5/13/2022 22:10:36'!
topFrom: aStackToSeeItsTop

	^aStackToSeeItsTop topWhenNotEmpty! !


!OONotEmptyStackState methodsFor: 'adding' stamp: 'DEC 5/13/2022 22:46:57'!
push: anObjectToBePushed to: aStackToPushObjects

	aStackToPushObjects pushWhenNotEmpty: anObjectToBePushed 

	! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'OONotEmptyStackState class' category: 'Stack-Exercise.Estados1'!
OONotEmptyStackState class
	instanceVariableNames: ''!

!OONotEmptyStackState class methodsFor: 'validation' stamp: 'DEC 5/13/2022 22:54:22'!
isStackValidForMe: aStackToValidate

	^aStackToValidate isEmpty = false! !


!classDefinition: #SentenceFinderByPrefix category: 'Stack-Exercise.Estados1'!
Object subclass: #SentenceFinderByPrefix
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise.Estados1'!
