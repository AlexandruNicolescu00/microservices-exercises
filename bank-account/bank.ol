include "interface.iol"

inputPort MyInput {
    Location: "socket://localhost:8000"
    Protocol: sodep
    Interfaces: BankAccountInterface
}

cset {
    sid: BankOperation.sid
}

main {
    login( request )( response ) {
        username = request.username
        password = request.password
        response.sid = cset.sid = new
    }
    [ deposit( request )( response ) {
        response = "Deposited " + request.value + " to account " + cset.sid
    } ]
    [ withdraw( request )( response ) {
        response = "Withdrew " + request.value + " from account " + cset.sid
    } ]
    [ balance( request )( response ) {
        response = "Balance of account " + cset.sid + " is 1000"
    } ]
    [ logout( request ) {
        cset.sid = null
    }
    ]
}