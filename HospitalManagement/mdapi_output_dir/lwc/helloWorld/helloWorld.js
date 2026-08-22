import { LightningElement } from 'lwc';

export default class PlacementHome extends LightningElement {

    studentName = 'Rahul';
    rollNumber = '22B81A0501';
    department = 'CSE';

    message = '';
    status = 'Not Applied';

    showMessage() {
        this.message = 'Welcome to Salesforce Development.';
    }

    changeStatus() {
        this.status = 'Applied';
    }
}