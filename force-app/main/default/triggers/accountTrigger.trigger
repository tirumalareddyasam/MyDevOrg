trigger accountTrigger on Account(before delete, before insert, before update, after insert, after update, after delete){
    // Create account and automatically create child contact when if condition meet the criteria 
    /*if (Trigger.isBefore) {
        for(Account acc: Trigger.new){
            If(acc.Industry != Null && acc.Type == 'Prospect' && (acc.Industry == 'Energy' || acc.Industry == 'Communications')){
                acc.Description = 'Account created';
                acc.Rating__c = 'Warm';
            }
            else {
                acc.addError('Only Accounts with Industry as "Energy" or "Communications" and Type as "Prospect" are allowed.');
            }
        }
    }
    if (Trigger.isAfter && Trigger.isInsert) {
        List<Contact> conList = new List<Contact>();
        
        for(Account acc1 : Trigger.new){
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
    }*/
    //If you want call apex class you need to write above code in class then call class using below code.
    if(Trigger.isBefore){
        if(Trigger.isDelete){
            AccountConCreation.delAcc(Trigger.old);// Deleting account record
            AccountConCreation.deleteContact(Trigger.old);// Deleting child contact records
        }else{
            AccountConCreation.myAccountCreation(Trigger.new);
        }
    }
    if(Trigger.isAfter && Trigger.isInsert){
        AccountConCreation.createContacts(Trigger.new);
    }
    if(Trigger.isUpdate && Trigger.isAfter){
        AccountConCreation.OppoCreation(Trigger.newmap, Trigger.oldmap);
    }
    if(Trigger.isUpdate){
        if(Trigger.isBefore){
            AccountConCreation.updatePhone(Trigger.new, Trigger.oldmap);
        }
    }
    /*if(Trigger.isBefore && Trigger.isDelete){
        AccountConCreation.deleteContact(Trigger.old);
    }*/
}