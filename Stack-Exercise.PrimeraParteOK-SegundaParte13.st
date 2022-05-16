!classDefinition: #OOStackTest category: 'Stack-Exercise.PrimeraParteOK-SegundaParte13'!
TestCase subclass: #OOStackTest
	instanceVariableNames: 'fullLimitedStack'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise.PrimeraParteOK-SegundaParte13'!

!OOStackTest methodsFor: 'test - limited stack' stamp: 'DEC 5/15/2022 19:35:54'!
test11LimitedStackIsEmptyWhenCreated

	| stack |
	
	stack := OOLimitedStack newOfSize: 4.
	
	self assert: stack isEmpty.
	self deny: stack isFull.! !

!OOStackTest methodsFor: 'test - limited stack' stamp: 'DEC 5/15/2022 19:36:05'!
test12PushInALimitedStackAddsAnElement

	| stack |
	
	stack := OOLimitedStack newOfSize: 4.
	stack push: 'FirstPushedObject'.
	
	self deny: stack isEmpty.
	self deny: stack isFull.! !

!OOStackTest methodsFor: 'test - limited stack' stamp: 'DEC 5/15/2022 19:36:14'!
test13PopInALimitedStackRemovesLastElement

	| stack lastPushedObject |
	
	stack := OOLimitedStack newOfSize: 4.
	stack push: 'FirstPushedObject'.
	lastPushedObject := stack pop.
	
	self assert: lastPushedObject = 'FirstPushedObject'.
	self assert: stack isEmpty.
	self deny: stack isFull.! !

!OOStackTest methodsFor: 'test - limited stack' stamp: 'DEC 5/15/2022 20:26:12'!
test14LimitedStackGetsFullWithCorrectQuantityOfPushedElements

	self deny: fullLimitedStack isEmpty.
	self assert: fullLimitedStack isFull.! !

!OOStackTest methodsFor: 'test - limited stack' stamp: 'DEC 5/15/2022 20:26:05'!
test15FullLimitedStackReturnsLastPushedElementWithTopAndRemainsFull

	 | topOfTheStack |	
	
	topOfTheStack := fullLimitedStack top.

	self assert: fullLimitedStack isFull.
	self assert: topOfTheStack = 'FourthPushedObject'.
	self assert: fullLimitedStack isFull.! !

!OOStackTest methodsFor: 'test - limited stack' stamp: 'DEC 5/15/2022 20:25:59'!
test16FullLimitedStackReturnsLastPushedObjectWithPop

	| lastPushedObject |
	
	self assert: fullLimitedStack isFull.
	lastPushedObject := fullLimitedStack pop.
	self assert: lastPushedObject = 'FourthPushedObject'.
	self deny: fullLimitedStack isFull.! !

!OOStackTest methodsFor: 'test - limited stack' stamp: 'DEC 5/15/2022 20:25:53'!
test17FullLimitedStackReturnsAFullErrorDescriptionWhenPushedAnotherObject
	
	self
		should: [ fullLimitedStack push: 'FifthPushedObject'. ]
		raise: Error
		withExceptionDo: [ :anError |
			self assert: anError messageText = OOLimitedStack stackFullErrorDescription ]! !

!OOStackTest methodsFor: 'test - limited stack' stamp: 'DEC 5/15/2022 20:25:48'!
test18AfterBeingFullLimitedStackCanGetEmptied
	
	self assert: fullLimitedStack isFull.
	self assert: fullLimitedStack pop = 'FourthPushedObject'.
	self assert: fullLimitedStack pop = 'ThirdPushedObject'.
	self assert: fullLimitedStack pop = 'SecondPushedObject'.
	self assert: fullLimitedStack pop = 'FirstPushedObject'.
	self assert: fullLimitedStack isEmpty.! !


!OOStackTest methodsFor: 'set up' stamp: 'DEC 5/15/2022 20:22:20'!
setUp

	fullLimitedStack := OOLimitedStack newOfSize: 4.
	fullLimitedStack push: 'FirstPushedObject'.
	fullLimitedStack push: 'SecondPushedObject'.
	fullLimitedStack push: 'ThirdPushedObject'.
	fullLimitedStack push: 'FourthPushedObject'.! !


!OOStackTest methodsFor: 'test - unlimited stack' stamp: 'DEC 5/15/2022 19:06:42'!
test01StackShouldBeEmptyWhenCreated

	| stack |
	
	stack := OOStack newUnlimited.
	
	self assert: stack isEmpty! !

!OOStackTest methodsFor: 'test - unlimited stack' stamp: 'DEC 5/15/2022 19:06:52'!
test02PushAddElementsToTheStack

	| stack |
	
	stack := OOStack newUnlimited.
	stack push: 'something'.
	
	self deny: stack isEmpty! !

!OOStackTest methodsFor: 'test - unlimited stack' stamp: 'DEC 5/15/2022 19:06:59'!
test03PopRemovesElementsFromTheStack

	| stack |
	
	stack := OOStack newUnlimited.
	stack push: 'something'.
	stack pop.
	
	self assert: stack isEmpty! !

!OOStackTest methodsFor: 'test - unlimited stack' stamp: 'DEC 5/15/2022 19:07:06'!
test04PopReturnsLastPushedObject

	| stack pushedObject |
	
	stack := OOStack newUnlimited.
	pushedObject := 'something'.
	stack push: pushedObject.
	
	self assert: stack pop = pushedObject! !

!OOStackTest methodsFor: 'test - unlimited stack' stamp: 'DEC 5/15/2022 19:07:16'!
test05StackBehavesLIFO

	| stack firstPushedObject secondPushedObject |
	
	stack := OOStack newUnlimited.
	firstPushedObject := 'first'.
	secondPushedObject := 'second'.
	
	stack push: firstPushedObject.
	stack push: secondPushedObject.
	
	self assert: stack pop = secondPushedObject.
	self assert: stack pop = firstPushedObject.
	self assert: stack isEmpty 
	! !

!OOStackTest methodsFor: 'test - unlimited stack' stamp: 'DEC 5/15/2022 19:07:22'!
test06TopReturnsLastPushedObject

	| stack pushedObject |
	
	stack := OOStack newUnlimited.
	pushedObject := 'something'.
	
	stack push: pushedObject.
	
	self assert: stack top = pushedObject.
	! !

!OOStackTest methodsFor: 'test - unlimited stack' stamp: 'DEC 5/15/2022 19:07:30'!
test07TopDoesNotRemoveObjectFromStack

	| stack pushedObject |
	
	stack := OOStack newUnlimited.
	pushedObject := 'something'.
	
	stack push: pushedObject.
	
	self assert: stack size = 1.
	stack top.
	self assert: stack size = 1.
	! !

!OOStackTest methodsFor: 'test - unlimited stack' stamp: 'DEC 5/15/2022 19:07:37'!
test08CanNotPopWhenThereAreNoObjectsInTheStack

	| stack  |
	
	stack := OOStack newUnlimited.
	self
		should: [ stack pop ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: anError messageText = OOStack stackEmptyErrorDescription ]
		
! !

!OOStackTest methodsFor: 'test - unlimited stack' stamp: 'DEC 5/15/2022 19:07:47'!
test09CanNotPopWhenThereAreNoObjectsInTheStackAndTheStackHadObjects

	| stack  |
	
	stack := OOStack newUnlimited.
	stack push: 'something'.
	stack pop.
	
	self
		should: [ stack pop ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: anError messageText = OOStack stackEmptyErrorDescription ]
		
! !

!OOStackTest methodsFor: 'test - unlimited stack' stamp: 'DEC 5/15/2022 19:07:53'!
test10CanNotTopWhenThereAreNoObjectsInTheStack

	| stack  |
	
	stack := OOStack newUnlimited.
	self
		should: [ stack top ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: anError messageText = OOStack stackEmptyErrorDescription ]
		
! !


!classDefinition: #SentenceFinderByPrefixTest category: 'Stack-Exercise.PrimeraParteOK-SegundaParte13'!
TestCase subclass: #SentenceFinderByPrefixTest
	instanceVariableNames: 'notEmptyStack emptyStack stackWithFourEqualStrings sentenceFinderWithEmptyStack sentenceFinderWithNotEmptyStack sentenceFinderWithEqualStringsStack'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise.PrimeraParteOK-SegundaParte13'!

!SentenceFinderByPrefixTest methodsFor: 'test' stamp: 'DEC 5/15/2022 22:29:26'!
test01PrefixNotInStackThenItReturnsAnEmptyCollection

	| results |
	
	results := sentenceFinderWithNotEmptyStack find: 'Mal'.
	
	self assert: results isEmpty.! !

!SentenceFinderByPrefixTest methodsFor: 'test' stamp: 'DEC 5/14/2022 19:40:03'!
test02PrefixInStackOneTimeThenReturnsACollectionWithTheString

	| results |
	
	results := sentenceFinderWithNotEmptyStack find: 'mal'.
	
	self assert: results size = 1.
	self assert: (results at: 1) = 'malditos objetos'.

	! !

!SentenceFinderByPrefixTest methodsFor: 'test' stamp: 'DEC 5/15/2022 20:27:59'!
test03AfterFindingThePrefixTheOriginalStackRemainsTheSame

	| results |
	
	results := sentenceFinderWithNotEmptyStack find: 'mal'.
	
	self assert: (results at: 1) = 'malditos objetos'.
	self assert: notEmptyStack pop = 'me marea el double dispatch'.
	self assert: notEmptyStack pop = 'malditos objetos'.
	self assert: notEmptyStack pop = 'No me gusta el stack'.
	self assert: notEmptyStack pop = 'TP complicado'.! !

!SentenceFinderByPrefixTest methodsFor: 'test' stamp: 'DEC 5/15/2022 20:28:14'!
test04FindPrefixInAnEmptyStackShouldReturnAnEmptyCollection
	| results |
	
	results := sentenceFinderWithEmptyStack find: 'siu'.
	
	self assert: results isEmpty.! !

!SentenceFinderByPrefixTest methodsFor: 'test' stamp: 'DEC 5/14/2022 19:17:37'!
test05PrefixIsFoundFourTimesThenReturnsACollectionWithSizeFour
	
	| results0 |
	
	results0 := sentenceFinderWithEqualStringsStack find: 'Sent'.
	
	self assert: results0 size = 4.
	

	! !

!SentenceFinderByPrefixTest methodsFor: 'test' stamp: 'DEC 5/14/2022 20:58:41'!
test06SameSentenceFinderByPrefixCanBeUsedTwiceWithDifferentsPrefixes

	| results0 results1 |
	
	results0 := sentenceFinderWithNotEmptyStack find: 'm'.
	results1 := sentenceFinderWithNotEmptyStack find: 'M'.
	
	self assert: results0 size = 2.
	self assert: results1 size = 0.
	! !

!SentenceFinderByPrefixTest methodsFor: 'test' stamp: 'DEC 5/14/2022 21:11:52'!
test07TryingToFindInvalidPrefixWithAnEmptyStackReturnsAnInvalidPrefixError

	self 
		should: [ sentenceFinderWithEmptyStack find: '']
		raise: Error
		withExceptionDo: [ :anError | self assert: SentenceFinderByPrefix invalidPrefixErrorDescription equals: anError messageText ].
		
	self 
		should: [ sentenceFinderWithEmptyStack find: ' ']
		raise: Error
		withExceptionDo: [ :anError | self assert: SentenceFinderByPrefix invalidPrefixErrorDescription equals: anError messageText ].
	


	

	! !

!SentenceFinderByPrefixTest methodsFor: 'test' stamp: 'DEC 5/14/2022 21:15:10'!
test08TryingToFindInvalidPrefixWithANotEmptyStackReturnsAnInvalidPrefixError

	self 
		should: [ sentenceFinderWithNotEmptyStack find: '']
		raise: Error
		withExceptionDo: [ :anError | self assert: SentenceFinderByPrefix invalidPrefixErrorDescription equals: anError messageText ].
		
	self 
		should: [ sentenceFinderWithNotEmptyStack find: ' ']
		raise: Error
		withExceptionDo: [ :anError | self assert: SentenceFinderByPrefix invalidPrefixErrorDescription equals: anError messageText ].
	! !

!SentenceFinderByPrefixTest methodsFor: 'test' stamp: 'DEC 5/15/2022 10:39:31'!
test09TryingToFindPrefixWithWhiteSpaceReturnsAnInvalidPrefixError

	self 
		should: [ sentenceFinderWithNotEmptyStack find: ' invalido']
		raise: Error
		withExceptionDo: [ :anError | self assert: SentenceFinderByPrefix invalidPrefixErrorDescription equals: anError messageText ].
		
	self 
		should: [ sentenceFinderWithNotEmptyStack find: 'invalido ']
		raise: Error
		withExceptionDo: [ :anError | self assert: SentenceFinderByPrefix invalidPrefixErrorDescription equals: anError messageText ].
		
	self 
		should: [ sentenceFinderWithNotEmptyStack find: 'invali do']
		raise: Error
		withExceptionDo: [ :anError | self assert: SentenceFinderByPrefix invalidPrefixErrorDescription equals: anError messageText ].! !

!SentenceFinderByPrefixTest methodsFor: 'test' stamp: 'DEC 5/15/2022 19:04:17'!
test10UsingAnObjectThatIsNotAStringAsAPrefixReturnsAnInvalidPrefixError

	self 
		should: [ sentenceFinderWithNotEmptyStack find: emptyStack ]
		raise: Error
		withExceptionDo: [ :anError | self assert: SentenceFinderByPrefix invalidPrefixErrorDescription equals: anError messageText ].! !


!SentenceFinderByPrefixTest methodsFor: 'set up' stamp: 'DEC 5/15/2022 18:58:40'!
setUp

	
	emptyStack := OOStack new.
	
	notEmptyStack := OOStack new.
	notEmptyStack push: 'TP complicado'.
	notEmptyStack push: 'No me gusta el stack'.
	notEmptyStack push: 'malditos objetos'.
	notEmptyStack push: 'me marea el double dispatch'.
	
	stackWithFourEqualStrings := OOStack new.
	stackWithFourEqualStrings push: 'SentenceFinderByPrefix'.
	stackWithFourEqualStrings push: 'SentenceFinderByPrefix'.
	stackWithFourEqualStrings push: 'SentenceFinderByPrefix'.
	stackWithFourEqualStrings push: 'SentenceFinderByPrefix'.
	
	sentenceFinderWithEmptyStack := SentenceFinderByPrefix newWith: emptyStack.
	sentenceFinderWithNotEmptyStack := SentenceFinderByPrefix newWith: notEmptyStack.
	sentenceFinderWithEqualStringsStack := SentenceFinderByPrefix newWith: stackWithFourEqualStrings.

	
	

	! !


!classDefinition: #OOStack category: 'Stack-Exercise.PrimeraParteOK-SegundaParte13'!
Object subclass: #OOStack
	instanceVariableNames: 'contents state sizeLimit'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise.PrimeraParteOK-SegundaParte13'!

!OOStack methodsFor: 'adding' stamp: 'DEC 5/15/2022 22:14:06'!
push: anObjectToBePushed
	
	state push: anObjectToBePushed to: self.
	self updateState.
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


!OOStack methodsFor: 'initialization' stamp: 'DEC 5/15/2022 11:56:21'!
initialize

	state := OOEmptyStackState new.
	contents := OrderedCollection new.! !


!OOStack methodsFor: 'subtracting' stamp: 'DEC 5/13/2022 22:45:38'!
pop

	^state popFrom: self
! !


!OOStack methodsFor: 'private' stamp: 'DEC 5/15/2022 18:54:40'!
isFull
	
	^false! !

!OOStack methodsFor: 'private' stamp: 'DEC 5/15/2022 20:08:59'!
updateState

	| newStateClass |
	
	newStateClass := OOUnlimitedStackState allSubclasses detect: [:aSubclass | (aSubclass isStackValidForMe: self) = true].
	state := newStateClass new.
! !


!OOStack methodsFor: 'adding - private' stamp: 'DEC 5/15/2022 22:14:17'!
pushWhenEmpty: anObjectToBePushed

	contents addLast: anObjectToBePushed.


	! !

!OOStack methodsFor: 'adding - private' stamp: 'DEC 5/15/2022 22:14:27'!
pushWhenNotEmpty: anObjectToBePushed

	contents addLast: anObjectToBePushed.! !


!OOStack methodsFor: 'info getters - private' stamp: 'DEC 5/13/2022 22:09:49'!
topWhenEmpty

	^self error: OOStack stackEmptyErrorDescription ! !

!OOStack methodsFor: 'info getters - private' stamp: 'DEC 5/13/2022 22:12:23'!
topWhenNotEmpty

	^contents last! !


!OOStack methodsFor: 'subtracting - private' stamp: 'DEC 5/13/2022 22:01:23'!
popWhenEmpty

	^self error: OOStack stackEmptyErrorDescription ! !

!OOStack methodsFor: 'subtracting - private' stamp: 'DEC 5/13/2022 22:27:37'!
popWhenNotEmpty
	
	| lastPushedObject |
	
	lastPushedObject := contents removeLast.
	self updateState.
	
	^lastPushedObject! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'OOStack class' category: 'Stack-Exercise.PrimeraParteOK-SegundaParte13'!
OOStack class
	instanceVariableNames: ''!

!OOStack class methodsFor: 'error descriptions' stamp: 'HernanWilkinson 5/7/2012 11:51'!
stackEmptyErrorDescription
	
	^ 'Stack is empty'! !


!OOStack class methodsFor: 'instance creation' stamp: 'DEC 5/15/2022 19:06:08'!
newUnlimited

	^super new initialize! !


!classDefinition: #OOLimitedStack category: 'Stack-Exercise.PrimeraParteOK-SegundaParte13'!
OOStack subclass: #OOLimitedStack
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise.PrimeraParteOK-SegundaParte13'!

!OOLimitedStack methodsFor: 'info getters' stamp: 'DEC 5/15/2022 18:38:47'!
isFull

	^contents size = sizeLimit ! !


!OOLimitedStack methodsFor: 'initialization' stamp: 'DEC 5/15/2022 18:39:13'!
initializeOfSize: aSize
	
	sizeLimit := aSize.
	state := OOEmptyStackState new.
	contents := OrderedCollection new.! !


!OOLimitedStack methodsFor: 'adding - private' stamp: 'DEC 5/15/2022 19:47:55'!
pushWhenFull: anObjectToBePushed

	^self error: OOLimitedStack stackFullErrorDescription! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'OOLimitedStack class' category: 'Stack-Exercise.PrimeraParteOK-SegundaParte13'!
OOLimitedStack class
	instanceVariableNames: ''!

!OOLimitedStack class methodsFor: 'error description' stamp: 'DEC 5/15/2022 19:45:31'!
stackFullErrorDescription

	^'Stack is full'! !


!OOLimitedStack class methodsFor: 'instance creation' stamp: 'DEC 5/15/2022 19:28:17'!
newOfSize: aSize

	^super new initializeOfSize: aSize ! !


!classDefinition: #OOUnlimitedStackState category: 'Stack-Exercise.PrimeraParteOK-SegundaParte13'!
Object subclass: #OOUnlimitedStackState
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise.PrimeraParteOK-SegundaParte13'!

!OOUnlimitedStackState methodsFor: 'info getters' stamp: 'DEC 5/13/2022 22:50:14'!
topFrom: aStackToSeeItsTop

	self subclassResponsibility ! !


!OOUnlimitedStackState methodsFor: 'adding' stamp: 'DEC 5/13/2022 22:51:46'!
push: anObjectToBePushed to: aStackToPushObjects

	self subclassResponsibility ! !


!OOUnlimitedStackState methodsFor: 'subtracting' stamp: 'DEC 5/13/2022 22:52:24'!
popFrom: aStackToPopElements

	self subclassResponsibility ! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'OOUnlimitedStackState class' category: 'Stack-Exercise.PrimeraParteOK-SegundaParte13'!
OOUnlimitedStackState class
	instanceVariableNames: ''!

!OOUnlimitedStackState class methodsFor: 'validation' stamp: 'DEC 5/13/2022 22:53:50'!
isStackValidForMe: aStackToValidate

	self subclassResponsibility ! !


!classDefinition: #OOEmptyStackState category: 'Stack-Exercise.PrimeraParteOK-SegundaParte13'!
OOUnlimitedStackState subclass: #OOEmptyStackState
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise.PrimeraParteOK-SegundaParte13'!

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

!classDefinition: 'OOEmptyStackState class' category: 'Stack-Exercise.PrimeraParteOK-SegundaParte13'!
OOEmptyStackState class
	instanceVariableNames: ''!

!OOEmptyStackState class methodsFor: 'validation' stamp: 'DEC 5/13/2022 22:54:04'!
isStackValidForMe: aStackToValidate

	^(aStackToValidate isEmpty) = true! !


!classDefinition: #OONotEmptyStackState category: 'Stack-Exercise.PrimeraParteOK-SegundaParte13'!
OOUnlimitedStackState subclass: #OONotEmptyStackState
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise.PrimeraParteOK-SegundaParte13'!

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

!classDefinition: 'OONotEmptyStackState class' category: 'Stack-Exercise.PrimeraParteOK-SegundaParte13'!
OONotEmptyStackState class
	instanceVariableNames: ''!

!OONotEmptyStackState class methodsFor: 'validation' stamp: 'DEC 5/15/2022 11:40:46'!
isStackValidForMe: aStackToValidate

	^( aStackToValidate isEmpty = false ) and: [ aStackToValidate isFull = false ]! !


!classDefinition: #OOFullStackState category: 'Stack-Exercise.PrimeraParteOK-SegundaParte13'!
OONotEmptyStackState subclass: #OOFullStackState
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise.PrimeraParteOK-SegundaParte13'!

!OOFullStackState methodsFor: 'adding' stamp: 'DEC 5/15/2022 19:50:19'!
push: anObjectToBePushed to: aStackToPushObjects

	^aStackToPushObjects pushWhenFull: anObjectToBePushed 
! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'OOFullStackState class' category: 'Stack-Exercise.PrimeraParteOK-SegundaParte13'!
OOFullStackState class
	instanceVariableNames: ''!

!OOFullStackState class methodsFor: 'validation' stamp: 'DEC 5/15/2022 11:29:54'!
isStackValidForMe: aStackToValidate

	^( aStackToValidate isFull ) = true! !


!classDefinition: #PrefixType category: 'Stack-Exercise.PrimeraParteOK-SegundaParte13'!
Object subclass: #PrefixType
	instanceVariableNames: 'value'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise.PrimeraParteOK-SegundaParte13'!

!PrefixType methodsFor: 'getters' stamp: 'DEC 5/14/2022 17:04:03'!
value

	^value! !


!PrefixType methodsFor: 'private' stamp: 'DEC 5/14/2022 16:42:33'!
canBeFoundBy: aSentenceFinderByPrefix

	self subclassResponsibility ! !


!PrefixType methodsFor: 'inizialization' stamp: 'DEC 5/14/2022 17:00:42'!
initializeWith: aStringPrefix

	value := aStringPrefix ! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'PrefixType class' category: 'Stack-Exercise.PrimeraParteOK-SegundaParte13'!
PrefixType class
	instanceVariableNames: ''!

!PrefixType class methodsFor: 'validation' stamp: 'DEC 5/14/2022 16:15:53'!
isPrefixValidForMe: aStringPrefix

	self subclassResponsibility 

	! !


!PrefixType class methodsFor: 'instance creation' stamp: 'DEC 5/15/2022 18:58:40'!
newWith: aStringPrefix

	^self new initializeWith: aStringPrefix ! !


!classDefinition: #InvalidPrefix category: 'Stack-Exercise.PrimeraParteOK-SegundaParte13'!
PrefixType subclass: #InvalidPrefix
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise.PrimeraParteOK-SegundaParte13'!

!InvalidPrefix methodsFor: 'private' stamp: 'DEC 5/14/2022 16:42:33'!
canBeFoundBy: aSentenceFinderByPrefix

	^aSentenceFinderByPrefix findAnInvalidPrefix. ! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'InvalidPrefix class' category: 'Stack-Exercise.PrimeraParteOK-SegundaParte13'!
InvalidPrefix class
	instanceVariableNames: ''!

!InvalidPrefix class methodsFor: 'validation' stamp: 'DEC 5/15/2022 19:05:07'!
isPrefixValidForMe: aStringPrefix

	^(( aStringPrefix isString not ) or: [((aStringPrefix findString: ' ') = 0) not]) or: [ aStringPrefix = '' ]! !


!classDefinition: #ValidPrefix category: 'Stack-Exercise.PrimeraParteOK-SegundaParte13'!
PrefixType subclass: #ValidPrefix
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise.PrimeraParteOK-SegundaParte13'!

!ValidPrefix methodsFor: 'private' stamp: 'DEC 5/14/2022 19:34:52'!
canBeFoundBy: aSentenceFinderByPrefix

	^aSentenceFinderByPrefix findAValidPrefix: self

	! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'ValidPrefix class' category: 'Stack-Exercise.PrimeraParteOK-SegundaParte13'!
ValidPrefix class
	instanceVariableNames: ''!

!ValidPrefix class methodsFor: 'validation' stamp: 'DEC 5/14/2022 16:19:56'!
isPrefixValidForMe: aStringPrefix

	^( ( aStringPrefix = '' ) or: [aStringPrefix beginsWith: ' '] ) not
	! !


!classDefinition: #SentenceFinderByPrefix category: 'Stack-Exercise.PrimeraParteOK-SegundaParte13'!
Object subclass: #SentenceFinderByPrefix
	instanceVariableNames: 'stackWithStrings collectionWithResults auxiliaryStack'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise.PrimeraParteOK-SegundaParte13'!

!SentenceFinderByPrefix methodsFor: 'prefix finding' stamp: 'DEC 5/15/2022 10:38:12'!
find: aPrefixToBeFound

	| prefixTypeInstance collectionWithStrings |
	
	prefixTypeInstance := self analizePrefix: aPrefixToBeFound.
	collectionWithStrings := prefixTypeInstance canBeFoundBy: self.
	
	^collectionWithStrings

! !


!SentenceFinderByPrefix methodsFor: 'inizialization' stamp: 'DEC 5/15/2022 11:56:21'!
initializeWith: aStackToCollaborateWith

	stackWithStrings := aStackToCollaborateWith. 
	auxiliaryStack := 	OOStack new.
	collectionWithResults := OrderedCollection new.! !


!SentenceFinderByPrefix methodsFor: 'private' stamp: 'DEC 5/15/2022 18:58:40'!
analizePrefix: aPrefixToBeAnalized
	
	| prefixClass |
	
	prefixClass := PrefixType subclasses detect: [:aPrefixType | aPrefixType isPrefixValidForMe: aPrefixToBeAnalized ].
	^prefixClass newWith: aPrefixToBeAnalized.
	
	! !

!SentenceFinderByPrefix methodsFor: 'private' stamp: 'DEC 5/15/2022 11:56:21'!
emptyTheStack

	| stringsFromStack stringPopped |
	
	stringsFromStack := OrderedCollection new.
	stackWithStrings size timesRepeat: [ stringPopped := stackWithStrings pop.
								stringsFromStack addLast: stringPopped.
								auxiliaryStack push: stringPopped ].
	
	^stringsFromStack ! !

!SentenceFinderByPrefix methodsFor: 'private' stamp: 'DEC 5/15/2022 10:38:26'!
findAValidPrefix: aValidPrefixToBeFound
	
	| stringsWithPrefix |
	
	stringsWithPrefix := ( self emptyTheStack ) select: [:aString | aString beginsWith: aValidPrefixToBeFound value ].
	self restoreStack.
	
	^stringsWithPrefix 

! !

!SentenceFinderByPrefix methodsFor: 'private' stamp: 'DEC 5/14/2022 16:37:43'!
findAnInvalidPrefix

	^self error: SentenceFinderByPrefix invalidPrefixErrorDescription ! !

!SentenceFinderByPrefix methodsFor: 'private' stamp: 'DEC 5/14/2022 20:48:00'!
restoreStack

	auxiliaryStack size timesRepeat: [ stackWithStrings push: auxiliaryStack pop].! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'SentenceFinderByPrefix class' category: 'Stack-Exercise.PrimeraParteOK-SegundaParte13'!
SentenceFinderByPrefix class
	instanceVariableNames: ''!

!SentenceFinderByPrefix class methodsFor: 'instance creation' stamp: 'DEC 5/15/2022 18:59:45'!
newWith: aStackToCollaborateWith
	"Decidimos que el stack sea parte del sentence finder, en vez de que se pueda usar un sentence finder para varios stacks"
	
	^super new initializeWith: aStackToCollaborateWith 
! !


!SentenceFinderByPrefix class methodsFor: 'error description' stamp: 'DEC 5/14/2022 15:55:13'!
invalidPrefixErrorDescription

	^'The Prefix is invalid'! !
