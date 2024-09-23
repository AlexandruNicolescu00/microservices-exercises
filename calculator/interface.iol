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
    mul(CalcRequest)(int)
    avg(AvgRequest)(int)
}