public class ExternalPlacementIntegrationJob implements Queueable {

    private Id applicationId;

    public ExternalPlacementIntegrationJob(Id applicationId) {
        this.applicationId = applicationId;
    }

    public void execute(QueueableContext context) {

        Boolean success =
            PlacementIntegrationService.processApplication(applicationId);

        if (success) {
            System.debug('External placement integration completed successfully.');
        } else {
            System.debug('External placement integration failed.');
        }
    }
}