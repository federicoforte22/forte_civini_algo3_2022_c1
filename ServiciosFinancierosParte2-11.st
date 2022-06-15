!classDefinition: #AccountSummaryTest category: 'ServiciosFinancierosParte2-11'!
TestCase subclass: #AccountSummaryTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancierosParte2-11'!

!AccountSummaryTest methodsFor: 'as yet unclassified' stamp: 'DEC 6/14/2022 18:43:44'!
test01TheSummaryOfAnAccountWithoutAnyTransactionsShowsJustTheBalanceThatIs0

	| receptiveAccount accountSummary|
	
	receptiveAccount := ReceptiveAccount new.
	accountSummary := AccountSummary for: receptiveAccount.
	
	self assert: accountSummary print equals: ( OrderedCollection with: 'Balance = 0' )! !

!AccountSummaryTest methodsFor: 'as yet unclassified' stamp: 'DEC 6/14/2022 18:47:29'!
test02TheSummaryOfAnAccountWithOnlyADepositShowsTheLineOfTheDepositAndTheOneOfTheBalance

	| receptiveAccount accountSummary1 |
	
	receptiveAccount := ReceptiveAccount new.
	accountSummary1 := AccountSummary for: receptiveAccount.
	
	Deposit register: 50 * peso on: receptiveAccount.
	
	self assert: ( OrderedCollection with: 'Depósito por 50 * pesos' with: 'Balance = 50 * pesos' ) equals: accountSummary1 print.! !

!AccountSummaryTest methodsFor: 'as yet unclassified' stamp: 'DEC 6/14/2022 18:49:12'!
test03TheSummaryOfAnAccountWithOnlyAWithdrawShowsTheLineOfTheWithdrawAndTheOneOfTheBalance

	| receptiveAccount accountSummary1 |
	
	receptiveAccount := ReceptiveAccount new.
	accountSummary1 := AccountSummary for: receptiveAccount.
	
	Withdraw register: 30 * peso on: receptiveAccount.
	
	self assert: ( OrderedCollection with: 'Extracción por 30 * pesos' with: 'Balance = -30 * pesos' ) print equals: accountSummary1 print.! !

!AccountSummaryTest methodsFor: 'as yet unclassified' stamp: 'DEC 6/14/2022 19:14:24'!
test04TheSummaryOfAnAccountWithOnlyATransferShowsTheLineOfTheTransferAndTheOneOfTheBalance

	| receptiveAccount anotherReceptiveAccount accountSummary1 accountSummary2 |
	
	receptiveAccount := ReceptiveAccount new.
	anotherReceptiveAccount := ReceptiveAccount new.
	accountSummary1 := AccountSummary for: receptiveAccount.
	accountSummary2 := AccountSummary for: anotherReceptiveAccount.
	
	Transfer amount: 20 * peso from: receptiveAccount to: anotherReceptiveAccount.
	
	self assert: ( OrderedCollection with: 'Entrada por transferencia de 20 * pesos' with: 'Balance = 20 * pesos' ) equals: accountSummary2  print.
	self assert: ( OrderedCollection with: 'Salida por transferencia de 20 * pesos' with: 'Balance = -20 * pesos' ) equals: accountSummary1 print.! !

!AccountSummaryTest methodsFor: 'as yet unclassified' stamp: 'DEC 6/14/2022 18:51:23'!
test05TheSummaryOfAPortfolioWithoutAnyTransactionsShowsJustTheBalanceThatIs0

	| portfolio accountSummary |
	
	portfolio := Portfolio new.
	accountSummary := AccountSummary for: portfolio.
	
	self assert: accountSummary print equals: ( OrderedCollection with: 'Balance = 0' ).
! !

!AccountSummaryTest methodsFor: 'as yet unclassified' stamp: 'DEC 6/14/2022 18:58:14'!
test06TheSummaryOfAPortfolioWithOnlyADepositShowsTheLineOfTheDepositAndTheOneOfTheBalance

	| portfolio receptiveAccount accountSummary |
	
	portfolio := Portfolio new.
	receptiveAccount := ReceptiveAccount new.
	accountSummary := AccountSummary for: portfolio.
	
	Deposit register: 50 * peso on: receptiveAccount.
	portfolio add: receptiveAccount.

	self assert: accountSummary print equals: ( OrderedCollection with: 'Depósito por 50 * pesos' with: 'Balance = 50 * pesos' ).
! !

!AccountSummaryTest methodsFor: 'as yet unclassified' stamp: 'DEC 6/14/2022 18:59:07'!
test07TheSummaryOfAPortfolioWithEveryTransactionShowsTheLineOfEveryTransaactionAndTheOneOfTheBalance

	| portfolio transferSenderAccount transferRecipientAccount accountSummary |
	
	portfolio := Portfolio new.
	transferSenderAccount := ReceptiveAccount new.
	transferRecipientAccount := ReceptiveAccount new.
	accountSummary := AccountSummary for: portfolio.
	
	Deposit register: 50 * peso on: transferSenderAccount.
	Withdraw register: 30 * peso on: transferSenderAccount.
	Transfer amount: 20 * peso from: transferSenderAccount to: transferRecipientAccount.
	portfolio add: transferSenderAccount.
	portfolio add: transferRecipientAccount.
	
	self assert: accountSummary print equals: ( OrderedCollection with: 'Depósito por 50 * pesos' with: 'Extracción por 30 * pesos' with: 'Salida por transferencia de 20 * pesos' with: 'Entrada por transferencia de 20 * pesos' with: 'Balance = 20 * pesos' ).
! !


!classDefinition: #PortfolioTest category: 'ServiciosFinancierosParte2-11'!
TestCase subclass: #PortfolioTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancierosParte2-11'!

!PortfolioTest methodsFor: 'tests' stamp: 'HAW 5/25/2019 11:16:26'!
test01BalanceOfPortfolioWithoutAccountsIsZero

	self assert: 0 equals: Portfolio new balance! !

!PortfolioTest methodsFor: 'tests' stamp: 'LL 7/1/2021 03:27:00'!
test02BalanceOfPortfolioWithOneAccountIsAccountBalance

	| account portfolio |
	
	account := ReceptiveAccount new.
	Deposit register: 100 * peso on: account.
	portfolio := Portfolio with: account.
	
	self assert: account balance equals: portfolio balance! !

!PortfolioTest methodsFor: 'tests' stamp: 'LL 7/1/2021 03:27:06'!
test03BalanceOfPortfolioIsCalculatedRecursivelyOnPortfolios

	| simplePortfolioAccount simplePortfolio composedPortfolioAccount composedPortofolio |
	
	simplePortfolioAccount := ReceptiveAccount new.
	Deposit register: 100 * peso on: simplePortfolioAccount.
	simplePortfolio := Portfolio with: simplePortfolioAccount.
	
	composedPortfolioAccount := ReceptiveAccount new.
	Withdraw register: 50 * peso on: composedPortfolioAccount.
	composedPortofolio := Portfolio with: simplePortfolio with: composedPortfolioAccount.
	
	self assert: (composedPortfolioAccount balance + simplePortfolio balance) equals: composedPortofolio balance! !

!PortfolioTest methodsFor: 'tests' stamp: 'LL 7/1/2021 03:27:12'!
test04PortfolioWithoutAccountsHasNoRegisteredTransaction

	self deny: (Portfolio new hasRegistered: (Deposit for: 100 * peso))! !

!PortfolioTest methodsFor: 'tests' stamp: 'LL 7/1/2021 03:27:18'!
test05PortfolioHasRegisteredItsAccountsTransactions

	| account portfolio deposit |
	
	account := ReceptiveAccount new.
	deposit := Deposit register: 100 * peso on: account.
	portfolio := Portfolio with: account.
	
	self assert: (portfolio hasRegistered: deposit)! !

!PortfolioTest methodsFor: 'tests' stamp: 'LL 7/1/2021 03:27:26'!
test06PortfolioLooksForRegisteredTransactionsRecursively

	| simplePortfolioAccount simplePortfolio composedPortfolioAccount composedPortfolio composedPortfolioAccountWithdraw simplePortfolioAccountDeposit |
	
	simplePortfolioAccount := ReceptiveAccount new.
	simplePortfolioAccountDeposit := Deposit register: 100 * peso on: simplePortfolioAccount.
	simplePortfolio := Portfolio with: simplePortfolioAccount.
	
	composedPortfolioAccount := ReceptiveAccount new.
	composedPortfolioAccountWithdraw := Withdraw register: 50 * peso on: composedPortfolioAccount.
	composedPortfolio := Portfolio with: simplePortfolio with: composedPortfolioAccount.
	
	self assert: (composedPortfolio hasRegistered: simplePortfolioAccountDeposit).
	self assert: (composedPortfolio hasRegistered: composedPortfolioAccountWithdraw)! !

!PortfolioTest methodsFor: 'tests' stamp: 'HAW 5/25/2019 11:58:10'!
test07PortfolioHasNoTransactionWhenHasNoAccounts

	self assert: Portfolio new transactions isEmpty! !

!PortfolioTest methodsFor: 'tests' stamp: 'LL 7/1/2021 03:28:08'!
test08PortfolioTransactionsIncludesAllItsAccountsTransactions

	| account portfolio accountDeposit portfolioTransactions anotherAccountWithdraw |
	
	account := ReceptiveAccount new.
	accountDeposit := Deposit register: 100 * peso on: account.
	anotherAccountWithdraw := Withdraw register: 100 * peso on: account.
	portfolio := Portfolio with: account.
	
	portfolioTransactions := portfolio transactions.
	
	self assert: 2 equals: portfolioTransactions size.
	self assert: (portfolioTransactions includes: accountDeposit).
	self assert: (portfolioTransactions includes: anotherAccountWithdraw)! !

!PortfolioTest methodsFor: 'tests' stamp: 'LL 7/1/2021 03:28:20'!
test09PortfolioTransactionsAreCalculatedRecursively

	| simplePortfolioAccount simplePortfolio composedPortfolioAccount composedPortfolio composedPortfolioAccountWithdraw simplePortfolioAccountDeposit composedPortfolioTransactions |
	
	simplePortfolioAccount := ReceptiveAccount new.
	simplePortfolioAccountDeposit := Deposit register: 100 * peso on: simplePortfolioAccount.
	simplePortfolio := Portfolio with: simplePortfolioAccount.
	
	composedPortfolioAccount := ReceptiveAccount new.
	composedPortfolioAccountWithdraw := Withdraw register: 50 * peso on: composedPortfolioAccount.
	composedPortfolio := Portfolio with: simplePortfolio with: composedPortfolioAccount.
	
	composedPortfolioTransactions := composedPortfolio transactions.
	self assert: 2 equals: composedPortfolioTransactions size.
	self assert: (composedPortfolioTransactions includes: simplePortfolioAccountDeposit).
	self assert: (composedPortfolioTransactions includes: composedPortfolioAccountWithdraw)! !

!PortfolioTest methodsFor: 'tests' stamp: 'HAW 5/25/2019 11:58:24'!
test10PortfolioCanNotIncludeTheSameAccountMoreThanOnce

	| account portfolio |
	
	account := ReceptiveAccount new.
	portfolio := Portfolio with: account.
	
	self 
		should: [ portfolio add: account ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: Portfolio canNotAddAccountErrorMessage equals: anError messageText.
			self assert: 1 equals: portfolio accountsSize.
			self assert: (portfolio accountsIncludes: account) ]! !

!PortfolioTest methodsFor: 'tests' stamp: 'HAW 5/25/2019 11:58:28'!
test11PortfolioCanNotIncludeAccountOfItsPortfolios

	| account simplePortfolio composedPortfolio |
	
	account := ReceptiveAccount new.
	simplePortfolio := Portfolio with: account.
	composedPortfolio := Portfolio with: simplePortfolio.
	
	self 
		should: [ composedPortfolio add: account ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: Portfolio canNotAddAccountErrorMessage equals: anError messageText.
			self assert: 1 equals: composedPortfolio accountsSize.
			self assert: (composedPortfolio accountsIncludes: simplePortfolio) ]! !

!PortfolioTest methodsFor: 'tests' stamp: 'LL 11/29/2021 18:55:37'!
test12PortfolioCanNotIncludeItself

	| simplePortfolio |
	
	simplePortfolio := Portfolio new.
	
	self 
		should: [ simplePortfolio add: simplePortfolio ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: Portfolio canNotAddAccountErrorMessage equals: anError messageText.
			self assert: 0 equals: simplePortfolio accountsSize. ]! !

!PortfolioTest methodsFor: 'tests' stamp: 'HAW 5/25/2019 12:01:51'!
test13ComposedPortfolioCanNotHaveParentPortfolioAccount

	| account simplePortfolio composedPortfolio |
	
	account := ReceptiveAccount new.
	simplePortfolio := Portfolio new.
	composedPortfolio := Portfolio with: simplePortfolio.
	composedPortfolio add: account.
	
	self 
		should: [ simplePortfolio add: account ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: Portfolio canNotAddAccountErrorMessage equals: anError messageText.
			self assert: simplePortfolio accountsIsEmpty ]! !

!PortfolioTest methodsFor: 'tests' stamp: 'HAW 5/25/2019 12:12:16'!
test14ComposedPortfolioCanNotHaveAccountOfAnyRootParentRecursively

	| account leftParentPortfolio leftRootParentPortfolio portfolio rightParentPortfolio rightRootParentPortfolio |
	
	account := ReceptiveAccount new.
	portfolio := Portfolio new.
	leftParentPortfolio := Portfolio with: portfolio .
	leftRootParentPortfolio := Portfolio with: leftParentPortfolio.
	leftRootParentPortfolio add: account.
	
	rightParentPortfolio := Portfolio with: portfolio .
	rightRootParentPortfolio := Portfolio with: rightParentPortfolio.
	rightRootParentPortfolio add: account.

	self 
		should: [ portfolio add: account ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: Portfolio canNotAddAccountErrorMessage equals: anError messageText.
			self assert: portfolio accountsIsEmpty ]! !

!PortfolioTest methodsFor: 'tests' stamp: 'HAW 5/29/2019 16:31:18'!
test15PortfolioCanNotIncludeAnyOfTheComposedAccountOfPortfolioToAdd

	| portfolioToAdd portfolioToModify rootPortfolio sharedAccount |
	
	sharedAccount := ReceptiveAccount new.
	portfolioToModify := Portfolio new.
	rootPortfolio := Portfolio with: sharedAccount with: portfolioToModify.
	portfolioToAdd := Portfolio with: sharedAccount.
	
	self 
		should: [ portfolioToModify add: portfolioToAdd ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError | 
			self assert: Portfolio canNotAddAccountErrorMessage equals: anError messageText.
			self assert: portfolioToModify accountsIsEmpty ]! !


!classDefinition: #PortfolioTreePrinterTest category: 'ServiciosFinancierosParte2-11'!
TestCase subclass: #PortfolioTreePrinterTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancierosParte2-11'!

!PortfolioTreePrinterTest methodsFor: 'as yet unclassified' stamp: 'DEC 6/14/2022 18:17:14'!
test01TheSummaryOfAnAccountWithoutAnyTransactionsShowsJustTheBalanceThatIs0

	| portfolioTreePrinter |
	
	portfolioTreePrinter := PortfolioTreePrinter new.
	
	self assert: portfolioTreePrinter print equals: ''.
	
	
! !

!PortfolioTreePrinterTest methodsFor: 'as yet unclassified' stamp: 'DEC 6/14/2022 19:22:49'!
test01TheTreePrinterOfAnEmptyPortfolioReturnsAnEmptyString

	| portfolioTreePrinter |
	
	portfolioTreePrinter := PortfolioTreePrinter new.
	
	self assert: portfolioTreePrinter print equals: ''.
	
	
! !

!PortfolioTreePrinterTest methodsFor: 'as yet unclassified' stamp: 'DEC 6/14/2022 18:46:11'!
test02YaLoSepare

	| fedesAccount portfolioTreePrinter |
	
	fedesAccount := ReceptiveAccount named: 'Cuenta de Fede'.
	portfolioTreePrinter := PortfolioTreePrinter new.
	fedesAccount accept: portfolioTreePrinter.
	
	self assert: portfolioTreePrinter print equals: 'Cuenta de Fede'.
	
! !


!classDefinition: #ReceptiveAccountTest category: 'ServiciosFinancierosParte2-11'!
TestCase subclass: #ReceptiveAccountTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancierosParte2-11'!

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'LL 7/1/2021 03:10:43'!
test01ReceptiveAccountHaveZeroAsBalanceWhenCreated 

	| account |
	
	account := ReceptiveAccount new.

	self assert: 0 equals: account balance
! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'LL 7/1/2021 03:14:20'!
test02DepositIncreasesBalanceOnTransactionValue 

	| account |
	
	account := ReceptiveAccount  new.
	Deposit register: 100 * peso on: account.
		
	self assert: 100 * peso equals: account balance
! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'LL 7/1/2021 03:14:24'!
test03WithdrawDecreasesBalanceOnTransactionValue 

	| account |
	
	account := ReceptiveAccount new.
	Deposit register: 100 * peso on: account.
	Withdraw register: 50 * peso on: account.
		
	self assert: 50 * peso equals: account balance
! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'LL 7/1/2021 03:10:14'!
test04WithdrawValueMustBePositive 

	| account withdrawValue |
	
	account := ReceptiveAccount new.
	withdrawValue := 50 * peso.
	
	self assert: withdrawValue equals: (Withdraw register: withdrawValue on: account) value
! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'LL 7/1/2021 03:10:22'!
test05ReceptiveAccountKnowsRegisteredTransactions 

	| account deposit withdraw |
	
	account := ReceptiveAccount new.
	deposit := Deposit register: 100 * peso on: account.
	withdraw := Withdraw register: 50 * peso on: account.
		
	self assert: (account hasRegistered: deposit).
	self assert: (account hasRegistered: withdraw).
! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'LL 7/1/2021 03:12:14'!
test06ReceptiveAccountDoNotKnowNotRegisteredTransactions

	| account deposit withdraw |
	
	account := ReceptiveAccount new.
	deposit :=  Deposit for: 100 * peso.
	withdraw := Withdraw for: 50 * peso.
		
	self deny: (account hasRegistered: deposit).
	self deny: (account hasRegistered: withdraw).
! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'LL 7/1/2021 03:12:23'!
test07AccountKnowsItsTransactions 

	| account deposit |
	
	account := ReceptiveAccount new.
	
	deposit := Deposit register: 50 * peso on: account.
		
	self assert: 1 equals: account transactions size.
	self assert: (account transactions includes: deposit).
! !


!classDefinition: #TransferNetTest category: 'ServiciosFinancierosParte2-11'!
TestCase subclass: #TransferNetTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancierosParte2-11'!

!TransferNetTest methodsFor: 'as yet unclassified' stamp: 'DEC 6/14/2022 19:04:54'!
test01TheTransferNetOfAnAccountThatDidntParticipateOnATransferIs0Pesos

	| receptiveAccount transferNet |
	
	receptiveAccount := ReceptiveAccount new.
	transferNet := TransferNet for: receptiveAccount.
	
	self assert: 0 * peso equals: transferNet print.! !

!TransferNetTest methodsFor: 'as yet unclassified' stamp: 'DEC 6/14/2022 19:09:02'!
test02TheTransferNetOfEachAccountParticipatingOnATransferAreEqualInModuleButOppositeSign

	| transferSenderAccount transferRecipientAccount transferNet1 transferNet2 |
	
	transferSenderAccount := ReceptiveAccount new.
	transferRecipientAccount := ReceptiveAccount new.
	transferNet1 := TransferNet for: transferSenderAccount .
	transferNet2 := TransferNet for: transferRecipientAccount .
	
	Transfer amount: 20 * peso from: transferSenderAccount to: transferRecipientAccount.
	
	self assert: -20 * peso equals: transferNet1 print.
	self assert: 20 * peso equals: transferNet2 print.! !

!TransferNetTest methodsFor: 'as yet unclassified' stamp: 'DEC 6/14/2022 19:06:09'!
test03TheTransferNetOfAPortfolioThatDidntParticipateOnATransferIs0Pesos

	| portfolio transferNet |
	
	portfolio := Portfolio new.
	transferNet := TransferNet for: portfolio.
	
	self assert: 0 * peso equals: transferNet print.! !

!TransferNetTest methodsFor: 'as yet unclassified' stamp: 'DEC 6/14/2022 19:12:15'!
test04TheTransferNetOfAPortfolioThatIncludesATransferSenderAccountIsEqualToTheNegativeValueOfTheTransfer

	| portfolio transferSenderAccount transferRecipientAccount transferNet |
	
	portfolio := Portfolio new.
	transferSenderAccount := ReceptiveAccount new.
	transferRecipientAccount := ReceptiveAccount new.
	transferNet := TransferNet for: portfolio.
	
	Transfer amount: 40 * peso from: transferSenderAccount to: transferRecipientAccount.
	portfolio add: transferSenderAccount.
			
	self assert: -40 * peso equals: transferNet print.! !


!classDefinition: #TransferTest category: 'ServiciosFinancierosParte2-11'!
TestCase subclass: #TransferTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancierosParte2-11'!

!TransferTest methodsFor: 'as yet unclassified' stamp: 'LL 9/20/2020 21:07:03'!
test01ATransferDecreasesBalanceFromOriginAccountAndIncreasesItForDestinationAccount

	| destinationAccount originAccount |
	
	originAccount := ReceptiveAccount new.
	Deposit register: 10 * peso on: originAccount.
	
	destinationAccount := ReceptiveAccount new.
	Deposit register: 10 * peso on: destinationAccount.
	
	Transfer amount: 2 * peso from: originAccount to: destinationAccount.
	
	self assert: 8 * peso equals: originAccount balance.
	self assert: 12 * peso equals: destinationAccount balance.! !

!TransferTest methodsFor: 'as yet unclassified' stamp: 'LL 9/20/2020 21:12:28'!
test02ATransferKnowsItsValue

	| destinationAccount originAccount transfer |
	
	originAccount := ReceptiveAccount new.
	Deposit register: 10 * peso on: originAccount.
	
	destinationAccount := ReceptiveAccount new.
	Deposit register: 10 * peso on: destinationAccount.
	
	transfer := Transfer amount: 2 * peso from: originAccount to: destinationAccount.
	
	self assert: 2 * peso equals: transfer value.! !

!TransferTest methodsFor: 'as yet unclassified' stamp: 'LL 9/20/2020 23:01:44'!
test03DepositLegKnowsItsWithdrawCounterpart

	| destinationAccount originAccount transfer |
	
	originAccount := ReceptiveAccount new.
	Deposit register: 10 * peso on: originAccount.
	
	destinationAccount := ReceptiveAccount new.
	Deposit register: 10 * peso on: destinationAccount.
	
	transfer := Transfer amount: 2 * peso from: originAccount to: destinationAccount.
	
	self assert: transfer withdrawLeg equals: transfer depositLeg withdrawLeg! !

!TransferTest methodsFor: 'as yet unclassified' stamp: 'LL 9/20/2020 23:01:51'!
test04WithdrawLegKnowsItsDepositCounterpart

	| destinationAccount originAccount transfer |
	
	originAccount := ReceptiveAccount new.
	Deposit register: 10 * peso on: originAccount.
	
	destinationAccount := ReceptiveAccount new.
	Deposit register: 10 * peso on: destinationAccount.
	
	transfer := Transfer amount: 2 * peso from: originAccount to: destinationAccount.
	
	self assert: transfer depositLeg equals: transfer withdrawLeg depositLeg! !

!TransferTest methodsFor: 'as yet unclassified' stamp: 'LL 9/20/2020 23:02:36'!
test05OriginAndDestinationAccountsCannotBeTheSame

	| originAccount |
	
	originAccount := ReceptiveAccount new.
	Deposit register: 10 * peso on: originAccount.
	
	self should: [ Transfer amount: 2 * peso from: originAccount to: originAccount ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: Transfer cannotTransferToOriginErrorDescription equals: anError messageText.
			self assert: 10 * peso equals: originAccount balance.
		]
! !

!TransferTest methodsFor: 'as yet unclassified' stamp: 'LL 9/20/2020 23:02:44'!
test06CannotTransferAZeroAmount

	| originAccount destinationAccount |
	
	originAccount := ReceptiveAccount new.
	Deposit register: 10 * peso on: originAccount.
	
	destinationAccount := ReceptiveAccount new.
	Deposit register: 5 * peso on: destinationAccount.
	
	self should: [ Transfer amount: 0 from: originAccount to: destinationAccount ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: Transfer cannotTransferZeroErrorDescription equals: anError messageText.
			self assert: 10 * peso equals: originAccount balance.
		]
! !


!classDefinition: #Account category: 'ServiciosFinancierosParte2-11'!
Object subclass: #Account
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancierosParte2-11'!

!Account methodsFor: 'main protocol' stamp: 'HAW 5/25/2019 12:23:40'!
balance

	self subclassResponsibility ! !

!Account methodsFor: 'main protocol' stamp: 'HAW 5/25/2019 12:23:47'!
hasRegistered: aTransaction

	self subclassResponsibility ! !

!Account methodsFor: 'main protocol' stamp: 'HAW 5/25/2019 12:23:15'!
transactions

	self subclassResponsibility ! !


!Account methodsFor: 'composition' stamp: 'LL 7/8/2021 21:45:50'!
addedTo: aPortfolio

	self subclassResponsibility! !

!Account methodsFor: 'composition' stamp: 'LL 7/8/2021 21:46:48'!
isComposedBy: anAccount

	self subclassResponsibility! !


!Account methodsFor: 'private' stamp: 'DEC 6/14/2022 18:10:43'!
accept: aReportToAccept

	self subclassResponsibility ! !

!Account methodsFor: 'private' stamp: 'HAW 5/25/2019 12:23:27'!
addTransactionsTo: aCollectionOfTransactions

	self subclassResponsibility ! !


!classDefinition: #Portfolio category: 'ServiciosFinancierosParte2-11'!
Account subclass: #Portfolio
	instanceVariableNames: 'accounts parents'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancierosParte2-11'!

!Portfolio methodsFor: 'initialization' stamp: 'HAW 5/25/2019 12:03:18'!
initialize

	accounts := OrderedCollection new.
	parents := OrderedCollection new.! !


!Portfolio methodsFor: 'main protocol' stamp: 'HAW 5/25/2019 11:19:36'!
balance
	
	^accounts sum: [ :anAccount | anAccount balance ] ifEmpty: [ 0 ]! !

!Portfolio methodsFor: 'main protocol' stamp: 'HAW 5/25/2019 11:28:29'!
hasRegistered: aTransaction

	^accounts anySatisfy: [ :anAccount | anAccount hasRegistered: aTransaction ]! !

!Portfolio methodsFor: 'main protocol' stamp: 'HAW 5/25/2019 11:38:32'!
transactions
	
	| transactions |
	
	transactions := OrderedCollection new.
	accounts do: [ :anAccount | anAccount addTransactionsTo: transactions ].
	
	^transactions ! !


!Portfolio methodsFor: 'accounts management' stamp: 'HAW 5/25/2019 11:49:20'!
accountsIncludes: anAccount

	^accounts includes: anAccount ! !

!Portfolio methodsFor: 'accounts management' stamp: 'HAW 5/25/2019 12:05:04'!
accountsIsEmpty
	
	^accounts isEmpty ! !

!Portfolio methodsFor: 'accounts management' stamp: 'HAW 5/25/2019 11:49:06'!
accountsSize
	
	^accounts size! !

!Portfolio methodsFor: 'accounts management' stamp: 'HAW 5/25/2019 12:19:20'!
add: accountToAdd

	self assertCanAdd: accountToAdd.
		
	accounts add: accountToAdd.
	accountToAdd addedTo: self 
	! !


!Portfolio methodsFor: 'private' stamp: 'DEC 6/14/2022 17:10:23'!
accept: aReportToAccept

	self transactions do: [:aTransaction | aTransaction accept: aReportToAccept ]! !

!Portfolio methodsFor: 'private' stamp: 'HAW 5/25/2019 11:42:55'!
addTransactionsTo: aCollectionOfTransactions

	accounts do: [ :anAccount | anAccount addTransactionsTo: aCollectionOfTransactions ]! !


!Portfolio methodsFor: 'composition' stamp: 'HAW 5/25/2019 12:17:31'!
addRootParentsTo: rootParents

	parents 
		ifEmpty: [ rootParents add: self ] 
		ifNotEmpty: [ parents do: [ :aParent | aParent addRootParentsTo: rootParents ]]! !

!Portfolio methodsFor: 'composition' stamp: 'HAW 5/25/2019 12:02:59'!
addedTo: aPortfolio 
	
	parents add: aPortfolio ! !

!Portfolio methodsFor: 'composition' stamp: 'HAW 5/25/2019 12:20:56'!
anyRootParentIsComposedBy: accountToAdd

	^self rootParents anySatisfy: [ :aParent | aParent isComposedBy: accountToAdd]! !

!Portfolio methodsFor: 'composition' stamp: 'HAW 5/25/2019 12:20:36'!
assertCanAdd: accountToAdd

	(self anyRootParentIsComposedBy: accountToAdd) ifTrue: [ self signalCanNotAddAccount ].
! !

!Portfolio methodsFor: 'composition' stamp: 'HAW 5/29/2019 16:24:54'!
isComposedBy: anAccount

	^ self = anAccount or: [ accounts anySatisfy: [ :composedAccount | (composedAccount isComposedBy: anAccount) or: [ anAccount isComposedBy: composedAccount ]]]! !

!Portfolio methodsFor: 'composition' stamp: 'HAW 5/25/2019 12:17:31'!
rootParents
	
	| rootParents |
	
	rootParents := Set new.
	self addRootParentsTo: rootParents.
	
	^ rootParents! !

!Portfolio methodsFor: 'composition' stamp: 'HAW 5/25/2019 11:48:34'!
signalCanNotAddAccount
	
	self error: self class canNotAddAccountErrorMessage! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Portfolio class' category: 'ServiciosFinancierosParte2-11'!
Portfolio class
	instanceVariableNames: ''!

!Portfolio class methodsFor: 'as yet unclassified' stamp: 'HAW 5/25/2019 11:48:55'!
canNotAddAccountErrorMessage
	
	^'Can not add repeated account to a portfolio'! !

!Portfolio class methodsFor: 'as yet unclassified' stamp: 'HAW 5/25/2019 11:18:21'!
with: anAccount

	^self new 
		add: anAccount;
		yourself! !

!Portfolio class methodsFor: 'as yet unclassified' stamp: 'HAW 5/25/2019 11:23:59'!
with: anAccount with: anotherAccount

	^self new 
		add: anAccount;
		add: anotherAccount;
		yourself! !


!classDefinition: #ReceptiveAccount category: 'ServiciosFinancierosParte2-11'!
Account subclass: #ReceptiveAccount
	instanceVariableNames: 'transactions accountName'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancierosParte2-11'!

!ReceptiveAccount methodsFor: 'initialization' stamp: 'HernanWilkinson 7/13/2011 18:35'!
initialize

	super initialize.
	transactions := OrderedCollection new.! !

!ReceptiveAccount methodsFor: 'initialization' stamp: 'DEC 6/14/2022 16:30:27'!
initializeNamed: aNameForTheAccount 

	transactions := OrderedCollection new.
	accountName := aNameForTheAccount.! !


!ReceptiveAccount methodsFor: 'main protocol' stamp: 'HAW 5/25/2019 11:24:46'!
balance

	^transactions 
		inject: 0
		into: [ :currentBalance :transaction | transaction affectBalance: currentBalance ]! !

!ReceptiveAccount methodsFor: 'main protocol' stamp: 'NR 10/21/2019 18:55:56'!
hasRegistered: aTransaction

	^ transactions includes: aTransaction 
! !

!ReceptiveAccount methodsFor: 'main protocol' stamp: 'HernanWilkinson 7/13/2011 18:37'!
register: aTransaction

	transactions add: aTransaction 
! !

!ReceptiveAccount methodsFor: 'main protocol' stamp: 'HernanWilkinson 7/13/2011 18:37'!
transactions 

	^ transactions copy! !


!ReceptiveAccount methodsFor: 'private' stamp: 'DEC 6/14/2022 17:03:13'!
accept: aReportToAccept
	
	transactions do: [:aTransaction | aTransaction accept: aReportToAccept ].
	! !

!ReceptiveAccount methodsFor: 'private' stamp: 'HAW 5/25/2019 11:38:52'!
addTransactionsTo: aCollectionOfTransactions

	aCollectionOfTransactions addAll: transactions ! !


!ReceptiveAccount methodsFor: 'composition' stamp: 'HAW 5/25/2019 12:03:32'!
addedTo: aPortfolio 
	
	! !

!ReceptiveAccount methodsFor: 'composition' stamp: 'HAW 5/25/2019 11:54:51'!
isComposedBy: anAccount

	^self = anAccount ! !


!ReceptiveAccount methodsFor: 'error handling' stamp: 'decc 6/10/2022 19:45:00'!
error: aString 
	self shouldBeImplemented.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'ReceptiveAccount class' category: 'ServiciosFinancierosParte2-11'!
ReceptiveAccount class
	instanceVariableNames: ''!

!ReceptiveAccount class methodsFor: 'as yet unclassified' stamp: 'DEC 6/14/2022 16:29:31'!
named: aNameForTheAccount

	^self new initializeNamed: aNameForTheAccount 

	! !


!classDefinition: #AccountTransaction category: 'ServiciosFinancierosParte2-11'!
Object subclass: #AccountTransaction
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancierosParte2-11'!

!AccountTransaction methodsFor: 'value' stamp: 'HernanWilkinson 9/12/2011 12:25'!
value 

	self subclassResponsibility ! !


!AccountTransaction methodsFor: 'balance' stamp: 'HAW 5/25/2019 11:25:39'!
affectBalance: aBalance

	self subclassResponsibility ! !


!AccountTransaction methodsFor: 'private' stamp: 'DEC 6/14/2022 16:08:24'!
accept: aReportToAccept

	self subclassResponsibility ! !


!classDefinition: #Deposit category: 'ServiciosFinancierosParte2-11'!
AccountTransaction subclass: #Deposit
	instanceVariableNames: 'value'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancierosParte2-11'!

!Deposit methodsFor: 'initialization' stamp: 'HernanWilkinson 7/13/2011 18:45'!
initializeFor: aValue

	value := aValue ! !


!Deposit methodsFor: 'value' stamp: 'HernanWilkinson 7/13/2011 18:38'!
value

	^ value! !


!Deposit methodsFor: 'balance' stamp: 'HAW 5/25/2019 11:25:02'!
affectBalance: aBalance

	^aBalance + value ! !


!Deposit methodsFor: 'as yet unclassified' stamp: 'DEC 6/14/2022 17:13:58'!
accept: aReportToAccept

	aReportToAccept visitDeposit: self! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Deposit class' category: 'ServiciosFinancierosParte2-11'!
Deposit class
	instanceVariableNames: ''!

!Deposit class methodsFor: 'instance creation' stamp: 'HernanWilkinson 7/13/2011 18:38'!
for: aValue

	^ self new initializeFor: aValue ! !


!Deposit class methodsFor: 'as yet unclassified' stamp: 'LL 7/8/2021 21:45:00'!
register: aValue on: account

	| transaction |
	
	transaction := self for: aValue.
	account register: transaction.
		
	^ transaction! !


!classDefinition: #TransferLeg category: 'ServiciosFinancierosParte2-11'!
AccountTransaction subclass: #TransferLeg
	instanceVariableNames: 'transfer'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancierosParte2-11'!

!TransferLeg methodsFor: 'value' stamp: 'LL 9/20/2020 22:27:32'!
value

	^transfer value! !


!TransferLeg methodsFor: 'initialization' stamp: 'LL 9/20/2020 22:28:14'!
initializeWith: aTransfer

	transfer := aTransfer! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'TransferLeg class' category: 'ServiciosFinancierosParte2-11'!
TransferLeg class
	instanceVariableNames: ''!

!TransferLeg class methodsFor: 'as yet unclassified' stamp: 'LL 9/20/2020 22:45:01'!
of: aTransfer on: anAccount

	| transaction |
	
	transaction := self new initializeWith: 	aTransfer.
	anAccount register: transaction.	
	
	^transaction! !


!classDefinition: #TransferDepositLeg category: 'ServiciosFinancierosParte2-11'!
TransferLeg subclass: #TransferDepositLeg
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancierosParte2-11'!

!TransferDepositLeg methodsFor: 'accessing' stamp: 'LL 9/20/2020 22:26:10'!
withdrawLeg

	^transfer withdrawLeg! !


!TransferDepositLeg methodsFor: 'balance' stamp: 'LL 9/20/2020 22:27:49'!
affectBalance: aBalance

	^aBalance + self value! !


!TransferDepositLeg methodsFor: 'as yet unclassified' stamp: 'DEC 6/14/2022 17:14:04'!
accept: aReportToAccept

	aReportToAccept visitTransferDepositLeg: self! !


!classDefinition: #TransferWithdrawLeg category: 'ServiciosFinancierosParte2-11'!
TransferLeg subclass: #TransferWithdrawLeg
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancierosParte2-11'!

!TransferWithdrawLeg methodsFor: 'accessing' stamp: 'LL 9/20/2020 22:25:47'!
depositLeg

	^transfer depositLeg! !


!TransferWithdrawLeg methodsFor: 'balance' stamp: 'LL 9/20/2020 22:27:55'!
affectBalance: aBalance

	^aBalance - self value! !


!TransferWithdrawLeg methodsFor: 'as yet unclassified' stamp: 'DEC 6/14/2022 17:14:08'!
accept: aReportToAccept

	aReportToAccept visitTransferWithdrawLeg: self! !


!classDefinition: #Withdraw category: 'ServiciosFinancierosParte2-11'!
AccountTransaction subclass: #Withdraw
	instanceVariableNames: 'value'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancierosParte2-11'!

!Withdraw methodsFor: 'initialization' stamp: 'HernanWilkinson 7/13/2011 18:46'!
initializeFor: aValue

	value := aValue ! !


!Withdraw methodsFor: 'value' stamp: 'HernanWilkinson 7/13/2011 18:33'!
value

	^ value! !


!Withdraw methodsFor: 'balance' stamp: 'HAW 5/25/2019 11:25:15'!
affectBalance: aBalance

	^aBalance - value! !


!Withdraw methodsFor: 'as yet unclassified' stamp: 'DEC 6/14/2022 15:33:45'!
accept: aReportToAccept

	^aReportToAccept visitWithdraw: self! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Withdraw class' category: 'ServiciosFinancierosParte2-11'!
Withdraw class
	instanceVariableNames: ''!

!Withdraw class methodsFor: 'instance creation' stamp: 'HernanWilkinson 7/13/2011 18:33'!
for: aValue

	^ self new initializeFor: aValue ! !


!Withdraw class methodsFor: 'as yet unclassified' stamp: 'LL 7/8/2021 21:45:05'!
register: aValue on: account

	| transaction |
	
	transaction := self for: aValue.
	account register: transaction.
		
	^ transaction! !


!classDefinition: #Report category: 'ServiciosFinancierosParte2-11'!
Object subclass: #Report
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancierosParte2-11'!


!classDefinition: #AccountSummary category: 'ServiciosFinancierosParte2-11'!
Report subclass: #AccountSummary
	instanceVariableNames: 'account reportLines test'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancierosParte2-11'!

!AccountSummary methodsFor: 'inicialization' stamp: 'DEC 6/14/2022 17:01:06'!
initializeFor: anAccount

	reportLines := OrderedCollection new.
	account := anAccount.

	! !


!AccountSummary methodsFor: 'nueva manera' stamp: 'DEC 6/14/2022 15:45:23'!
initialize

	reportLines := OrderedCollection new.

	! !

!AccountSummary methodsFor: 'nueva manera' stamp: 'DEC 6/14/2022 19:18:00'!
print
	
	account accept: self.
	reportLines add: ( 'Balance = ', account balance asString ).
	test := account balance.
	^reportLines copy
	
	! !


!AccountSummary methodsFor: 'visits' stamp: 'DEC 6/14/2022 15:41:09'!
visit: anAccountToVisit

	anAccountToVisit transactions do: [:aTransaction |  aTransaction accept: self ].
	reportLines add: ( 'Balance = ', anAccountToVisit balance asString ).
	^reportLines 

	! !

!AccountSummary methodsFor: 'visits' stamp: 'DEC 6/14/2022 15:35:39'!
visitDeposit: aDepositToVisit
	
	"COMO SE SOLUCIONA EL ROMPER EL ENCAPSULAMIENTO"
	reportLines add: ( 'Depósito por ', aDepositToVisit value asString)	! !

!AccountSummary methodsFor: 'visits' stamp: 'DEC 6/14/2022 15:36:47'!
visitTransferDepositLeg: aTransferDepositLegToVisit
	
	"COMO SE SOLUCIONA EL ROMPER EL ENCAPSULAMIENTO"
	^reportLines add: ( 'Entrada por transferencia de ', aTransferDepositLegToVisit value asString )	! !

!AccountSummary methodsFor: 'visits' stamp: 'DEC 6/14/2022 15:36:34'!
visitTransferWithdrawLeg: aTransferWithdrawLegToVisit
	
	"COMO SE SOLUCIONA EL ROMPER EL ENCAPSULAMIENTO"
	^reportLines add: ( 'Salida por transferencia de ', aTransferWithdrawLegToVisit value asString )	! !

!AccountSummary methodsFor: 'visits' stamp: 'DEC 6/14/2022 15:37:02'!
visitWithdraw: aWithdrawToVisit
	
	"COMO SE SOLUCIONA EL ROMPER EL ENCAPSULAMIENTO"
	^reportLines add: ( 'Extracción por ', aWithdrawToVisit value asString )	! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'AccountSummary class' category: 'ServiciosFinancierosParte2-11'!
AccountSummary class
	instanceVariableNames: ''!

!AccountSummary class methodsFor: 'as yet unclassified' stamp: 'DEC 6/14/2022 17:00:36'!
for: anAccount

	^self new initializeFor: anAccount! !


!classDefinition: #PortfolioTreePrinter category: 'ServiciosFinancierosParte2-11'!
Report subclass: #PortfolioTreePrinter
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancierosParte2-11'!

!PortfolioTreePrinter methodsFor: 'as yet unclassified' stamp: 'DEC 6/14/2022 16:28:00'!
print

	^''! !

!PortfolioTreePrinter methodsFor: 'as yet unclassified' stamp: 'DEC 6/14/2022 16:51:08'!
visit: anAccountToVisit

	^anAccountToVisit name! !


!classDefinition: #TransferNet category: 'ServiciosFinancierosParte2-11'!
Report subclass: #TransferNet
	instanceVariableNames: 'account transferNetBalance'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancierosParte2-11'!

!TransferNet methodsFor: 'nueva manera' stamp: 'DEC 6/14/2022 15:55:28'!
initialize

	transferNetBalance := 0 * peso.! !

!TransferNet methodsFor: 'nueva manera' stamp: 'DEC 6/14/2022 17:17:08'!
initializeFor: anAccount 

	transferNetBalance := 0 * peso.
	account := anAccount.! !

!TransferNet methodsFor: 'nueva manera' stamp: 'DEC 6/14/2022 17:18:47'!
print

"	account transactions do: [:aTransaction | aTransaction affectTransferNet: self ].
	^transferNetBalance "
	account accept: self.
	^transferNetBalance ! !

!TransferNet methodsFor: 'nueva manera' stamp: 'DEC 6/14/2022 15:59:04'!
visit: anAccountToVisit

	anAccountToVisit transactions do: [:aTransaction | aTransaction accept: self ]! !

!TransferNet methodsFor: 'nueva manera' stamp: 'DEC 6/14/2022 16:01:52'!
visitDeposit: aDepositToVisit


	! !

!TransferNet methodsFor: 'nueva manera' stamp: 'DEC 6/14/2022 16:01:09'!
visitTransferDepositLeg: aTransferDepositLegToVisit

	transferNetBalance := transferNetBalance + aTransferDepositLegToVisit value

	! !

!TransferNet methodsFor: 'nueva manera' stamp: 'DEC 6/14/2022 16:00:45'!
visitTransferWithdrawLeg: aTransferWithdrawLegToVisit

	transferNetBalance := transferNetBalance - aTransferWithdrawLegToVisit value

	! !

!TransferNet methodsFor: 'nueva manera' stamp: 'DEC 6/14/2022 15:59:57'!
visitWithdraw: aWithdrawToVisit

	! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'TransferNet class' category: 'ServiciosFinancierosParte2-11'!
TransferNet class
	instanceVariableNames: ''!

!TransferNet class methodsFor: 'as yet unclassified' stamp: 'DEC 6/14/2022 17:16:16'!
for: anAccount

	^self new initializeFor: anAccount ! !


!classDefinition: #Transfer category: 'ServiciosFinancierosParte2-11'!
Object subclass: #Transfer
	instanceVariableNames: 'value withdrawLeg depositLeg'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancierosParte2-11'!

!Transfer methodsFor: 'value' stamp: 'LL 9/20/2020 21:13:00'!
value

	^value! !


!Transfer methodsFor: 'accessing' stamp: 'LL 9/20/2020 22:39:46'!
depositLeg

	^depositLeg! !

!Transfer methodsFor: 'accessing' stamp: 'LL 9/20/2020 21:25:56'!
withdrawLeg
	
	^withdrawLeg! !


!Transfer methodsFor: 'initialization' stamp: 'LL 9/20/2020 21:25:21'!
initializeWith: aValue withdrawLeg: aWithdraw depositLeg: aDeposit

	value := aValue.
	withdrawLeg := aWithdraw.
	depositLeg := aDeposit! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Transfer class' category: 'ServiciosFinancierosParte2-11'!
Transfer class
	instanceVariableNames: ''!

!Transfer class methodsFor: 'errors' stamp: 'LL 9/20/2020 22:57:30'!
cannotTransferToOriginErrorDescription
	
	^'Transfer destionation cannot be the origin account'! !

!Transfer class methodsFor: 'errors' stamp: 'LL 9/20/2020 23:00:53'!
cannotTransferZeroErrorDescription

	^'Transfer amount should be positive'! !

!Transfer class methodsFor: 'errors' stamp: 'LL 9/20/2020 22:56:35'!
signalCannotTransferToOrigin
	
	self error: self cannotTransferToOriginErrorDescription! !

!Transfer class methodsFor: 'errors' stamp: 'LL 9/20/2020 23:06:17'!
signalCannotTransferZero

	self error: self cannotTransferZeroErrorDescription! !


!Transfer class methodsFor: 'assertions' stamp: 'LL 9/20/2020 23:05:22'!
assert: anAmountOfMoney canBeTransferedTo: destinationAccount from: originAccount

	self assertCanTransferTo: destinationAccount from: originAccount.
	self assertCanTransfer: anAmountOfMoney! !

!Transfer class methodsFor: 'assertions' stamp: 'LL 9/20/2020 23:11:50'!
assertCanTransfer: anAmountOfMoney

	^ anAmountOfMoney isZero ifTrue: [ self signalCannotTransferZero ]! !

!Transfer class methodsFor: 'assertions' stamp: 'LL 9/20/2020 23:04:58'!
assertCanTransferTo: destinationAccount from: originAccount

	^ originAccount = destinationAccount ifTrue: [ self signalCannotTransferToOrigin ]! !


!Transfer class methodsFor: 'instance creation' stamp: 'LL 9/20/2020 23:11:34'!
amount: anAmountOfMoney from: originAccount to: destinationAccount 
	
	| transfer depositLeg withdrawLeg |
	
	self assert: anAmountOfMoney canBeTransferedTo: destinationAccount from: originAccount.
	
	transfer := self new.
	
	withdrawLeg := TransferWithdrawLeg of: transfer on: originAccount.
	depositLeg := TransferDepositLeg of: transfer on: destinationAccount.
	
	^transfer initializeWith: anAmountOfMoney withdrawLeg: withdrawLeg depositLeg: depositLeg
	
	
	! !
