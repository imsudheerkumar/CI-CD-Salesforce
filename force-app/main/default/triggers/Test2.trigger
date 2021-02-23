trigger Test2 on Account__c (before update) {
    
   // Set<id> AccIDset = new Set<id>();
   //Map<Id,Account__c> oldvals = new Map<Id,Account__c>([select id,name,account_type__c 
                                                      //  from account__c where Id in : Trigger.old]);
    
    for(Account__c acc : Trigger.New)
    {
        if(acc.Account_type__c!=Trigger.oldmap.get(acc.Id).Account_type__c)
        {
             acc.Account_type__c.addError('Once fixed Account Type cannot be changed! Please contact Admin');
            
        }
    }
    //system.debug(AccIDset);
    
        

}