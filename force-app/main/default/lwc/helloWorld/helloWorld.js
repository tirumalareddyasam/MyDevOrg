import { LightningElement } from 'lwc';
export default class HelloWorld extends LightningElement {
    wish = "Choose best bus for safe journey";

    greeting = "-------------";
    handlerChange(event) {
        this.greeting = event.target.value;
    }
    isShow = false;
    handleClick() {
        this.isShow = true;
    }
    handleClickhide() {
        this.isShow = false;
    }
    toggleText = false;
    get labelaname() {
        return this.toggleText ? 'Hide Details' : 'Show Details';
    }
    handletoggle() {
        this.toggleText = !this.toggleText;
    }
}