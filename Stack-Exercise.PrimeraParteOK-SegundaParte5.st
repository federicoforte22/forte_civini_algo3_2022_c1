!classDefinition: #OOStackTest category: 'Stack-Exercise.PrimeraParteOK-SegundaParte5'!
TestCase subclass: #OOStackTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise.PrimeraParteOK-SegundaParte5'!

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


!classDefinition: #SentenceFinderByPrefixTest category: 'Stack-Exercise.PrimeraParteOK-SegundaParte5'!
TestCase subclass: #SentenceFinderByPrefixTest
	instanceVariableNames: 'notEmptyStack emptyStack stackWithFourEqualStrings sentenceFinderWithEmptyStack sentenceFinderWithNotEmptyStack sentenceFinderWithEqualStringsStack'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise.PrimeraParteOK-SegundaParte5'!

!SentenceFinderByPrefixTest methodsFor: 'test' stamp: 'DEC 5/14/2022 18:45:31'!
test01PrefixNotInStackThenItReturnsAnEmptyCollection

	| results |
	results := sentenceFinderWithNotEmptyStack find: 'Mal'.
	self assert: results isEmpty.
"
	| sentenceFinder stack results |
	
	stack := OOStack new.
	stack push: 'TP complicado'.
	stack push: 'No me gusta el stack'.
	stack push: 'malditos objetos'.
	
	sentenceFinder := SentenceFinderByPrefix new: stack.
	results := sentenceFinder find: 'Mal'.
	
	self assert: results isEmpty."! !

!SentenceFinderByPrefixTest methodsFor: 'test' stamp: 'DEC 5/14/2022 19:40:03'!
test02PrefixInStackOneTimeThenReturnsACollectionWithTheString

	| results |
	
	results := sentenceFinderWithNotEmptyStack find: 'mal'.
	
	self assert: results size = 1.
	self assert: (results at: 1) = 'malditos objetos'.

	! !

!SentenceFinderByPrefixTest methodsFor: 'test' stamp: 'DEC 5/14/2022 18:50:25'!
test03AfterFindingThePrefixTheOriginalStackRemainsTheSame

	| results |
	
	results := sentenceFinderWithNotEmptyStack find: 'mal'.
	
	self assert: (results at: 1) = 'malditos objetos'.
	self assert: notEmptyStack pop = 'me marea el double dispatch'.
	self assert: notEmptyStack pop = 'malditos objetos'.
	self assert: notEmptyStack pop = 'No me gusta el stack'.
	self assert: notEmptyStack pop = 'TP complicado'.
"
	| sentenceFinder stack results |
	
	stack := OOStack new.
	stack push: 'TP complicado'.
	stack push: 'No me gusta el stack'.
	stack push: 'malditos objetos'.
	
	sentenceFinder := SentenceFinderByPrefix new: stack.
	results := sentenceFinder find: 'mal'.
	
	self assert: (results at: 1) = 'malditos objetos'.
	self assert: stack pop = 'malditos objetos'.
	self assert: stack pop = 'No me gusta el stack'.
	self assert: stack pop = 'TP complicado'."! !

!SentenceFinderByPrefixTest methodsFor: 'test' stamp: 'DEC 5/14/2022 18:51:11'!
test04FindPrefixInAnEmptyStackShouldReturnAnEmptyCollection
	| results |
	
	results := sentenceFinderWithEmptyStack find: 'siu'.
	
	self assert: results isEmpty.

"
	| results sentenceFinder stack |
	
	stack := OOStack new.
	sentenceFinder := SentenceFinderByPrefix new: stack.
	results := sentenceFinder find: 'siu'.
	
	self assert: results isEmpty."! !

!SentenceFinderByPrefixTest methodsFor: 'test' stamp: 'DEC 5/14/2022 19:17:37'!
test05PrefixIsFoundFourTimesThenReturnsACollectionWithSizeFour
	
	| results0 |
	
	results0 := sentenceFinderWithEqualStringsStack find: 'Sent'.
	
	self assert: results0 size = 4.
	

	! !

!SentenceFinderByPrefixTest methodsFor: 'test' stamp: 'DEC 5/14/2022 19:19:48'!
test06SameSentenceFinderByPrefixCanBeUsedTwiceWithDifferentsPrefixes! !

!SentenceFinderByPrefixTest methodsFor: 'test' stamp: 'DEC 5/14/2022 19:18:01'!
test07TryingToFindAnInvalidPrefixReturnsAnInvalidPrefixError

	

	! !


!SentenceFinderByPrefixTest methodsFor: 'set up' stamp: 'DEC 5/14/2022 19:11:44'!
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
	
	sentenceFinderWithEmptyStack := SentenceFinderByPrefix new: emptyStack.
	sentenceFinderWithNotEmptyStack := SentenceFinderByPrefix new: notEmptyStack.
	sentenceFinderWithEqualStringsStack := SentenceFinderByPrefix new: stackWithFourEqualStrings 
	
	
	
	

	! !


!classDefinition: #OOStack category: 'Stack-Exercise.PrimeraParteOK-SegundaParte5'!
Object subclass: #OOStack
	instanceVariableNames: 'contents state'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise.PrimeraParteOK-SegundaParte5'!

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

!classDefinition: 'OOStack class' category: 'Stack-Exercise.PrimeraParteOK-SegundaParte5'!
OOStack class
	instanceVariableNames: ''!

!OOStack class methodsFor: 'error descriptions' stamp: 'HernanWilkinson 5/7/2012 11:51'!
stackEmptyErrorDescription
	
	^ 'Stack is empty'! !


!classDefinition: #OOStackState category: 'Stack-Exercise.PrimeraParteOK-SegundaParte5'!
Object subclass: #OOStackState
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise.PrimeraParteOK-SegundaParte5'!

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

!classDefinition: 'OOStackState class' category: 'Stack-Exercise.PrimeraParteOK-SegundaParte5'!
OOStackState class
	instanceVariableNames: ''!

!OOStackState class methodsFor: 'validate' stamp: 'DEC 5/13/2022 22:53:50'!
isStackValidForMe: aStackToValidate

	self subclassResponsibility ! !


!classDefinition: #OOEmptyStackState category: 'Stack-Exercise.PrimeraParteOK-SegundaParte5'!
OOStackState subclass: #OOEmptyStackState
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise.PrimeraParteOK-SegundaParte5'!

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

!classDefinition: 'OOEmptyStackState class' category: 'Stack-Exercise.PrimeraParteOK-SegundaParte5'!
OOEmptyStackState class
	instanceVariableNames: ''!

!OOEmptyStackState class methodsFor: 'validation' stamp: 'DEC 5/13/2022 22:54:04'!
isStackValidForMe: aStackToValidate

	^(aStackToValidate isEmpty) = true! !


!classDefinition: #OONotEmptyStackState category: 'Stack-Exercise.PrimeraParteOK-SegundaParte5'!
OOStackState subclass: #OONotEmptyStackState
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise.PrimeraParteOK-SegundaParte5'!

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

!classDefinition: 'OONotEmptyStackState class' category: 'Stack-Exercise.PrimeraParteOK-SegundaParte5'!
OONotEmptyStackState class
	instanceVariableNames: ''!

!OONotEmptyStackState class methodsFor: 'validation' stamp: 'DEC 5/13/2022 22:54:22'!
isStackValidForMe: aStackToValidate

	^aStackToValidate isEmpty = false! !


!classDefinition: #PrefixType category: 'Stack-Exercise.PrimeraParteOK-SegundaParte5'!
Object subclass: #PrefixType
	instanceVariableNames: 'value'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise.PrimeraParteOK-SegundaParte5'!

!PrefixType methodsFor: 'as yet unclassified' stamp: 'DEC 5/14/2022 16:42:33'!
canBeFoundBy: aSentenceFinderByPrefix

	self subclassResponsibility ! !

!PrefixType methodsFor: 'as yet unclassified' stamp: 'DEC 5/14/2022 17:00:42'!
initializeWith: aStringPrefix

	value := aStringPrefix ! !

!PrefixType methodsFor: 'as yet unclassified' stamp: 'DEC 5/14/2022 17:04:03'!
value

	^value! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'PrefixType class' category: 'Stack-Exercise.PrimeraParteOK-SegundaParte5'!
PrefixType class
	instanceVariableNames: ''!

!PrefixType class methodsFor: 'as yet unclassified' stamp: 'DEC 5/14/2022 16:15:53'!
isPrefixValidForMe: aStringPrefix

	self subclassResponsibility 

	! !

!PrefixType class methodsFor: 'as yet unclassified' stamp: 'DEC 5/14/2022 17:00:00'!
new: aStringPrefix

	^self new initializeWith: aStringPrefix ! !


!classDefinition: #InvalidPrefix category: 'Stack-Exercise.PrimeraParteOK-SegundaParte5'!
PrefixType subclass: #InvalidPrefix
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise.PrimeraParteOK-SegundaParte5'!

!InvalidPrefix methodsFor: 'as yet unclassified' stamp: 'DEC 5/14/2022 16:42:33'!
canBeFoundBy: aSentenceFinderByPrefix

	^aSentenceFinderByPrefix findAnInvalidPrefix. ! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'InvalidPrefix class' category: 'Stack-Exercise.PrimeraParteOK-SegundaParte5'!
InvalidPrefix class
	instanceVariableNames: ''!

!InvalidPrefix class methodsFor: 'as yet unclassified' stamp: 'DEC 5/14/2022 16:17:00'!
isPrefixValidForMe: aStringPrefix

	^( aStringPrefix = '' ) or: [aStringPrefix beginsWith: ' ']! !


!classDefinition: #ValidPrefix category: 'Stack-Exercise.PrimeraParteOK-SegundaParte5'!
PrefixType subclass: #ValidPrefix
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise.PrimeraParteOK-SegundaParte5'!

!ValidPrefix methodsFor: 'as yet unclassified' stamp: 'DEC 5/14/2022 19:34:52'!
canBeFoundBy: aSentenceFinderByPrefix

	^aSentenceFinderByPrefix findAValidPrefix: self

	! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'ValidPrefix class' category: 'Stack-Exercise.PrimeraParteOK-SegundaParte5'!
ValidPrefix class
	instanceVariableNames: ''!

!ValidPrefix class methodsFor: 'as yet unclassified' stamp: 'DEC 5/14/2022 16:19:56'!
isPrefixValidForMe: aStringPrefix

	^( ( aStringPrefix = '' ) or: [aStringPrefix beginsWith: ' '] ) not
	! !


!classDefinition: #SentenceFinderByPrefix category: 'Stack-Exercise.PrimeraParteOK-SegundaParte5'!
Object subclass: #SentenceFinderByPrefix
	instanceVariableNames: 'stackWithStrings collectionWithResults auxiliaryStack'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise.PrimeraParteOK-SegundaParte5'!

!SentenceFinderByPrefix methodsFor: 'as yet unclassified' stamp: 'DEC 5/14/2022 16:15:00'!
analizePrefix: aPrefixToBeAnalized
	
	| prefixClass |
	
	prefixClass := PrefixType subclasses detect: [:aPrefixType | aPrefixType isPrefixValidForMe: aPrefixToBeAnalized ].
	^prefixClass new: aPrefixToBeAnalized.
	
	
	"aca deberia crear una instancia de la clase a la que el prefijo pertenece, invalida o valida"
"
	(aPrefixToBeAnalized beginsWith: ' ') ifTrue: [self error: SentenceFinderByPrefix invalidPrefixErrorDescription].
	(aPrefixToBeAnalized = '') ifTrue: [self error: SentenceFinderByPrefix invalidPrefixErrorDescription]."
"	(el prefijo es valido) ifTrue: [devuelve true?]"
	! !

!SentenceFinderByPrefix methodsFor: 'as yet unclassified' stamp: 'DEC 5/14/2022 20:39:54'!
emptyTheStack

	| stringsFromStack stringPopped |
	
	stringsFromStack := OrderedCollection new.
	stackWithStrings size timesRepeat: [ stringPopped := stackWithStrings pop.
								stringsFromStack addLast: stringPopped.
								auxiliaryStack push: stringPopped ].
	
	^stringsFromStack ! !

!SentenceFinderByPrefix methodsFor: 'as yet unclassified' stamp: 'DEC 5/14/2022 19:39:27'!
find: aPrefixToBeFound

	| prefix collectionWithStrings |
	
	prefix := self analizePrefix: aPrefixToBeFound.
	collectionWithStrings := prefix canBeFoundBy: self.
	self restoreCollaborators.
	
	^collectionWithStrings

! !

!SentenceFinderByPrefix methodsFor: 'as yet unclassified' stamp: 'DEC 5/14/2022 20:43:49'!
findAValidPrefix: aValidPrefixToBeFound
	
	| stringsWithPrefix |
	
	stringsWithPrefix := ( self emptyTheStack ) select: [:aString | aString beginsWith: aValidPrefixToBeFound value ].
	
	^stringsWithPrefix 
"
	stackWithStrings size timesRepeat: [self findInStringsOfStack: aValidPrefixToBeFound thenCollectIn: collectionWithResults ]."
! !

!SentenceFinderByPrefix methodsFor: 'as yet unclassified' stamp: 'DEC 5/14/2022 16:37:43'!
findAnInvalidPrefix

	^self error: SentenceFinderByPrefix invalidPrefixErrorDescription ! !

!SentenceFinderByPrefix methodsFor: 'as yet unclassified' stamp: 'DEC 5/14/2022 19:33:13'!
findInStringsOfStack: aValidPrefixInstance thenCollectIn: aCollectionOfStringsWithPrefix 

	| stringToAnalize |
	
	stringToAnalize := stackWithStrings pop.
	
	( stringToAnalize beginsWith: aValidPrefixInstance value ) ifTrue: [ collectionWithResults addLast: stringToAnalize ].
	
	auxiliaryStack push: stringToAnalize.
	! !

!SentenceFinderByPrefix methodsFor: 'as yet unclassified' stamp: 'DEC 5/14/2022 15:17:52'!
initializeWith: aStackToCollaborateWith

	stackWithStrings := aStackToCollaborateWith. 
	auxiliaryStack := 	OOStack new.
	collectionWithResults := OrderedCollection new.! !

!SentenceFinderByPrefix methodsFor: 'as yet unclassified' stamp: 'DEC 5/14/2022 18:19:32'!
restoreCollaborators

	auxiliaryStack size timesRepeat: [ stackWithStrings push: auxiliaryStack pop].! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'SentenceFinderByPrefix class' category: 'Stack-Exercise.PrimeraParteOK-SegundaParte5'!
SentenceFinderByPrefix class
	instanceVariableNames: ''!

!SentenceFinderByPrefix class methodsFor: 'instance creation' stamp: 'DEC 5/14/2022 15:33:56'!
new: aStackToCollaborateWith

	^super new initializeWith: aStackToCollaborateWith 
! !


!SentenceFinderByPrefix class methodsFor: 'error description' stamp: 'DEC 5/14/2022 15:55:13'!
invalidPrefixErrorDescription

	^'The Prefix is invalid'! !
