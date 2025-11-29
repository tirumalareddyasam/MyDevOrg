
trigger AccountTrigger on Account (After insert){

    if(Trigger.isAfter && Trigger.isUpdate){


    }
}


//Handler class:
//===========

/*public class AccountTriggerHandler{

public static void updateOpportunitiesWhenHighValue(){

Set<Id> highValueAccountIds = new Set<Id>();

For( Account acc: newList){

    Account oldAcc = oldMap.get(acc.Id);

    If(!oldAcc.High_Value__c && acc.High_value__c){

     highValueAccountIds.add(acc.Id);

    }
}

List<Opportunity> oppsToUpdate = [Select id , High_Value__c From Opportunity where AccountId IN :highValueAccountIds AND (High_Value__c = false or High_Value__c = null) ];

for(Opportunity opp : oppsToUpdate){

Boolean new
    opp.High_Value__c = true;

}

if(!oppsToUpdate.isEmpty()){

    update oppsToUpdate;
}
}

}*/