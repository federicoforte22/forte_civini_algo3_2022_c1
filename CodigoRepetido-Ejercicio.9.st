!classDefinition: #CantSuspend category: 'CodigoRepetido-Ejercicio.9'!
Error subclass: #CantSuspend
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'CodigoRepetido-Ejercicio.9'!


!classDefinition: #NotFound category: 'CodigoRepetido-Ejercicio.9'!
Error subclass: #NotFound
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'CodigoRepetido-Ejercicio.9'!


!classDefinition: #CustomerBookTest category: 'CodigoRepetido-Ejercicio.9'!
TestCase subclass: #CustomerBookTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'CodigoRepetido-Ejercicio.9'!

!CustomerBookTest methodsFor: 'testing' stamp: 'DC 5/1/2022 18:14:51'!
test01AddingCustomerShouldNotTakeMoreThan50Milliseconds
	| customerBook |
	
	customerBook := CustomerBook new.
	self timeFor: [:aName | customerBook addCustomerNamed: aName] with: 'John Lennon' shouldNotBeMoreThan: 50. 

! !

!CustomerBookTest methodsFor: 'testing' stamp: 'DC 5/1/2022 20:22:25'!
test02RemovingCustomerShouldNotTakeMoreThan100Milliseconds
	| customerBook paulMcCartney |
	
	paulMcCartney := 'Paul McCartney'.
	customerBook := CustomerBook with: 'Paul McCartney'.
	
	self timeFor: [:aName | customerBook removeCustomerNamed: aName ] with: paulMcCartney shouldNotBeMoreThan: 100.

! !

!CustomerBookTest methodsFor: 'testing' stamp: 'DC 5/1/2022 20:22:34'!
test03CanNotAddACustomerWithEmptyName
	| customerBook |
			
	customerBook := CustomerBook new.
	
	self execute: [:aName | customerBook addCustomerNamed: aName ] with: '' toCatch: Error toAssert: [ :anError | self assert: anError messageText = CustomerBook customerCanNotBeEmptyErrorMessage. self assert: customerBook isEmpty.] .
! !

!CustomerBookTest methodsFor: 'testing' stamp: 'DC 5/1/2022 20:23:23'!
test04CanNotRemoveAnInvalidCustomer
	| customerBook johnLennon |
	
	johnLennon := 'John Lennon'.	
	customerBook := CustomerBook with: johnLennon.
	
	self execute: [:aName | customerBook removeCustomerNamed: aName ] with: 'Paul McCartney' toCatch: NotFound toAssert: [ self assertOnlyCustomerIsJohnLennon: customerBook. ].

! !

!CustomerBookTest methodsFor: 'testing' stamp: 'DC 5/1/2022 20:24:58'!
test05SuspendingACustomerShouldNotRemoveItFromCustomerBook
	| customerBook paulMcCartney elements |
	
	paulMcCartney := 'Paul McCartney'.
	customerBook := CustomerBook with: paulMcCartney.
	customerBook suspendCustomerNamed: paulMcCartney.
	elements := OrderedCollection with: 0 with: 1 with: 1 with: paulMcCartney.

	self elementsToBeVerified: elements from: customerBook.

	
! !

!CustomerBookTest methodsFor: 'testing' stamp: 'DC 5/1/2022 20:26:15'!
test06RemovingASuspendedCustomerShouldRemoveItFromCustomerBook
	| customerBook paulMcCartney elements |
	
	paulMcCartney := 'Paul McCartney'.
	customerBook := CustomerBook with: paulMcCartney.
	customerBook suspendCustomerNamed: paulMcCartney.
	customerBook removeCustomerNamed: paulMcCartney.
	elements := OrderedCollection with: 0 with: 0 with: 0 with: paulMcCartney.
	
	self elementsToBeVerified: elements from: customerBook.
	

	
! !

!CustomerBookTest methodsFor: 'testing' stamp: 'DC 5/1/2022 20:26:55'!
test07CanNotSuspendAnInvalidCustomer
	| customerBook johnLennon |
	
	johnLennon := 'John Lennon'.		
	customerBook := CustomerBook with: johnLennon.
	
	self execute: [:aName | customerBook suspendCustomerNamed: aName] with: 'Ringo Starr' toCatch: CantSuspend toAssert: [self assertOnlyCustomerIsJohnLennon: customerBook.]. 
! !

!CustomerBookTest methodsFor: 'testing' stamp: 'DC 5/1/2022 20:27:22'!
test08CanNotSuspendAnAlreadySuspendedCustomer
	| customerBook johnLennon |
		
	johnLennon := 'John Lennon'.		
	customerBook := CustomerBook with: johnLennon.
	customerBook suspendCustomerNamed: johnLennon.
	
	self execute: [:aName | customerBook suspendCustomerNamed: aName] with: johnLennon toCatch: CantSuspend toAssert: [self assertOnlyCustomerIsJohnLennon: customerBook ] ! !


!CustomerBookTest methodsFor: 'private' stamp: 'hh 5/1/2022 16:55:01'!
assertOnlyCustomerIsJohnLennon: aCustomerBook
	
	self assert: aCustomerBook numberOfCustomers = 1.
	self assert: (aCustomerBook includesCustomerNamed: 'John Lennon' ).! !

!CustomerBookTest methodsFor: 'private' stamp: 'DC 5/1/2022 19:45:17'!
elementsToBeVerified: aCollection from: aCustomerBook

	| anIncludedCustomerOrNot |
	
	anIncludedCustomerOrNot := aCustomerBook includesCustomerNamed: (aCollection at: 4).

	self assert: (aCollection at: 1) equals: aCustomerBook numberOfActiveCustomers.
	self assert: (aCollection at: 2) equals: aCustomerBook numberOfSuspendedCustomers.
	self assert: (aCollection at: 3) equals: aCustomerBook numberOfCustomers.
	(anIncludedCustomerOrNot) ifTrue: [self assert: anIncludedCustomerOrNot] ifFalse: [self deny: anIncludedCustomerOrNot ].! !

!CustomerBookTest methodsFor: 'private' stamp: 'DC 5/1/2022 18:33:23'!
execute: aBlock with: aString toCatch: anError toAssert: aBlockWithAsserts

	[ aBlock value: aString. self fail. ] on: anError do: aBlockWithAsserts ! !

!CustomerBookTest methodsFor: 'private' stamp: 'DC 5/1/2022 20:02:59'!
timeFor: aBlock with: aName shouldNotBeMoreThan: aTimeLimit
	| duration |
	
	duration := [ aBlock value: aName.] millisecondsToRun .
	self assert:  duration  < ( aTimeLimit * millisecond ).

	! !


!classDefinition: #CustomerBook category: 'CodigoRepetido-Ejercicio.9'!
Object subclass: #CustomerBook
	instanceVariableNames: 'suspended active'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'CodigoRepetido-Ejercicio.9'!

!CustomerBook methodsFor: 'testing' stamp: 'NR 4/3/2019 10:14:26'!
includesCustomerNamed: aName

	^(active includes: aName) or: [ suspended includes: aName ]! !

!CustomerBook methodsFor: 'testing' stamp: 'NR 4/3/2019 10:14:26'!
isEmpty
	
	^active isEmpty and: [ suspended isEmpty ]! !


!CustomerBook methodsFor: 'initialization' stamp: 'NR 4/3/2019 10:14:26'!
initialize

	super initialize.
	active := OrderedCollection new.
	suspended:= OrderedCollection new.! !


!CustomerBook methodsFor: 'customer management' stamp: 'DC 4/30/2022 13:33:23'!
addCustomerNamed: aName

	aName isEmpty ifTrue: [ self signalCustomerNameCannotBeEmpty ].
	(self includesCustomerNamed: aName) ifTrue: [ self signalCustomerAlreadyExists ].
	
	active add: aName ! !

!CustomerBook methodsFor: 'customer management' stamp: 'NR 4/3/2019 10:14:26'!
numberOfActiveCustomers
	
	^active size! !

!CustomerBook methodsFor: 'customer management' stamp: 'NR 4/3/2019 10:14:26'!
numberOfCustomers
	
	^active size + suspended size! !

!CustomerBook methodsFor: 'customer management' stamp: 'NR 9/19/2018 17:36:09'!
numberOfSuspendedCustomers
	
	^suspended size! !

!CustomerBook methodsFor: 'customer management' stamp: 'DC 5/1/2022 11:34:24'!
removeCustomerNamed: aName
	active remove: aName ifAbsent: [ suspended remove: aName ifAbsent: [ ^NotFound signal ]. ].

! !

!CustomerBook methodsFor: 'customer management' stamp: 'HernanWilkinson 7/6/2011 17:52'!
signalCustomerAlreadyExists 

	self error: self class customerAlreadyExistsErrorMessage! !

!CustomerBook methodsFor: 'customer management' stamp: 'HernanWilkinson 7/6/2011 17:51'!
signalCustomerNameCannotBeEmpty 

	self error: self class customerCanNotBeEmptyErrorMessage ! !

!CustomerBook methodsFor: 'customer management' stamp: 'DC 5/1/2022 11:35:11'!
suspendCustomerNamed: aName 
	active remove: aName ifAbsent: [ ^CantSuspend signal. ].
	suspended add: aName.

! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CustomerBook class' category: 'CodigoRepetido-Ejercicio.9'!
CustomerBook class
	instanceVariableNames: ''!

!CustomerBook class methodsFor: 'error messages' stamp: 'NR 4/30/2020 09:05:18'!
customerAlreadyExistsErrorMessage

	^'Customer Already Exists'! !

!CustomerBook class methodsFor: 'error messages' stamp: 'NR 4/30/2020 09:05:25'!
customerCanNotBeEmptyErrorMessage

	^'Customer Name Cannot Be Empty'! !


!CustomerBook class methodsFor: 'instance creation' stamp: 'DC 5/1/2022 20:16:04'!
with: aName

	^self new
		addCustomerNamed: aName;
		yourself! !
