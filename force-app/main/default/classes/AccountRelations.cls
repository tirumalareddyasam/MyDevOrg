public class AccountRelations {
    public static void relations(){
        Account acc = new Account();
        acc.Name = 'Asam';
        acc.AccountNumber = '10';
        acc.Rating = 'Hot';
        acc.CurrencyIsoCode = 'EUR';
        insert acc;
        
        Contact con = new Contact();
        con.FirstName = 'Jerry';
        con.LastName = 'Luke';
        con.Phone = '9828376672';
        con.AccountId = acc.Id;       
        insert con;
        
        Opportunity opp = new Opportunity();
        opp.Name = 'BMW';
        opp.StageName = 'Prospecting';
        opp.CloseDate = Date.newInstance(2025,08,24);
        opp.AccountId = acc.Id;
        insert opp;
        
        system.debug('Records are created successfully under account');
        system.debug('Account Id..:'+acc.Id);
        system.debug('Contact Id..:'+con.Id);
        system.debug('Opportunity Id..:'+opp.Id);
    }

}