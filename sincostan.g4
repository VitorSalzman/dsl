grammar sincostan;
expression: Operator Operand ';'
{
    double result = 0;
    if($Operator.text.equals("sin")) {
        result = Math.sin(Math.toRadians($Operand.int));
    } else if($Operator.text.equals("cos")) {
        result = Math.cos(Math.toRadians($Operand.int));
    } else if($Operator.text.equals("tan")) {
        result = Math.cos(Math.toRadians($Operand.int));
    }
    System.out.println($Operator.text+" "+$Operand.text+" = "+result);
}
;
Operator: 'sin' | 'cos' | 'tan';
Operand : [0-9]+;
WS : [ \t\n]+ -> skip ;
