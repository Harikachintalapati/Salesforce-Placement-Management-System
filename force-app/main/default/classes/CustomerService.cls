public class CustomerService {
    public static List<Customer__c> getCustomers() {
        return [
            SELECT Id, Name, Phone_Number__c
            FROM Customer__c
        ];
    }

}