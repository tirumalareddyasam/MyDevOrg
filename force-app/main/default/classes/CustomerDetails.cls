public class CustomerDetails {
    public Integer customerId, customerPhone;
    public String name, address, desrciption, emailId;
    public Date joiningDate, validity;
    public Double amount;
    
    public void cdMethod(){
        //for(Integer i=0; i<5; i++){
        customerId = 423413;
        Long customerPhone = 9876543210L;
        name = 'Tiru';
        address = 'Kadiri, Anantapur, Andhra Pradesh';
        desrciption = 'This is Test record. So please check everything i created correct or wrong';
        emailId = 'tiru@test.com';
        joiningDate = system.today();
        validity = Date.newInstance(2025,10,15);
        amount = 100000.00;
        
        system.debug('Customer Id is..:'+customerId);
        system.debug('Customer Name is ..:'+name);
        system.debug('Customer Phone Number..:'+customerPhone);
        system.debug('Customer Address is..:'+address);
        system.debug('Customer Email is..:'+emailId);
        system.debug('Customer Joining Date is..:'+joiningDate);
        system.debug('Customer Validity is..:'+validity);
        system.debug('Customer Amount is..:'+amount);
        system.debug('Customer Description is..:'+desrciption);
        //}
    }

}