
public class ApplicationService {

    public static void processSelectedApplications(
        List<Application__c> applications,
        Map<Id, Application__c> oldApplicationMap
    ) {

        Set<Id> selectedApplicationIds = new Set<Id>();
        Set<Id> studentIds = new Set<Id>();

        for (Application__c app : applications) {

            Application__c oldApp = oldApplicationMap.get(app.Id);

            if (
                oldApp.Status__c != 'Selected' &&
                app.Status__c == 'Selected'
            ) {

                selectedApplicationIds.add(app.Id);

                if (app.Student__c != null) {
                    studentIds.add(app.Student__c);
                }
            }
        }

        if (selectedApplicationIds.isEmpty()) {
            return;
        }

        // Update Student Placement Status
        if (!studentIds.isEmpty()) {

            List<Student__c> students = [
                SELECT Id, Placement_Status__c
                FROM Student__c
                WHERE Id IN :studentIds
            ];

            for (Student__c student : students) {
                student.Placement_Status__c = 'Selected';
            }

            if (!students.isEmpty()) {
                update students;
            }
        }

        // Create asynchronous jobs for Offer processing
        for (Id applicationId : selectedApplicationIds) {
            System.enqueueJob(
                new OfferPostProcessingJob(applicationId)
            );
        }
    }
}

