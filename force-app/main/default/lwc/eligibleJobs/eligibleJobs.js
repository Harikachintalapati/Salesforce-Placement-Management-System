import { LightningElement, wire } from 'lwc';
import getEligibleJobs from '@salesforce/apex/ApplicationController.getEligibleJobs';
import submitApplication from '@salesforce/apex/ApplicationController.submitApplication';

export default class EligibleJobs extends LightningElement {

    jobs = [];
    selectedJob = null;
    studentId = 'a04dM000005fpy9QAA'; // change if needed

    @wire(getEligibleJobs)
    wiredJobs({ data, error }) {
        if (data) {
            this.jobs = data;
        } else {
            console.error(error);
        }
    }

    handleApply(event) {
        const jobId = event.currentTarget.dataset.id;

        submitApplication({ studentId: this.studentId, jobId: jobId })
            .then(result => {
                window.alert(result);
            })
            .catch(error => {
                console.error(error);
            });
    }

    handleViewDetails(event) {
        const jobId = event.currentTarget.dataset.id;
        this.selectedJob = this.jobs.find(job => job.Id === jobId);
    }

    closeDetails() {
        this.selectedJob = null;
    }
}