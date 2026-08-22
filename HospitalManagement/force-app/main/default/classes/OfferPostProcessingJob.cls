public class OfferPostProcessingJob implements Queueable {

    private Id applicationId;

    public OfferPostProcessingJob(Id applicationId) {
        this.applicationId = applicationId;
    }

    public void execute(QueueableContext context) {

        Application__c application = [
            SELECT Id,
                   Name,
                   Status__c,
                   Student__c,
                   job__c
            FROM Application__c
            WHERE Id = :applicationId
            LIMIT 1
        ];

        System.debug('Processing Application: ' + application.Name);
        System.debug('Status: ' + application.Status__c);
        System.debug('Student: ' + application.Student__c);
        System.debug('Job: ' + application.job__c);

        // Only create Offer when Application is Selected
        if (application.Status__c != 'Selected') {
            return;
        }

        // Check whether an Offer already exists
        List<Offer__c> existingOffers = [
            SELECT Id
            FROM Offer__c
            WHERE Application__c = :application.Id
            LIMIT 1
        ];

        if (!existingOffers.isEmpty()) {
            System.debug('Offer already exists for this Application.');
            return;
        }

        // Create Offer
        Offer__c offer = new Offer__c();

        offer.Application__c = application.Id;
        offer.job__c = application.job__c;
        offer.Offer_Date__c = Date.today();
        offer.Offer_Name__c = 'Offer - ' + application.Name;
        offer.Status__c = 'Generated';

        insert offer;

        System.debug('Offer created successfully: ' + offer.Id);

        // Start external placement synchronization
        System.enqueueJob(new ExternalPlacementSyncJob(application.Id));
    }
}