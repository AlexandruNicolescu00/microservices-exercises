include "interface.iol"

inputPort BankService {
    Location: "socket://localhost:8000"
    Protocol: sodep
    Interfaces: BankAccountInterface
}

execution{ concurrent }

cset {
    sid: BankOperation.sid,
}

init {
    keepRunning = true
    accountA = "a"
    accountA.money = 100
    accountB = "b"
    accountB.money = 200
}

main {
    login( request )( response ) {
        account = request.username
        response.sid = cset.sid = new
        synchronized(account){
            if(is_defined (global.account.( account )) ) {
                global.account.( account ) = new
                global.account.( account ).money = 0
            }
        }
    }
    while( keepRunning ) {
        [ deposit( request )( response ) ] {
            synchronized(account){
                global.account.( account ).money += request.value
            }
        response = "Deposited " + request.value + " to account " + global.account.( account )
        }
        [ withdraw( request )( response ) ] {
            synchronized(account){
                global.account.( account ).money -= request.value
            }
            response = "Withdrew " + request.value + " from account " + global.account.( account )
        } 
        [ balance( request )( response ) ] {
            response = "Balance of account " + global.account.( account ) + " is " + global.account.( account ).money
        } 
        [ logout( request ) ] {
            cset.sid = null
            keepRunning = false
        }
    }
}