public class Collections_List {
    public boolean stVar3;
    String iVar;
    public void ListCollection(){
        
        //add() Method
        List<String> stVar = new List<String>();
        stVar.add('Tiru');
        stVar.add('Jaga');
        stVar.add('Narasimha');
        stVar.add('Diva');
        stVar.add('Shiva');
        system.debug('String variable values are..:'+stVar);
        
        //size() Method
        system.debug('String variable values size..:'+stVar.size());
        
        //clone() Method
        List<String> stVar2 = new List<String>();
        stVar2 = stVar.clone();
        stVar2.add(stVar[2]);
        system.debug('String variable values are..:'+stVar2);
        
        //remove() Method
        stVar2.remove(5);
        system.debug('String variable values are..:'+stVar2);
        
        //equals() Method
        stVar3 = stVar.equals(stVar2);
        system.debug('stVar and stVar2 are equal..? '+stVar3);
        
        //get() Method
        iVar = stVar.get(0);
        String iVar2 = stVar2.get(1);
        system.debug('iVar value is '+iVar+iVar2);
        
        //Print 10 times each values
        /*for(String s: stVar){  
for(Integer i=0; i<10; i++){
system.debug(+s);           
}
}*/
        
        //set() Method
        stVar2.set(4,'Upi');
        system.debug('String variable values are..:'+stVar2);
        
        //clear() Method
        //stVar2.clear();
        
//================================================================================================ 
 
        // add() Method
        List<Account> accVar = new List<Account>();
        Account acc = new Account();
        acc.Name = 'Tiru';
        acc.AccountNumber = '10';
        acc.NumberOfEmployees = 10;
        acc.AnnualRevenue = 20000;
        Account acc1 = new Account(Name = 'Swathi',AnnualRevenue = 10000);
        accVar.add(acc);
        accVar.add(acc1);
        system.debug(+accVar);
        
        // clone() Method
        List<Account> accVar2 = new List<Account>();
        accVar2 = accVar.clone();
        system.debug('Cloned values'+accVar2);
        
        // equals() Method
        Boolean AccountEq = accVar.equals(accVar2);
        system.debug('Account 1 and Account 2 are equal..? '+AccountEq);
        
        
        // remove() Method
        accVar.remove(0);
        system.debug(+accVar);
        
        // get() Method
        Account str = accVar.get(0);
        system.debug(+str);
        
        // set() Method
        Account acc3 = new Account();
        acc3.Name = 'Tinku';
        acc3.Fax = '72389969123';
        acc3.Rating = 'Hot';
        accVar2.set(0,acc3);
        system.debug('Cloned values'+accVar2);
        
        //clear() Method
        //accVar.clear();
        
        //insert accVar;
    }   
}