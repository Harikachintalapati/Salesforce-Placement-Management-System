import { LightningElement, track } from 'lwc';
import createStudent from '@salesforce/apex/StudentController.createStudent';

export default class StudentForm extends LightningElement {

    @track name = '';
    @track email = '';
    @track course = '';

    @track isSaving = false;

    handleName(event) {
        this.name = event.target.value;
    }

    handleEmail(event) {
        this.email = event.target.value;
    }

    handleCourse(event) {
        this.course = event.target.value;
    }

    handleSave() {

        // 🔴 VALIDATION
        if (!this.name || !this.email || !this.course) {
            alert('Please fill all fields');
            return;
        }

        this.isSaving = true;

        createStudent({
            name: this.name,
            email: this.email,
            course: this.course
        })
        .then(() => {
            alert('Student Created Successfully');

            // 🔁 CLEAR FORM
            this.name = '';
            this.email = '';
            this.course = '';

            // 🔄 REFRESH PAGE (simple way)
            window.location.reload();

        })
        .catch(error => {
            console.error(error);
            alert('Error creating student');
        })
        .finally(() => {
            this.isSaving = false;
        });
    }
}