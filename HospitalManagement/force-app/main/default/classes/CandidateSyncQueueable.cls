public class CandidateSyncQueueable implements Queueable, Database.AllowsCallouts {

    private Id studentId;

    public CandidateSyncQueueable(Id studentId) {
        this.studentId = studentId;
    }

    public void execute(QueueableContext context) {

        Student__c student = [
            SELECT Id, Name, Email__c, Branch__c, CGPA__c
            FROM Student__c
            WHERE Id = :studentId
            LIMIT 1
        ];

        HttpRequest request = new HttpRequest();

        request.setEndpoint(
            'callout:Recruitment_API/3a5f9b67-344e-4120-8c60-7205c4a04b01'
        );

        request.setMethod('POST');

        request.setHeader(
            'Content-Type',
            'application/json'
        );

        Map<String, Object> data = new Map<String, Object>();

        data.put('studentId', student.Id);
        data.put('name', student.Name);
        data.put('email', student.Email__c);
        data.put('branch', student.Branch__c);
        data.put('cgpa', student.CGPA__c);

        request.setBody(JSON.serialize(data));

        Http http = new Http();

        HttpResponse response = http.send(request);

        System.debug('Status Code: ' + response.getStatusCode());
        System.debug('Response Body: ' + response.getBody());
    }
}