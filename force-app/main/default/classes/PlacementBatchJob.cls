public class PlacementBatchJob implements Database.Batchable<SObject> {

    public Database.QueryLocator start(Database.BatchableContext bc) {
        return Database.getQueryLocator(
            'SELECT Id, Name FROM Application__c'
        );
    }

    public void execute(Database.BatchableContext bc, List<Application__c> scope) {

        for(Application__c app : scope) {
            System.debug('Processing Application : ' + app.Id);
        }

    }

    public void finish(Database.BatchableContext bc) {

        System.debug('Batch Job Completed');

    }
}