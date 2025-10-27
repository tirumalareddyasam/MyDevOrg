public class AccountClass {
    public static void accountMethod(){
        for(Integer i=0; i<5; i++){
            Account acc = new Account();
            acc.Name = 'Tirumala Reddy';
            acc.AccountNumber = 'Account Number'+i;
            acc.Rating = 'Hot';
            acc.CurrencyIsoCode = 'USD';
            acc.NumberofLocations__c = Decimal.valueOf('100000000988');
            // try{
            insert acc;
            
            if(acc.Id != null){
                system.debug('Record has been created successfully');
                system.debug('Account Id is..:'+acc.Id);
            }
        }
        /*}catch(DmlException e){
System.debug('Error creating account: ' + e.getMessage());
}*/
        List<String> validRatings = new List<String>();
        for (Schema.PicklistEntry entry : Account.Rating.getDescribe().getPicklistValues()) {
            validRatings.add(entry.getValue());
        }
        System.debug('Valid Rating values: ' + validRatings);
    }
}