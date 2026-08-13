public class ApplicationFutureService {

    @future
    public static void sendApplication(Id applicationId) {

        System.debug('Future Method Executed');
        System.debug('Application Id : ' + applicationId);

    }

}