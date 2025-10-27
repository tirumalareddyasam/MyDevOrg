public class studentMarks {
    public static void nestedIf(){
        integer sanskrit,english,maths,physics,chemistry,totalMarks,average;
        sanskrit = 98;
        english = 96;
        maths = 100;
        physics = 100;
        chemistry = 39;
        
        totalMarks = sanskrit+english+maths+physics+chemistry;
        
        //calculate the result....
        if(sanskrit>=40 && english>=40 && maths>=40 && physics>=40 && chemistry>=40){
            system.debug('Result : PASS');
            system.debug('Total Marks are..'+totalMarks);
            
            //calculate the grade...........
            average = totalMarks/5;
            if(average>=60){
                system.debug('Grade A');
            }
            else if(average>=50 && average<=59){
                system.debug('Grade B');
            }
            else if(average>=40 && average<=49){
                system.debug('Grade C');
            }
        }
        else{
            system.debug('Result : FAIL');
            system.debug('Total Marks are..'+totalMarks);
            //system.debug('Failed Subjects');
            if(sanskrit<40){
                system.debug('Failed Subject is Sanskrit = '+sanskrit);
            }
            else if(english<40){
                system.debug('Failed Subject is English = '+english);
            }
            else if(maths<40){
                system.debug('Failed Subject is Maths = '+maths);
            }
            else if(physics<40){
                system.debug('Failed Subject is Physics = '+physics);
            }
            else if(chemistry<40){
                system.debug('Failed Subject is Chemistry = '+chemistry);
            }
        }
    }
}