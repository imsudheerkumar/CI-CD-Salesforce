@RestResource(urlmapping='/Account__c/*/Transactions__r')
global with sharing class BankAccountRestManager {
    @HttpGet
    global static Account__c getAccountDetails()
    {
        RestRequest request = RestContext.request;
        String accountId = request.requestURI.substringBetween('Account__c/','/Transactions__r');
        system.debug(accountId);
        Account__c retacc = [select Name,Account_type__c,Balance__c , (select Name,Amount__c,Transaction_type__c from transactions__r) from Account__c where id = :accountId];
        return retacc;
    }

}