@isTest
public class ContactServiceTest {

    @isTest
    static void testGetCustomers() {

        Test.startTest();
        List<Customer__c> customers = CustomerService.getCustomers();
        Test.stopTest();

        System.assert(customers.size() > 0);
    }
}