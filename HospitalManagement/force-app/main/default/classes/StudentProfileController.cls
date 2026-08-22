public with sharing class StudentProfileController {

    @AuraEnabled(cacheable=true)
    public static Student__c getStudent(Id studentId) {

        return [
            SELECT Id,
                   Name,
                   Email__c,
                   Phone_Number__c,
                   Branch__c,
                   CGPA__c,
                   Active_Backlogs__c,
                   Placement_Status__c
            FROM Student__c
            WHERE Id = :studentId
            LIMIT 1
        ];
    }

    @AuraEnabled
    public static void updateStudent(
        Id studentId,
        String email,
        String phone,
        String branch,
        Decimal cgpa,
        Integer activeBacklogs
    ) {

        Student__c student = [
            SELECT Id
            FROM Student__c
            WHERE Id = :studentId
            LIMIT 1
        ];

        student.Email__c = email;
        student.Phone_Number__c = phone;
        student.Branch__c = branch;
        student.CGPA__c = cgpa;
        student.Active_Backlogs__c = activeBacklogs;

        update student;
    }
}