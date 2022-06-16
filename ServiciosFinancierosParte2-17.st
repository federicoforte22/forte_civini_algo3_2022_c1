!classDefinition: #AccountSummaryTest category: 'ServiciosFinancierosParte2-17'!
TestCase subclass: #AccountSummaryTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancierosParte2-17'!

!AccountSummaryTest methodsFor: 'tests' stamp: 'DEC 6/16/2022 11:09:04'!
test01TheSummaryOfAnAccountWithoutAnyTransactionsShowsJustTheBalanceThatIs0

	| receptiveAccount accountSummary|
	
	receptiveAccount := ReceptiveAccount new.
	"accountSummary := AccountSummary for: receptiveAccount."
	
	self assert: ( OrderedCollection with: 'Balance = 0 * pesos' ) equals: ( AccountSummary for: receptiveAccount ).! !

!AccountSummaryTest methodsFor: 'tests' stamp: 'DEC 6/16/2022 11:09:27'!
test02TheSummaryOfAnAccountWithOnlyADepositShowsTheLineOfTheDepositAndTheOneOfTheBalance

	| receptiveAccount accountSummary1 |
	
	receptiveAccount := ReceptiveAccount new.
	"accountSummary1 := AccountSummary for: receptiveAccount."
	
	Deposit register: 50 * peso on: receptiveAccount.
	
	self assert: ( OrderedCollection with: 'Depósito por 50 * pesos' with: 'Balance = 50 * pesos' ) equals: ( AccountSummary for: receptiveAccount ).! !

!AccountSummaryTest methodsFor: 'tests' stamp: 'DEC 6/16/2022 11:09:46'!
test03TheSummaryOfAnAccountWithOnlyAWithdrawShowsTheLineOfTheWithdrawAndTheOneOfTheBalance

	| receptiveAccount accountSummary1 |
	
	receptiveAccount := ReceptiveAccount new.
	"accountSummary1 := AccountSummary for: receptiveAccount."
	
	Withdraw register: 30 * peso on: receptiveAccount.
	
	self assert: ( OrderedCollection with: 'Extracción por 30 * pesos' with: 'Balance = -30 * pesos' ) print equals: ( AccountSummary for: receptiveAccount ).! !

!AccountSummaryTest methodsFor: 'tests' stamp: 'DEC 6/16/2022 11:13:34'!
test04TheSummaryOfAnAccountWithOnlyATransferShowsTheLineOfTheTransferAndTheOneOfTheBalance

	| transferSenderAccount transferRecipientAccount accountSummaryForSender accountSummaryForRecipient |
	
	transferSenderAccount := ReceptiveAccount new.
	transferRecipientAccount := ReceptiveAccount new.
	"accountSummaryForSender := AccountSummary for: transferSenderAccount.
	accountSummaryForRecipient := AccountSummary for: transferRecipientAccount."
	
	Transfer amount: 20 * peso from: transferSenderAccount to: transferRecipientAccount.
	
	self assert: ( OrderedCollection with: 'Entrada por transferencia de 20 * pesos' with: 'Balance = 20 * pesos' ) equals: ( AccountSummary for: transferRecipientAccount ).
	self assert: ( OrderedCollection with: 'Salida por transferencia de 20 * pesos' with: 'Balance = -20 * pesos' ) equals: ( AccountSummary for: transferSenderAccount ).! !

!AccountSummaryTest methodsFor: 'tests' stamp: 'DEC 6/16/2022 11:10:55'!
test05TheSummaryOfAPortfolioWithoutAnyTransactionsShowsJustTheBalanceThatIs0

	| portfolio accountSummary |
	
	portfolio := Portfolio new.
	"accountSummary := AccountSummary for: portfolio."
	
	self assert: ( AccountSummary for: portfolio ) equals: ( OrderedCollection with: 'Balance = 0' ).
! !

!AccountSummaryTest methodsFor: 'tests' stamp: 'DEC 6/16/2022 11:11:19'!
test06TheSummaryOfAPortfolioWithOnlyADepositShowsTheLineOfTheDepositAndTheOneOfTheBalance

	| portfolio receptiveAccount accountSummary |
	
	portfolio := Portfolio new.
	receptiveAccount := ReceptiveAccount new.
	"accountSummary := AccountSummary for: portfolio."
	
	Deposit register: 50 * peso on: receptiveAccount.
	portfolio add: receptiveAccount.

	self assert: ( AccountSummary for: portfolio ) equals: ( OrderedCollection with: 'Depósito por 50 * pesos' with: 'Balance = 50 * pesos' ).
! !

!AccountSummaryTest methodsFor: 'tests' stamp: 'DEC 6/16/2022 11:11:42'!
test07TheSummaryOfAPortfolioWithEveryTransactionShowsTheLineOfEveryTransaactionAndTheOneOfTheBalance

	| portfolio transferSenderAccount transferRecipientAccount accountSummary |
	
	portfolio := Portfolio new.
	transferSenderAccount := ReceptiveAccount new.
	transferRecipientAccount := ReceptiveAccount new.
	"accountSummary := AccountSummary for: portfolio."
	
	Deposit register: 50 * peso on: transferSenderAccount.
	Withdraw register: 30 * peso on: transferSenderAccount.
	Transfer amount: 20 * peso from: transferSenderAccount to: transferRecipientAccount.
	portfolio add: transferSenderAccount.
	portfolio add: transferRecipientAccount.
	
	self assert: ( AccountSummary for: portfolio ) equals: ( OrderedCollection with: 'Depósito por 50 * pesos' with: 'Extracción por 30 * pesos' with: 'Salida por transferencia de 20 * pesos' with: 'Entrada por transferencia de 20 * pesos' with: 'Balance = 20 * pesos' ).
! !


!classDefinition: #PortfolioTest category: 'ServiciosFinancierosParte2-17'!
TestCase subclass: #PortfolioTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancierosParte2-17'!

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


!classDefinition: #PortfolioTreePrinterTest category: 'ServiciosFinancierosParte2-17'!
TestCase subclass: #PortfolioTreePrinterTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancierosParte2-17'!

!PortfolioTreePrinterTest methodsFor: 'tests' stamp: 'DEC 6/14/2022 20:52:36'!
test01

	| fedesPortfolio portfolioTreePrinter |
	
	fedesPortfolio := Portfolio named: 'Portfolio de Fede'.
	portfolioTreePrinter := PortfolioTreePrinter for: fedesPortfolio.
	
	self assert: 'Portfolio de Fede' equals: portfolioTreePrinter print.
	
! !

!PortfolioTreePrinterTest methodsFor: 'tests' stamp: 'DEC 6/16/2022 13:30:08'!
test02

	| fedesPortfolio fedesAccount portfolioTreePrinter |
	
	fedesAccount := ReceptiveAccount named: 'Cuenta de Fede'.
	fedesPortfolio := Portfolio named: 'Portfolio de Fede' with: fedesAccount .
	portfolioTreePrinter := PortfolioTreePrinter for: fedesPortfolio.
	
	self assert: ( 'Portfolio de Fede\', String tab, 'Cuenta de Fede' ) withNewLines equals: portfolioTreePrinter print.
	
! !

!PortfolioTreePrinterTest methodsFor: 'tests' stamp: 'DEC 6/16/2022 13:29:31'!
test03

	| fedesAccount portfolioTreePrinter diegosAccount gruposPortfolio |
	
	fedesAccount := ReceptiveAccount named: 'Cuenta de Fede'.
	diegosAccount := ReceptiveAccount named: 'Cuenta de Diego'.
	gruposPortfolio := Portfolio named: 'Portfolio del Grupo' with: fedesAccount with: diegosAccount.
	portfolioTreePrinter := PortfolioTreePrinter for: gruposPortfolio.
	
	self assert: ( 'Portfolio del Grupo\', String tab, 'Cuenta de Fede\', String tab, 'Cuenta de Diego' ) withNewLines equals: portfolioTreePrinter print.
	
! !

!PortfolioTreePrinterTest methodsFor: 'tests' stamp: 'DEC 6/16/2022 13:34:15'!
test04

		| fedesAccount portfolioTreePrinter diegosAccount fedesPortfolio diegosPortfolio |
	
	fedesAccount := ReceptiveAccount named: 'Cuenta de Fede'.
	diegosAccount := ReceptiveAccount named: 'Cuenta de Diego'.
	diegosPortfolio := Portfolio named: 'Portfolio de Diego' with: diegosAccount.
	fedesPortfolio := Portfolio named: 'Portfolio de Fede' with: fedesAccount with:diegosPortfolio. 
	portfolioTreePrinter := PortfolioTreePrinter for: fedesPortfolio.
	
	self assert: ( 'Portfolio de Fede\', String tab, 'Cuenta de Fede\', String tab, 'Portfolio de Diego\', String tab, String tab, 'Cuenta de Diego' ) withNewLines equals: portfolioTreePrinter print.
	
! !

!PortfolioTreePrinterTest methodsFor: 'tests' stamp: 'DEC 6/16/2022 14:11:49'!
test05

		| fedesAccount portfolioTreePrinter diegosAccount fedesPortfolio diegosPortfolio palitosAccount palitosPortfolio |
	
	fedesAccount := ReceptiveAccount named: 'Cuenta de Fede'.
	diegosAccount := ReceptiveAccount named: 'Cuenta de Diego'.
	palitosAccount := ReceptiveAccount named: 'Cuenta de Palito'.
	
	palitosPortfolio := Portfolio named: 'Portfolio de Palito' with: palitosAccount.
	diegosPortfolio := Portfolio named: 'Portfolio de Diego' with: diegosAccount with: palitosPortfolio.
	fedesPortfolio := Portfolio named: 'Portfolio de Fede' with: fedesAccount with: diegosPortfolio.
	portfolioTreePrinter := PortfolioTreePrinter for: fedesPortfolio.
	
	self assert: ( 'Portfolio de Fede\', String tab, 'Cuenta de Fede\', String tab, 'Portfolio de Diego\', String tab, String tab, 'Cuenta de Diego\', String tab, String tab, 'Portfolio de Palito\', String tab, String tab, String tab, 'Cuenta de Palito' ) withNewLines equals: portfolioTreePrinter print.
	
! !

!PortfolioTreePrinterTest methodsFor: 'tests' stamp: 'DEC 6/16/2022 16:08:54'!
test06

	| fedesAccount portfolioTreePrinter diegosAccount fedesPortfolio diegosPortfolio palitosAccount |
	
	fedesAccount := ReceptiveAccount named: 'Cuenta de Fede'.
	diegosAccount := ReceptiveAccount named: 'Cuenta de Diego'.
	palitosAccount := ReceptiveAccount named: 'Cuenta de Palito'.
	
	diegosPortfolio := Portfolio named: 'Portfolio de Diego'.
	fedesPortfolio := Portfolio named: 'Portfolio de Fede' with: fedesAccount with: diegosPortfolio.
	fedesPortfolio add: palitosAccount.
	portfolioTreePrinter := PortfolioTreePrinter for: fedesPortfolio.
	
	self assert: ( 'Portfolio de Fede\', String tab, 'Cuenta de Fede\', String tab, 'Portfolio de Diego\', String tab, String tab, 'Cuenta de Diego\', String tab, 'Cuenta de Palito') withNewLines equals: portfolioTreePrinter print.
	
! !

!PortfolioTreePrinterTest methodsFor: 'tests' stamp: 'DEC 6/16/2022 16:09:00'!
test07

	| fedesAccount portfolioTreePrinter diegosAccount fedesPortfolio diegosPortfolio palitosAccount |
	
	fedesAccount := ReceptiveAccount named: 'Cuenta de Fede'.
	diegosAccount := ReceptiveAccount named: 'Cuenta de Diego'.
	palitosAccount := ReceptiveAccount named: 'Cuenta de Palito'.
	
	diegosPortfolio := Portfolio named: 'Portfolio de Diego'.
	fedesPortfolio := Portfolio named: 'Portfolio de Fede' with: fedesAccount with: diegosPortfolio.
	fedesPortfolio add: palitosAccount.
	portfolioTreePrinter := PortfolioTreePrinter for: fedesPortfolio.
	
	self assert: ( 'Portfolio de Fede\', String tab, 'Cuenta de Fede\', String tab, 'Portfolio de Diego\', String tab, String tab, 'Cuenta de Diego\', String tab, 'Cuenta de Palito') withNewLines equals: portfolioTreePrinter print.
	
! !


!classDefinition: #ReceptiveAccountTest category: 'ServiciosFinancierosParte2-17'!
TestCase subclass: #ReceptiveAccountTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancierosParte2-17'!

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


!classDefinition: #TransferNetTest category: 'ServiciosFinancierosParte2-17'!
TestCase subclass: #TransferNetTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancierosParte2-17'!

!TransferNetTest methodsFor: 'tests' stamp: 'DEC 6/16/2022 11:06:44'!
test01TheTransferNetOfAnAccountThatDidntParticipateOnATransferIs0Pesos

	| receptiveAccount transferNet |
	
	receptiveAccount := ReceptiveAccount new.
	"transferNet := TransferNet for: receptiveAccount."
	
	self assert: 0 * peso equals: ( TransferNet for: receptiveAccount ).! !

!TransferNetTest methodsFor: 'tests' stamp: 'DEC 6/16/2022 11:07:23'!
test02TheTransferNetOfEachAccountParticipatingOnATransferAreEqualInModuleButOppositeSign

	| transferSenderAccount transferRecipientAccount transferNet1 transferNet2 |
	
	transferSenderAccount := ReceptiveAccount new.
	transferRecipientAccount := ReceptiveAccount new.
	"transferNet1 := TransferNet for: transferSenderAccount .
	transferNet2 := TransferNet for: transferRecipientAccount ."
	
	Transfer amount: 20 * peso from: transferSenderAccount to: transferRecipientAccount.
	
	self assert: -20 * peso equals: ( TransferNet for: transferSenderAccount ).
	self assert: 20 * peso equals: ( TransferNet for: transferRecipientAccount ).! !

!TransferNetTest methodsFor: 'tests' stamp: 'DEC 6/16/2022 11:07:46'!
test03TheTransferNetOfAPortfolioThatDidntParticipateOnATransferIs0Pesos

	| portfolio transferNet |
	
	portfolio := Portfolio new.
	"transferNet := TransferNet for: portfolio."
	
	self assert: 0 * peso equals: ( TransferNet for: portfolio ).! !

!TransferNetTest methodsFor: 'tests' stamp: 'DEC 6/16/2022 11:08:11'!
test04TheTransferNetOfAPortfolioThatIncludesATransferSenderAccountIsEqualToTheNegativeValueOfTheTransfer

	| portfolio transferSenderAccount transferRecipientAccount transferNet |
	
	portfolio := Portfolio new.
	transferSenderAccount := ReceptiveAccount new.
	transferRecipientAccount := ReceptiveAccount new.
	"transferNet := TransferNet for: portfolio."
	
	Transfer amount: 40 * peso from: transferSenderAccount to: transferRecipientAccount.
	portfolio add: transferSenderAccount.
			
	self assert: -40 * peso equals: ( TransferNet for: portfolio ).! !


!classDefinition: #TransferTest category: 'ServiciosFinancierosParte2-17'!
TestCase subclass: #TransferTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancierosParte2-17'!

!TransferTest methodsFor: 'tests' stamp: 'LL 9/20/2020 21:07:03'!
test01ATransferDecreasesBalanceFromOriginAccountAndIncreasesItForDestinationAccount

	| destinationAccount originAccount |
	
	originAccount := ReceptiveAccount new.
	Deposit register: 10 * peso on: originAccount.
	
	destinationAccount := ReceptiveAccount new.
	Deposit register: 10 * peso on: destinationAccount.
	
	Transfer amount: 2 * peso from: originAccount to: destinationAccount.
	
	self assert: 8 * peso equals: originAccount balance.
	self assert: 12 * peso equals: destinationAccount balance.! !

!TransferTest methodsFor: 'tests' stamp: 'LL 9/20/2020 21:12:28'!
test02ATransferKnowsItsValue

	| destinationAccount originAccount transfer |
	
	originAccount := ReceptiveAccount new.
	Deposit register: 10 * peso on: originAccount.
	
	destinationAccount := ReceptiveAccount new.
	Deposit register: 10 * peso on: destinationAccount.
	
	transfer := Transfer amount: 2 * peso from: originAccount to: destinationAccount.
	
	self assert: 2 * peso equals: transfer value.! !

!TransferTest methodsFor: 'tests' stamp: 'LL 9/20/2020 23:01:44'!
test03DepositLegKnowsItsWithdrawCounterpart

	| destinationAccount originAccount transfer |
	
	originAccount := ReceptiveAccount new.
	Deposit register: 10 * peso on: originAccount.
	
	destinationAccount := ReceptiveAccount new.
	Deposit register: 10 * peso on: destinationAccount.
	
	transfer := Transfer amount: 2 * peso from: originAccount to: destinationAccount.
	
	self assert: transfer withdrawLeg equals: transfer depositLeg withdrawLeg! !

!TransferTest methodsFor: 'tests' stamp: 'LL 9/20/2020 23:01:51'!
test04WithdrawLegKnowsItsDepositCounterpart

	| destinationAccount originAccount transfer |
	
	originAccount := ReceptiveAccount new.
	Deposit register: 10 * peso on: originAccount.
	
	destinationAccount := ReceptiveAccount new.
	Deposit register: 10 * peso on: destinationAccount.
	
	transfer := Transfer amount: 2 * peso from: originAccount to: destinationAccount.
	
	self assert: transfer depositLeg equals: transfer withdrawLeg depositLeg! !

!TransferTest methodsFor: 'tests' stamp: 'LL 9/20/2020 23:02:36'!
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

!TransferTest methodsFor: 'tests' stamp: 'LL 9/20/2020 23:02:44'!
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


!classDefinition: #Account category: 'ServiciosFinancierosParte2-17'!
Object subclass: #Account
	instanceVariableNames: 'accountName'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancierosParte2-17'!

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


!Account methodsFor: 'private' stamp: 'DEC 6/16/2022 11:54:30'!
acceptTransactionReport: aReportToAccept

	self transactions do: [:aTransaction | aTransaction acceptTransactionReport: aReportToAccept ]! !

!Account methodsFor: 'private' stamp: 'HAW 5/25/2019 12:23:27'!
addTransactionsTo: aCollectionOfTransactions

	self subclassResponsibility ! !

!Account methodsFor: 'private' stamp: 'DEC 6/14/2022 20:49:53'!
name

	^accountName ! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Account class' category: 'ServiciosFinancierosParte2-17'!
Account class
	instanceVariableNames: ''!

!Account class methodsFor: 'instance creation' stamp: 'DEC 6/16/2022 15:44:11'!
named: aNameForTheAccount

	^self new initializeNamed: aNameForTheAccount ! !


!classDefinition: #Portfolio category: 'ServiciosFinancierosParte2-17'!
Account subclass: #Portfolio
	instanceVariableNames: 'accounts parents'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancierosParte2-17'!

!Portfolio methodsFor: 'initialization' stamp: 'HAW 5/25/2019 12:03:18'!
initialize

	accounts := OrderedCollection new.
	parents := OrderedCollection new.! !

!Portfolio methodsFor: 'initialization' stamp: 'DEC 6/14/2022 20:43:53'!
initializeNamed: aNameForTheAccount 

	accountName := aNameForTheAccount.
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


!Portfolio methodsFor: 'private' stamp: 'DEC 6/16/2022 16:07:57'!
acceptAccountReport: aReportToAccept
	
	aReportToAccept reportOfAPortfolio: self.
	accounts do: [:anAccount | anAccount acceptAccountReport: aReportToAccept ].
	aReportToAccept endOfPortfolio.! !

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

!classDefinition: 'Portfolio class' category: 'ServiciosFinancierosParte2-17'!
Portfolio class
	instanceVariableNames: ''!

!Portfolio class methodsFor: 'error description' stamp: 'HAW 5/25/2019 11:48:55'!
canNotAddAccountErrorMessage
	
	^'Can not add repeated account to a portfolio'! !


!Portfolio class methodsFor: 'instance creation' stamp: 'DEC 6/15/2022 12:42:09'!
named: aName with: anAccount

	| portfolio |	
	
	portfolio := self new initializeNamed: aName.
	portfolio add: anAccount.
	^portfolio ! !

!Portfolio class methodsFor: 'instance creation' stamp: 'DEC 6/15/2022 13:01:44'!
named: aName with: anAccount with: anotherAccount

	| portfolio |	
	
	portfolio := self new initializeNamed: aName.
	portfolio add: anAccount.
	portfolio add: anotherAccount.
	^portfolio ! !

!Portfolio class methodsFor: 'instance creation' stamp: 'HAW 5/25/2019 11:18:21'!
with: anAccount

	^self new 
		add: anAccount;
		yourself! !

!Portfolio class methodsFor: 'instance creation' stamp: 'HAW 5/25/2019 11:23:59'!
with: anAccount with: anotherAccount

	^self new 
		add: anAccount;
		add: anotherAccount;
		yourself! !


!classDefinition: #ReceptiveAccount category: 'ServiciosFinancierosParte2-17'!
Account subclass: #ReceptiveAccount
	instanceVariableNames: 'transactions'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancierosParte2-17'!

!ReceptiveAccount methodsFor: 'initialization' stamp: 'HernanWilkinson 7/13/2011 18:35'!
initialize

	super initialize.
	transactions := OrderedCollection new.! !

!ReceptiveAccount methodsFor: 'initialization' stamp: 'DEC 6/14/2022 16:30:27'!
initializeNamed: aNameForTheAccount 

	transactions := OrderedCollection new.
	accountName := aNameForTheAccount.! !


!ReceptiveAccount methodsFor: 'main protocol' stamp: 'DEC 6/14/2022 19:33:12'!
balance

	^transactions 
		inject: 0 * peso
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


!ReceptiveAccount methodsFor: 'private' stamp: 'DEC 6/16/2022 10:46:33'!
accept: aReportAccept

	aReportAccept reportOfReceptiveAccount: self! !

!ReceptiveAccount methodsFor: 'private' stamp: 'DEC 6/15/2022 12:54:31'!
acceptAccountReport: aReportToAccept

	aReportToAccept reportOfAReceptiveAccount: self.! !

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


!classDefinition: #AccountTransaction category: 'ServiciosFinancierosParte2-17'!
Object subclass: #AccountTransaction
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancierosParte2-17'!

!AccountTransaction methodsFor: 'value' stamp: 'HernanWilkinson 9/12/2011 12:25'!
value 

	self subclassResponsibility ! !


!AccountTransaction methodsFor: 'balance' stamp: 'HAW 5/25/2019 11:25:39'!
affectBalance: aBalance

	self subclassResponsibility ! !


!AccountTransaction methodsFor: 'private' stamp: 'DEC 6/15/2022 12:44:22'!
acceptTransactionReport: aReportToAccept

	self subclassResponsibility ! !


!classDefinition: #Deposit category: 'ServiciosFinancierosParte2-17'!
AccountTransaction subclass: #Deposit
	instanceVariableNames: 'value'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancierosParte2-17'!

!Deposit methodsFor: 'initialization' stamp: 'HernanWilkinson 7/13/2011 18:45'!
initializeFor: aValue

	value := aValue ! !


!Deposit methodsFor: 'value' stamp: 'HernanWilkinson 7/13/2011 18:38'!
value

	^ value! !


!Deposit methodsFor: 'balance' stamp: 'HAW 5/25/2019 11:25:02'!
affectBalance: aBalance

	^aBalance + value ! !


!Deposit methodsFor: 'as yet unclassified' stamp: 'DEC 6/16/2022 10:44:46'!
accept: aReportToAccept

	aReportToAccept reportOfADeposit: self! !

!Deposit methodsFor: 'as yet unclassified' stamp: 'DEC 6/15/2022 12:44:22'!
acceptTransactionReport: aReportToAccept

	aReportToAccept reportOfADeposit: self! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Deposit class' category: 'ServiciosFinancierosParte2-17'!
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


!classDefinition: #TransferLeg category: 'ServiciosFinancierosParte2-17'!
AccountTransaction subclass: #TransferLeg
	instanceVariableNames: 'transfer'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancierosParte2-17'!

!TransferLeg methodsFor: 'value' stamp: 'LL 9/20/2020 22:27:32'!
value

	^transfer value! !


!TransferLeg methodsFor: 'initialization' stamp: 'LL 9/20/2020 22:28:14'!
initializeWith: aTransfer

	transfer := aTransfer! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'TransferLeg class' category: 'ServiciosFinancierosParte2-17'!
TransferLeg class
	instanceVariableNames: ''!

!TransferLeg class methodsFor: 'as yet unclassified' stamp: 'LL 9/20/2020 22:45:01'!
of: aTransfer on: anAccount

	| transaction |
	
	transaction := self new initializeWith: 	aTransfer.
	anAccount register: transaction.	
	
	^transaction! !


!classDefinition: #TransferDepositLeg category: 'ServiciosFinancierosParte2-17'!
TransferLeg subclass: #TransferDepositLeg
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancierosParte2-17'!

!TransferDepositLeg methodsFor: 'accessing' stamp: 'LL 9/20/2020 22:26:10'!
withdrawLeg

	^transfer withdrawLeg! !


!TransferDepositLeg methodsFor: 'balance' stamp: 'LL 9/20/2020 22:27:49'!
affectBalance: aBalance

	^aBalance + self value! !


!TransferDepositLeg methodsFor: 'as yet unclassified' stamp: 'DEC 6/16/2022 10:45:06'!
accept: aReportToAccept

	aReportToAccept reportOfATransferDepositLeg: self! !

!TransferDepositLeg methodsFor: 'as yet unclassified' stamp: 'DEC 6/15/2022 12:44:22'!
acceptTransactionReport: aReportToAccept

	aReportToAccept reportOfATransferDepositLeg: self! !


!classDefinition: #TransferWithdrawLeg category: 'ServiciosFinancierosParte2-17'!
TransferLeg subclass: #TransferWithdrawLeg
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancierosParte2-17'!

!TransferWithdrawLeg methodsFor: 'accessing' stamp: 'LL 9/20/2020 22:25:47'!
depositLeg

	^transfer depositLeg! !


!TransferWithdrawLeg methodsFor: 'balance' stamp: 'LL 9/20/2020 22:27:55'!
affectBalance: aBalance

	^aBalance - self value! !


!TransferWithdrawLeg methodsFor: 'as yet unclassified' stamp: 'DEC 6/16/2022 10:45:19'!
accept: aReportToAccept

	aReportToAccept reportOfATransferWithdrawLeg: self! !

!TransferWithdrawLeg methodsFor: 'as yet unclassified' stamp: 'DEC 6/15/2022 12:44:22'!
acceptTransactionReport: aReportToAccept

	aReportToAccept reportOfATransferWithdrawLeg: self! !


!classDefinition: #Withdraw category: 'ServiciosFinancierosParte2-17'!
AccountTransaction subclass: #Withdraw
	instanceVariableNames: 'value'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancierosParte2-17'!

!Withdraw methodsFor: 'initialization' stamp: 'HernanWilkinson 7/13/2011 18:46'!
initializeFor: aValue

	value := aValue ! !


!Withdraw methodsFor: 'value' stamp: 'HernanWilkinson 7/13/2011 18:33'!
value

	^ value! !


!Withdraw methodsFor: 'balance' stamp: 'HAW 5/25/2019 11:25:15'!
affectBalance: aBalance

	^aBalance - value! !


!Withdraw methodsFor: 'as yet unclassified' stamp: 'DEC 6/16/2022 10:45:31'!
accept: aReportToAccept

	aReportToAccept reportOfAWithdraw: self! !

!Withdraw methodsFor: 'as yet unclassified' stamp: 'DEC 6/15/2022 12:44:22'!
acceptTransactionReport: aReportToAccept

	^aReportToAccept reportOfAWithdraw: self! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Withdraw class' category: 'ServiciosFinancierosParte2-17'!
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


!classDefinition: #Report category: 'ServiciosFinancierosParte2-17'!
Object subclass: #Report
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancierosParte2-17'!

!Report methodsFor: 'initialization' stamp: 'DEC 6/15/2022 12:14:34'!
initializeFor: anAccount

	self subclassResponsibility ! !


!Report methodsFor: 'visits' stamp: 'DEC 6/15/2022 12:25:08'!
reportOfADeposit: aDepositToReport

	self subclassResponsibility ! !

!Report methodsFor: 'visits' stamp: 'DEC 6/15/2022 12:25:00'!
reportOfATransferDepositLeg: aTransferDepositLegToReport

	self subclassResponsibility ! !

!Report methodsFor: 'visits' stamp: 'DEC 6/15/2022 12:24:53'!
reportOfATransferWithdrawLeg: aTransferWithdrawLegToReport

	self subclassResponsibility ! !

!Report methodsFor: 'visits' stamp: 'DEC 6/15/2022 12:24:45'!
reportOfAWithdraw: aWithdrawToReport

	self subclassResponsibility ! !


!Report methodsFor: 'main protocol' stamp: 'DEC 6/15/2022 12:19:26'!
print

	self subclassResponsibility ! !


!classDefinition: #AccountSummary category: 'ServiciosFinancierosParte2-17'!
Report subclass: #AccountSummary
	instanceVariableNames: 'account reportLines'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancierosParte2-17'!

!AccountSummary methodsFor: 'initialization' stamp: 'DEC 6/14/2022 17:01:06'!
initializeFor: anAccount

	reportLines := OrderedCollection new.
	account := anAccount.

	! !


!AccountSummary methodsFor: 'private' stamp: 'DEC 6/16/2022 11:41:05'!
print

	account acceptTransactionReport: self.
	reportLines add: ( 'Balance = ', account balance asString ).
	^reportLines copy
	
	! !


!AccountSummary methodsFor: 'reports' stamp: 'DEC 6/15/2022 12:25:19'!
reportOfADeposit: aDepositToReport
	
	reportLines add: ( 'Depósito por ', aDepositToReport value asString)	! !

!AccountSummary methodsFor: 'reports' stamp: 'DEC 6/15/2022 12:25:26'!
reportOfATransferDepositLeg: aTransferDepositLegToReport

	reportLines add: ( 'Entrada por transferencia de ', aTransferDepositLegToReport value asString )	! !

!AccountSummary methodsFor: 'reports' stamp: 'DEC 6/15/2022 12:25:32'!
reportOfATransferWithdrawLeg: aTransferWithdrawLegToReport

	reportLines add: ( 'Salida por transferencia de ', aTransferWithdrawLegToReport value asString )	! !

!AccountSummary methodsFor: 'reports' stamp: 'DEC 6/15/2022 12:24:34'!
reportOfAWithdraw: aWithdrawToReport

	reportLines add: ( 'Extracción por ', aWithdrawToReport value asString )	! !

!AccountSummary methodsFor: 'reports' stamp: 'DEC 6/16/2022 10:43:41'!
reportOfPortfolio: aPortfolioToReport

	account transactions do: [:aTransaction | aTransaction accept: self ]! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'AccountSummary class' category: 'ServiciosFinancierosParte2-17'!
AccountSummary class
	instanceVariableNames: ''!

!AccountSummary class methodsFor: 'as yet unclassified' stamp: 'DEC 6/16/2022 11:12:17'!
for: anAccount

	^( self new initializeFor: anAccount ) print! !


!classDefinition: #PortfolioTreePrinter category: 'ServiciosFinancierosParte2-17'!
Report subclass: #PortfolioTreePrinter
	instanceVariableNames: 'portfolio printedTree indentation treeLevel'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancierosParte2-17'!

!PortfolioTreePrinter methodsFor: 'private' stamp: 'DEC 6/16/2022 16:05:57'!
endOfPortfolio

	treeLevel := treeLevel - 1.
	self indentationForLevel ! !

!PortfolioTreePrinter methodsFor: 'private' stamp: 'DEC 6/16/2022 13:57:59'!
incrementTreeLevel

	treeLevel := treeLevel + 1.! !

!PortfolioTreePrinter methodsFor: 'private' stamp: 'DEC 6/16/2022 14:11:30'!
indentationForLevel
	
	indentation := ''.
	treeLevel timesRepeat: [ indentation := indentation, String tab ].
	self incrementTreeLevel.! !

!PortfolioTreePrinter methodsFor: 'private' stamp: 'DEC 6/16/2022 13:25:23'!
print

	portfolio acceptAccountReport: self.
	^printedTree allButLast withNewLines copy! !


!PortfolioTreePrinter methodsFor: 'initialization' stamp: 'DEC 6/16/2022 12:15:35'!
initializeFor: anAccount

	portfolio := anAccount.
	printedTree := ''.
	indentation := ''.
	treeLevel := 0.! !


!PortfolioTreePrinter methodsFor: 'reports' stamp: 'DEC 6/16/2022 14:00:51'!
reportOfAPortfolio: aPortfolioToReport
	
	self indentationForLevel.
	printedTree := printedTree, indentation, aPortfolioToReport name, '\'.! !

!PortfolioTreePrinter methodsFor: 'reports' stamp: 'DEC 6/16/2022 13:27:31'!
reportOfAReceptiveAccount: aReceptiveAccountToReport

	printedTree := printedTree,  indentation, String tab, aReceptiveAccountToReport name, '\'.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'PortfolioTreePrinter class' category: 'ServiciosFinancierosParte2-17'!
PortfolioTreePrinter class
	instanceVariableNames: ''!

!PortfolioTreePrinter class methodsFor: 'as yet unclassified' stamp: 'DEC 6/15/2022 12:12:42'!
for: aPortfolio

	^self new initializeFor: aPortfolio ! !


!classDefinition: #TransferNet category: 'ServiciosFinancierosParte2-17'!
Report subclass: #TransferNet
	instanceVariableNames: 'account transferNetBalance'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancierosParte2-17'!

!TransferNet methodsFor: 'private' stamp: 'DEC 6/16/2022 11:41:17'!
print

	account acceptTransactionReport: self.
	^transferNetBalance! !


!TransferNet methodsFor: 'initialization' stamp: 'DEC 6/14/2022 17:17:08'!
initializeFor: anAccount 

	transferNetBalance := 0 * peso.
	account := anAccount.! !


!TransferNet methodsFor: 'reports' stamp: 'DEC 6/15/2022 12:25:46'!
reportOfADeposit: aDepositToReport


	! !

!TransferNet methodsFor: 'reports' stamp: 'DEC 6/15/2022 12:25:53'!
reportOfATransferDepositLeg: aTransferDepositLegToReport

	transferNetBalance := transferNetBalance + aTransferDepositLegToReport value

	! !

!TransferNet methodsFor: 'reports' stamp: 'DEC 6/15/2022 12:26:00'!
reportOfATransferWithdrawLeg: aTransferWithdrawLegToReport

	transferNetBalance := transferNetBalance - aTransferWithdrawLegToReport value

	! !

!TransferNet methodsFor: 'reports' stamp: 'DEC 6/15/2022 12:26:06'!
reportOfAWithdraw: aWithdrawToReport

	! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'TransferNet class' category: 'ServiciosFinancierosParte2-17'!
TransferNet class
	instanceVariableNames: ''!

!TransferNet class methodsFor: 'as yet unclassified' stamp: 'DEC 6/16/2022 11:08:34'!
for: anAccount

	^( self new initializeFor: anAccount ) print! !


!classDefinition: #Transfer category: 'ServiciosFinancierosParte2-17'!
Object subclass: #Transfer
	instanceVariableNames: 'value withdrawLeg depositLeg'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancierosParte2-17'!

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

!classDefinition: 'Transfer class' category: 'ServiciosFinancierosParte2-17'!
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
