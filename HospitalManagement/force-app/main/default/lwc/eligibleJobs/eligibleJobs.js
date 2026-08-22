import { LightningElement } from 'lwc';

import applyForJob from '@salesforce/apex/ApplicationController.applyForJob';
import getJobs from '@salesforce/apex/ApplicationController.getJobs';

export default class EligibleJobs extends LightningElement {

    message = '';

    studentId = 'a04dM000005g49BQAQ';

    jobs = [];

    selectedJob;

    connectedCallback() {
        this.loadJobs();
    }

    loadJobs() {

        getJobs()
            .then(result => {

                console.log('Jobs:', result);

                this.jobs = result;

            })
            .catch(error => {

                console.error('Error loading jobs:', error);

                this.message = 'Failed to load jobs.';
            });
    }

    handleApply(event) {

        const jobId = event.detail.jobId;

        console.log('Student Id:', this.studentId);
        console.log('Job Id:', jobId);

        applyForJob({
            studentId: this.studentId,
            jobId: jobId
        })
        .then(result => {

            console.log('Application Created:', result);

            this.message =
                'Application submitted successfully! Application Id: ' + result;

        })
        .catch(error => {

            console.error('FULL ERROR:', JSON.stringify(error));

            let errorMessage = 'Unknown error';

            if (error.body) {

                if (typeof error.body === 'string') {
                    errorMessage = error.body;
                }
                else if (error.body.message) {
                    errorMessage = error.body.message;
                }
                else if (
                    error.body.pageErrors &&
                    error.body.pageErrors.length > 0
                ) {
                    errorMessage = error.body.pageErrors[0].message;
                }
                else if (error.body.fieldErrors) {
                    errorMessage =
                        JSON.stringify(error.body.fieldErrors);
                }
            }
            else if (error.message) {
                errorMessage = error.message;
            }

            this.message =
                'Application failed: ' + errorMessage;
        });
    }

    handleViewDetails(event) {

        const jobId = event.detail.jobId;

        console.log('View Details Job Id:', jobId);

        this.selectedJob =
            this.jobs.find(job => job.Id === jobId);

        console.log('Selected Job:', this.selectedJob);
    }

    handleProfileUpdate() {

        console.log(
            'Student profile updated. Refreshing jobs...'
        );

        this.loadJobs();
    }
}