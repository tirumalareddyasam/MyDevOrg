public class seasons {
    public static void seasonIfelse(){
        integer monthNumber;
        monthNumber = 4;
        if(monthNumber >= 1 && monthNumber <= 4){
            system.debug('Winter Season');
        }       
        else if(monthNumber >= 5 && monthNumber <= 8){
            system.debug('Summer Season');
        }
        else if(monthNumber >= 9 && monthNumber <= 12){
            system.debug('Spring Season');
        }
        else {
            system.debug('Invalid Month Number');
        }
    }
}