public with sharing class ApplicationController {

    @AuraEnabled
    public static Id applyForJob(Id studentId, Id jobId) {

        // Get the selected Job
        Job__c job = [
            SELECT Id, company_name__c
            FROM Job__c
            WHERE Id = :jobId
            LIMIT 1
        ];

        // Create Application
        Application__c application = new Application__c();

        application.Student__c = studentId;
        application.Job__c = jobId;
        application.Company_Name__c = job.company_name__c;
        application.Status__c = 'Applied';
        application.Application_Date__c = Date.today();

        insert application;

        return application.Id;
    }


    @AuraEnabled(cacheable=true)
    public static List<Job__c> getJobs() {

        return [
            SELECT Id,
                   Name,
                   company_name__c,
                   job_Title__c,
                   Department__c,
                   closing_date__c,
                   Laste_date__c,
                   mimnum_cgp__c
            FROM Job__c
            ORDER BY closing_date__c ASC
        ];
    }
}