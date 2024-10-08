type LoginRequest: void {
    .username: string
}

type BankOperation: void {
    .sid: string
    .value?: double
}

type BankAccount: string {
    .money: double
}

interface BankAccountInterface {
    RequestResponse:
        login(LoginRequest)(BankOperation)
    RequestResponse:
        deposit(BankOperation)(string)
    RequestResponse:
        withdraw(BankOperation)(string)
    RequestResponse:
        balance(BankOperation)(string)
    OneWay:
        logout(BankOperation)
}