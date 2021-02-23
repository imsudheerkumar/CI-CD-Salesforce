@RestResource(UrlMapping ='/api/BankAccount/*')
global with sharing class RestAPITesting_2 {
    
    @HTTPGet
    global static List<Account__c> getAccountdetails()
    {
        RestRequest req = RestContext.request;
        RestResponse res = RestContext.response;
        
        RestRequest contactRequest = RestContext.request;
        // Getting the request URI
        String contactRequestURI = contactRequest.requestURI;
        // Getting the limit from the request URI
        Integer contactLimit = Integer.valueOf(contactRequestURI.substring(contactRequestURI.lastIndexOf('/') + 1));
        // Querying contacts
        List<Account__c> contactList = [SELECT Id, Name,Balance__c,Bank__r.Name FROM Account__c LIMIT :contactLimit];
        // Returning the contacts in the response
        return contactList;
    }

}