@RestResource(urlMapping='/api/Account/*')
global with sharing class RestAPITesting
{
    @HttpGet
    global static Account doGet() 
    {
        RestRequest req = RestContext.request;
        RestResponse res = RestContext.response;
        String AccNumber = req.requestURI.substring(req.requestURI.lastIndexOf('/')+1);
        Account result = [SELECT Id, Name, Phone, Website FROM Account WHERE AccountNumber = :AccNumber ];
        return result;
    }
    
    

    @HttpDelete
    global static void doDelete() 
    {
        RestRequest req = RestContext.request;
        RestResponse res = RestContext.response;
        String AccNumber = req.requestURI.substring(req.requestURI.lastIndexOf('/')+1);
        Account result = [SELECT Id, Name, Phone, Website FROM Account WHERE AccountNumber = :AccNumber ];
        delete result;
    }

    @HttpPost
    global static Contact createNewContact() {
        // Initializing the request parameter with the incoming request
        RestRequest contactRequest = RestContext.request;
        // Getting the request body from the request
        String requestBody = contactRequest.requestBody.toString();
        // Deserializing the JSON response body and assigning it to an instance of Contact object
        Contact contact = (Contact) JSON.deserialize(requestBody, Contact.class);
        // Inserting Contact
        insert contact;
        // Returning the contact in the response
        return contact;
    }
    


}