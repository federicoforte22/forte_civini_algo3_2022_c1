!classDefinition: #PortfolioTest category: 'ServiciosFinancieros-Ejercicio21'!
TestCase subclass: #PortfolioTest
	instanceVariableNames: 'receptiveAccount1 receptiveAccount2 receptiveAccount3 portfolioWith3ReceptiveAccounts depositOf100Pesos depositOf150Pesos depositOf50Pesos portfolioWith1ReceptiveAccountAnd1Portfolio portfolioWith2ReceptiveAccounts'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio21'!

!PortfolioTest methodsFor: 'tests - main protocol' stamp: 'DEC 6/7/2022 22:37:14'!
test01ANewPortfolioBalanceIsZeroPesos

	| portfolio |
	
	portfolio := Portfolio new.
	
	self assert: 0 * peso equals: portfolio balance.
	
	! !

!PortfolioTest methodsFor: 'tests - main protocol' stamp: 'DEC 6/9/2022 12:50:19'!
test02APortfolioOnlyWithReceptiveAccountsBalanceIsTheSumOfAllReceptiveAccountsBalance
	
	self assert: 300 * peso equals: portfolioWith3ReceptiveAccounts balance.
	
	
	! !

!PortfolioTest methodsFor: 'tests - main protocol' stamp: 'DEC 6/9/2022 12:49:28'!
test03ATransactionInAReceptiveAccountIsRegisteredByThePortfolio

	self assert: (portfolioWith3ReceptiveAccounts hasRegistered: depositOf100Pesos).
	! !

!PortfolioTest methodsFor: 'tests - main protocol' stamp: 'DEC 6/9/2022 12:59:44'!
test04APortfolioCanListAllOfItsTransactionsWhenIncludingOnlyReceptiveAccounts

	self assertThatEveryTransactionIsIn: portfolioWith3ReceptiveAccounts 
! !

!PortfolioTest methodsFor: 'tests - main protocol' stamp: 'DEC 6/9/2022 12:59:50'!
test05APortfolioCanListAllOfItsTransactionsWhenIncludingAPortfolioAndAReceptiveAccount

	self assertThatEveryTransactionIsIn: portfolioWith1ReceptiveAccountAnd1Portfolio 
! !

!PortfolioTest methodsFor: 'tests - main protocol' stamp: 'DEC 6/9/2022 12:50:35'!
test06APortfolioWithReceptiveAccountsAndOtherPorfoliosBalanceIsTheSumOfAllReceptiveAccountsBalance
	
	self assert: 300 * peso equals: portfolioWith1ReceptiveAccountAnd1Portfolio balance.! !

!PortfolioTest methodsFor: 'tests - main protocol' stamp: 'DEC 6/9/2022 12:49:46'!
test07ATransactionInAReceptiveAccountThatIsInAPortfolioIsRegisteredByThePortfolio

	self assert: (portfolioWith1ReceptiveAccountAnd1Portfolio hasRegistered: depositOf150Pesos).! !


!PortfolioTest methodsFor: 'tests - cant add same account twice' stamp: 'DEC 6/9/2022 14:56:56'!
test08WhenTryingToAddTheSameReceptiveAccountTwiceToAPortfolioItReturnsACantAddAccountTwiceErrorDescription

	| portfolioWithReceptiveAccount receptiveAccount |
	
	portfolioWithReceptiveAccount := Portfolio new.
	receptiveAccount := ReceptiveAccount new.
	
	portfolioWithReceptiveAccount addAccount: receptiveAccount.
	
	self should: [ portfolioWithReceptiveAccount addAccount: receptiveAccount ] raise: Error withExceptionDo: [:anError | self assert: Portfolio cantAddAccountTwiceErrorDescription equals:  anError messageText ].
	
	! !

!PortfolioTest methodsFor: 'tests - cant add same account twice' stamp: 'DEC 6/9/2022 14:57:02'!
test09WhenTryingToAddTheSamePortfolioTwiceToAPortfolioItReturnsACantAddAccountTwiceErrorDescription

	| portfolioWithAPortfolio portfolio |
	
	portfolioWithAPortfolio := Portfolio new.
	portfolio := Portfolio new.
	
	portfolioWithAPortfolio addAccount: portfolio .
	
	self should: [ portfolioWithAPortfolio addAccount: portfolio ] raise: Error withExceptionDo: [:anError | self assert: Portfolio cantAddAccountTwiceErrorDescription equals:  anError messageText ].
	
	! !

!PortfolioTest methodsFor: 'tests - cant add same account twice' stamp: 'DEC 6/9/2022 14:57:07'!
test10WhenTryingToAddAReceptiveAccountToAPortfolioThatHasAnotherPortfolioIncludedWithTheSameReceptiveAccountItReturnsACantAddAccountTwiceErrorDescription

	| portfolioWithAPortfolio portfolioWithAReceptiveAccount receptiveAccount |
	
	portfolioWithAPortfolio := Portfolio new.
	portfolioWithAReceptiveAccount := Portfolio new.
	receptiveAccount := ReceptiveAccount new.
	
	portfolioWithAReceptiveAccount addAccount: receptiveAccount.
	portfolioWithAPortfolio addAccount: portfolioWithAReceptiveAccount.
	
	self should: [ portfolioWithAPortfolio addAccount: receptiveAccount ] raise: Error withExceptionDo: [:anError | self assert: Portfolio cantAddAccountTwiceErrorDescription equals:  anError messageText ].
	
	! !

!PortfolioTest methodsFor: 'tests - cant add same account twice' stamp: 'DEC 6/9/2022 14:57:13'!
test11WhenTryingToAddAPortfolioToAPortfolioThatHasAnotherPortfolioIncludedWithTheSamePortfolioItReturnsACantAddAccountTwiceErrorDescription

	| portfolio1 portfolio2 portfolio3 |
	
	portfolio1 := Portfolio new.
	portfolio2 := Portfolio new.
	portfolio3 := Portfolio new.
	
	portfolio2 addAccount: portfolio3.
	portfolio1 addAccount: portfolio2.
	
	self should: [ portfolio1 addAccount: portfolio3 ] raise: Error withExceptionDo: [:anError | self assert: Portfolio cantAddAccountTwiceErrorDescription equals:  anError messageText ].
	
	! !

!PortfolioTest methodsFor: 'tests - cant add same account twice' stamp: 'DEC 6/9/2022 14:57:19'!
test12WhenTryingToAddAPortfolioToItselfItReturnsACantAddAccountTwiceErrorDescription

	| portfolio1 |
	
	portfolio1 := Portfolio new.
	
	self should: [ portfolio1 addAccount: portfolio1 ] raise: Error withExceptionDo: [:anError | self assert: Portfolio cantAddAccountTwiceErrorDescription equals:  anError messageText ].
	
	! !

!PortfolioTest methodsFor: 'tests - cant add same account twice' stamp: 'DEC 6/9/2022 14:57:31'!
test13WhenTryingToAddAPortfolioWithAReceptiveAccountToAPortfolioThatAlreadyHasThatReceptiveAccountItReturnsACantAddAccountTwiceErrorDescription

	| portfolio1 portfolio2 receptiveAccount |
	
	portfolio1 := Portfolio new.
	portfolio2 := Portfolio new.
	receptiveAccount := ReceptiveAccount new.
	
	portfolio1 addAccount: receptiveAccount.
	portfolio2 addAccount: receptiveAccount.
	
	self should: [ portfolio1 addAccount: portfolio2 ] raise: Error withExceptionDo: [:anError | self assert: Portfolio cantAddAccountTwiceErrorDescription equals:  anError messageText ].
	
	! !

!PortfolioTest methodsFor: 'tests - cant add same account twice' stamp: 'DEC 6/9/2022 14:57:36'!
test14WhenTryingToAddAPortfolioWithAnotherPortfolioIncludedToAPortfolioThatAlreadyHasThatPortfolioItReturnsACantAddAccountTwiceErrorDescription

	| portfolio1 portfolio2 portfolio3 |
	
	portfolio1 := Portfolio new.
	portfolio2 := Portfolio new.
	portfolio3 := Portfolio new.
	
	portfolio1 addAccount: portfolio3.
	portfolio2 addAccount: portfolio3.
	
	self should: [ portfolio1 addAccount: portfolio2 ] raise: Error withExceptionDo: [:anError | self assert: Portfolio cantAddAccountTwiceErrorDescription equals:  anError messageText ].
	
	! !

!PortfolioTest methodsFor: 'tests - cant add same account twice' stamp: 'DEC 6/9/2022 14:57:43'!
test15WhenTryingToAddAReceptiveAccountToAPortfolioThatHasAFatherThatAlreadyHasThatSameReceptiveAccountItReturnsACantAddAccountTwiceErrorDescription

	| portfolio1 portfolio2 receptiveAccount |
	
	portfolio1 := Portfolio new.
	portfolio2 := Portfolio new.
	receptiveAccount := ReceptiveAccount new.
	
	portfolio1 addAccount: receptiveAccount.
	portfolio1 addAccount: portfolio2.
	
	self should: [ portfolio2 addAccount: receptiveAccount ] raise: Error withExceptionDo: [:anError | self assert: Portfolio cantAddAccountTwiceErrorDescription equals:  anError messageText ].
	
	! !

!PortfolioTest methodsFor: 'tests - cant add same account twice' stamp: 'DEC 6/9/2022 14:57:49'!
test16WhenTryingToAddAPortfolioToAPortfolioThatHasAFatherThatAlreadyHasThatSamePortfolioItReturnsACantAddAccountTwiceErrorDescription

	| portfolio1 portfolio2 portfolio3 receptiveAccount |
	
	portfolio1 := Portfolio new.
	portfolio2 := Portfolio new.
	portfolio3 := Portfolio new.
	receptiveAccount := ReceptiveAccount new.
	
	portfolio1 addAccount: receptiveAccount.
	portfolio1 addAccount: portfolio2.
	portfolio3 addAccount: portfolio2.
	
	self should: [ portfolio2 addAccount: receptiveAccount ] raise: Error withExceptionDo: [:anError | self assert: Portfolio cantAddAccountTwiceErrorDescription equals:  anError messageText ].
	
	! !


!PortfolioTest methodsFor: 'asserts' stamp: 'DEC 6/9/2022 12:56:17'!
assertThatEveryTransactionIsIn: aPortfolioWithTransactions

	| allTransactions |
	
	allTransactions := aPortfolioWithTransactions transactions.
	
	self assert: allTransactions includes: depositOf100Pesos .
	self assert: allTransactions includes: depositOf150Pesos .
	self assert: allTransactions includes: depositOf50Pesos .
	! !


!PortfolioTest methodsFor: 'set up' stamp: 'DEC 6/9/2022 12:50:09'!
setUp

	receptiveAccount1 := ReceptiveAccount new.
	receptiveAccount2 := ReceptiveAccount new.
	receptiveAccount3 := ReceptiveAccount new.	
	
	depositOf100Pesos := Deposit register: 100 * peso on: 	receptiveAccount1.
	depositOf150Pesos := Deposit register: 150 * peso on: 	receptiveAccount2.
	depositOf50Pesos := Deposit register: 50 * peso on: 	receptiveAccount3.		
	
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


!classDefinition: #ReceptiveAccountTest category: 'ServiciosFinancieros-Ejercicio21'!
TestCase subclass: #ReceptiveAccountTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio21'!

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


!ReceptiveAccountTest methodsFor: 'set up' stamp: 'DEC 6/7/2022 22:39:45'!
setUp

	transferRecipientAccount := ReceptiveAccount new.
	transferSenderAccount := ReceptiveAccount new.
	
	depositOnSenderAccount := Deposit register: 50 * peso on: transferSenderAccount.
	transfer := Transfer register: 50 * peso from: transferSenderAccount to: transferRecipientAccount.
	transferWithdraw := transfer withdraw.
	transferDeposit := transfer deposit.
	
	
	
	 ! !


!classDefinition: #TransferTest category: 'ServiciosFinancieros-Ejercicio21'!
TestCase subclass: #TransferTest
	instanceVariableNames: 'transferRecipientAccount transferSenderAccount depositOnSenderAccount transfer transferWithdraw transferDeposit'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio21'!

!TransferTest methodsFor: 'set up' stamp: 'DEC 6/9/2022 14:48:53'!
setUp

	transferRecipientAccount := ReceptiveAccount new.
	transferSenderAccount := ReceptiveAccount new.
	
	depositOnSenderAccount := Deposit register: 50 * peso on: transferSenderAccount.
	transfer := Transfer register: 50 * peso from: transferSenderAccount to: transferRecipientAccount.
	transferWithdraw := transfer withdraw.
	transferDeposit := transfer deposit.! !


!TransferTest methodsFor: 'tests' stamp: 'DEC 6/9/2022 14:51:01'!
test01ATransferWithdrawsAnAmountOfPesosFromTheSenderAccount

	self assert: 0 * peso equals: transferSenderAccount balance.! !

!TransferTest methodsFor: 'tests' stamp: 'DEC 6/9/2022 14:51:07'!
test02ATransferDepositsAnAmountOfPesosToRecipientAccount

	self assert: 50 * peso equals: transferRecipientAccount balance.! !

!TransferTest methodsFor: 'tests' stamp: 'DEC 6/9/2022 14:51:13'!
test03ATransferCanReturnItsValue

	self assert: 50 * peso equals: transfer value.! !

!TransferTest methodsFor: 'tests' stamp: 'DEC 6/9/2022 14:51:21'!
test04ATransferCanReturnItsDepositPart

	self assert: 50 * peso equals: transferDeposit value.! !

!TransferTest methodsFor: 'tests' stamp: 'DEC 6/9/2022 14:51:29'!
test05ATransferCanReturnItsWithdrawPart

	self assert: 50 * peso equals: transferWithdraw value.! !

!TransferTest methodsFor: 'tests' stamp: 'DEC 6/9/2022 14:51:36'!
test06ATransferWithdrawCounterpartIsItsTransferDeposit

	| transferWithdrawCounterpart |
	
	transferWithdrawCounterpart := transferWithdraw counterpart.
	self assert: transferWithdrawCounterpart equals: transferDeposit.! !

!TransferTest methodsFor: 'tests' stamp: 'DEC 6/9/2022 14:51:42'!
test07ATransferDepositCounterpartIsItsTransferWithdraw

	| transferDepositCounterpart |
	
	transferDepositCounterpart := transferDeposit counterpart.
	self assert: transferDepositCounterpart equals: transferWithdraw.! !


!classDefinition: #Account category: 'ServiciosFinancieros-Ejercicio21'!
Object subclass: #Account
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio21'!

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


!Account methodsFor: 'private' stamp: 'DEC 6/9/2022 14:41:48'!
addAFatherPortfolio: aPortfolioToAssignAsAFather

	self subclassResponsibility ! !

!Account methodsFor: 'private' stamp: 'DEC 6/9/2022 14:42:19'!
hasIntersectionOfAccountsWith: aCollectionWithAccounts

	self subclassResponsibility ! !

!Account methodsFor: 'private' stamp: 'DEC 6/8/2022 19:35:00'!
includes: anAccountToBeSearched

	self subclassResponsibility ! !


!classDefinition: #Portfolio category: 'ServiciosFinancieros-Ejercicio21'!
Account subclass: #Portfolio
	instanceVariableNames: 'accounts fathersPortfolio'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio21'!

!Portfolio methodsFor: 'initialization' stamp: 'DEC 6/8/2022 22:57:23'!
initialize

	accounts := OrderedCollection new.
	fathersPortfolio := OrderedCollection new.! !


!Portfolio methodsFor: 'main protocol' stamp: 'DEC 6/9/2022 15:22:00'!
addAccount: anAccountToBeAdded

	( self isAbleToAdd: anAccountToBeAdded ) 
	ifTrue: [ ^self error: Portfolio cantAddAccountTwiceErrorDescription ] 
	ifFalse: [ accounts add: anAccountToBeAdded. anAccountToBeAdded addAFatherPortfolio: self].! !

!Portfolio methodsFor: 'main protocol' stamp: 'FF 6/7/2022 18:43:53'!
balance

	^accounts sum: [:anAccount | anAccount balance] ifEmpty: [ 0 * peso ]! !

!Portfolio methodsFor: 'main protocol' stamp: 'FF 6/7/2022 19:10:42'!
hasRegistered: aTransaction 

	^accounts anySatisfy: [ :anAccount | anAccount hasRegistered: aTransaction ].! !

!Portfolio methodsFor: 'main protocol' stamp: 'DEC 6/9/2022 14:33:34'!
transactions

	| allTransactions |
	
	allTransactions := OrderedCollection new.
	accounts do: [ :anAccount | allTransactions addAll: anAccount transactions ].
	
	^allTransactions
! !


!Portfolio methodsFor: 'private' stamp: 'DEC 6/8/2022 23:04:27'!
addAFatherPortfolio: aPortfolioToAssignAsAFather

	fathersPortfolio add: aPortfolioToAssignAsAFather ! !

!Portfolio methodsFor: 'private' stamp: 'DEC 6/9/2022 14:33:49'!
checkIfFatherIncludes: anAccountToBeSearched

	fathersPortfolio ifEmpty: [^false].
	^fathersPortfolio anySatisfy: [:aPortfolio | aPortfolio includes: anAccountToBeSearched ].! !

!Portfolio methodsFor: 'private' stamp: 'DEC 6/8/2022 20:14:03'!
hasIntersectionOfAccountsWith: aCollectionWithAccounts

	^accounts includesAnyOf: aCollectionWithAccounts ! !

!Portfolio methodsFor: 'private' stamp: 'DEC 6/9/2022 14:34:51'!
includes: anAccountToBeSearched

	^(self = anAccountToBeSearched ) 
	or: [ accounts anySatisfy: [:anAccount | anAccount includes: anAccountToBeSearched ] ] 
	or: [ anAccountToBeSearched hasIntersectionOfAccountsWith: accounts ]! !

!Portfolio methodsFor: 'private' stamp: 'DEC 6/9/2022 15:21:12'!
isAbleToAdd: anAccountToBeAdded

	^(self includes: anAccountToBeAdded ) 
	or: [self checkIfFatherIncludes: anAccountToBeAdded ]! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Portfolio class' category: 'ServiciosFinancieros-Ejercicio21'!
Portfolio class
	instanceVariableNames: ''!

!Portfolio class methodsFor: 'as yet unclassified' stamp: 'DEC 6/8/2022 22:30:17'!
cantAddAccountTwiceErrorDescription

	^'The account is already included in the Portfolio'! !


!classDefinition: #ReceptiveAccount category: 'ServiciosFinancieros-Ejercicio21'!
Account subclass: #ReceptiveAccount
	instanceVariableNames: 'transactions'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio21'!

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


!ReceptiveAccount methodsFor: 'private' stamp: 'DEC 6/8/2022 23:04:17'!
addAFatherPortfolio: aPortfolioToAssignAsAFather

	^self! !

!ReceptiveAccount methodsFor: 'private' stamp: 'DEC 6/8/2022 20:17:10'!
hasIntersectionOfAccountsWith: aCollectionWithAccounts

	^false! !

!ReceptiveAccount methodsFor: 'private' stamp: 'DEC 6/8/2022 19:34:18'!
includes: anAccountToBeSearched

	^self = anAccountToBeSearched 
	! !


!classDefinition: #AccountTransaction category: 'ServiciosFinancieros-Ejercicio21'!
Object subclass: #AccountTransaction
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio21'!

!AccountTransaction methodsFor: 'balance modification' stamp: 'DEC 6/7/2022 22:40:51'!
modifyBalance: aBalaanceToBeModified

	self subclassResponsibility ! !


!AccountTransaction methodsFor: 'value' stamp: 'HernanWilkinson 9/12/2011 12:25'!
value 

	self subclassResponsibility ! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'AccountTransaction class' category: 'ServiciosFinancieros-Ejercicio21'!
AccountTransaction class
	instanceVariableNames: ''!

!AccountTransaction class methodsFor: 'instance creation' stamp: 'NR 10/17/2019 03:22:00'!
register: aValue on: account

	| transaction |
	
	transaction := self for: aValue.
	account register: transaction.
		
	^ transaction! !


!classDefinition: #Deposit category: 'ServiciosFinancieros-Ejercicio21'!
AccountTransaction subclass: #Deposit
	instanceVariableNames: 'value'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio21'!

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

!classDefinition: 'Deposit class' category: 'ServiciosFinancieros-Ejercicio21'!
Deposit class
	instanceVariableNames: ''!

!Deposit class methodsFor: 'instance creation' stamp: 'HernanWilkinson 7/13/2011 18:38'!
for: aValue

	^ self new initializeFor: aValue ! !


!classDefinition: #TranferWithdraw category: 'ServiciosFinancieros-Ejercicio21'!
AccountTransaction subclass: #TranferWithdraw
	instanceVariableNames: 'associatedTransfer'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio21'!

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

!classDefinition: 'TranferWithdraw class' category: 'ServiciosFinancieros-Ejercicio21'!
TranferWithdraw class
	instanceVariableNames: ''!

!TranferWithdraw class methodsFor: 'as yet unclassified' stamp: 'DEC 6/4/2022 20:17:26'!
asPartOf: aTransfer

	^self new initializeAsPartOf: aTransfer ! !


!classDefinition: #TransferDeposit category: 'ServiciosFinancieros-Ejercicio21'!
AccountTransaction subclass: #TransferDeposit
	instanceVariableNames: 'associatedTransfer'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio21'!

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

!classDefinition: 'TransferDeposit class' category: 'ServiciosFinancieros-Ejercicio21'!
TransferDeposit class
	instanceVariableNames: ''!

!TransferDeposit class methodsFor: 'as yet unclassified' stamp: 'DEC 6/4/2022 20:04:15'!
asPartOf: aTransfer

	^self new initializeAsPartOf: aTransfer 

	! !


!classDefinition: #Withdraw category: 'ServiciosFinancieros-Ejercicio21'!
AccountTransaction subclass: #Withdraw
	instanceVariableNames: 'value'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio21'!

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

!classDefinition: 'Withdraw class' category: 'ServiciosFinancieros-Ejercicio21'!
Withdraw class
	instanceVariableNames: ''!

!Withdraw class methodsFor: 'instance creation' stamp: 'HernanWilkinson 7/13/2011 18:33'!
for: aValue

	^ self new initializeFor: aValue ! !


!classDefinition: #Transfer category: 'ServiciosFinancieros-Ejercicio21'!
Object subclass: #Transfer
	instanceVariableNames: 'value transferDeposit transferWithdraw'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio21'!

!Transfer methodsFor: 'initialization' stamp: 'DEC 6/4/2022 19:52:18'!
initializeFor: aValueInPesos

	value := aValueInPesos ! !


!Transfer methodsFor: 'setters - private' stamp: 'DEC 6/4/2022 20:00:25'!
deposit: aTransferDeposit

	transferDeposit := aTransferDeposit ! !

!Transfer methodsFor: 'setters - private' stamp: 'DEC 6/4/2022 20:19:41'!
withdraw: aTransferWithdraw

	transferWithdraw := aTransferWithdraw ! !



!Transfer methodsFor: 'getters' stamp: 'DEC 6/4/2022 19:47:35'!
deposit

	^transferDeposit! !

!Transfer methodsFor: 'getters' stamp: 'DEC 6/3/2022 16:28:12'!
value

	^value! !

!Transfer methodsFor: 'getters' stamp: 'FF 6/6/2022 20:22:09'!
withdraw
	
	^transferWithdraw ! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Transfer class' category: 'ServiciosFinancieros-Ejercicio21'!
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
