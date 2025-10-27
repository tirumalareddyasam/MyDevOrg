import { LightningElement } from 'lwc';
import getAccounts from '@salesforce/apex/Call_Method_AnotherClass.getAccounts';
import updateAccounts from '@salesforce/apex/Call_Method_AnotherClass.updateAccounts';
import { ShowToastEvent } from 'lightning/platformShowToastEvent';

export default class Tabset extends LightningElement {
    wish = "Choose best bus for safe journey";
    greeting = "";
    isShow = false;
    toggleText = false;

    // Input field change handler
    handlerChange(event) {
        this.greeting = event.target.value;
    }

    // Show/hide handler
    handleClick() {
        this.isShow = true;
    }

    handleClickhide() {
        this.isShow = false;
    }

    get labelaname() {
        return this.toggleText ? 'Hide Details' : 'Show Details';
    }

    handletoggle() {
        this.toggleText = !this.toggleText;
    }

    columnsList = [
        { label: 'Name', fieldName: 'Name', type: 'text', editable: true },
        { label: 'Industry', fieldName: 'Industry', type: 'text', editable: true },
        { label: 'Rating', fieldName: 'Rating__c', type: 'text', editable: true },
        { label: 'Annual Revenue', fieldName: 'AnnualRevenue', type: 'currency', editable: true },
    ];

    dataList = [];
    draftValues = [];

    connectedCallback() {
        this.getAccountList();
    }

    // Fetch data
    getAccountList() {
        getAccounts()
            .then(result => {
                this.dataList = result;
            })
            .catch(error => {
                console.error('Error fetching accounts:', error);
            });
    }
isLoading = false;
    // Handle save
    handleSave(event) {
        const updatedFields = event.detail.draftValues;
this.isLoading = true; // show spinner on save start

        updateAccounts({ accList: updatedFields })
            .then(() => {
                this.dispatchEvent(new ShowToastEvent({
                    title: 'Success',
                    message: 'Records updated successfully!',
                    variant: 'success'
                }));
                this.draftValues = [];
                return getAccounts(); // re-fetch updated data
            })
            .then((result) => {
                this.dataList = result;
                this.isLoading = false;  // hide spinner after successful save and refresh
            })
            .catch(error => {
                this.dispatchEvent(new ShowToastEvent({
                    title: 'Error updating records',
                    message: error.body.message,
                    variant: 'error'
                }));
                this.isLoading = false;  // hide spinner if error occurs too
            });
    }
}