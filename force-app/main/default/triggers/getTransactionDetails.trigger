trigger getTransactionDetails on Account__c (after update) {
    //List<Transactions__r> translist= new List<Transactions__r>();
    
    List<Account__c> tran =   [SELECT Name,Balance__c,(SELECT Account_Number__c,Amount__c,Bank_Account__c from Transactions__r) 
                                 from Account__c where Id IN :Trigger.New];
    
    List<Transaction__c> lst = new List<Transaction__c>();
    
    //SELECT Account.Name, (SELECT Contact.FirstName, Contact.LastName FROM Account.Contacts) FROM Account
    //system.debug(tran.get(0));
    for (Account__c  acc: tran)
    {
        
        
        system.debug('Account number : ' + acc.Name);
        system.debug('Balance : ' + acc.Balance__c);
       // system.debug(tran[0].Transactions__r);
        //lst.add(tran[0].Transactions__r);
        //system.debug(lst.size());
        //lst.add(tran[0].Transactions__r);
        //system.debug(tran[0].Transactions__r.getsize());
        //system.debug('Count of Transactions : ' +acc.Account__c.Transactions__r.size());
        //system.debug('Name : ' + acc.Name);
        
    }
    
    

}