import { LightningElement, api } from 'lwc';

export default class JobCard extends LightningElement {

    @api job;

    handleApply() {

        const event = new CustomEvent('apply', {
            detail: {
                jobId: this.job.Id
            }
        });

        this.dispatchEvent(event);
    }

    handleViewDetails() {

        this.dispatchEvent(
            new CustomEvent('viewdetails', {
                detail: {
                    jobId: this.job.Id
                }
            })
        );
    }
}