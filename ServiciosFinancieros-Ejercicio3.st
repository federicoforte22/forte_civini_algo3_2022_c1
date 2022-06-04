!classDefinition: #ReceptiveAccountTest category: 'ServiciosFinancieros-Ejercicio3'!
TestCase subclass: #ReceptiveAccountTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio3'!

!ReceptiveAccountTest methodsFor: 'tests - transfer' stamp: 'DEC 6/3/2022 16:45:09'!
test08

	| recipientAccount senderAccount |
	
	recipientAccount := ReceptiveAccount new.
	senderAccount := ReceptiveAccount new.
	
	Deposit register: 50 * peso on: senderAccount.
	Transfer register: 50 * peso from: senderAccount to: recipientAccount.
	"senderAccount transfer: 50 * peso to: recipientAccount."
	
	self assert: 0 * peso equals: senderAccount balance.! !

!ReceptiveAccountTest methodsFor: 'tests - transfer' stamp: 'DEC 6/3/2022 16:30:38'!
test09

	| recipientAccount senderAccount |
	
	recipientAccount := ReceptiveAccount new.
	senderAccount := ReceptiveAccount new.
	
	Deposit register: 50 * peso on: senderAccount.
	Transfer register: 50 * peso from: senderAccount to: recipientAccount.
	"senderAccount transfer: 50 * peso to: recipientAccount."
	
	self assert: 50 * peso equals: recipientAccount balance.! !

!ReceptiveAccountTest methodsFor: 'tests - transfer' stamp: 'DEC 6/3/2022 16:21:37'!
test10

	| recipientAccount senderAccount transfer |
	
	recipientAccount := ReceptiveAccount new.
	senderAccount := ReceptiveAccount new.
	
	Deposit register: 50 * peso on: senderAccount.
	transfer := Transfer register: 50 * peso from: senderAccount to: recipientAccount.
	
	self assert: 50 * peso equals: transfer value.! !

!ReceptiveAccountTest methodsFor: 'tests - transfer' stamp: 'DEC 6/3/2022 18:25:01'!
test11

	| recipientAccount senderAccount transfer |
	
	recipientAccount := ReceptiveAccount new.
	senderAccount := ReceptiveAccount new.
	
	Deposit register: 50 * peso on: senderAccount.
	transfer := Transfer register: 50 * peso from: senderAccount to: recipientAccount.
	
	self assert: recipientAccount equals: transfer recipientAccount.! !

!ReceptiveAccountTest methodsFor: 'tests - transfer' stamp: 'DEC 6/3/2022 18:26:15'!
test12

	| recipientAccount senderAccount transfer |
	
	recipientAccount := ReceptiveAccount new.
	senderAccount := ReceptiveAccount new.
	
	Deposit register: 50 * peso on: senderAccount.
	transfer := Transfer register: 50 * peso from: senderAccount to: recipientAccount.
	
	self assert: senderAccount equals: transfer senderAccount.! !


!ReceptiveAccountTest methodsFor: 'tests - deposit and withdraw' stamp: 'LL 7/1/2021 03:10:43'!
test01ReceptiveAccountHaveZeroAsBalanceWhenCreated 

	| account |
	
	account := ReceptiveAccount new.

	self assert: 0 equals: account balance
! !

!ReceptiveAccountTest methodsFor: 'tests - deposit and withdraw' stamp: 'DEC 6/3/2022 16:14:27'!
test02DepositIncreasesBalanceOnTransactionValue 

	| account |
	
	account := ReceptiveAccount new.
	Deposit register: 100 * peso on: account.
		
	self assert: 100 * peso equals: account balance
! !

!ReceptiveAccountTest methodsFor: 'tests - deposit and withdraw' stamp: 'LL 7/1/2021 03:14:24'!
test03WithdrawDecreasesBalanceOnTransactionValue 

	| account |
	
	account := ReceptiveAccount new.
	Deposit register: 100 * peso on: account.
	Withdraw register: 50 * peso on: account.
		
	self assert: 50 * peso equals: account balance
! !

!ReceptiveAccountTest methodsFor: 'tests - deposit and withdraw' stamp: 'LL 7/1/2021 03:10:14'!
test04WithdrawValueMustBePositive 

	| account withdrawValue |
	
	account := ReceptiveAccount new.
	withdrawValue := 50 * peso.
	
	self assert: withdrawValue equals: (Withdraw register: withdrawValue on: account) value
! !

!ReceptiveAccountTest methodsFor: 'tests - deposit and withdraw' stamp: 'LL 7/1/2021 03:10:22'!
test05ReceptiveAccountKnowsRegisteredTransactions 

	| account deposit withdraw |
	
	account := ReceptiveAccount new.
	deposit := Deposit register: 100 * peso on: account.
	withdraw := Withdraw register: 50 * peso on: account.
		
	self assert: (account hasRegistered: deposit).
	self assert: (account hasRegistered: withdraw).
! !

!ReceptiveAccountTest methodsFor: 'tests - deposit and withdraw' stamp: 'LL 7/1/2021 03:12:14'!
test06ReceptiveAccountDoNotKnowNotRegisteredTransactions

	| account deposit withdraw |
	
	account := ReceptiveAccount new.
	deposit :=  Deposit for: 100 * peso.
	withdraw := Withdraw for: 50 * peso.
		
	self deny: (account hasRegistered: deposit).
	self deny: (account hasRegistered: withdraw).
! !

!ReceptiveAccountTest methodsFor: 'tests - deposit and withdraw' stamp: 'LL 7/1/2021 03:12:23'!
test07AccountKnowsItsTransactions 

	| account deposit |
	
	account := ReceptiveAccount new.
	
	deposit := Deposit register: 50 * peso on: account.
		
	self assert: 1 equals: account transactions size.
	self assert: (account transactions includes: deposit).
! !


!classDefinition: #AccountTransaction category: 'ServiciosFinancieros-Ejercicio3'!
Object subclass: #AccountTransaction
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio3'!

!AccountTransaction methodsFor: 'value' stamp: 'HernanWilkinson 9/12/2011 12:25'!
value 

	self subclassResponsibility ! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'AccountTransaction class' category: 'ServiciosFinancieros-Ejercicio3'!
AccountTransaction class
	instanceVariableNames: ''!

!AccountTransaction class methodsFor: 'instance creation' stamp: 'NR 10/17/2019 03:22:00'!
register: aValue on: account

	| transaction |
	
	transaction := self for: aValue.
	account register: transaction.
		
	^ transaction! !


!classDefinition: #Deposit category: 'ServiciosFinancieros-Ejercicio3'!
AccountTransaction subclass: #Deposit
	instanceVariableNames: 'value'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio3'!

!Deposit methodsFor: 'initialization' stamp: 'HernanWilkinson 7/13/2011 18:45'!
initializeFor: aValue

	value := aValue ! !


!Deposit methodsFor: 'value' stamp: 'HernanWilkinson 7/13/2011 18:38'!
value

	^ value! !


!Deposit methodsFor: 'balance modification' stamp: 'DEC 6/3/2022 10:42:38'!
modifyBalance: aBalanceToModify

	^aBalanceToModify + value! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Deposit class' category: 'ServiciosFinancieros-Ejercicio3'!
Deposit class
	instanceVariableNames: ''!

!Deposit class methodsFor: 'instance creation' stamp: 'HernanWilkinson 7/13/2011 18:38'!
for: aValue

	^ self new initializeFor: aValue ! !


!classDefinition: #Transfer category: 'ServiciosFinancieros-Ejercicio3'!
AccountTransaction subclass: #Transfer
	instanceVariableNames: 'value recipientAccount senderAccount'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio3'!

!Transfer methodsFor: 'initialization' stamp: 'DEC 6/3/2022 18:26:38'!
initializeFor: aValueInPesos from: aSenderAccount to: aRecipientAccount 
	
	value := aValueInPesos.
	recipientAccount := aRecipientAccount.
	senderAccount:= aSenderAccount.
! !


!Transfer methodsFor: 'as yet unclassified' stamp: 'DEC 6/3/2022 16:43:10'!
modifyBalance: aBalanceToModify

	^aBalanceToModify + value! !

!Transfer methodsFor: 'as yet unclassified' stamp: 'DEC 6/3/2022 18:25:29'!
recipientAccount

	^recipientAccount! !

!Transfer methodsFor: 'as yet unclassified' stamp: 'DEC 6/3/2022 18:27:01'!
senderAccount

	^senderAccount ! !

!Transfer methodsFor: 'as yet unclassified' stamp: 'DEC 6/3/2022 16:28:12'!
value

	^value! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Transfer class' category: 'ServiciosFinancieros-Ejercicio3'!
Transfer class
	instanceVariableNames: ''!

!Transfer class methodsFor: 'as yet unclassified' stamp: 'DEC 6/3/2022 16:35:49'!
for: aValueInPesos from: aSenderAccount to: aRecipientAccount

	^ self new initializeFor: aValueInPesos from: aSenderAccount to: aRecipientAccount ! !

!Transfer class methodsFor: 'as yet unclassified' stamp: 'DEC 6/3/2022 18:06:56'!
register: aValueInPesos from: aSenderAccount to: aRecipientAccount 
	
	| transfer |
	
	transfer := self for: aValueInPesos from: aSenderAccount to: aRecipientAccount.
	aSenderAccount registerExtractionTransfer: transfer.
	aRecipientAccount registerDepositTransfer: transfer.
	
	^transfer ! !


!classDefinition: #Withdraw category: 'ServiciosFinancieros-Ejercicio3'!
AccountTransaction subclass: #Withdraw
	instanceVariableNames: 'value'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio3'!

!Withdraw methodsFor: 'initialization' stamp: 'HernanWilkinson 7/13/2011 18:46'!
initializeFor: aValue

	value := aValue ! !


!Withdraw methodsFor: 'value' stamp: 'HernanWilkinson 7/13/2011 18:33'!
value

	^ value! !


!Withdraw methodsFor: 'balance modification' stamp: 'DEC 6/3/2022 10:42:38'!
modifyBalance: aBalanceToModify

	^aBalanceToModify - value! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Withdraw class' category: 'ServiciosFinancieros-Ejercicio3'!
Withdraw class
	instanceVariableNames: ''!

!Withdraw class methodsFor: 'instance creation' stamp: 'HernanWilkinson 7/13/2011 18:33'!
for: aValue

	^ self new initializeFor: aValue ! !


!classDefinition: #ReceptiveAccount category: 'ServiciosFinancieros-Ejercicio3'!
Object subclass: #ReceptiveAccount
	instanceVariableNames: 'transactions depositTransfers extractionTransfers'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio3'!

!ReceptiveAccount methodsFor: 'initialization' stamp: 'DEC 6/3/2022 18:03:28'!
initialize

	transactions := OrderedCollection new.
	extractionTransfers := OrderedCollection new.
	depositTransfers := OrderedCollection new.! !


!ReceptiveAccount methodsFor: 'main protocol' stamp: 'DEC 6/3/2022 18:21:27'!
balance

	| balance depositTransferBalance extractionTransferBalance |
	
	balance := transactions inject: 0 into: [:aBalance :aTransaction | aTransaction modifyBalance: aBalance ].
	depositTransferBalance := depositTransfers sum: 	[:aDepositTransfer | aDepositTransfer value] ifEmpty: [0 * peso].
	extractionTransferBalance := extractionTransfers sum: [:aTransaction | aTransaction value ] ifEmpty: [0 * peso].
	balance := balance + depositTransferBalance - extractionTransferBalance.
	^balance 
	
	
	"
	^transactions inject: 0 into: [:aBalance :aTransaction | aTransaction modifyBalance: aBalance ]."! !

!ReceptiveAccount methodsFor: 'main protocol' stamp: 'DEC 6/3/2022 18:02:05'!
hasRegistered: aTransaction

	^ transactions includes: aTransaction 
! !

!ReceptiveAccount methodsFor: 'main protocol' stamp: 'DEC 6/3/2022 18:03:51'!
register: aTransaction

	transactions add: aTransaction
! !

!ReceptiveAccount methodsFor: 'main protocol' stamp: 'DEC 6/3/2022 18:06:13'!
registerDepositTransfer: aDepositTransfer

	depositTransfers add: aDepositTransfer 
! !

!ReceptiveAccount methodsFor: 'main protocol' stamp: 'DEC 6/3/2022 18:05:27'!
registerExtractionTransfer: anExtractionTransfer

	extractionTransfers add: anExtractionTransfer 
! !

!ReceptiveAccount methodsFor: 'main protocol' stamp: 'DEC 6/3/2022 18:02:05'!
transactions 

	^ transactions copy! !


!ReceptiveAccount methodsFor: 'as yet unclassified' stamp: 'DEC 6/3/2022 16:18:34'!
transfer: aSimpleMeasure to: aReceptiveAccount 
	
	Withdraw register: aSimpleMeasure on: self.
	Deposit register: aSimpleMeasure on: aReceptiveAccount.! !
