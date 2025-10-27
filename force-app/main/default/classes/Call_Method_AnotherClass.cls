public class Call_Method_AnotherClass {
    /*public Call_Method_AnotherClass(){
Method_Types MT = new Method_Types();
string StuName = MT.Name;
system.debug(StuName);
}
public Call_Method_AnotherClass(){
String StuCourse = Method_Types.Course;
system.debug(StuCourse);
}*/
    public list<Account> accResult;
    public Call_Method_AnotherClass(){
        accResult = new list<Account>();
        accResult = Method_Types.retriveAcc('Tiru');
        system.debug('Account Result...> '+accResult);
    }
    //This is Reusable method or Utility method
    public Account accDetails(String Name, String CurrencyIsoCode, String Rating, Integer NumberOfEmployees){
        Account acc = new Account();
        acc.Name = Name;
        acc.CurrencyIsoCode = CurrencyIsoCode;
        acc.Rating = Rating;
        acc.NumberOfEmployees = NumberOfEmployees;
        return acc;
    }
    @AuraEnabled
    public static List<Account> getAccounts(){
        List<Account> accList = [SELECT Id, Name, Industry, Rating__c, AnnualRevenue FROM Account];
        System.debug('Get data: ' + accList);
        return accList;
    }
    @AuraEnabled
    public static void updateAccounts(List<Account> accList) {
        System.debug('Got data: ' + accList);
        update accList;
    }
}