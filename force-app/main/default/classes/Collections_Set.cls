public class Collections_Set {
    public static void SetCollection(){
        // add() Method
        //We can create records in 3 ways in Account
        Set<Account> accSet = new Set<Account>();
        
        //This is 1 way
        Account acc = new Account(Name = 'Amazon', CurrencyIsoCode = 'EUR', AnnualRevenue = 25000);
        accSet.add(acc);
        
        //This is 2nd way
        Account acc1 = new Account();
        acc1.Name = 'Flipkart';
        acc1.CurrencyIsoCode = 'USD';
        acc1.AnnualRevenue = 22000;
        accSet.add(acc1);
        
        //This is 3rd way
        accSet.add(new Account(Name = 'Ajio', CurrencyIsoCode = 'USD', AnnualRevenue = 10000));
        
        system.debug('New Accounts..: '+accSet);
        //size() Method
        system.debug('New Accounts Size..: '+accSet.size());
        //insert new List<Account>(accSet); //Convert Set to List and insert
        
        //addAll() Method
        Set<Account> accSet1 = new Set<Account>();
        accSet1.add(new Account(Name = 'Amazon', CurrencyIsoCode = 'EUR', AnnualRevenue = 25000));// 'Amazon' is a duplicate
        accSet1.add(new Account(Name = 'Myntra', CurrencyIsoCode = 'EUR', AnnualRevenue = 10000));
        accSet1.addAll(accSet); //Only unique values will remains
        system.debug('New add all Accounts..: '+accSet1);// Output values are Ajio,Amazon,Flipkart,Myntra.

        //contains() Method
        //if you're only tracking names
        system.debug(accSet.contains(acc1));
        //if any Account in the set has the name 'Amazon' contains() workaround: check by Name
        Boolean foundAmazon = false;
        for(Account a: accSet){
            if(a.Name == 'Amazon'){
                foundAmazon = true;
                break;
            }
        }
        system.debug('Does the set contain "Amazon"? '+foundAmazon);
        
        //isEmpty() Methos
        Set<Id> accIds = new Set<Id>();
        for(Account a: [SELECT Id, Name FROM Account WHERE CurrencyIsoCode = 'EUR']){
            accIds.add(a.Id);
        }
        if(!accIds.isEmpty()){
            List<Contact> ConList = [SELECT Id From Contact WHERE AccountId IN: accIds]; 
            ConList.add(new contact(FirstName = 'Upi', LastName = 'Asam'));
            //insert ConList;
        }
        else{
            System.debug('No accounts found in the set.');
        }
        
        //remove() Method
        accSet.remove(acc1);
        System.debug(accSet);
        
        //equals() Method
        Boolean isEqual = accSet.equals(accSet1);
        System.debug('Both are equal..: '+isEqual);
        
        //clear() Method
        //accSet.clear();
    }
    
}