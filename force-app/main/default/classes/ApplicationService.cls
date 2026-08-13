public class ApplicationService {

    public static void validateApplications(List<Application__c> applications) {

        Set<Id> studentIds = new Set<Id>();
        Set<Id> jobIds = new Set<Id>();

        for (Application__c app : applications) {

            if (app.Student__c != null) {
                studentIds.add(app.Student__c);
            }

            if (app.Job__c != null) {
                jobIds.add(app.Job__c);
            }
        }

        System.debug('Student Ids : ' + studentIds);
        System.debug('Job Ids : ' + jobIds);
    }

    public void submitApplication(Id studentId, Id jobId) {

        Application__c app = new Application__c(
            Student__c = studentId,
            Job__c = jobId,
            Status__c = 'Applied',
            Application_Date__c = Date.today()
        );

        insert app;

        System.enqueueJob(new OfferPostProcessingJob(app.Id));

        System.debug('Application Submitted Successfully');
    }
}