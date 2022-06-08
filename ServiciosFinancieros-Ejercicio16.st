!classDefinition: #PortfolioTest category: 'ServiciosFinancieros-Ejercicio16'!
TestCase subclass: #PortfolioTest
	instanceVariableNames: 'receptiveAccount1 receptiveAccount2 receptiveAccount3 portfolioWith3ReceptiveAccounts deposit1 deposit2 deposit3 portfolioWith1ReceptiveAccountAnd1Portfolio portfolioWith2ReceptiveAccounts'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio16'!

!PortfolioTest methodsFor: 'tests' stamp: 'DEC 6/7/2022 22:37:14'!
test01ANewPortfolioBalanceIsZeroPesos

	| portfolio |
	
	portfolio := Portfolio new.
	
	self assert: 0 * peso equals: portfolio balance.
	
	! !

!PortfolioTest methodsFor: 'tests' stamp: 'DEC 6/7/2022 22:37:23'!
test02APortfolioOnlyWithReceptiveAccountsBalanceIsTheSumOfAllReceptiveAccountsBalance
	
	self assert: 200 * peso equals: portfolioWith3ReceptiveAccounts balance.
	
	
	! !

!PortfolioTest methodsFor: 'tests' stamp: 'DEC 6/7/2022 22:37:29'!
test03ATransactionInAReceptiveAccountIsRegisteredByThePortfolio

	self assert: (portfolioWith3ReceptiveAccounts hasRegistered: deposit1).
	! !

!PortfolioTest methodsFor: 'tests' stamp: 'DEC 6/8/2022 20:29:17'!
test04APortfolioCanListAllOfItsTransactionsWhenIncludingOnlyReceptiveAccounts

	| allTransactions |
	
	allTransactions := portfolioWith3ReceptiveAccounts transactions.
	
	self assert: allTransactions includes: deposit1 .
	self assert: allTransactions includes: deposit2 .
	self assert: allTransactions includes: deposit3 .! !

!PortfolioTest methodsFor: 'tests' stamp: 'DEC 6/8/2022 20:29:54'!
test05APortfolioCanListAllOfItsTransactionsWhenIncludingAPortfolioAndAReceptiveAccount

	| allTransactions |
	
	allTransactions := portfolioWith1ReceptiveAccountAnd1Portfolio transactions.
	
	self assert: allTransactions includes: deposit1 .
	self assert: allTransactions includes: deposit2 .
	self assert: allTransactions includes: deposit3 .! !

!PortfolioTest methodsFor: 'tests' stamp: 'DEC 6/8/2022 20:28:48'!
test06APortfolioWithReceptiveAccountsAndOtherPorfoliosBalanceIsTheSumOfAllReceptiveAccountsBalance
	
	self assert: 200 * peso equals: portfolioWith1ReceptiveAccountAnd1Portfolio balance.! !

!PortfolioTest methodsFor: 'tests' stamp: 'DEC 6/8/2022 20:28:39'!
test07ATransactionInAReceptiveAccountThatIsInAPortfolioIsRegisteredByThePortfolio

	self assert: (portfolioWith1ReceptiveAccountAnd1Portfolio hasRegistered: deposit2).! !

!PortfolioTest methodsFor: 'tests' stamp: 'DEC 6/8/2022 20:28:32'!
test08APortfolioWithReceptiveAccountsAndOtherPorfoliosCanListAllOfItsTransactions

	| allTransactions deposits |
	
	allTransactions := portfolioWith1ReceptiveAccountAnd1Portfolio transactions.
	deposits := OrderedCollection with: deposit1 with: deposit2 with: deposit3. 
	
	self assert: (allTransactions includesAllOf: deposits) .! !

!PortfolioTest methodsFor: 'tests' stamp: 'DEC 6/8/2022 20:28:25'!
test09

	| portfolio receptiveAccount |
	
	portfolio := Portfolio new.
	receptiveAccount := ReceptiveAccount new.
	
	portfolio addAccount: receptiveAccount.
	
	self should: [ portfolio addAccount: receptiveAccount ] raise: Error withExceptionDo: [:anError | self assert: Portfolio cantAddSameAccountErrorDescription equals:  anError messageText ].
	
	! !

!PortfolioTest methodsFor: 'tests' stamp: 'DEC 6/8/2022 20:28:17'!
test10

	| portfolio1 portfolio2 |
	
	portfolio1 := Portfolio new.
	portfolio2 := Portfolio new.
	
	portfolio1 addAccount: portfolio2 .
	
	self should: [ portfolio1 addAccount: portfolio2 ] raise: Error withExceptionDo: [:anError | self assert: Portfolio cantAddSameAccountErrorDescription equals:  anError messageText ].
	
	! !

!PortfolioTest methodsFor: 'tests' stamp: 'DEC 6/8/2022 20:28:12'!
test11

	| portfolio1 portfolio2 receptiveAccount |
	
	portfolio1 := Portfolio new.
	portfolio2 := Portfolio new.
	receptiveAccount := ReceptiveAccount new.
	
	portfolio2 addAccount: receptiveAccount.
	portfolio1 addAccount: portfolio2.
	
	self should: [ portfolio1 addAccount: receptiveAccount ] raise: Error withExceptionDo: [:anError | self assert: Portfolio cantAddSameAccountErrorDescription equals:  anError messageText ].
	
	! !

!PortfolioTest methodsFor: 'tests' stamp: 'DEC 6/8/2022 20:28:07'!
test12

	| portfolio1 portfolio2 portfolio3 |
	
	portfolio1 := Portfolio new.
	portfolio2 := Portfolio new.
	portfolio3 := Portfolio new.
	
	portfolio2 addAccount: portfolio3.
	portfolio1 addAccount: portfolio2.
	
	self should: [ portfolio1 addAccount: portfolio3 ] raise: Error withExceptionDo: [:anError | self assert: Portfolio cantAddSameAccountErrorDescription equals:  anError messageText ].
	
	! !

!PortfolioTest methodsFor: 'tests' stamp: 'DEC 6/8/2022 20:28:03'!
test13

	| portfolio1 |
	
	portfolio1 := Portfolio new.
	
	self should: [ portfolio1 addAccount: portfolio1 ] raise: Error withExceptionDo: [:anError | self assert: Portfolio cantAddSameAccountErrorDescription equals:  anError messageText ].
	
	! !

!PortfolioTest methodsFor: 'tests' stamp: 'DEC 6/8/2022 20:27:58'!
test14

	| portfolio1 portfolio2 receptiveAccount |
	
	portfolio1 := Portfolio new.
	portfolio2 := Portfolio new.
	receptiveAccount := ReceptiveAccount new.
	
	portfolio1 addAccount: receptiveAccount.
	portfolio2 addAccount: receptiveAccount.
	
	self should: [ portfolio1 addAccount: portfolio2 ] raise: Error withExceptionDo: [:anError | self assert: Portfolio cantAddSameAccountErrorDescription equals:  anError messageText ].
	
	! !

!PortfolioTest methodsFor: 'tests' stamp: 'DEC 6/8/2022 20:27:51'!
test15

	| portfolio1 portfolio2 portfolio3 |
	
	portfolio1 := Portfolio new.
	portfolio2 := Portfolio new.
	portfolio3 := Portfolio new.
	
	portfolio1 addAccount: portfolio3.
	portfolio2 addAccount: portfolio3.
	
	self should: [ portfolio1 addAccount: portfolio2 ] raise: Error withExceptionDo: [:anError | self assert: Portfolio cantAddSameAccountErrorDescription equals:  anError messageText ].
	
	! !


!PortfolioTest methodsFor: 'set up' stamp: 'DEC 6/7/2022 22:33:12'!
setUp

	receptiveAccount1 := ReceptiveAccount new.
	receptiveAccount2 := ReceptiveAccount new.
	receptiveAccount3 := ReceptiveAccount new.	
	
	deposit1 := Deposit register: 100 * peso on: 	receptiveAccount1.
	deposit2 := Deposit register: 50 * peso on: 	receptiveAccount2.
	deposit3 := Deposit register: 50 * peso on: 	receptiveAccount3.		
	
	portfolioWith3ReceptiveAccounts := Portfolio new.
	portfolioWith3ReceptiveAccounts addAccount: receptiveAccount1.
	portfolioWith3ReceptiveAccounts addAccount: receptiveAccount2.
	portfolioWith3ReceptiveAccounts addAccount: receptiveAccount3.
	
	portfolioWith2ReceptiveAccounts := Portfolio new.
	portfolioWith2ReceptiveAccounts addAccount: receptiveAccount2.
	portfolioWith2ReceptiveAccounts addAccount: receptiveAccount3.
	
	portfolioWith1ReceptiveAccountAnd1Portfolio := Portfolio new.
	portfolioWith1ReceptiveAccountAnd1Portfolio addAccount: receptiveAccount1.
	portfolioWith1ReceptiveAccountAnd1Portfolio addAccount: portfolioWith2ReceptiveAccounts.
	! !


!classDefinition: #ReceptiveAccountTest category: 'ServiciosFinancieros-Ejercicio16'!
TestCase subclass: #ReceptiveAccountTest
	instanceVariableNames: 'transferRecipientAccount transferSenderAccount depositOnSenderAccount transfer transferWithdraw transferDeposit'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio16'!

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


!ReceptiveAccountTest methodsFor: 'tests - transfer' stamp: 'DEC 6/7/2022 22:39:45'!
test08ATransferWithdrawsAnAmountOfPesosFromTheSenderAccount

	self assert: 0 * peso equals: transferSenderAccount balance.! !

!ReceptiveAccountTest methodsFor: 'tests - transfer' stamp: 'DEC 6/7/2022 22:39:38'!
test09ATransferDepositsAnAmountOfPesosToRecipientAccount

	self assert: 50 * peso equals: transferRecipientAccount balance.! !

!ReceptiveAccountTest methodsFor: 'tests - transfer' stamp: 'DEC 6/7/2022 22:10:20'!
test10ATransferCanReturnItsValue

	self assert: 50 * peso equals: transfer value.! !

!ReceptiveAccountTest methodsFor: 'tests - transfer' stamp: 'DEC 6/7/2022 22:10:33'!
test11ATransferCanReturnItsDepositPart

	self assert: 50 * peso equals: transferDeposit value.! !

!ReceptiveAccountTest methodsFor: 'tests - transfer' stamp: 'DEC 6/7/2022 22:10:28'!
test12ATransferCanReturnItsWithdrawPart
	
	self assert: 50 * peso equals: transferWithdraw value.! !

!ReceptiveAccountTest methodsFor: 'tests - transfer' stamp: 'DEC 6/7/2022 22:10:33'!
test13ATransferWithdrawCounterpartIsItsTransferDeposit

	| transferWithdrawCounterpart |
	
	transferWithdrawCounterpart := transferWithdraw counterpart.
	self assert: transferWithdrawCounterpart equals: transferDeposit.! !

!ReceptiveAccountTest methodsFor: 'tests - transfer' stamp: 'DEC 6/7/2022 22:10:33'!
test14ATransferDepositCounterpartIsItsTransferWithdraw

	| transferDepositCounterpart |
	
	transferDepositCounterpart := transferDeposit counterpart.
	self assert: transferDepositCounterpart equals: transferWithdraw.! !


!ReceptiveAccountTest methodsFor: 'set up' stamp: 'DEC 6/7/2022 22:39:45'!
setUp

	transferRecipientAccount := ReceptiveAccount new.
	transferSenderAccount := ReceptiveAccount new.
	
	depositOnSenderAccount := Deposit register: 50 * peso on: transferSenderAccount.
	transfer := Transfer register: 50 * peso from: transferSenderAccount to: transferRecipientAccount.
	transferWithdraw := transfer withdraw.
	transferDeposit := transfer deposit.
	
	
	
	 ! !


!classDefinition: #Account category: 'ServiciosFinancieros-Ejercicio16'!
Object subclass: #Account
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio16'!

!Account methodsFor: 'initialization' stamp: 'FF 6/7/2022 19:13:54'!
initialize

	self subclassResponsibility ! !


!Account methodsFor: 'main protocol' stamp: 'FF 6/7/2022 19:13:27'!
addAccount: anAccount

	self subclassResponsibility ! !

!Account methodsFor: 'main protocol' stamp: 'FF 6/7/2022 19:13:43'!
balance

	self subclassResponsibility ! !

!Account methodsFor: 'main protocol' stamp: 'FF 6/7/2022 19:13:49'!
hasRegistered: aTransaction 

	self subclassResponsibility ! !

!Account methodsFor: 'main protocol' stamp: 'FF 6/7/2022 19:14:21'!
register: aTransaction

	self subclassResponsibility ! !

!Account methodsFor: 'main protocol' stamp: 'FF 6/7/2022 19:13:59'!
transactions

	self subclassResponsibility ! !


!Account methodsFor: 'private' stamp: 'DEC 6/8/2022 19:35:00'!
includes: anAccountToBeSearched

	self subclassResponsibility ! !


!classDefinition: #Portfolio category: 'ServiciosFinancieros-Ejercicio16'!
Account subclass: #Portfolio
	instanceVariableNames: 'accounts'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio16'!

!Portfolio methodsFor: 'initialization' stamp: 'FF 6/6/2022 21:00:08'!
initialize

	accounts := OrderedCollection new! !


!Portfolio methodsFor: 'main protocol' stamp: 'DEC 6/8/2022 19:25:27'!
addAccount: anAccount
	(self includes: anAccount ) ifTrue: [ ^self error: Portfolio cantAddSameAccountErrorDescription ] ifFalse: [ accounts add: anAccount ].
	"
	( accounts includes: anAccount ) ifTrue: [ ^self error: Portfolio cantAddSameAccountErrorDescription ] ifFalse: [ accounts add: anAccount ]"! !

!Portfolio methodsFor: 'main protocol' stamp: 'FF 6/7/2022 18:43:53'!
balance

	^accounts sum: [:anAccount | anAccount balance] ifEmpty: [ 0 * peso ]! !

!Portfolio methodsFor: 'main protocol' stamp: 'FF 6/7/2022 19:10:42'!
hasRegistered: aTransaction 

	^accounts anySatisfy: [ :anAccount | anAccount hasRegistered: aTransaction ].! !

!Portfolio methodsFor: 'main protocol' stamp: 'DEC 6/8/2022 20:54:21'!
transactions

	| allTransactions |
	
	allTransactions := OrderedCollection new.
	
	accounts do: [ :anAccount | allTransactions addAll: anAccount transactions ].
	"accounts do: [ :anAccount | (anAccount transactions) do: [ :aTransaction | allTransactions add: aTransaction ]]."
	
	^allTransactions
! !


!Portfolio methodsFor: 'private' stamp: 'DEC 6/8/2022 20:14:03'!
hasIntersectionOfAccountsWith: aCollectionWithAccounts

	^accounts includesAnyOf: aCollectionWithAccounts ! !

!Portfolio methodsFor: 'private' stamp: 'DEC 6/8/2022 20:14:03'!
includes: anAccountToBeSearched

"	( self = anAccountToBeSearched ) ifTrue: [ ^true ].
	( accounts anySatisfy: [:anAccount | anAccount includes: anAccountToBeSearched ] ) ifTrue: [ ^true ].
	( anAccountToBeSearched isKindOf: Portfolio ) ifTrue: [  ]"

	^(self = anAccountToBeSearched ) 
	or: [ accounts anySatisfy: [:anAccount | anAccount includes: anAccountToBeSearched ] ] or: [ anAccountToBeSearched hasIntersectionOfAccountsWith: accounts ]! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Portfolio class' category: 'ServiciosFinancieros-Ejercicio16'!
Portfolio class
	instanceVariableNames: ''!

!Portfolio class methodsFor: 'as yet unclassified' stamp: 'DEC 6/8/2022 19:08:11'!
cantAddSameAccountErrorDescription

	^'The account is already included in the Portfolio'! !


!classDefinition: #ReceptiveAccount category: 'ServiciosFinancieros-Ejercicio16'!
Account subclass: #ReceptiveAccount
	instanceVariableNames: 'transactions'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio16'!

!ReceptiveAccount methodsFor: 'initialization' stamp: 'FF 6/7/2022 19:15:58'!
initialize

	transactions := OrderedCollection new.! !


!ReceptiveAccount methodsFor: 'main protocol' stamp: 'FF 6/7/2022 19:16:31'!
balance
	
	^transactions inject: 0 into: [:aBalance :aTransaction | aTransaction modifyBalance: aBalance ]! !

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


!ReceptiveAccount methodsFor: 'private' stamp: 'DEC 6/8/2022 20:17:10'!
hasIntersectionOfAccountsWith: aCollectionWithAccounts

	^false! !

!ReceptiveAccount methodsFor: 'private' stamp: 'DEC 6/8/2022 19:34:18'!
includes: anAccountToBeSearched

	^self = anAccountToBeSearched 
	! !


!classDefinition: #AccountTransaction category: 'ServiciosFinancieros-Ejercicio16'!
Object subclass: #AccountTransaction
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio16'!

!AccountTransaction methodsFor: 'balance modification' stamp: 'DEC 6/7/2022 22:40:51'!
modifyBalance: aBalaanceToBeModified

	self subclassResponsibility ! !


!AccountTransaction methodsFor: 'value' stamp: 'HernanWilkinson 9/12/2011 12:25'!
value 

	self subclassResponsibility ! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'AccountTransaction class' category: 'ServiciosFinancieros-Ejercicio16'!
AccountTransaction class
	instanceVariableNames: ''!

!AccountTransaction class methodsFor: 'instance creation' stamp: 'NR 10/17/2019 03:22:00'!
register: aValue on: account

	| transaction |
	
	transaction := self for: aValue.
	account register: transaction.
		
	^ transaction! !


!classDefinition: #Deposit category: 'ServiciosFinancieros-Ejercicio16'!
AccountTransaction subclass: #Deposit
	instanceVariableNames: 'value'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio16'!

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

!classDefinition: 'Deposit class' category: 'ServiciosFinancieros-Ejercicio16'!
Deposit class
	instanceVariableNames: ''!

!Deposit class methodsFor: 'instance creation' stamp: 'HernanWilkinson 7/13/2011 18:38'!
for: aValue

	^ self new initializeFor: aValue ! !


!classDefinition: #TranferWithdraw category: 'ServiciosFinancieros-Ejercicio16'!
AccountTransaction subclass: #TranferWithdraw
	instanceVariableNames: 'associatedTransfer'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio16'!

!TranferWithdraw methodsFor: 'balance modification' stamp: 'FF 6/6/2022 21:16:20'!
modifyBalance: aBalanceToModify

	^aBalanceToModify - self value! !


!TranferWithdraw methodsFor: 'value' stamp: 'DEC 6/4/2022 20:22:55'!
value

	^associatedTransfer value! !


!TranferWithdraw methodsFor: 'counterpart' stamp: 'FF 6/6/2022 20:26:36'!
counterpart
	
	^associatedTransfer deposit ! !


!TranferWithdraw methodsFor: 'initialization' stamp: 'DEC 6/4/2022 20:17:45'!
initializeAsPartOf: aTransfer

	associatedTransfer := aTransfer ! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'TranferWithdraw class' category: 'ServiciosFinancieros-Ejercicio16'!
TranferWithdraw class
	instanceVariableNames: ''!

!TranferWithdraw class methodsFor: 'as yet unclassified' stamp: 'DEC 6/4/2022 20:17:26'!
asPartOf: aTransfer

	^self new initializeAsPartOf: aTransfer ! !


!classDefinition: #TransferDeposit category: 'ServiciosFinancieros-Ejercicio16'!
AccountTransaction subclass: #TransferDeposit
	instanceVariableNames: 'associatedTransfer'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio16'!

!TransferDeposit methodsFor: 'balance modification' stamp: 'FF 6/6/2022 21:15:02'!
modifyBalance: aBalanceToModify

	^aBalanceToModify + self value! !


!TransferDeposit methodsFor: 'value' stamp: 'DEC 6/4/2022 20:01:42'!
value

	^associatedTransfer value! !


!TransferDeposit methodsFor: 'counterpart' stamp: 'FF 6/6/2022 20:27:55'!
counterpart
	
	^associatedTransfer withdraw ! !


!TransferDeposit methodsFor: 'initialization' stamp: 'DEC 6/4/2022 19:58:05'!
initializeAsPartOf: aTransfer

	associatedTransfer := aTransfer ! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'TransferDeposit class' category: 'ServiciosFinancieros-Ejercicio16'!
TransferDeposit class
	instanceVariableNames: ''!

!TransferDeposit class methodsFor: 'as yet unclassified' stamp: 'DEC 6/4/2022 20:04:15'!
asPartOf: aTransfer

	^self new initializeAsPartOf: aTransfer 

	! !


!classDefinition: #Withdraw category: 'ServiciosFinancieros-Ejercicio16'!
AccountTransaction subclass: #Withdraw
	instanceVariableNames: 'value'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio16'!

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

!classDefinition: 'Withdraw class' category: 'ServiciosFinancieros-Ejercicio16'!
Withdraw class
	instanceVariableNames: ''!

!Withdraw class methodsFor: 'instance creation' stamp: 'HernanWilkinson 7/13/2011 18:33'!
for: aValue

	^ self new initializeFor: aValue ! !


!classDefinition: #Transfer category: 'ServiciosFinancieros-Ejercicio16'!
Object subclass: #Transfer
	instanceVariableNames: 'value transferDeposit transferWithdraw'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio16'!

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

!classDefinition: 'Transfer class' category: 'ServiciosFinancieros-Ejercicio16'!
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
