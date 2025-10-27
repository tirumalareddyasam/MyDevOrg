/*public class MySampleApexClass {
    public static Integer myValue = 0;
    public static String myString ='';
    public static Integer getCalculatedValue(){
        myValue = myValue+10;
        return myValue;
    }

}*/
public class MyClass{
    Integer myInteger = 10;
    public void myMethod(Integer multiplier){
        Integer multiplicationResult;
        multiplicationResult = multiplier*myInteger;
        system.debug(''+multiplicationResult);
    }
}