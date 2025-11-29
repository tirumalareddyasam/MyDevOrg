trigger myContact on Contact (before insert, before update) {
    Set<String> emailSet = new Set<String>();
    for(Contact con : Trigger.new){
        if(con.Email != null){
            emailSet.add(con.Email);
        }
    }
    List<Contact> existingConList = [SELECT Id, Email FROM Contact WHERE Email IN :emailSet];
    for(Contact newCon : Trigger.new){
        if(newCon.Email != null){
            for(Contact existCon : existingConList){
                if(newCon.Email == existCon.Email){
                    newCon.adderror('You entered duplicate email please check');
                }
            }
        }
    }
}