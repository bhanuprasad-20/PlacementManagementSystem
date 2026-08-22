public class ApplicationTriggerHandler {

    public static void handleAfterUpdate(
        List<Application__c> newApplications,
        Map<Id, Application__c> oldApplicationMap
    ) {

        ApplicationService.processSelectedApplications(
            newApplications,
            oldApplicationMap
        );
    }
}