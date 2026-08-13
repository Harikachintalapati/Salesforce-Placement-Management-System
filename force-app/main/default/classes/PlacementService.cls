public class PlacementService {

    
    public static List<Student__c> getEligibleStudents(Decimal minimumCGPA) {
        return [
            SELECT Name, CGPA__c
            FROM Student__c
            WHERE CGPA__c >= :minimumCGPA
        ];
    }

  
    public static List<Student__c> getStudentsByDepartment(String department) {
        return [
            SELECT Name, Department__c
            FROM Student__c
            WHERE Department__c = :department
        ];
    }

    
    public static void createApplication(Id studentId, Id jobId) {

        Application__c app = new Application__c();

        app.Student__c = studentId;
        app.Job__c = jobId;
        app.Status__c = 'Applied';

        insert app;
    }

}