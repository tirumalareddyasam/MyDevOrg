public class Collections_Map {
    public static void MapCollection(){
        //put() Method
        Account acc1 = new Account(Name='Amazon');
        Contact con1 = new Contact(FirstName='John', LastName='Doe');
        Contact con2 = new Contact(FirstName='Jane', LastName='Smith');
        List<Contact> Contacts = new List<Contact>{con1,con2};
            Map<Account,List<Contact>> MapAccounts = new Map<Account,List<Contact>>();
        MapAccounts.put(acc1,Contacts);
        system.debug(MapAccounts);
        
        //If you want to get 2 contacts and map them to an Account like 'Amazon'
        List<Account> accName = [SELECT Id, Name FROM Account WHERE Name = 'Swathi' LIMIT 1];
        List<Contact> conList = [SELECT Id, FirstName, LastName FROM Contact WHERE FirstName IN ('Chantal','Dragon')];
        Map<Account,List<Contact>> MapAccount = new Map<Account,List<Contact>>();
        if(!accName.isEmpty() && !conList.isEmpty()){
            MapAccount.put(accName[0],conList);
        }
        system.debug('Account to contacts map..: '+MapAccount);
        
        // putAll() Method
        Account acc = new Account(Name = 'Alibaba');
        Contact con = new Contact(FirstName = 'Blackhole', LastName='Smith');
        List<Contact> conList1 = new List<Contact>{con}; 
            Map<Account, List<Contact>> MapAccounts1 = new Map<Account, List<Contact>>();
        MapAccounts1.put(acc,conList1);
        MapAccounts.putAll(MapAccounts1);
        system.debug(MapAccounts);
        
        //size() Method
        system.debug('Size is..: '+MapAccounts.size());
        
        //isEmpty() Method
        ////If you want display contacts where accounts are not tagged this one way
        Map<Id,String> mapList = new Map<Id,String>();
        for(Contact cons: [Select Id, FirstName, LastName From Contact Where AccountId = null]){
            String fullName = cons.FirstName + ' ' + cons.LastName;
            mapList.put(cons.Id, fullName);
        }
        if(!mapList.isEmpty()){
            for (Id contactId : mapList.keySet()) {
                System.debug('Id: ' + contactId + ', Full Name: ' + mapList.get(contactId));
            } 
        }
        //If you want display contacts where accounts are not tagged this another way
        List<Contact> contacts1 = [SELECT Id, FirstName, LastName FROM Contact WHERE AccountId = null];
        
        for (Contact c : contacts1) {
            System.debug('Id: ' + c.Id + ', First Name: ' + c.FirstName + ', Last Name: ' + c.LastName);
        }
    }
}