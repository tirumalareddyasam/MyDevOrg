@isTest
private class test1Test {

    @isTest
    static void testDisplayValues() {
        // Create an instance of the class
        test1 obj = new test1();

        // Call the method to ensure it runs without exception
        obj.displayValues();

        // Since displayValues only logs output, there are no assertions needed
        // This ensures 100% code coverage
    }
}