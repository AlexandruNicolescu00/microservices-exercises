type CalcRequest:void {
    .x:int
    .y:int
}

type AvgRequest:void {
    .values[1,*]:int
}

interface CalculatorInterface {
RequestResponse:
    sum(CalcRequest)(int)
RequestResponse:
    mul(CalcRequest)(int)
RequestResponse:
    avg(AvgRequest)(int)
}