public class AccountConCreation {
    // Create account and automatically create child contact when if condition meet the criteria 
    public static void myAccountCreation(List<Account> accList){
        
        for(Account acc: accList){
            If(acc.Industry != Null && acc.Type == 'Prospect' && (acc.Industry == 'Energy' || acc.Industry == 'Communications')){
                acc.Description = 'Account created';
                acc.Rating__c = 'Warm';
            }
            /*else {
                acc.addError('Only Accounts with Industry as "Energy" or "Communications" and Type as "Prospect" are allowed.');
            }*/
        }
    }
    public static void createContacts(List<Account> accList){
        List<Contact> conList = new List<Contact>();
        
        for(Account acc1 : accList){
                Contact con = new Contact();
                con.AccountId = acc1.Id;
                con.FirstName = acc1.Name;
                con.LastName = 'AC';
                con.Phone = acc1.Phone;
                conList.add(con);           
        }
        if(!conList.isEmpty()){
            insert conList;
        }
    }
    public static void OppoCreation(Map<Id, Account> newAccountMap, Map<Id, Account> oldAccountMap){
        List<Opportunity> oppList = new List<Opportunity>();
        for(Account acc: newAccountMap.values()){
            if(acc.Rating__c != oldAccountMap.get(acc.Id).Rating__c && acc.Rating__c == 'Warm'){
                Opportunity opp = new Opportunity();
                opp.AccountId = acc.Id;
                opp.Name = acc.Name;
                opp.CloseDate = Date.today().addDays(90);
                opp.StageName ='Proposal';
                oppList.add(opp);
            }
        }
        if(!oppList.isEmpty()){
            insert oppList;
        }
    }
    public static void delAcc(List<Account> accList){
        for(Account acc: accList){
            if(String.isNotBlank(acc.Phone)){
                acc.addError('you cannot delete please check Phone value should be blank');
            }
        }
    }
    public static void updatePhone(List<Account> newList, Map<Id, Account> oldMap){
        for(Account acc: newList){
            if(oldMap != Null && acc.Phone != oldMap.get(acc.Id).Phone){
                acc.Description = 'Phone number is updated';
            }
        }
    }
    public static void deleteContact(List<Account> accList){
        //This is way to delete child records if parent deleted --> This logic will filter duplicates
        Set<Id> accIds = new Set<Id>();
        for(Account acc: accList){
            accIds.add(acc.Id);
        }
        List<Contact> conList = [SELECT Id FROM Contact WHERE AccountId = :accIds];
        if(!conList.isEmpty()){
            delete conList;
        }
    }
    //Other way to delete child records if parent deleted --> This logic will allow duplicates
    /*List<Contact> conList = new List<Contact>();
    for(Account acc: accList){
        for(Contact con: [SELECT Id FROM Contact WHERE AccountId = :acc.Id]){
            conList.add(con);
        }
        if(conList.size()>0){
            delete conList;
        }
    }
}*/
}