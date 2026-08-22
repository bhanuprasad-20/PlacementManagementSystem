import { LightningElement } from 'lwc';

import getStudent from '@salesforce/apex/StudentProfileController.getStudent';
import updateStudent from '@salesforce/apex/StudentProfileController.updateStudent';

export default class StudentProfile extends LightningElement {

    studentId = 'a04dM000005g49BQAQ';

    studentName = '';
    email = '';
    phone = '';
    branch = '';
    cgpa = '';
    activeBacklogs = '';
    placementStatus = '';

    message = '';

    connectedCallback() {
        this.loadStudent();
    }

    loadStudent() {

        getStudent({
            studentId: this.studentId
        })
        .then(result => {

            console.log('Student:', result);

            this.studentName = result.Name;
            this.email = result.Email__c;
            this.phone = result.Phone_Number__c;
            this.branch = result.Branch__c;
            this.cgpa = result.CGPA__c;
            this.activeBacklogs = result.Active_Backlogs__c;
            this.placementStatus = result.Placement_Status__c;

        })
        .catch(error => {

            console.error('Error loading student:', error);

            this.message = 'Error loading student.';

        });
    }

    handleSave() {

        updateStudent({

            studentId: this.studentId,

            email: this.template.querySelector(
                '[data-field="Email__c"]'
            ).value,

            phone: this.template.querySelector(
                '[data-field="Phone_Number__c"]'
            ).value,

            branch: this.template.querySelector(
                '[data-field="Branch__c"]'
            ).value,

            cgpa: Number(
                 this.template.querySelector(
                 '[data-field="CGPA__c"]'
            ).value
),

            activeBacklogs: Number(
                this.template.querySelector(
                '[data-field="Active_Backlogs__c"]'
            ).value
)

        })
        .then(() => {

            console.log('Student profile updated');

            this.message = 'Profile updated successfully!';

            this.dispatchEvent(
                new CustomEvent('profileupdate')
            );

        })
        .catch(error => {

            console.error(
                'Error updating student:',
                JSON.stringify(error)
            );

            this.message = 'Failed to update profile.';

        });
    }
}