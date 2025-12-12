public class LearnIntegrationApex {
    public static void makeCallout(){
        Http http = new Http();
        HttpRequest req = new HttpRequest();
        req.setEndpoint('callout:Request_Bin_Named');
        req.setMethod('GET');
        HttpResponse res = http.send(req);
        system.debug('get status code'+res.getStatusCode());

        if(res.getStatusCode() == 200){
            system.debug('Made callout to external system'+res.getBody());
        }

    }
}