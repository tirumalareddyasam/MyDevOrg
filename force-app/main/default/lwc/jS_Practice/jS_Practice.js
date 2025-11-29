import { LightningElement, track } from 'lwc';

export default class JS_Practice extends LightningElement {
    //======Arithmetic Operators JS=============
    num1 =10;
    num2 =20;
    get isEqual() {
        return this.num1 === this.num2;
    }
    get isNotEqual() {
        return this.num1 !== this.num2;
    }
    get greaterthan() {
        return this.num1 > this.num2;
    }
    get divisionResult() {
        return this.num1 / this.num2;
    }
    get moduloResult() {
        return this.num1 % this.num2;
    }
    //=====Comparision Operators JS===============
    isTrue = true;
    isFalse = false;  
    get andResult() {
        return this.isTrue && this.isFalse;
    }
    get orResult() {
        return this.isTrue || this.isFalse;
    }
    get notResult() {
        return !this.isTrue;
    }
    //====== Ternary Operator JS===================
    isLoggedIn = false;
    get greetingMessage (){
        return this.isLoggedIn ? 'Welcome Back' : 'Please login to continue';
    }
    handleLoginClick(){
        this.isLoggedIn = true;
    }
    handleLogoutClick(){
        this.isLoggedIn = false;
    }
    //======Assignment Operator JS================
    message = "welcome lightning web components";
    //=======if/else statements JS==============
    userAge;
    resultMessage;
    handleAgeChange(event){
        this.userAge = event.target.value;
    }
    /*checkAge(){
        if(this.userAge >=18){
            this.resultMessage = 'you are an adult';
        }else{
            this.resultMessage = 'you are a minor';
        }
    }*/
   //Using ternary operator way to excute
   checkAge(){
        this.resultMessage = this.userAge >= 18 
            ? 'You are an adult' 
            : 'You are a minor';
    }
    //======Switch Statement JS================
    currentDay;
    dayMessage;
    handleDayChange(event){
        this.currentDay = event.target.value;
    }
    checkDay(){
        switch(this.currentDay){
            case 'Monday':
                this.dayMessage = 'Start of the week';
                break;
            case 'Friday':
                this.dayMessage = 'Almost there';
                break;
            case 'Saturday':
            case 'Sunday':
                this.dayMessage = 'Weekend';
                break;
            default:
                this.dayMessage = 'Regular Weekday';
        }
        return `Today is ${this.currentDay}. ${this.dayMessage}`;
    }
    //======for loop JS====================
    get getNumbers() {
        let numbers = '';
        for (let i = 1; i <= 5; i++) {
            numbers += i + ' ';
        }
        return numbers;
    }
    //==========While loop JS=====================
    get findPowerOfTwo(){
        let result = 1;
        let exponent = 0;
        while(result<=100){
            result = Math.pow(2, exponent);
            exponent++;
        }
        return `The first power of 2 greater than 100 is ${result}`;
    }
    //=======Do While loop JS====================
    /*get getPositiveNumber() {
        let userInput;
        do {
            userInput = parseInt(prompt('Enter a positive number:'));
        } while (isNaN(userInput) || userInput <= 0);
        return `You entered a positive number: ${userInput}`;
    }*/
    //======Functions JS===============
    result = 0;
    calculateNumbers(){
        const num1 = 10;
        const num2 = 10;
        this.result = num1+num2;
    }
    //======Scope Functions JS ===============
    /*function calculateSum(a, b){
        const sum =a+b;
        return sum;
    }
    console.log(sum);// Error: sum is not defined.*/
    //=======Module Scope JS============
    @track moduleScopedVar = 'I am module-scoped';
    showScope(){
        const functionScopedVar = 'I am function-scoped';
        //console.log(`${moduleScopedVar}`);
        console.log(functionScopedVar);
    }
    //==========Arrow Function JS=====================
    @track width = 5;
    @track height = 4;
    @track area;
    calculateArea = () =>{
        this.area = this.width * this.height;
    }
    //=============Template Literal JS===================
    firstName = 'Tiru';
    lastName = 'Reddy';
    get fullName() {
        return `${this.firstName} ${this.lastName}`;
    } 
}

