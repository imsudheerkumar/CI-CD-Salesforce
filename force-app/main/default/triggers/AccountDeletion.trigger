trigger AccountDeletion on Account__c (before delete) {
    
    Set<id> AccountIds = Trigger.oldMap.keyset();
    
   List<Loan__c> loanList = new List<Loan__c>([select name ,bank_account__r.id from loan__c where bank_account__r.id IN : AccountIds]);
   //List<Account__c > acs = [select id,name from account__C where id in : AccountIds];
    if (loanlist.size()>0)
    {
        for(Account__c acc : Trigger.old)
        {
            acc.addError('Cannot delete');
        }
    }

}