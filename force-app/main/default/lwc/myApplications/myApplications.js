import { LightningElement, wire } from 'lwc';
import getMyApplications from '@salesforce/apex/ApplicationController.getMyApplications';

export default class MyApplications extends LightningElement {

    applications = [];
    studentId = 'a04dM000005fpy9QAA';

    @wire(getMyApplications, { studentId: '$studentId' })
    wiredApps({ data, error }) {
        if (data) {
            this.applications = data;
        } else {
            console.error(error);
        }
    }

    get hasApplications() {
        return this.applications.length > 0;
    }
}