public class PlacementScheduler implements Schedulable {

    public void execute(SchedulableContext sc) {

        Database.executeBatch(new PlacementBatchJob(), 5);

        System.debug('Scheduler Executed');

    }
}