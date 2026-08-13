import { LightningElement } from 'lwc';

export default class ParentComponent extends LightningElement {

    recordId = '001000000000001';
    message = '';

    handleMessage(event) {
        this.message = event.detail;
    }

}