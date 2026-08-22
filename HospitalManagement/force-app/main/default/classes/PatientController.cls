public with sharing class PatientController {

    @AuraEnabled(cacheable=true)
    public static List<Patient__c> getPatients() {
        return [
            SELECT Id, Name, Age__c
            FROM Patient__c
            ORDER BY Name
        ];
    }
}