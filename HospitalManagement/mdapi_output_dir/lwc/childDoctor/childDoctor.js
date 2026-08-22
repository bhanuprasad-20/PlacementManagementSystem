import { LightningElement, api } from 'lwc';

export default class ChildDoctor extends LightningElement {

    @api doctorName;

    sendMessage() {
        const event = new CustomEvent('message', {
            detail: 'Hello Parent! Message received from Child.'
        });

        this.dispatchEvent(event);
    }
}