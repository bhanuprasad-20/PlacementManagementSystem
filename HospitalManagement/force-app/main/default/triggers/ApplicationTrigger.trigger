trigger ApplicationTrigger on Application__c (after insert, after update) {

    Set<Id> applicationIds = new Set<Id>();

    for (Application__c app : Trigger.new) {

        if (Trigger.isInsert) {
            applicationIds.add(app.Id);
        }

        if (Trigger.isUpdate) {
            Application__c oldApp = Trigger.oldMap.get(app.Id);

            if (app.Status__c != oldApp.Status__c) {
                applicationIds.add(app.Id);
            }
        }
    }

    for (Id applicationId : applicationIds) {
        System.enqueueJob(
            new ExternalPlacementIntegrationJob(applicationId)
        );
    }
}