import { LightningElement } from 'lwc';

export default class ParentDoctor extends LightningElement {

    doctorName = 'Dr. Bhanu';
    message = 'No message received yet';

    handleChange(event) {
        this.doctorName = event.target.value;
    }

    handleMessage(event) {
        this.message = event.detail;
    }
}