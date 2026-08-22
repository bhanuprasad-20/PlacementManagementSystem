import { LightningElement, api } from 'lwc';

export default class EmptyState extends LightningElement {

    @api message = 'No data found';

}