include "interface.iol"

inputPort MyInput {
Location: "socket://localhost:8000"
Protocol: sodep
Interfaces: CalculatorInterface
}

main {
    sum( request )( response ) {
        response = request.x + request.y
    }
    mul( request )( response ) {
        response = request.x * request.y
    }
    avg( request )( response ) {
        response = 0
        foreach( i : request.values ) {
            response = response + i
        }
        response = response / #request.values
    }
}