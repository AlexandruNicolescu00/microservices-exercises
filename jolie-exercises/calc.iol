type NOTATIONType:any

type Add:void {
	.intB:int
	.intA:int
}

type Divide:void {
	.intB:int
	.intA:int
}

type MultiplyResponse:void {
	.MultiplyResult:int
}

type DivideResponse:void {
	.DivideResult:int
}

type SubtractResponse:void {
	.SubtractResult:int
}

type Multiply:void {
	.intB:int
	.intA:int
}

type Subtract:void {
	.intB:int
	.intA:int
}

type AddResponse:void {
	.AddResult:int
}

interface CalculatorSoap {
RequestResponse:
	Add(Add)(AddResponse),
	Subtract(Subtract)(SubtractResponse),
	Multiply(Multiply)(MultiplyResponse),
	Divide(Divide)(DivideResponse)
}

outputPort CalculatorSoap12 {
Location: "socket://localhost:80/"
Protocol: soap
Interfaces: CalculatorSoap
}

outputPort CalculatorSoap {
Location: "socket://www.dneonline.com:80/calculator.asmx"
Protocol: soap {
	.wsdl = "http://www.dneonline.com/calculator.asmx?wsdl";
	.wsdl.port = "CalculatorSoap"
}
Interfaces: CalculatorSoap
}


