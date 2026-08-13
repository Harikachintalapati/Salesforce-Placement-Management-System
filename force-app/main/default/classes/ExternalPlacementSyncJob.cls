public class ExternalPlacementSyncJob implements Queueable {

    private Id applicationId;

    public ExternalPlacementSyncJob(Id applicationId) {
        this.applicationId = applicationId;
    }

    public void execute(QueueableContext context) {

        System.debug('External Sync Started');

        System.enqueueJob(
            new PlacementNotificationJob(applicationId)
        );
    }
}