public with sharing class ApplicationController {

    // 🔹 Get Jobs
    @AuraEnabled(cacheable=true)
    public static List<Job__c> getEligibleJobs() {
        return [
            SELECT Id, Name, Company__c, Location__c, Closing_Date__c, Minimum_CGPA__c
            FROM Job__c
            ORDER BY CreatedDate DESC
        ];
    }

    // 🔹 Apply Job
    @AuraEnabled
    public static String submitApplication(Id studentId, Id jobId) {

        // Prevent duplicate
        List<Application__c> existing = [
            SELECT Id FROM Application__c
            WHERE Student__c = :studentId
            AND Job__c = :jobId
        ];

        if (!existing.isEmpty()) {
            return 'You already applied for this job';
        }

        Application__c app = new Application__c();
        app.Student__c = studentId;
        app.Job__c = jobId;
        app.Status__c = 'Applied';
        app.Application_Date__c = Date.today();

        insert app;

        return 'Application submitted successfully';
    }

    // 🔹 My Applications
    @AuraEnabled(cacheable=true)
    public static List<Application__c> getMyApplications(Id studentId) {
        return [
            SELECT Id,
                   Status__c,
                   Application_Date__c,
                   Job__r.Name,
                   Job__r.Company__c
            FROM Application__c
            WHERE Student__c = :studentId
            ORDER BY CreatedDate DESC
        ];
    }
}