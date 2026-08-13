public class FutureDemo {

    @future
    public static void updateStudent(Id studentId){

        Student__c stu = [
            SELECT Id, Department__c
            FROM Student__c
            WHERE Id = :studentId
            LIMIT 1
        ];

        stu.Department__c = 'IT';

        update stu;
    }

}