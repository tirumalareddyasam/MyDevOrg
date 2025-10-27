public class ConstructorEx {
    String fax = '9305719';
    Integer NoOfBooks;
    public ConstructorEx(){
        integer age = 30;
        string name = 'Tiru';
        boolean isActive = True;
        date DOB = Date.newInstance(1993,08,24);
        double fee = 100000.00;
        Fax = '736363';
        NoOfBooks = 20;
        system.debug('Print above data');
        system.debug('Fax number is..:'+fax);
        System.debug('Number of Books..:'+NoOfBooks);
    }
    public ConstructorEx(integer NoOfEmp, string address){
        NoOfEmp = 200;
        address = 'Kadiri';
        system.debug(NoOfEmp);
        system.debug(address);
        system.debug(Fax);
    }
}