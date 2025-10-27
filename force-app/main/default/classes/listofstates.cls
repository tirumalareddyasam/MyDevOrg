public class listofstates {
    public static void method(){
        List<string> ListOfStatesMethod = new List<string>();//This is one way
        //List<string> ListOfStatesMethod = new List<string>{'Andhra Pradesh','Karnataka'};//This is 2nd way to add values
        system.debug('Values of List'+ListOfStatesMethod);//It will give null values
        ListOfStatesMethod.add('Andhra Pradesh');
        ListOfStatesMethod.add('Karnataka');
        system.debug('Values of states'+ListOfStatesMethod);//It will return states values
    }
}