trigger ClosedBankAccount on Account__c (before update) {
    

    
    if(Trigger.isBefore && Trigger.isUpdate)
    {
       for(Account__c acc : Trigger.New)
       {
          
                if(acc.AccountApproved__c!=Trigger.oldmap.get(acc.Id).AccountApproved__c)
                {
                    if(acc.AccountApproved__c == 'Closed')
                    {
                        acc.Account_Closed_Date__c = System.now();
                    }
                    	
           				
                }
     
          
       }
    }
    //AccountApproved__c
    

}