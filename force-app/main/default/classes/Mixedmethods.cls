public class Mixedmethods {
    Integer num1;
    Integer num2;
    
    public Mixedmethods(Integer n1, Integer n2){
        num1 = n1;
        num2 = n2;
    }
    
    public void voidMethod(){
        Integer additionResult = num1+num2;
        system.debug('Addition Result..: '+additionResult);
    }
    
    public Integer returnMethod(){
        return num1-num2;
    }
    
    public static Integer staticMethod(Integer n1, Integer n2){
        return n1*n2;
    }
    
    public static Decimal staticMethods(Integer n1, Integer n2){
        if(n2!=0){
            return n1/n2;
        }else{
            return null;
        }
    }

}