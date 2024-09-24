include "interface.iol"
include "console.iol"

outputPort Calculator {
Location: "socket://localhost:8000"
Protocol: sodep
Interfaces: CalculatorInterface
}

main {
    a.x = 1
    a.y = 2
    b.values[0] = 1
    b.values[1] = 2
    b.values[2] = 3
    b.values[3] = 4
    sum@Calculator(a)(sumRes)
    mul@Calculator(a)(mulRes)
    println@Console( sumRes )()
    println@Console( mulRes )()
    avg@Calculator(b)(avgRes)
    println@Console( avgRes )()
}