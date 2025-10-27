public class OlderAccountsUtility {
    public static void updateOlderAccounts(){
        Account[] oldAccounts=[SELECT ID, Description FROM Account order by CreatedDate ASC LIMIT 5];
        for(Account acc : oldAccounts){
            acc.Description = ' Heritage Account';
        }
        update oldAccounts;
    }
}