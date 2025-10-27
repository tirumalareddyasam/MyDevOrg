public class sObjectexample {
    public static void sObjex(){
        /*Account accObj = new Account();
        accObj.Name = 'Tiru';
        accObj.Description = 'This is test account creation';
        insert accObj;
        system.debug('Record has been created '+accObj);*/
        
        Applicant__c appObj = new Applicant__c();
        appObj.Name = 'Tirumala';
        appObj.CloseDate__c = Date.newInstance(2025, 7, 10);
        insert appObj;
        system.debug('Record has been created '+appObj);
    }

}