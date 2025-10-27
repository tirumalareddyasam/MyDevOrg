public class mathOp {
    public static void operators(){
        integer firstNumber,secondNumber,result;
        firstNumber = 6700;
        secondNumber = 0;
        result = firstNumber+secondNumber;
        system.debug('Addition result is '+result);
        //substraction
        system.debug('Substraction result is '+(firstNumber-secondNumber));
        //multiplication
        if(secondNumber==0){
            system.debug('Multiplication result is '+firstNumber*secondNumber);
        }
        //Division
        if(secondNumber>firstNumber){
            system.debug('Division result is '+secondNumber/firstNumber);
        }
        else{
            system.debug('Division opertaion cannot be performed');
        }
    }

}