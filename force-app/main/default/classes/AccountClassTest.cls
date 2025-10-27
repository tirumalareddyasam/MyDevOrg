@isTest
private class AccountClassTest {


@IsTest
    public static void accountTestMethod(){
        AccountClass.accountMethod();
        Account = [SELECT Id, Name FROM Account WHERE Name = 'Tirumala Reddy' LIMIT 1];
        System.assertEquals('Tirumala Reddy', Name, 'Account Name should be "Tirumala Reddy"');
    }
}