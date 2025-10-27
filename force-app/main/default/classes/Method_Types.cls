public class Method_Types {
    /*//Variable declaration
    public string Name = 'Tirumala';
    
    //Static Variable declaration
    public static String Course = 'Salesforce';
    
    //Constructor
    public Method_Types(){
        Name = 'Tiru';
        Course = 'SFDC';
    }
    
    //Method(It allows Non static and static variable values)
    public void Method(){
        Name = 'Asam Reddy';
        Course = 'CRM';
    }
    
    //Static Method(It allows static variable values only)
    public static void Method1(){
        //Name = 'Tirumala Reddy Asam'; // Throwing error becaz its Non static varible value.
        Course = 'Cloud CRM'; // Its static variable value
    }*/
    public static List<Account> retriveAcc(String Name){
        string st = '%'+Name+'%';
        list<Account> accList = [SELECT Id, Name FROM Account WHERE Name like:st];
        return accList;
    }
}