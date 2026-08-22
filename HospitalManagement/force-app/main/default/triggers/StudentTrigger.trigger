trigger StudentTrigger on Student__c (after insert) {

    for (Student__c student : Trigger.new) {

        System.enqueueJob(
            new CandidateSyncQueueable(student.Id)
        );
    }
}