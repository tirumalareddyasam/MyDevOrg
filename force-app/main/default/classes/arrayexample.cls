public class arrayexample {
    public static void store5elements(){
        integer [] customerIds = new integer[100];
        system.debug('Array size' + customerIds.size()); //Print array size
        customerIds[0] = 200;
        customerIds[1] = 300;
        customerIds[2] = 10000;
        customerIds[3] = 400;
        customerIds[4] = 200;
        system.debug('Customer Ids are'+ customerIds); //print all elements in one row
        for(integer i=0; i<5; i++){
            system.debug('Elements are'+ customerIds[i]); //print 5 elements line by line because condition size is 5
        }
        for(integer i=0; i<customerIds.size(); i++){
            system.debug('customer ids are'+ customerIds[i]); //print all elements as per the array size; We can mention array size directly in condition. No need to change condition everytime when array size change.
        }
    }

}