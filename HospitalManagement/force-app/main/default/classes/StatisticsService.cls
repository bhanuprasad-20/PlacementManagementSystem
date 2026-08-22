public class StatisticsService {

    public static void refreshStatistics(
        List<Application__c> applications
    ) {
        System.debug('StatisticsService called.');

        for (Application__c app : applications) {
            System.debug(
                'Application selected: ' + app.Id
            );
        }
    }
}