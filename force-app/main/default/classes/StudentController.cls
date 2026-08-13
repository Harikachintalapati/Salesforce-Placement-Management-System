public with sharing class StudentController {

    @AuraEnabled
    public static void createStudent(String name, String email, String course) {
        Student__c s = new Student__c();
        s.Name = name;
        s.Email__c = email;
        s.Course__c = course;

        insert s;
    }
}