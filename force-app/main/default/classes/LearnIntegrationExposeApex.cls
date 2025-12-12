@RestResource(urlMapping='/LearnIntegration/*')
global class LearnIntegrationExposeApex {
    @HttpGet
    global static List<Contact> getContactData (){
        RestRequest req = RestContext.request;
        Map<String, String> mapOfData= req.params;
        String myRecId = mapOfData.get('sfId');
        String email = mapOfData.get('email');

        List<Contact> conList = [SELECT Id, Name FROM Contact WHERE Id=: myRecId OR Email=: email];
        return conList;
    }
}