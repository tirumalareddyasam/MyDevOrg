@RestResource(urlMapping='/ProductDataIntegration/*')
global class ProductExposeIntegration {
    /*===============GET Method========================================
    @HttpGet
    global static Product2 getProdData(){
        Product2 prod = new Product2();
        Map<String, String> mapOfData = RestContext.request.params;
        String ProdId = mapOfData.get('Id');
        String Name = mapOfData.get('Name');
        String ProdCode = mapOfData.get('ProdCode');
        prod = [SELECT Id, Name, ProductCode FROM Product2 WHERE Id=: ProdId OR Name=: Name OR ProductCode=: ProdCode];
        return Prod;
        
    /*
     global static List<Product2> getProdData {
        RestRequest req = RestContext.request;
        Map<String, String> mapOfData = req.params;
        String ProdId = mapOfData.get('Id');
        String Name = mapOfData.get('Name');
        String ProdCode = mapOfData.get('ProdCode');
        List<Product2> prodList = [SELECT Id, Name, ProductCode FROM Product2 WHERE Id=: ProdId AND Name=: Name AND ProductCode=: ProdCode];
        return prodList;
    }/

    }*/
	/*================POST Method==============================
	@HttpPost
	global static List<Id> createProducts() {

        RestRequest req = RestContext.request;
        String body = req.requestBody.toString();

        // Deserialize into a list
        List<ProductWrapper> reqList =
            (List<ProductWrapper>) JSON.deserialize(body, List<ProductWrapper>.class);

        List<Product2> products = new List<Product2>();

        for (ProductWrapper w : reqList) {
            Product2 p = new Product2();
            p.Name = w.Name;
            p.ProductCode = w.ProductCode;
            products.add(p);
        }

        insert products;

        // Return inserted record Ids
        List<Id> ids = new List<Id>();
        for (Product2 p : products) {
            ids.add(p.Id);
        }

        return ids;
    }

    global class ProductWrapper {
        public String Name;
        public String ProductCode;
    }*/
    
    /*=====================PATCH Method=================================
    @HttpPatch
    global static List<Id> upsertProducts() {

        RestRequest req = RestContext.request;
        String body = req.requestBody.toString();

        // Deserialize incoming JSON array
        List<ProductWrapper> reqList =
            (List<ProductWrapper>) JSON.deserialize(body, List<ProductWrapper>.class);

        // Extract Names from incoming JSON (for SOQL)
        Set<String> incomingNames = new Set<String>();
        for (ProductWrapper w : reqList) {
            incomingNames.add(w.Name);
        }

        // Query existing records (those with matching names)
        Map<String, Product2> existingMap = new Map<String, Product2>();

        for (Product2 p : [
            SELECT Id, Name, ProductCode
            FROM Product2
            WHERE Name IN :incomingNames
        ]) {
            existingMap.put(p.Name, p);
        }

        List<Product2> finalList = new List<Product2>();

        // Build insert/update list
        for (ProductWrapper w : reqList) {

            if (existingMap.containsKey(w.Name)) {
                // UPDATE existing
                Product2 ex = existingMap.get(w.Name);
                ex.ProductCode = w.ProductCode;
                finalList.add(ex);

            } else {
                // INSERT new
                Product2 newP = new Product2();
                newP.Name = w.Name;
                newP.ProductCode = w.ProductCode;
                finalList.add(newP);
            }
        }

        upsert finalList;   // Insert or update in one operation

        // Return list of IDs
        List<Id> responseIds = new List<Id>();
        for (Product2 p : finalList) {
            responseIds.add(p.Id);
        }

        return responseIds;
    }

    global class ProductWrapper {
        public String Name;
        public String ProductCode;
    }*/
    
   /*==================DELETE Method===================*/
    @HttpDelete
    global static List<String> deleteProducts() {

        RestRequest req = RestContext.request;
        String body = req.requestBody.toString();

        // Incoming JSON array of Ids
        List<String> idsToDelete =
            (List<String>) JSON.deserialize(body, List<String>.class);

        // Convert string Id list → SObject list
        List<Product2> recordsToDelete = new List<Product2>();

        for (String s : idsToDelete) {
            recordsToDelete.add(new Product2(Id = s));
        }

        // Now we can delete safely
        delete recordsToDelete;

        return idsToDelete;
    }
}