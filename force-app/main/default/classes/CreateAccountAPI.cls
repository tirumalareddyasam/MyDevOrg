@RestResource(urlMapping='/CreateAccountAPI/*')
global with sharing class CreateAccountAPI {

    @HttpPost
    global static String createAcc() {
        RestRequest req = RestContext.request;
        String body = req.requestBody.toString();

        // Deserialize JSON into the wrapper class
        AccountWrapper accReq = (AccountWrapper) JSON.deserialize(body, AccountWrapper.class);

        // Create Account record
        Account acc = new Account();
        acc.Name = accReq.name;
        acc.Phone = accReq.phone;
        acc.Type = accReq.type;
        acc.Industry = accReq.industry;

        // CRUD check before DML
        if (!Schema.sObjectType.Account.isCreateable()) {
            // Return permission error JSON without performing DML
            return JSON.serialize(new ResponseWrapper('ERROR', 'INSUFFICIENT_ACCESS: Create permission on Account is required'));
        }

        insert acc;

        // Return success JSON
        return JSON.serialize(new ResponseWrapper('SUCCESS', acc.Id));
    }

    // Wrapper class to map incoming JSON
    global class AccountWrapper {
        public String name;
        public String phone;
        public String type;
        public String industry;
    }

    // Wrapper class for response
    global class ResponseWrapper {
        public String status;
        public String accountId;

        public ResponseWrapper(String status, String accountId) {
            this.status = status;
            this.accountId = accountId;
        }
    }
}