@isTest
private class Collections_MapTest {


@IsTest
    static void testMapCollection() {
        // Create test data
        Account acc1 = new Account(Name='*');
        insert acc1;
        Contact con1 = new Contact(FirstName='John', LastName='Doe', AccountId=acc1.Id);
        Contact con2 = new Contact(FirstName='Jane', LastName='Smith', AccountId=acc1.Id);
        insert new List<Contact>{con1, con2};

        // Call the method
        Collections_Map.MapCollection();

        // Verify the results
        Map<Account, List<Contact>> expectedMap = new Map<Account, List<Contact>>{
            acc1 => new List<Contact>{con1, con2}
        };
        System.assertEquals(expectedMap.size(), 1, 'Map should have 1 entry');
        System.assertEquals(expectedMap.get(acc1).size(), 2, 'Account should have 2 contacts');
    }
}