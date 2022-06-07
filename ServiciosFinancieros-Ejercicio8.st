!classDefinition: #PortfolioTest category: 'ServiciosFinancieros-Ejercicio8'!
TestCase subclass: #PortfolioTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio8'!

!PortfolioTest methodsFor: 'as yet unclassified' stamp: 'FF 6/7/2022 18:50:49'!
test15ANewPortfolioBalanceIsZeroPesos

	| portfolio |
	
	portfolio := Portfolio new.
	
	self assert: 0 * peso equals: portfolio balance.
	
	! !

!PortfolioTest methodsFor: 'as yet unclassified' stamp: 'FF 6/7/2022 18:51:50'!
test16APortfolioOnlyWithReceptiveAccountsBalanceIsTheSumOfAllReceptiveAccountsBalance

	| portfolio receptiveAccount1 receptiveAccount2 receptiveAccount3 |
	
	portfolio := Portfolio new.
	receptiveAccount1 := ReceptiveAccount new.
	receptiveAccount2 := ReceptiveAccount new.
	receptiveAccount3 := ReceptiveAccount new.
	
	portfolio addReceptiveAccount: receptiveAccount1.
	portfolio addReceptiveAccount: receptiveAccount2.
	portfolio addReceptiveAccount: receptiveAccount3.
		
	Deposit register: 100 * peso on: 	receptiveAccount1.
	Deposit register: 50 * peso on: 	receptiveAccount2.
	Deposit register: 50 * peso on: 	receptiveAccount3.		
	
	self assert: 200 * peso equals: portfolio balance.
	
	
	! !

!PortfolioTest methodsFor: 'as yet unclassified' stamp: 'FF 6/7/2022 18:52:30'!
test17ATransactionInAReceptiveAccountIsRegisteredByThePortfolio

	| portfolio receptiveAccount1 deposit1 |
	
	portfolio := Portfolio new.
	receptiveAccount1 := ReceptiveAccount new.
	
	portfolio addReceptiveAccount: receptiveAccount1.
		
	deposit1 := Deposit register: 100 * peso on: 	receptiveAccount1.
	
	self assert: (portfolio hasRegistered: deposit1).
	! !

!PortfolioTest methodsFor: 'as yet unclassified' stamp: 'FF 6/7/2022 18:53:33'!
test18APortfolioCanListAllOfItsTransactions

	| portfolio receptiveAccount1 receptiveAccount2 receptiveAccount3  deposit1 deposit2 deposit3 allTransactions |
	
	portfolio := Portfolio new.
	receptiveAccount1 := ReceptiveAccount new.
	receptiveAccount2 := ReceptiveAccount new.
	receptiveAccount3 := ReceptiveAccount new.
	
	portfolio addReceptiveAccount: receptiveAccount1.
	portfolio addReceptiveAccount: receptiveAccount2.
	portfolio addReceptiveAccount: receptiveAccount3.
		
	deposit1 := Deposit register: 100 * peso on: 	receptiveAccount1.
	deposit2 := Deposit register: 50 * peso on: 	receptiveAccount2.
	deposit3 := Deposit register: 50 * peso on: 	receptiveAccount3.		
	
	allTransactions := portfolio transactions.
	
	self assert: allTransactions includes: deposit1 .
	self assert: allTransactions includes: deposit2 .
	self assert: allTransactions includes: deposit3 .! !

!PortfolioTest methodsFor: 'as yet unclassified' stamp: 'FF 6/7/2022 18:54:26'!
test19APortfolioWithReceptiveAccountsAndOtherPorfoliosBalanceIsTheSumOfAllReceptiveAccountsBalance

	| portfolio1 portfolio2 receptiveAccount1 receptiveAccount2 receptiveAccount3 |
	
	portfolio1 := Portfolio new.
	portfolio2 := Portfolio new.
	receptiveAccount1 := ReceptiveAccount new.
	receptiveAccount2 := ReceptiveAccount new.
	receptiveAccount3 := ReceptiveAccount new.
	
	portfolio1 addReceptiveAccount: receptiveAccount1.
	portfolio2 addReceptiveAccount: receptiveAccount2.
	portfolio2 addReceptiveAccount: receptiveAccount3.
	portfolio1 addPortfolio: portfolio2.
		
	Deposit register: 100 * peso on: 	receptiveAccount1.
	Deposit register: 50 * peso on: 	receptiveAccount2.
	Deposit register: 50 * peso on: 	receptiveAccount3.		
	
	self assert: 200 * peso equals: portfolio1 balance.! !

!PortfolioTest methodsFor: 'as yet unclassified' stamp: 'FF 6/7/2022 18:55:22'!
test20ATransactionInAReceptiveAccountThatIsInAPortfolioIsRegisteredByThePortfolio

	| portfolio1 portfolio2 receptiveAccount2 deposit2 |
	
	
	portfolio1 := Portfolio new.
	portfolio2 := Portfolio new.
	receptiveAccount2 := ReceptiveAccount new.
	
	portfolio2 addReceptiveAccount: receptiveAccount2.
	portfolio1 addPortfolio: portfolio2.
		
	deposit2 := Deposit register: 50 * peso on: 	receptiveAccount2.
	
	
	self assert: (portfolio1 hasRegistered: deposit2).! !

!PortfolioTest methodsFor: 'as yet unclassified' stamp: 'FF 6/7/2022 18:56:18'!
test21APortfolioWithReceptiveAccountsAndOtherPorfoliosCanListAllOfItsTransactions

	| portfolio1 portfolio2 receptiveAccount1 receptiveAccount2 receptiveAccount3  deposit1 deposit2 deposit3 allTransactions |
	
	
	portfolio1 := Portfolio new.
	portfolio2 := Portfolio new.
	receptiveAccount1 := ReceptiveAccount new.
	receptiveAccount2 := ReceptiveAccount new.
	receptiveAccount3 := ReceptiveAccount new.
	
	portfolio1 addReceptiveAccount: receptiveAccount1.
	portfolio2 addReceptiveAccount: receptiveAccount2.
	portfolio2 addReceptiveAccount: receptiveAccount3.
	portfolio1 addPortfolio: portfolio2.
		
	deposit1 := Deposit register: 100 * peso on: 	receptiveAccount1.
	deposit2 := Deposit register: 50 * peso on: 	receptiveAccount2.
	deposit3 := Deposit register: 50 * peso on: 	receptiveAccount3.		
	
	allTransactions := portfolio1 transactions.
	
	self assert: allTransactions includes: deposit1 .
	self assert: allTransactions includes: deposit2 .
	self assert: allTransactions includes: deposit3 .! !


!classDefinition: #ReceptiveAccountTest category: 'ServiciosFinancieros-Ejercicio8'!
TestCase subclass: #ReceptiveAccountTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio8'!

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


!ReceptiveAccountTest methodsFor: 'tests - transfer' stamp: 'FF 6/6/2022 20:46:08'!
test08ATransferWithdrawsAnAmountOfPesosFromSenderAccountAfterTransfer

	| recipientAccount senderAccount |
	
	recipientAccount := ReceptiveAccount new.
	senderAccount := ReceptiveAccount new.
	
	Deposit register: 50 * peso on: senderAccount.
	Transfer register: 50 * peso from: senderAccount to: recipientAccount.

	
	self assert: 0 * peso equals: senderAccount balance.! !

!ReceptiveAccountTest methodsFor: 'tests - transfer' stamp: 'FF 6/6/2022 20:46:03'!
test09ATransferDepositsAnAmountOfPesosToRecipientAccountAfterTransfer

	| recipientAccount senderAccount |
	
	recipientAccount := ReceptiveAccount new.
	senderAccount := ReceptiveAccount new.
	
	Deposit register: 50 * peso on: senderAccount.
	Transfer register: 50 * peso from: senderAccount to: recipientAccount.

	
	self assert: 50 * peso equals: recipientAccount balance.! !

!ReceptiveAccountTest methodsFor: 'tests - transfer' stamp: 'FF 6/6/2022 20:46:51'!
test10ATransferCanReturnItsValue

	| recipientAccount senderAccount transfer |
	
	recipientAccount := ReceptiveAccount new.
	senderAccount := ReceptiveAccount new.
	
	Deposit register: 50 * peso on: senderAccount.
	transfer := Transfer register: 50 * peso from: senderAccount to: recipientAccount.
	
	self assert: 50 * peso equals: transfer value.! !

!ReceptiveAccountTest methodsFor: 'tests - transfer' stamp: 'FF 6/6/2022 20:47:42'!
test11ATransferCanReturnItsDepositPart

	| recipientAccount senderAccount transfer transferDeposit |
	
	recipientAccount := ReceptiveAccount new.
	senderAccount := ReceptiveAccount new.
	
	Deposit register: 50 * peso on: senderAccount.
	transfer := Transfer register: 50 * peso from: senderAccount to: recipientAccount.
	transferDeposit := transfer deposit.
	
	self assert: 50 * peso equals: transferDeposit value.! !

!ReceptiveAccountTest methodsFor: 'tests - transfer' stamp: 'FF 6/6/2022 20:48:07'!
test12ATransferCanReturnItsWithdrawPart

	| recipientAccount senderAccount transfer transferWithdraw |
	
	recipientAccount := ReceptiveAccount new.
	senderAccount := ReceptiveAccount new.
	
	Deposit register: 50 * peso on: senderAccount.
	transfer := Transfer register: 50 * peso from: senderAccount to: recipientAccount.
	transferWithdraw := transfer withdraw.
	
	self assert: 50 * peso equals: transferWithdraw value.! !

!ReceptiveAccountTest methodsFor: 'tests - transfer' stamp: 'FF 6/6/2022 21:10:46'!
test13ATransferWithdrawCounterpartIsItsTransferDeposit

	| recipientAccount senderAccount transfer transferWithdraw transferDeposit transferWithdrawCounterpart |
	
	recipientAccount := ReceptiveAccount new.
	senderAccount := ReceptiveAccount new.
	
	Deposit register: 50 * peso on: senderAccount.
	transfer := Transfer register: 50 * peso from: senderAccount to: recipientAccount.
	transferWithdraw := transfer withdraw.
	transferDeposit := transfer deposit.
	transferWithdrawCounterpart := transferWithdraw counterpart.
	
	self assert: transferWithdrawCounterpart equals: transferDeposit.! !

!ReceptiveAccountTest methodsFor: 'tests - transfer' stamp: 'FF 6/6/2022 21:11:08'!
test14ATransferDepositCounterpartIsItsTransferWithdraw

	| recipientAccount senderAccount transfer transferWithdraw transferDeposit transferDepositCounterpart |
	
	recipientAccount := ReceptiveAccount new.
	senderAccount := ReceptiveAccount new.
	
	Deposit register: 50 * peso on: senderAccount.
	transfer := Transfer register: 50 * peso from: senderAccount to: recipientAccount.
	transferWithdraw := transfer withdraw.
	transferDeposit := transfer deposit.
	transferDepositCounterpart := transferDeposit counterpart.
	
	self assert: transferDepositCounterpart equals: transferWithdraw.! !


!classDefinition: #AccountTransaction category: 'ServiciosFinancieros-Ejercicio8'!
Object subclass: #AccountTransaction
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio8'!

!AccountTransaction methodsFor: 'value' stamp: 'HernanWilkinson 9/12/2011 12:25'!
value 

	self subclassResponsibility ! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'AccountTransaction class' category: 'ServiciosFinancieros-Ejercicio8'!
AccountTransaction class
	instanceVariableNames: ''!

!AccountTransaction class methodsFor: 'instance creation' stamp: 'NR 10/17/2019 03:22:00'!
register: aValue on: account

	| transaction |
	
	transaction := self for: aValue.
	account register: transaction.
		
	^ transaction! !


!classDefinition: #Deposit category: 'ServiciosFinancieros-Ejercicio8'!
AccountTransaction subclass: #Deposit
	instanceVariableNames: 'value'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio8'!

!Deposit methodsFor: 'initialization' stamp: 'HernanWilkinson 7/13/2011 18:45'!
initializeFor: aValue

	value := aValue ! !


!Deposit methodsFor: 'value' stamp: 'HernanWilkinson 7/13/2011 18:38'!
value

	^ value! !


!Deposit methodsFor: 'balance modification' stamp: 'FF 6/6/2022 21:15:12'!
modifyBalance: aBalanceToModify

	^aBalanceToModify + value! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Deposit class' category: 'ServiciosFinancieros-Ejercicio8'!
Deposit class
	instanceVariableNames: ''!

!Deposit class methodsFor: 'instance creation' stamp: 'HernanWilkinson 7/13/2011 18:38'!
for: aValue

	^ self new initializeFor: aValue ! !


!classDefinition: #TranferWithdraw category: 'ServiciosFinancieros-Ejercicio8'!
AccountTransaction subclass: #TranferWithdraw
	instanceVariableNames: 'associatedTransfer'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio8'!

!TranferWithdraw methodsFor: 'as yet unclassified' stamp: 'FF 6/6/2022 20:26:36'!
counterpart
	
	^associatedTransfer deposit ! !

!TranferWithdraw methodsFor: 'as yet unclassified' stamp: 'DEC 6/4/2022 20:17:45'!
initializeAsPartOf: aTransfer

	associatedTransfer := aTransfer ! !

!TranferWithdraw methodsFor: 'as yet unclassified' stamp: 'FF 6/6/2022 21:16:20'!
modifyBalance: aBalanceToModify

	^aBalanceToModify - self value! !

!TranferWithdraw methodsFor: 'as yet unclassified' stamp: 'DEC 6/4/2022 20:22:55'!
value

	^associatedTransfer value! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'TranferWithdraw class' category: 'ServiciosFinancieros-Ejercicio8'!
TranferWithdraw class
	instanceVariableNames: ''!

!TranferWithdraw class methodsFor: 'as yet unclassified' stamp: 'DEC 6/4/2022 20:17:26'!
asPartOf: aTransfer

	^self new initializeAsPartOf: aTransfer ! !


!classDefinition: #TransferDeposit category: 'ServiciosFinancieros-Ejercicio8'!
AccountTransaction subclass: #TransferDeposit
	instanceVariableNames: 'associatedTransfer'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio8'!

!TransferDeposit methodsFor: 'as yet unclassified' stamp: 'FF 6/6/2022 20:27:55'!
counterpart
	
	^associatedTransfer withdraw ! !

!TransferDeposit methodsFor: 'as yet unclassified' stamp: 'DEC 6/4/2022 19:58:05'!
initializeAsPartOf: aTransfer

	associatedTransfer := aTransfer ! !

!TransferDeposit methodsFor: 'as yet unclassified' stamp: 'FF 6/6/2022 21:15:02'!
modifyBalance: aBalanceToModify

	^aBalanceToModify + self value! !

!TransferDeposit methodsFor: 'as yet unclassified' stamp: 'DEC 6/4/2022 20:01:42'!
value

	^associatedTransfer value! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'TransferDeposit class' category: 'ServiciosFinancieros-Ejercicio8'!
TransferDeposit class
	instanceVariableNames: ''!

!TransferDeposit class methodsFor: 'as yet unclassified' stamp: 'DEC 6/4/2022 20:04:15'!
asPartOf: aTransfer

	^self new initializeAsPartOf: aTransfer 

	! !


!classDefinition: #Withdraw category: 'ServiciosFinancieros-Ejercicio8'!
AccountTransaction subclass: #Withdraw
	instanceVariableNames: 'value'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio8'!

!Withdraw methodsFor: 'initialization' stamp: 'HernanWilkinson 7/13/2011 18:46'!
initializeFor: aValue

	value := aValue ! !


!Withdraw methodsFor: 'value' stamp: 'HernanWilkinson 7/13/2011 18:33'!
value

	^ value! !


!Withdraw methodsFor: 'balance modification' stamp: 'FF 6/6/2022 21:16:30'!
modifyBalance: aBalanceToModify

	^aBalanceToModify - value! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Withdraw class' category: 'ServiciosFinancieros-Ejercicio8'!
Withdraw class
	instanceVariableNames: ''!

!Withdraw class methodsFor: 'instance creation' stamp: 'HernanWilkinson 7/13/2011 18:33'!
for: aValue

	^ self new initializeFor: aValue ! !


!classDefinition: #Portfolio category: 'ServiciosFinancieros-Ejercicio8'!
Object subclass: #Portfolio
	instanceVariableNames: 'accounts'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio8'!

!Portfolio methodsFor: 'initialization' stamp: 'FF 6/6/2022 21:00:08'!
initialize

	accounts := OrderedCollection new! !


!Portfolio methodsFor: 'main protocol' stamp: 'FF 6/7/2022 18:42:52'!
addPortfolio: aPortfolio 

	accounts add: aPortfolio ! !

!Portfolio methodsFor: 'main protocol' stamp: 'FF 6/6/2022 20:59:42'!
addReceptiveAccount: aReceptiveAccount

	accounts add: aReceptiveAccount ! !

!Portfolio methodsFor: 'main protocol' stamp: 'FF 6/7/2022 18:43:53'!
balance

	^accounts sum: [:anAccount | anAccount balance] ifEmpty: [ 0 * peso ]! !

!Portfolio methodsFor: 'main protocol' stamp: 'FF 6/7/2022 18:44:04'!
hasRegistered: aTransaction 

	^accounts anySatisfy: [ :each | each hasRegistered: aTransaction ].! !

!Portfolio methodsFor: 'main protocol' stamp: 'FF 6/7/2022 18:46:12'!
transactions

	| allTransactions allTransactions2 |
	
	allTransactions2 := OrderedCollection new.
	
	allTransactions := accounts do: [ :each | (each transactions) do: [ :each2 | allTransactions2 add: each2]].
	
	^allTransactions2
	! !


!classDefinition: #ReceptiveAccount category: 'ServiciosFinancieros-Ejercicio8'!
Object subclass: #ReceptiveAccount
	instanceVariableNames: 'transactions'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio8'!

!ReceptiveAccount methodsFor: 'initialization' stamp: 'DEC 6/3/2022 18:03:28'!
initialize

	transactions := OrderedCollection new.
	extractionTransfers := OrderedCollection new.
	depositTransfers := OrderedCollection new.! !


!ReceptiveAccount methodsFor: 'main protocol' stamp: 'FF 6/6/2022 20:32:44'!
balance
	
	^transactions inject: 0 into: [:aBalance :aTransaction | aTransaction modifyBalance: aBalance ].

	
	
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

!ReceptiveAccount methodsFor: 'main protocol' stamp: 'DEC 6/3/2022 18:02:05'!
transactions 

	^ transactions copy! !


!classDefinition: #Transfer category: 'ServiciosFinancieros-Ejercicio8'!
Object subclass: #Transfer
	instanceVariableNames: 'value transferDeposit transferWithdraw'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio8'!

!Transfer methodsFor: 'initialization' stamp: 'DEC 6/4/2022 19:52:18'!
initializeFor: aValueInPesos

	value := aValueInPesos ! !


!Transfer methodsFor: 'as yet unclassified' stamp: 'DEC 6/4/2022 19:47:35'!
deposit

	^transferDeposit! !

!Transfer methodsFor: 'as yet unclassified' stamp: 'DEC 6/4/2022 20:00:25'!
deposit: aTransferDeposit

	transferDeposit := aTransferDeposit ! !

!Transfer methodsFor: 'as yet unclassified' stamp: 'DEC 6/3/2022 16:43:10'!
modifyBalance: aBalanceToModify

	^aBalanceToModify + value! !

!Transfer methodsFor: 'as yet unclassified' stamp: 'DEC 6/3/2022 16:28:12'!
value

	^value! !

!Transfer methodsFor: 'as yet unclassified' stamp: 'FF 6/6/2022 20:22:09'!
withdraw
	
	^transferWithdraw ! !

!Transfer methodsFor: 'as yet unclassified' stamp: 'DEC 6/4/2022 20:19:41'!
withdraw: aTransferWithdraw

	transferWithdraw := aTransferWithdraw ! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Transfer class' category: 'ServiciosFinancieros-Ejercicio8'!
Transfer class
	instanceVariableNames: ''!

!Transfer class methodsFor: 'as yet unclassified' stamp: 'DEC 6/4/2022 19:51:13'!
for: aValueInPesos

	^self new initializeFor: aValueInPesos ! !

!Transfer class methodsFor: 'as yet unclassified' stamp: 'DEC 6/4/2022 20:20:08'!
register: aValueInPesos from: aSenderAccount to: aRecipientAccount 
	
	| transfer transferDeposit transferWithdraw |
	
	transfer := self for: aValueInPesos.
	"creo las dos patas y les paso la transfer y desp a la transfer le agrgo las patas"
	transferDeposit := TransferDeposit asPartOf: transfer.
	transferWithdraw := TranferWithdraw asPartOf: transfer.
	transfer deposit: transferDeposit.
	transfer withdraw: transferWithdraw.
	
	aRecipientAccount register: transferDeposit.
	aSenderAccount register: transferWithdraw.
	
	^transfer ! !
