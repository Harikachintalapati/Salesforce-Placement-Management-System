public class CustomerTriggerHandler {
    public static void checkDuplicate(List<Customer__c> customers) {

        Set<String> phones = new Set<String>();

        for(Customer__c c : customers){
            if(c.Phone_Number__c != null){
                phones.add(c.Phone_Number__c);
            }
        }

        Map<String,Customer__c> existing =
        new Map<String,Customer__c>();

        for(Customer__c c : [
            SELECT Id, Phone_Number__c
            FROM Customer__c
            WHERE Phone_Number__c IN :phones
        ]){
            existing.put(c.Phone_Number__c,c);
        }

        for(Customer__c c : customers){
            if(existing.containsKey(c.Phone_Number__c)){
                c.addError('Duplicate Phone Number Not Allowed');
            }
        }
    }
}