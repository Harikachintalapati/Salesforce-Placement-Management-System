import { LightningElement, api } from 'lwc';

export default class ChildComponent extends LightningElement {

    @api recordId;

    sendMessage() {
        this.dispatchEvent(
            new CustomEvent('message', {
                detail: 'Hello from Child Component'
            })
        );
    }

}