public class OfferPostProcessingJob implements Queueable {

    private Id applicationId;

    public OfferPostProcessingJob(Id applicationId) {
        this.applicationId = applicationId;
    }

    public void execute(QueueableContext context) {

        System.debug('Queueable Job Started');
        System.debug('Application Id : ' + applicationId);

    }

}