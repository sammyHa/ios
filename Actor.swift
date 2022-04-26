actor BankAccount {
    var balance: Decimal
    
    init(initialBalance: Decimal) {
        balance = initialBalance
    }
    
    func deposit(amount: Decimal) {
        balance = balance + amount
    }
    
    func transfer(amount: Decimal, to other: BankAccount) async  {
        guard balance > amount else { return }
        
        balance = balance - amount
        
        //send it to other account
         await other.deposit(amount: amount)
    }
}


Task {
    let firstAccount = BankAccount(initialBalance: 500)
    let secondAccount = BankAccount(initialBalance: 0)
    await firstAccount.transfer(amount: 450, to: secondAccount)
    await print(secondAccount.balance)
}

