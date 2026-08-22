public class AlumniService {

    public static void notifyAlumniOffice(
        List<Application__c> applications
    ) {

        for (Application__c app : applications) {

            System.debug(
                'AlumniService called for Application: '
                + app.Id
            );
        }
    }
}