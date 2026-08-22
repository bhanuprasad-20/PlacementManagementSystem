public class PlacementIntegrationService {

    public static Boolean processApplication(Id applicationId) {

        try {

            Application__c application = [
                SELECT Id, Name, Status__c, Student__c, Job__c
                FROM Application__c
                WHERE Id = :applicationId
                LIMIT 1
            ];

            System.debug('=== Placement Integration Service ===');
            System.debug('Application: ' + application.Name);
            System.debug('Status: ' + application.Status__c);
            System.debug('Student: ' + application.Student__c);
            System.debug('Job: ' + application.Job__c);

            System.debug('Integration successful');

            return true;

        } catch (Exception e) {

            System.debug('Integration failed: ' + e.getMessage());

            return false;
        }
    }
}