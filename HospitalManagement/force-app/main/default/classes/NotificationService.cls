public class NotificationService {

    public static void sendNotifications(
        List<Application__c> applications
    ) {

        for (Application__c app : applications) {

            System.debug(
                'NotificationService called for Application: '
                + app.Id
                + ' with Status: '
                + app.Status__c
            );
        }
    }
}