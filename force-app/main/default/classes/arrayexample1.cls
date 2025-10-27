public class arrayexample1 {
    public static void storeCountries(){
        string [] countryNames = new string[]{'India','Japan','America','Israel','England','New Zeland'};
            system.debug('Array size..:'+countryNames.size());
        system.debug('Single line Countries are...:'+countryNames);
        system.debug('Index wise selected Countries are..:'+countryNames[0]);
        for(integer i=0; i<10; i++){
            system.debug('As per array size print countries are..:'+countryNames[i]);
        }
        for(integer k=0; k<countryNames.size(); k++){
            system.debug('Automatically take array size countries..:'+countryNames[k]);
        }
        for(string st : countryNames){
            system.debug('No need to write array sizes to print countries..:'+st);
        }
    }

}