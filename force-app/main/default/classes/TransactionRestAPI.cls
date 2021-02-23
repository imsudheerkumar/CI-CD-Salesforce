@RestResource(urlMapping='/api/Transaction__c/*')
global with sharing class TransactionRestAPI {
    
    @HttpGet
    global static String getDepositTransactions()
    {
        RestRequest request = RestContext.request;
        
        String URI = request.requestURI;
        
        
        
    
        
       //	String type1 = String.valueOf(URI.substring(URI.lastIndexOf('/')+1));
       Map<String,String> tranParams = request.params;
        
        String type1 = tranParams.get('type');
        
        String transactionId = tranParams.get('Id');
        
        List<Transaction__c> transList = [select Amount__c from Transaction__c where Name =: transactionId and Transaction_type__c =:type1];
        Decimal SumofAmount= 0;
        for(Transaction__c tran : transList)
        {
            SumofAmount+=tran.Amount__c;
        }
        
        return 'Total Amount for Desposits is : ' +SumofAmount +'Transaction Type ' +type1;
        
        
    }

}