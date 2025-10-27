@isTest
public class AccountRelationsTest {
    @isTest
    public static void testRelationsMethod() {
        // Call the method to test
        system.Test.startTest();
        AccountRelations.relations();
        system.Test.stopTest();

        // Verify that an Account record is created
        List<Account> accList = [SELECT Id, Name, AccountNumber, Rating, CurrencyIsoCode FROM Account WHERE Name = 'Asam'];
        System.assertEquals(1, accList.size(), 'Account should be inserted');
        System.assertEquals('Asam', accList[0].Name);

        // Verify that a Contact record is created and related to the Account
        List<Contact> conList = [SELECT Id, FirstName, LastName, Phone, AccountId FROM Contact WHERE FirstName = 'Jerry' AND LastName = 'Luke'];
        System.assertEquals(1, conList.size(), 'Contact should be inserted');
        System.assertEquals(accList[0].Id, conList[0].AccountId, 'Contact should be linked to the correct Account');

        // Verify that an Opportunity record is created and related to the Account
        List<Opportunity> oppList = [SELECT Id, Name, StageName, CloseDate, AccountId FROM Opportunity WHERE Name = 'BMW'];
        System.assertEquals(1, oppList.size(), 'Opportunity should be inserted');
        System.assertEquals(accList[0].Id, oppList[0].AccountId, 'Opportunity should be linked to the correct Account');
    }
}