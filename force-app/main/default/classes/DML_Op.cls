public class DML_Op {
    public void DMLOperation(){
        Account acc = new Account();
        acc.Name = 'Reddy';
        acc.CurrencyIsoCode = 'USD';
        acc.Rating = 'Hot';
        insert acc;
        
        Account ac = MyAccount('Ebay', 'USD', 'Hot', 100);
        insert ac;
        
        Contact con = new Contact();
        con.AccountId = acc.Id;
        con.FirstName = 'Smith';
        con.LastName = 'Jelly';
        con.Phone = '8923746183';
        insert con;
        
        //If you want update another account's associated contacts this is the method
        
        /*List<Account> accList = [select Id from Account LIMIT 10]; //if you want update 10 account's contacts
Set<Id> accIds = new Set<Id>();
for(Account acc: accList){
accIds.add(acc.Id);
}*/
        
        Id AccTargetId = '001J400000bsTkPIAU';
        Contact [] ContactsToUpdate = [SELECT Id FROM Contact WHERE AccountId = :AccTargetId];
        //OR
        //List<Contact> ContactsToUpdate = [SELECT Id FROM Contact WHERE AccountId = :AccTargetId];
        
        for(Contact c: ContactsToUpdate){
            c.FirstName ='Tom';
        }
        if(!ContactsToUpdate.isEmpty()){
            update ContactsToUpdate;
        }
        else{
            System.debug('No contacts found for this Account.');
        }
        //If you want update specified contact this is the method 
        Id ConTargetId = '0035j00000AwEAIAA3';
        Contact ConToUpdate = [SELECT Id, Phone From Contact WHERE Id = :ConTargetId LIMIT 1];
        ConToUpdate.Phone = '892635762375';
        update ConToUpdate;
        
        //Update No Of Emp field for all accounts if account is active , type is prospect and rating is hot
        List<Account> accList = [SELECT Id, NumberOfEmployees FROM Account WHERE Active__c = 'Yes' AND Type = 'Prospect' AND Rating = 'Hot'];
        for(Account a: accList){
            a.NumberOfEmployees = 200;
        }
        if(!accList.isEmpty()){
            update accList;
        }else{
            system.debug('No matching accounts found');
        }
        
        //If you want delete the record 
        Contact ConToDelete = [SELECT Id From Contact Where Id = '0035j00000pMwt3AAC'];
        delete ConToDelete;
        
        //If you want undelete the record
        Contact ConToUnDel = [SELECT Id From Contact Where Id = '0035j00000pMwt3AAC' ALL ROWS];
        undelete ConToUnDel;
    }
    //This reusable method coming from another class to create account record see line 9 AND 10.
    public Account MyAccount(String Name, String CurrencyIsoCode, String Rating, Integer NumberOfEmployees){
    Call_Method_AnotherClass CmA = new Call_Method_AnotherClass();
    return CmA.accDetails(Name, CurrencyIsoCode, Rating, NumberOfEmployees);
    }
}