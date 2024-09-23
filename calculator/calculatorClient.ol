include "interface.iol"

outputPort Calculator {
Location: "socket://localhost:8000"
Protocol: sodep
Interfaces: CalculatorInterface
}

main {
    sum@Calculator((1,2))
    mul@Calculator((1,2))
    avg@Calculator(([1,2,3,4,5]))
}