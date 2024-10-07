include "interface.iol"
include "console.iol"
include "ui/swing_ui.iol"

outputPort Calculator {
Location: "socket://localhost:8000"
Protocol: sodep
Interfaces: CalculatorInterface
}

main {
    op = -1
    while (op != 0) {
        showInputDialog@SwingUI("Choice: 1 for sum, 2 for mul, 3 for avg, 0 for exit:")(op)
        op = int(op)
        if (op == 1) {
            showInputDialog@SwingUI("Insert first number:")(a.x)
            showInputDialog@SwingUI("Insert second number:")(a.y)
            a.x = int(a.x)
            a.y = int(a.y)
            sum@Calculator(a)(sumRes)
            println@Console( sumRes )()
        } else if (op == 2) {
            showInputDialog@SwingUI("Insert first number:")(a.x)
            showInputDialog@SwingUI("Insert second number:")(a.y)
            a.x = int(a.x)
            a.y = int(a.y)
            mul@Calculator(a)(mulRes)
            println@Console( mulRes )()
        } else if (op == 3) {
            i = 0
            num = 0
            while (num != "") {
                showInputDialog@SwingUI("Insert a number for avarege, leave empty for result:")(num)
                if (num != "") {
                    b.values[i] = int(num)
                    i += 1
                }
            }
            avg@Calculator(b)(avgRes)
            println@Console( avgRes )()
        }
    }
}