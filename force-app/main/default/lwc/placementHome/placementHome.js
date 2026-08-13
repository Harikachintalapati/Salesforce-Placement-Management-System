import { LightningElement } from 'lwc';

export default class PlacementHome extends LightningElement {
    studentName = 'Rahul';
    rollNumber = '22B81A0501';
    department = 'CSE';

    message = '';
    status = 'Not Applied';

    todayDate = '31 July 2026';
    companies = 25;
    jobs = 63;
    applications = 5;

    showMessage() {
        this.message = 'Welcome to Salesforce Development.';
    }

    applyJob() {
        this.status = 'Applied';
    }
}